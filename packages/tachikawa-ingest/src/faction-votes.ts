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
  /** 賛否が分かれた議案。against に挙げた会派以外は賛成 */
  split: { billNumber: string; title: string; against: string[] }[];
  /**
   * 全員一致だった件数（確認用）。会期内の split 以外の議案は全会派「賛成」、
   * 請願・陳情は全会派「反対」（全員一致で不採択）として登録する。
   * 全員一致で採択された請願・陳情がある会期は、この仕組みでは扱えないため入力エラーにする。
   */
  unanimous: { billCount: number; petitionCount: number; petitionsAdopted?: false };
};

/** 入力の矛盾をチェックし、問題があればメッセージの配列を返す */
export function validateFactionVoteData(data: FactionVoteData): string[] {
  const errors: string[] = [];
  const names = data.factions.map((f) => f.name);
  if (new Set(names).size !== names.length) errors.push("会派名が重複しています");
  const billNumbers = data.split.map((s) => s.billNumber);
  if (new Set(billNumbers).size !== billNumbers.length) {
    errors.push("賛否が分かれた議案の番号が重複しています");
  }
  for (const s of data.split) {
    if (s.against.length === 0) {
      errors.push(`${s.billNumber}: 反対した会派がありません（全員一致なら split に入れない）`);
    }
    for (const name of s.against) {
      if (!names.includes(name)) errors.push(`${s.billNumber}: 会派「${name}」が factions にありません`);
    }
  }
  if (data.unanimous.petitionsAdopted !== undefined && data.unanimous.petitionsAdopted !== false) {
    errors.push("全員一致で採択された請願・陳情には対応していません");
  }
  return errors;
}

/** 議案ごとの会派の賛否（split の議案のみ）を展開する */
export function expandSplitVotes(
  data: FactionVoteData
): { billNumber: string; faction: string; type: "for" | "against" }[] {
  return data.split.flatMap((s) =>
    data.factions.map((f) => ({
      billNumber: s.billNumber,
      faction: f.name,
      type: s.against.includes(f.name) ? ("against" as const) : ("for" as const),
    }))
  );
}

/** 新しく追加する会派の表示順の開始値（いまの会派 1〜99 と混ざらないように） */
export const PAST_FACTION_SORT_BASE = 100;

/**
 * Supabase の SQL Editor に貼り付けて実行できる SQL を作る（何度流しても同じ結果）。
 * - 会派は無ければ追加（過去の会派として is_active = false）。既にある会派は変更しない
 * - 件数が入力と合わないときは、何も変更せずにエラーで止める
 * - 賛否は (議案, 会派) ごとに上書き
 */
export function buildFactionVoteSql(data: FactionVoteData): string {
  const errors = validateFactionVoteData(data);
  if (errors.length > 0) throw new Error(errors.join("\n"));

  const slug = sqlString(data.session);
  const factionList = data.factions.map((f) => sqlString(f.name)).join(", ");
  const splitList =
    data.split.length > 0 ? data.split.map((s) => sqlString(s.billNumber)).join(", ") : "''";
  const inSession = `b.council_session_id = (SELECT id FROM council_sessions WHERE slug = ${slug})`;
  const upsert =
    "ON CONFLICT (bill_id, faction_id) DO UPDATE SET type = EXCLUDED.type, updated_at = now();";

  const out: string[] = [
    "-- 生成元: packages/tachikawa-ingest（AI不使用）",
    `-- 出典: ${data.source.title}`,
    `--       ${data.source.url}`,
    `-- 対象: ${data.session}（賛否が分かれた議案 ${data.split.length} 件、全員一致 ${data.unanimous.billCount} 件、請願・陳情 ${data.unanimous.petitionCount} 件）`,
    "BEGIN;",
    "",
    "-- 会派（当時の会派。無ければ過去の会派として追加）",
  ];
  data.factions.forEach((f, i) => {
    out.push(
      `INSERT INTO factions (name, display_name, sort_order, is_active)`,
      `SELECT ${sqlString(f.name)}, ${sqlString(f.name)}, ${PAST_FACTION_SORT_BASE + i + 1}, false`,
      `WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = ${sqlString(f.name)});`
    );
  });

  out.push(
    "",
    "-- 件数の確認（合わなければエラーで止まり、何も変更されない）",
    "DO $$",
    "DECLARE n_split int; n_bill int; n_petition int; n_faction int;",
    "BEGIN",
    `  SELECT count(*) INTO n_split FROM bills b WHERE ${inSession} AND b.bill_number IN (${splitList});`,
    `  SELECT count(*) INTO n_bill FROM bills b WHERE ${inSession} AND b.bill_type <> 'petition' AND b.bill_number NOT IN (${splitList});`,
    `  SELECT count(*) INTO n_petition FROM bills b WHERE ${inSession} AND b.bill_type = 'petition';`,
    `  SELECT count(*) INTO n_faction FROM factions WHERE name IN (${factionList});`,
    `  IF n_split <> ${data.split.length} OR n_bill <> ${data.unanimous.billCount} OR n_petition <> ${data.unanimous.petitionCount} OR n_faction <> ${data.factions.length} THEN`,
    `    RAISE EXCEPTION '件数が合いません: 賛否が分かれた議案 % / ${data.split.length}, 全員一致の議案 % / ${data.unanimous.billCount}, 請願・陳情 % / ${data.unanimous.petitionCount}, 会派 % / ${data.factions.length}', n_split, n_bill, n_petition, n_faction;`,
    "  END IF;",
    "END $$;",
    "",
    "-- 賛否が分かれた議案"
  );
  for (const v of expandSplitVotes(data)) {
    out.push(
      `INSERT INTO faction_stances (bill_id, faction_id, type)`,
      `SELECT b.id, f.id, '${v.type}' FROM bills b, factions f WHERE b.bill_number = ${sqlString(v.billNumber)} AND f.name = ${sqlString(v.faction)}`,
      upsert
    );
  }

  out.push(
    "",
    "-- 全員一致の議案（全会派 賛成）",
    `INSERT INTO faction_stances (bill_id, faction_id, type)`,
    `SELECT b.id, f.id, 'for' FROM bills b CROSS JOIN factions f`,
    `WHERE ${inSession} AND b.bill_type <> 'petition' AND b.bill_number NOT IN (${splitList}) AND f.name IN (${factionList})`,
    upsert,
    "",
    "-- 請願・陳情（全員一致で不採択 → 全会派 反対）",
    `INSERT INTO faction_stances (bill_id, faction_id, type)`,
    `SELECT b.id, f.id, 'against' FROM bills b CROSS JOIN factions f`,
    `WHERE ${inSession} AND b.bill_type = 'petition' AND f.name IN (${factionList})`,
    upsert,
    "",
    "COMMIT;",
    ""
  );
  return out.join("\n");
}
