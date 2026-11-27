/**
 * 議員マスターの投入用SQLを作る（AI不使用）。
 *
 * 使い方:
 *   pnpm --filter @mirai-gikai/tachikawa-ingest build-members-sql
 *
 * 入力: src/members.ts（出典を見て手で書いたデータ）
 * 出力: supabase/seed-tachikawa/members/members.sql
 * 生成したSQLは Supabase の SQL Editor に貼り付けて実行する。
 */
import { mkdirSync, writeFileSync } from "node:fs";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import {
  LINKS_CHECKED_AT,
  MEMBER_FACTIONS,
  MEMBER_ROLES,
  MEMBER_TERMS,
  MEMBERS,
} from "./members";
import { buildMemberSql } from "./members-sql";

const here = dirname(fileURLToPath(import.meta.url));
const dir = resolve(here, "../../../supabase/seed-tachikawa/members");
mkdirSync(dir, { recursive: true });
const outPath = resolve(dir, "members.sql");
writeFileSync(
  outPath,
  buildMemberSql({
    members: MEMBERS,
    terms: MEMBER_TERMS,
    factions: MEMBER_FACTIONS,
    roles: MEMBER_ROLES,
    linksCheckedAt: LINKS_CHECKED_AT,
  })
);
console.log(`書き出しました: ${outPath}`);
