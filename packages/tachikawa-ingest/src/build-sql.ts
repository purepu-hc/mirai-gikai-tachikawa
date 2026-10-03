import {
  buildStatusNote,
  isReferralOmitted,
  resolveBillStatus,
  resolvePetitionStatus,
} from "./bill-status";
import type { CouncilSessionDef } from "./masters";
import type { BillListRow } from "./parse-bill-list";

/** SQL の文字列リテラル（シングルクォートを二重化） */
export function sqlString(value: string | null): string {
  if (value === null) return "NULL";
  return `'${value.replace(/'/g, "''")}'`;
}

/**
 * 「議案第95号」に年を付けて、年をまたいでも重複しない番号にする。
 * 立川市議会の議案番号は年ごとに振り直されるため。
 */
export function buildBillNumber(eraYearLabel: string, number: string): string {
  // 継続審査の請願・陳情など、番号にすでに年が付いている場合はその年を使う
  // （会期の年を付けると、前年の同じ番号を上書きしてしまうため）
  if (/^(令和|平成)(元|\d+)年/.test(number)) return number;
  return `${eraYearLabel}${number}`;
}

/** 行の出典ページ（請願・陳情は請願・陳情一覧ページ） */
function sourceUrl(row: BillListRow, session: CouncilSessionDef): string {
  return row.kind === "petition" && session.petitionListUrl
    ? session.petitionListUrl
    : session.billListUrl;
}

/** 行の種類に応じて審議状況を判定する */
export function resolveRowStatus(row: BillListRow) {
  return row.kind === "petition"
    ? resolvePetitionStatus(row.committeeName, row.decisionText)
    : resolveBillStatus(row.committeeName, row.decisionText);
}

/** 解説を書くまでの仮コンテンツ（事実のみ。AIは使わない） */
export function buildPlaceholderContent(
  row: BillListRow,
  session: CouncilSessionDef
): { title: string; summary: string; content: string } {
  const lines = [
    row.kind === "petition" ? "## この請願・陳情について" : "## この議案について",
    "",
    "やさしい解説は準備中です。まずは公式の情報をご覧ください。",
    "",
    `- 会期：${session.name}`,
    `- 番号：${row.number}`,
    `- 区分：${row.category}`,
    `- 審議の状況：${buildStatusNote(row.committeeName, row.decisionText)}`,
  ];
  if (row.pdfUrl) {
    const pdfLabel = row.kind === "petition" ? "資料（PDF）" : "議案書（PDF）";
    lines.push(`- ${pdfLabel}：${row.pdfUrl}`);
  }
  lines.push(`- 出典：${sourceUrl(row, session)}`);
  return {
    title: row.name,
    summary: "やさしい解説は準備中です。",
    content: lines.join("\n"),
  };
}

type BuildSqlInput = {
  session: CouncilSessionDef;
  committees: { name: string; description: string }[];
  factions: string[];
  rows: BillListRow[];
};

/**
 * Supabase の SQL Editor に貼り付けて実行できる、何度流しても同じ結果になる SQL を作る。
 * - 会期・委員会・会派は無ければ追加
 * - 議案は議案番号で上書き更新（審議状況の更新に対応）
 * - 解説は無い場合だけ仮コンテンツを追加（書いた解説は上書きしない）
 */
export function buildSql(input: BuildSqlInput): string {
  const { session, committees, factions, rows } = input;
  const out: string[] = [];
  const billCount = rows.filter((r) => r.kind === "bill").length;
  const petitionCount = rows.length - billCount;
  const sources = [
    ...(billCount > 0 ? [session.billListUrl] : []),
    ...(petitionCount > 0 && session.petitionListUrl
      ? [session.petitionListUrl]
      : []),
  ];

  out.push(
    `-- 生成元: packages/tachikawa-ingest（AI不使用）`,
    ...sources.map((url) => `-- 出典: ${url}`),
    `-- 対象: ${session.name}（議案 ${billCount} 件、請願・陳情 ${petitionCount} 件）`,
    "BEGIN;",
    ""
  );

  // 会期
  out.push(
    "-- 会期",
    `INSERT INTO council_sessions (name, slug, start_date, end_date, council_url, is_active)`,
    `VALUES (${sqlString(session.name)}, ${sqlString(session.slug)}, ${sqlString(session.startDate)}, ${sqlString(session.endDate)}, ${sqlString(session.billListUrl)}, false)`,
    `ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, council_url = EXCLUDED.council_url;`,
    ...(session.isCurrent
      ? [
          `SELECT set_active_council_session((SELECT id FROM council_sessions WHERE slug = ${sqlString(session.slug)}));`,
        ]
      : ["-- 過去の会期のため、いまの会期（is_active）は変更しない"]),
    ""
  );

  // 委員会
  out.push("-- 委員会");
  committees.forEach((c, i) => {
    out.push(
      `INSERT INTO committees (name, description, sort_order)`,
      `SELECT ${sqlString(c.name)}, ${sqlString(c.description)}, ${i + 1}`,
      `WHERE NOT EXISTS (SELECT 1 FROM committees WHERE name = ${sqlString(c.name)});`
    );
  });
  out.push("");

  // 会派
  out.push("-- 会派");
  factions.forEach((name, i) => {
    out.push(
      `INSERT INTO factions (name, display_name, sort_order)`,
      `SELECT ${sqlString(name)}, ${sqlString(name)}, ${i + 1}`,
      `WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = ${sqlString(name)});`
    );
  });
  out.push("");

  // 議案
  out.push("-- 議案・請願・陳情");
  for (const row of rows) {
    const billNumber = buildBillNumber(session.eraYearLabel, row.number);
    const status = resolveRowStatus(row);
    const note = buildStatusNote(row.committeeName, row.decisionText);
    const committeeSql =
      row.committeeName && !isReferralOmitted(row.committeeName)
        ? `(SELECT id FROM committees WHERE name = ${sqlString(row.committeeName)} LIMIT 1)`
        : "NULL";
    out.push(
      `INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)`,
      `VALUES (${sqlString(billNumber)}, ${sqlString(row.kind)}, ${sqlString(row.name)}, ${sqlString(status)}, ${sqlString(note)}, ${sqlString(row.pdfUrl)}, ${committeeSql}, (SELECT id FROM council_sessions WHERE slug = ${sqlString(session.slug)}), 'published')`,
      `ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;`
    );
    const placeholder = buildPlaceholderContent(row, session);
    for (const level of ["normal", "hard"] as const) {
      out.push(
        `INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)`,
        `SELECT id, ${sqlString(level)}, ${sqlString(placeholder.title)}, ${sqlString(placeholder.summary)}, ${sqlString(placeholder.content)} FROM bills WHERE bill_number = ${sqlString(billNumber)}`,
        `ON CONFLICT (bill_id, difficulty_level) DO NOTHING;`
      );
    }
  }
  out.push("", "COMMIT;", "");

  return out.join("\n");
}
