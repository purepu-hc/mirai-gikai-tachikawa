/**
 * 市のPDF（登録データの原典）を取得し、前回の取得結果と比べる（AI不使用）。
 * GitHub Actions（.github/workflows/source_pdf_watch.yml）から週1回実行する。
 *
 * 使い方:
 *   pnpm --filter @mirai-gikai/tachikawa-ingest watch-sources -- --out-dir <dir> [--prev <前回の manifest.json>]
 *
 * 対象: supabase/seed-tachikawa/ 配下の .sql・.json に書かれた市のPDFのURL
 * 出力: <dir>/manifest.json（今回の取得結果）
 *       <dir>/issue.md（差し替え・取得不可があったときだけ。Issue の本文）
 * 市のサイトに負担をかけないよう、1件ずつ間隔を空けて取得する。
 */
import { createHash } from "node:crypto";
import {
  appendFileSync,
  existsSync,
  mkdirSync,
  readdirSync,
  readFileSync,
  writeFileSync,
} from "node:fs";
import { dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import {
  buildIssueBody,
  diffManifests,
  extractPdfUrls,
  needsAttention,
  type SourceEntry,
  type SourceManifest,
} from "./source-watch";

const INTERVAL_MS = 1500;
const TIMEOUT_MS = 30_000;
const USER_AGENT =
  "mirai-gikai-tachikawa source-watch (+https://github.com/purepu-hc/mirai-gikai-tachikawa)";

function getArg(name: string): string | undefined {
  const i = process.argv.indexOf(`--${name}`);
  return i >= 0 ? process.argv[i + 1] : undefined;
}

function listDataFiles(dir: string): string[] {
  return readdirSync(dir, { withFileTypes: true }).flatMap((d) => {
    const path = join(dir, d.name);
    if (d.isDirectory()) return listDataFiles(path);
    return /\.(sql|json)$/.test(d.name) ? [path] : [];
  });
}

async function fetchEntry(url: string): Promise<SourceEntry> {
  const checkedAt = new Date().toISOString();
  try {
    const res = await fetch(url, {
      headers: { "User-Agent": USER_AGENT },
      signal: AbortSignal.timeout(TIMEOUT_MS),
    });
    if (!res.ok) {
      return { sha256: null, bytes: null, status: res.status, checkedAt };
    }
    const body = Buffer.from(await res.arrayBuffer());
    return {
      sha256: createHash("sha256").update(body).digest("hex"),
      bytes: body.length,
      status: res.status,
      checkedAt,
    };
  } catch {
    return { sha256: null, bytes: null, status: null, checkedAt };
  }
}

const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));

async function main() {
  const outDir = getArg("out-dir");
  if (!outDir) throw new Error("--out-dir を指定してください");
  const prevPath = getArg("prev");

  const here = dirname(fileURLToPath(import.meta.url));
  const seedDir = resolve(here, "../../../supabase/seed-tachikawa");
  const urls = extractPdfUrls(
    listDataFiles(seedDir).map((f) => readFileSync(f, "utf8"))
  );
  console.log(`監視するPDF: ${urls.length} 件`);

  const next: SourceManifest = {};
  for (const [i, url] of urls.entries()) {
    if (i > 0) await sleep(INTERVAL_MS);
    next[url] = await fetchEntry(url);
  }

  mkdirSync(outDir, { recursive: true });
  writeFileSync(
    join(outDir, "manifest.json"),
    `${JSON.stringify(next, null, 2)}\n`
  );

  const prev: SourceManifest =
    prevPath && existsSync(prevPath)
      ? JSON.parse(readFileSync(prevPath, "utf8"))
      : {};
  if (Object.keys(prev).length === 0) {
    console.log("前回の記録がないため、今回の結果を基準として保存しました");
  }
  const diff = diffManifests(prev, next);
  console.log(
    `差し替え ${diff.changed.length} 件、取得不可 ${diff.lost.length} 件、復旧 ${diff.recovered.length} 件、新規 ${diff.added.length} 件`
  );

  const attention = needsAttention(diff);
  if (attention) {
    const runUrl = process.env.GITHUB_RUN_URL ?? "（ローカル実行）";
    writeFileSync(
      join(outDir, "issue.md"),
      buildIssueBody(diff, prev, next, runUrl)
    );
  }
  if (process.env.GITHUB_OUTPUT) {
    appendFileSync(process.env.GITHUB_OUTPUT, `attention=${attention}\n`);
  }
}

await main();
