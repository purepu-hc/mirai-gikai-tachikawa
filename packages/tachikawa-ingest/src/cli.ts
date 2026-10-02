/**
 * 使い方:
 *   pnpm --filter @mirai-gikai/tachikawa-ingest build-sql -- --session r8-3-teireikai
 *   pnpm --filter @mirai-gikai/tachikawa-ingest build-sql -- --session r8-3-teireikai --kind petition
 *   （ネットに出られない環境では --html <保存したHTML> で読み込み元を指定）
 *
 * 出力: supabase/seed-tachikawa/<session>.sql（請願・陳情は <session>-petitions.sql）
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

  const kind = getArg("kind") ?? "bill";
  if (kind !== "bill" && kind !== "petition") {
    throw new Error(`--kind は bill か petition を指定してください（指定値: ${kind}）`);
  }
  const pageUrl = kind === "petition" ? session.petitionListUrl : session.billListUrl;
  if (!pageUrl) {
    throw new Error(`会期 ${sessionKey} には請願・陳情一覧ページが登録されていません（masters.ts）`);
  }

  const htmlPath = getArg("html");
  const html = htmlPath
    ? readFileSync(resolve(htmlPath), "utf-8")
    : await (await fetch(pageUrl)).text();

  const rows = parseBillList(html, pageUrl).filter((r) => r.kind === kind);
  if (rows.length === 0) {
    throw new Error("1件も読み取れませんでした。ページの構成が変わった可能性があります。");
  }

  const sql = buildSql({ session, committees: COMMITTEES, factions: FACTIONS, rows });
  const repoRoot = resolve(dirname(fileURLToPath(import.meta.url)), "../../..");
  const outPath = getArg("out") ?? resolve(repoRoot, `supabase/seed-tachikawa/${session.slug}${kind === "petition" ? "-petitions" : ""}.sql`);
  mkdirSync(dirname(outPath), { recursive: true });
  writeFileSync(outPath, sql);
  const label = kind === "petition" ? "請願・陳情" : "議案";
  console.log(`${session.name}: ${label} ${rows.length} 件 → ${outPath}`);
}

main().catch((e) => {
  console.error(e instanceof Error ? e.message : e);
  process.exit(1);
});
