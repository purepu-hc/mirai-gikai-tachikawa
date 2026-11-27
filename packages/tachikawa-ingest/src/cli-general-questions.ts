/**
 * 一般質問の投入用SQLを作る（AI不使用）。
 *
 * 使い方:
 *   pnpm --filter @mirai-gikai/tachikawa-ingest build-general-questions-sql -- --session r8-4-teireikai
 *
 * 入力: supabase/seed-tachikawa/general-questions/<session>.json（一般質問順序表を書き起こしたもの）
 * 出力: supabase/seed-tachikawa/general-questions/<session>.sql
 * 議員マスター（members.sql）を流したあとで、Supabase の SQL Editor に貼り付けて実行する。
 */
import { readFileSync, writeFileSync } from "node:fs";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import {
  buildGeneralQuestionSql,
  type GeneralQuestionData,
} from "./general-questions";
import { MEMBER_TERMS, MEMBERS } from "./members";

function getArg(name: string): string | undefined {
  const i = process.argv.indexOf(`--${name}`);
  return i >= 0 ? process.argv[i + 1] : undefined;
}

const session = getArg("session");
if (!session) {
  throw new Error("--session を指定してください（例: --session r8-4-teireikai）");
}

const here = dirname(fileURLToPath(import.meta.url));
const dir = resolve(here, "../../../supabase/seed-tachikawa/general-questions");
const data = JSON.parse(
  readFileSync(resolve(dir, `${session}.json`), "utf8")
) as GeneralQuestionData;
if (data.session.slug !== session) {
  throw new Error(
    `JSON の session（${data.session.slug}）が --session と違います`
  );
}

const outPath = resolve(dir, `${session}.sql`);
writeFileSync(outPath, buildGeneralQuestionSql(data, MEMBERS, MEMBER_TERMS));
console.log(`書き出しました: ${outPath}`);
