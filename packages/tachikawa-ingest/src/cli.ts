/**
 * 使い方:
 *   pnpm --filter @mirai-gikai/tachikawa-ingest build-sql -- --session r8-3-teireikai
 *   （ネットに出られない環境では --html <保存したHTML> で読み込み元を指定）
 *
 * 出力: supabase/seed-tachikawa/<session>.sql
 * 生成したSQLは Supabase の SQL Editor に貼り付けて実行する。
 */
import { mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { buildSql } from "./build-sql";
import { COMMITTEES, FACTIONS, SESSIONS } from "./masters";
import { parseBillList } from "./parse-bill-list";

function getArg(name: string): string | undefined {
  const i = process.argv.indexOf(`--${name}`);
  return i >= 0 ? process.argv[i + 1] : undefined;
}

async function main() {
  const sessionKey = getArg("session") ?? "r8-3-teireikai";
  const session = SESSIONS[sessionKey];
  if (!session) {
    throw new Error(
      `会期 ${sessionKey} が masters.ts にありません（登録済み: ${Object.keys(SESSIONS).join(", ")}）`
    );
  }

  const htmlPath = getArg("html");
  const html = htmlPath
    ? readFileSync(resolve(htmlPath), "utf-8")
    : await (await fetch(session.billListUrl)).text();

  const rows = parseBillList(html, session.billListUrl);
  if (rows.length === 0) {
    throw new Error("議案が1件も読み取れませんでした。ページの構成が変わった可能性があります。");
  }

  const sql = buildSql({ session, committees: COMMITTEES, factions: FACTIONS, rows });
  const repoRoot = resolve(dirname(fileURLToPath(import.meta.url)), "../../..");
  const outPath = getArg("out") ?? resolve(repoRoot, `supabase/seed-tachikawa/${session.slug}.sql`);
  mkdirSync(dirname(outPath), { recursive: true });
  writeFileSync(outPath, sql);
  console.log(`${session.name}: 議案 ${rows.length} 件 → ${outPath}`);
}

main().catch((e) => {
  console.error(e instanceof Error ? e.message : e);
  process.exit(1);
});
