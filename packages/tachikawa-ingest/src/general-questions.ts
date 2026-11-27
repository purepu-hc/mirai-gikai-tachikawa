import { sqlString } from "./build-sql";
import type { MemberDef, MemberTermDef } from "./members";

/**
 * 一般質問順序表（市議会の日程表ページに添付のPDF）を書き起こしたJSON。
 * 件名・小項目は原文のまま。
 */
export type GeneralQuestionData = {
  session: {
    slug: string;
    name: string;
    startDate: string;
    endDate: string | null;
    /** 日程表ページ */
    councilUrl: string;
  };
  sourceUrl: string;
  sourceFetchedAt: string;
  questions: {
    orderNumber: number;
    seatNumber: number;
    /** 順序表の表記（姓と名の間にスペースなし） */
    name: string;
    factionLabel: string;
    questionStyle: string;
    aids: string[];
    items: { number: number; title: string; subs: string[] }[];
  }[];
};

/** 氏名の表記ゆれを除いて比べるためのキー（スペースを除き、髙→高） */
export function nameKey(name: string): string {
  return name.replace(/[\s　]/g, "").replace(/髙/g, "高");
}

/** 一般質問の日に在任していた任期（その日を含む任期）を探す */
function termOn(
  terms: MemberTermDef[],
  slug: string,
  date: string
): MemberTermDef | undefined {
  return terms.find(
    (t) =>
      t.slug === slug &&
      t.termStart <= date &&
      (t.termEnd === null || date <= t.termEnd)
  );
}

/**
 * 順序表の氏名を議員の slug にする。
 * 議席番号が議員マスターと合うかも確かめる（同姓同名や書き起こしの誤りに気づくため）。
 */
export function resolveQuestionMembers(
  data: GeneralQuestionData,
  members: MemberDef[],
  terms: MemberTermDef[]
): { slugs: string[]; errors: string[] } {
  const errors: string[] = [];
  const slugs: string[] = [];
  const orders = new Set<number>();
  for (const q of data.questions) {
    if (orders.has(q.orderNumber)) {
      errors.push(`受理番号の重複: ${q.orderNumber}`);
    }
    orders.add(q.orderNumber);

    const hits = members.filter((m) => nameKey(m.name) === nameKey(q.name));
    if (hits.length !== 1) {
      errors.push(`議員を1人に決められない: ${q.name}（${hits.length} 人）`);
      slugs.push("");
      continue;
    }
    const slug = hits[0].slug;
    if (slugs.includes(slug)) errors.push(`同じ議員が2回: ${q.name}`);
    slugs.push(slug);

    const term = termOn(terms, slug, data.session.startDate);
    if (!term) {
      errors.push(`会期の初日に在任していない: ${q.name}`);
    } else if (term.seatNumber !== q.seatNumber) {
      errors.push(
        `議席が議員マスターと違う: ${q.name}（順序表 ${q.seatNumber}、マスター ${term.seatNumber}）`
      );
    }
    if (q.items.length === 0) errors.push(`件名がない: ${q.name}`);
  }
  return { slugs, errors };
}

function sqlTextArray(values: string[]): string {
  if (values.length === 0) return "'{}'::text[]";
  return `ARRAY[${values.map(sqlString).join(", ")}]::text[]`;
}

/**
 * 一般質問の投入用SQLを作る。何度流しても同じ結果になる
 * （質問は会期と議員で上書きし、件名・小項目は消してから入れ直す）。
 */
export function buildGeneralQuestionSql(
  data: GeneralQuestionData,
  members: MemberDef[],
  terms: MemberTermDef[]
): string {
  const { slugs, errors } = resolveQuestionMembers(data, members, terms);
  if (errors.length > 0) {
    throw new Error(`一般質問のデータに問題があります:\n${errors.join("\n")}`);
  }
  const s = data.session;
  const sessionId = `(SELECT id FROM council_sessions WHERE slug = ${sqlString(s.slug)})`;
  const out: string[] = [
    "-- 立川市議会 一般質問（packages/tachikawa-ingest の build-general-questions-sql で生成。手で編集しない）",
    `-- 出典: ${data.sourceUrl}（${data.sourceFetchedAt} 取得）`,
    `-- 対象: ${s.name}（${data.questions.length} 人）`,
    "BEGIN;",
    "",
    "-- 会期（議案の取り込みより先に流すことがあるため、なければ作る。あれば変えない）",
    "INSERT INTO council_sessions (name, slug, start_date, end_date, council_url, is_active)",
    `VALUES (${sqlString(s.name)}, ${sqlString(s.slug)}, ${sqlString(s.startDate)}, ${sqlString(s.endDate)}, ${sqlString(s.councilUrl)}, false)`,
    "ON CONFLICT (slug) DO NOTHING;",
  ];

  data.questions.forEach((q, i) => {
    const memberId = `(SELECT id FROM council_members WHERE slug = ${sqlString(slugs[i])})`;
    const questionId = `(SELECT id FROM general_questions WHERE council_session_id = ${sessionId} AND member_id = ${memberId})`;
    out.push(
      "",
      `-- ${q.orderNumber}. ${q.name}`,
      "INSERT INTO general_questions (member_id, council_session_id, order_number, seat_number, faction_label, question_style, aids, source_url, source_fetched_at)",
      `VALUES (${memberId}, ${sessionId}, ${q.orderNumber}, ${q.seatNumber}, ${sqlString(q.factionLabel)}, ${sqlString(q.questionStyle)}, ${sqlTextArray(q.aids)}, ${sqlString(data.sourceUrl)}, ${sqlString(data.sourceFetchedAt)})`,
      "ON CONFLICT (council_session_id, member_id) DO UPDATE SET order_number = EXCLUDED.order_number, seat_number = EXCLUDED.seat_number, faction_label = EXCLUDED.faction_label, question_style = EXCLUDED.question_style, aids = EXCLUDED.aids, source_url = EXCLUDED.source_url, source_fetched_at = EXCLUDED.source_fetched_at;",
      `DELETE FROM general_question_items WHERE question_id = ${questionId};`
    );
    let sort = 0;
    for (const item of q.items) {
      sort += 1;
      out.push(
        "INSERT INTO general_question_items (question_id, parent_id, item_number, text, sort_order)",
        `VALUES (${questionId}, NULL, ${item.number}, ${sqlString(item.title)}, ${sort});`
      );
      const parentId = `(SELECT id FROM general_question_items WHERE question_id = ${questionId} AND parent_id IS NULL AND item_number = ${item.number})`;
      item.subs.forEach((sub, j) => {
        sort += 1;
        out.push(
          "INSERT INTO general_question_items (question_id, parent_id, item_number, text, sort_order)",
          `VALUES (${questionId}, ${parentId}, ${j + 1}, ${sqlString(sub)}, ${sort});`
        );
      });
    }
  });

  out.push(
    "",
    "COMMIT;",
    "",
    "-- 確認用",
    "SELECT",
    `  (SELECT count(*) FROM general_questions WHERE council_session_id = ${sessionId}) AS questions,`,
    `  (SELECT count(*) FROM general_question_items i JOIN general_questions q ON q.id = i.question_id WHERE q.council_session_id = ${sessionId} AND i.parent_id IS NULL) AS titles,`,
    `  (SELECT count(*) FROM general_question_items i JOIN general_questions q ON q.id = i.question_id WHERE q.council_session_id = ${sessionId} AND i.parent_id IS NOT NULL) AS subs;`,
    ""
  );
  return out.join("\n");
}
