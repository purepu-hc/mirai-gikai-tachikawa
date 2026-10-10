/**
 * 会派別賛否の投入用SQLを作る（AI不使用）。
 *
 * 使い方:
 *   pnpm --filter @mirai-gikai/tachikawa-ingest build-votes-sql -- --session r8-1-teireikai
 *
 * 入力: supabase/seed-tachikawa/votes/<session>.json（市議会便りの「各議案等に対する賛否」を書き起こしたもの）
 * 出力: supabase/seed-tachikawa/votes/<session>.sql
 * 生成したSQLは Supabase の SQL Editor に貼り付けて実行する。
 */
import { readFileSync, writeFileSync } from "node:fs";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { buildFactionVoteSql, type FactionVoteData } from "./faction-votes";

function getArg(name: string): string | undefined {
  const i = process.argv.indexOf(`--${name}`);
  return i >= 0 ? process.argv[i + 1] : undefined;
}

const session = getArg("session");
if (!session) {
  throw new Error("--session を指定してください（例: --session r8-1-teireikai）");
}

const here = dirname(fileURLToPath(import.meta.url));
const dir = resolve(here, "../../../supabase/seed-tachikawa/votes");
const data = JSON.parse(
  readFileSync(resolve(dir, `${session}.json`), "utf8")
) as FactionVoteData;
if (data.session !== session) {
  throw new Error(`JSON の session（${data.session}）が --session と違います`);
}

const outPath = resolve(dir, `${session}.sql`);
writeFileSync(outPath, buildFactionVoteSql(data));
console.log(`書き出しました: ${outPath}`);
