import { sqlString } from "./build-sql";
import type {
  MemberDef,
  MemberFactionDef,
  MemberRoleDef,
  MemberTermDef,
} from "./members";

export type MemberMasterData = {
  members: MemberDef[];
  terms: MemberTermDef[];
  factions: MemberFactionDef[];
  roles: MemberRoleDef[];
  linksCheckedAt: string;
};

/** データの食い違いを探す（見つかった問題の一覧。空なら問題なし） */
export function validateMemberData(data: MemberMasterData): string[] {
  const errors: string[] = [];
  const slugs = new Set<string>();
  for (const m of data.members) {
    if (slugs.has(m.slug)) errors.push(`slug が重複: ${m.slug}`);
    slugs.add(m.slug);
    if (!/^[a-z]+(-[a-z]+)+$/.test(m.slug)) {
      errors.push(`slug の形式が不正: ${m.slug}`);
    }
  }
  const unknown = (slug: string, where: string) => {
    if (!slugs.has(slug)) errors.push(`${where} に未登録の議員: ${slug}`);
  };

  // 同じ任期に同じ議席の人が2人いないか
  const seats = new Map<string, string>();
  for (const t of data.terms) {
    unknown(t.slug, "terms");
    if (t.seatNumber === null) continue;
    const key = `${t.termStart}#${t.seatNumber}`;
    const other = seats.get(key);
    if (other) {
      errors.push(
        `議席の重複: ${t.termStart} の ${t.seatNumber} 番（${other} と ${t.slug}）`
      );
    }
    seats.set(key, t.slug);
  }

  // 現職は全員、終わっていない任期を1つだけ持つ
  for (const m of data.members) {
    const open = data.terms.filter(
      (t) => t.slug === m.slug && t.termEnd === null
    );
    if (m.isCurrent && open.length !== 1) {
      errors.push(`現職なのに現在の任期が ${open.length} 件: ${m.slug}`);
    }
    if (!m.isCurrent && open.length > 0) {
      errors.push(`現職でないのに任期が終わっていない: ${m.slug}`);
    }
  }

  // 同じ議員の会派の期間が重ならないか
  for (const m of data.members) {
    const rows = data.factions
      .filter((f) => f.slug === m.slug)
      .sort((a, b) => a.startDate.localeCompare(b.startDate));
    for (let i = 1; i < rows.length; i++) {
      const prevEnd = rows[i - 1].endDate;
      if (prevEnd === null || prevEnd >= rows[i].startDate) {
        errors.push(`会派の期間が重なっている: ${m.slug}`);
      }
    }
  }
  for (const f of data.factions) unknown(f.slug, "factions");

  // 同じ役職は同時に1人まで
  for (const r of data.roles) unknown(r.slug, "roles");
  const byRole = new Map<string, MemberRoleDef[]>();
  for (const r of data.roles) {
    byRole.set(r.role, [...(byRole.get(r.role) ?? []), r]);
  }
  for (const [role, rows] of byRole) {
    rows.sort((a, b) => a.startDate.localeCompare(b.startDate));
    for (let i = 1; i < rows.length; i++) {
      const prevEnd = rows[i - 1].endDate;
      // 退任日と次の人の就任日が同じ日になるのは正常
      if (prevEnd === null || prevEnd > rows[i].startDate) {
        errors.push(`${role} の期間が重なっている: ${rows[i].slug}`);
      }
    }
  }
  return errors;
}

function sqlDate(value: string | null): string {
  return value === null ? "NULL" : `${sqlString(value)}::date`;
}

function memberId(slug: string): string {
  return `(SELECT id FROM council_members WHERE slug = ${sqlString(slug)})`;
}

/**
 * 議員マスターの投入用SQLを作る。何度流しても同じ結果になる（slug などで上書き）。
 * 会派は名前で factions を引くため、同じ名前の会派が1件だけあることを先に確かめる。
 */
export function buildMemberSql(data: MemberMasterData): string {
  const errors = validateMemberData(data);
  if (errors.length > 0) {
    throw new Error(`議員データに問題があります:\n${errors.join("\n")}`);
  }

  const out: string[] = [
    "-- 立川市議会 議員マスター（packages/tachikawa-ingest の build-members-sql で生成。手で編集しない）",
    "BEGIN;",
    "",
    "-- 使う会派が factions に1件ずつあるか確認（なければ止める）",
  ];
  const factionNames = [...new Set(data.factions.map((f) => f.faction))];
  out.push("DO $check$", "DECLARE n integer;", "BEGIN");
  for (const name of factionNames) {
    out.push(
      `  SELECT count(*) INTO n FROM factions WHERE name = ${sqlString(name)};`,
      `  IF n <> 1 THEN RAISE EXCEPTION '会派 % が % 件あります（1件のはず）', ${sqlString(name)}, n; END IF;`
    );
  }
  out.push("END", "$check$;", "");

  out.push("-- 議員");
  data.members.forEach((m, i) => {
    out.push(
      "INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)",
      `VALUES (${sqlString(m.slug)}, ${sqlString(m.name)}, ${sqlString(m.nameKana)}, ${i + 1}, ${sqlString(m.homepageUrl)}, ${sqlString(m.xUrl)}, ${sqlDate(data.linksCheckedAt)}, ${m.isCurrent})`,
      "ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;"
    );
  });

  out.push("", "-- 任期と議席");
  for (const t of data.terms) {
    out.push(
      "INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)",
      `VALUES (${memberId(t.slug)}, ${sqlDate(t.termStart)}, ${sqlDate(t.termEnd)}, ${t.seatNumber ?? "NULL"}, ${sqlString(t.endReason)})`,
      "ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;"
    );
  }

  out.push("", "-- 会派の所属（出典で確認できた期間）");
  for (const f of data.factions) {
    out.push(
      "INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)",
      `VALUES (${memberId(f.slug)}, (SELECT id FROM factions WHERE name = ${sqlString(f.faction)}), ${sqlDate(f.startDate)}, ${sqlDate(f.endDate)}, ${sqlString(f.sourceUrl)})`,
      "ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;"
    );
  }

  out.push("", "-- 議長・副議長");
  for (const r of data.roles) {
    out.push(
      "INSERT INTO council_member_roles (member_id, role, start_date, end_date, source_url)",
      `VALUES (${memberId(r.slug)}, ${sqlString(r.role)}, ${sqlDate(r.startDate)}, ${sqlDate(r.endDate)}, ${sqlString(r.sourceUrl)})`,
      "ON CONFLICT (member_id, role, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;"
    );
  }

  out.push(
    "",
    "COMMIT;",
    "",
    "-- 確認用",
    "SELECT",
    "  (SELECT count(*) FROM council_members) AS members,",
    "  (SELECT count(*) FROM council_members WHERE is_current) AS current_members,",
    "  (SELECT count(*) FROM council_member_terms) AS terms,",
    "  (SELECT count(*) FROM council_member_factions) AS factions,",
    "  (SELECT count(*) FROM council_member_roles) AS roles;",
    ""
  );
  return out.join("\n");
}
