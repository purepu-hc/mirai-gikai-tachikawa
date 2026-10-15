import { sqlString } from "./build-sql";

/**
 * 会派別賛否の入力データ（supabase/seed-tachikawa/votes/<会期>.json）。
 * 「たちかわ市議会便り」の「各議案等に対する賛否」の表を、手で（目視と座標で確認して）書き起こしたもの。
 */
export type FactionVoteData = {
  /** 会期の slug（例: r8-1-teireikai） */
  session: string;
  source: { title: string; url: string; note?: string };
  /** 表の左からの並び順。新しく追加する会派は、この順に表示順（sort_order）を付ける */
  factions: { name: string; abbr: string }[];
  /**
   * 賛否が分かれた議案・請願・陳情。against に挙げた会派以外は賛成。
   * comments には、会派ごとの補足（例: 所属議員の一部が退席）を事実だけ書く
   */
  split: {
    billNumber: string;
    title: string;
    against: string[];
    comments?: Record<string, string>;
  }[];
  /**
   * 全員一致だったもの。
   * - 議案：会期内の議案（請願・陳情以外）のうち split と notVoted 以外は全会派「賛成」。billCount は確認用の件数
   * - 請願・陳情：採択は全会派「賛成」、不採択は全会派「反対」（番号で指定）
   */
  unanimous: {
    billCount: number;
    adoptedPetitions: string[];
    rejectedPetitions: string[];
  };
  /** 継続審査などで、この会期に表決がなかったもの（登録しない） */
  notVoted?: string[];
};

/** 入力の矛盾をチェックし、問題があればメッセージの配列を返す */
export function validateFactionVoteData(data: FactionVoteData): string[] {
  const errors: string[] = [];
  const names = data.factions.map((f) => f.name);
  if (new Set(names).size !== names.length) {
    errors.push("会派名が重複しています");
  }
  const numbers = [
    ...data.split.map((s) => s.billNumber),
    ...data.unanimous.adoptedPetitions,
    ...data.unanimous.rejectedPetitions,
    ...(data.notVoted ?? []),
  ];
  if (new Set(numbers).size !== numbers.length) {
    errors.push("議案・請願・陳情の番号が重複しています");
  }
  for (const s of data.split) {
    if (s.against.length === 0) {
      errors.push(
        `${s.billNumber}: 反対した会派がありません（全員一致なら split に入れない）`
      );
    }
    const mentioned = [...s.against, ...Object.keys(s.comments ?? {})];
    for (const name of mentioned) {
      if (!names.includes(name)) {
        errors.push(`${s.billNumber}: 会派「${name}」が factions にありません`);
      }
    }
  }
  return errors;
}

export type FactionVoteRow = {
  billNumber: string;
  faction: string;
  type: "for" | "against";
  comment: string | null;
};

/** 議案ごとの会派の賛否（split の議案のみ）を展開する */
export function expandSplitVotes(data: FactionVoteData): FactionVoteRow[] {
  return data.split.flatMap((s) =>
    data.factions.map((f) => ({
      billNumber: s.billNumber,
      faction: f.name,
      type: s.against.includes(f.name)
        ? ("against" as const)
        : ("for" as const),
      comment: s.comments?.[f.name] ?? null,
    }))
  );
}

/** 新しく追加する会派の表示順の開始値（いまの会派 1〜99 と混ざらないように） */
export const PAST_FACTION_SORT_BASE = 100;

const sqlList = (values: string[]) =>
  values.length > 0 ? values.map(sqlString).join(", ") : "''";

/**
 * Supabase の SQL Editor に貼り付けて実行できる SQL を作る（何度流しても同じ結果）。
 * - 会派は無ければ追加（過去の会派として is_active = false）。既にある会派は変更しない
 * - 件数が入力と合わないとき（入力にない請願・陳情がある場合も）は、何も変更せずにエラーで止める
 * - 賛否は (議案, 会派) ごとに上書き
 */
export function buildFactionVoteSql(data: FactionVoteData): string {
  const errors = validateFactionVoteData(data);
  if (errors.length > 0) throw new Error(errors.join("\n"));

  const { adoptedPetitions, rejectedPetitions, billCount } = data.unanimous;
  const notVoted = data.notVoted ?? [];
  const slug = sqlString(data.session);
  const factionList = data.factions.map((f) => sqlString(f.name)).join(", ");
  const splitNumbers = data.split.map((s) => s.billNumber);
  const known = sqlList([
    ...splitNumbers,
    ...adoptedPetitions,
    ...rejectedPetitions,
    ...notVoted,
  ]);
  const inSession = `b.council_session_id = (SELECT id FROM council_sessions WHERE slug = ${slug})`;
  const upsert =
    "ON CONFLICT (bill_id, faction_id) DO UPDATE SET type = EXCLUDED.type, comment = EXCLUDED.comment, updated_at = now();";

  const unanimousBills = `b.bill_type <> 'petition' AND b.bill_number NOT IN (${sqlList([...splitNumbers, ...notVoted])})`;
  const adoptedWhere = `b.bill_type = 'petition' AND b.bill_number IN (${sqlList(adoptedPetitions)})`;
  const rejectedWhere = `b.bill_type = 'petition' AND b.bill_number IN (${sqlList(rejectedPetitions)})`;
  const checks: [string, string, number][] = [
    [
      "賛否が分かれたもの",
      `b.bill_number IN (${sqlList(splitNumbers)})`,
      splitNumbers.length,
    ],
    ["全員一致の議案", unanimousBills, billCount],
    ["全員一致で採択の請願・陳情", adoptedWhere, adoptedPetitions.length],
    ["全員一致で不採択の請願・陳情", rejectedWhere, rejectedPetitions.length],
    [
      "表決がなかったもの",
      `b.bill_number IN (${sqlList(notVoted)})`,
      notVoted.length,
    ],
    [
      "入力にない請願・陳情",
      `b.bill_type = 'petition' AND b.bill_number NOT IN (${known})`,
      0,
    ],
  ];

  const out: string[] = [
    "-- 生成元: packages/tachikawa-ingest（AI不使用）",
    `-- 出典: ${data.source.title}`,
    `--       ${data.source.url}`,
    `-- 対象: ${data.session}（賛否が分かれたもの ${data.split.length} 件、全員一致の議案 ${billCount} 件、全員一致の請願・陳情 採択 ${adoptedPetitions.length} 件・不採択 ${rejectedPetitions.length} 件、表決なし ${notVoted.length} 件）`,
    "BEGIN;",
    "",
    "-- 会派（当時の会派。無ければ過去の会派として追加）",
  ];
  data.factions.forEach((f, i) => {
    out.push(
      "INSERT INTO factions (name, display_name, sort_order, is_active)",
      `SELECT ${sqlString(f.name)}, ${sqlString(f.name)}, ${PAST_FACTION_SORT_BASE + i + 1}, false`,
      `WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = ${sqlString(f.name)});`
    );
  });

  out.push(
    "",
    "-- 件数の確認（合わなければエラーで止まり、何も変更されない）",
    "DO $$",
    "DECLARE n int;",
    "BEGIN"
  );
  for (const [label, where, expected] of checks) {
    out.push(
      `  SELECT count(*) INTO n FROM bills b WHERE ${inSession} AND ${where};`,
      `  IF n <> ${expected} THEN RAISE EXCEPTION '件数が合いません（${label}）: % 件 / 入力 ${expected} 件', n; END IF;`
    );
  }
  out.push(
    `  SELECT count(*) INTO n FROM factions WHERE name IN (${factionList});`,
    `  IF n <> ${data.factions.length} THEN RAISE EXCEPTION '件数が合いません（会派）: % 件 / 入力 ${data.factions.length} 件', n; END IF;`,
    "END $$;",
    "",
    "-- 賛否が分かれたもの"
  );
  for (const v of expandSplitVotes(data)) {
    out.push(
      "INSERT INTO faction_stances (bill_id, faction_id, type, comment)",
      `SELECT b.id, f.id, '${v.type}', ${sqlString(v.comment)} FROM bills b, factions f WHERE ${inSession} AND b.bill_number = ${sqlString(v.billNumber)} AND f.name = ${sqlString(v.faction)}`,
      upsert
    );
  }

  const bulk = (label: string, type: "for" | "against", where: string) => {
    out.push(
      "",
      `-- ${label}`,
      "INSERT INTO faction_stances (bill_id, faction_id, type, comment)",
      `SELECT b.id, f.id, '${type}', NULL FROM bills b CROSS JOIN factions f`,
      `WHERE ${inSession} AND ${where} AND f.name IN (${factionList})`,
      upsert
    );
  };
  bulk("全員一致の議案（全会派 賛成）", "for", unanimousBills);
  if (adoptedPetitions.length > 0) {
    bulk("全員一致で採択の請願・陳情（全会派 賛成）", "for", adoptedWhere);
  }
  if (rejectedPetitions.length > 0) {
    bulk(
      "全員一致で不採択の請願・陳情（全会派 反対＝採択に反対）",
      "against",
      rejectedWhere
    );
  }
  out.push("", "COMMIT;", "");
  return out.join("\n");
}
