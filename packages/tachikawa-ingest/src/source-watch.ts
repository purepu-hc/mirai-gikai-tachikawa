/**
 * 市のPDF（原典）の差し替えを見つけるための純粋関数（AI不使用）。
 * 取得・保存は cli-source-watch.ts が行う。
 */

/** 監視するPDFのURL（市のサイトに置かれたPDF） */
const PDF_URL_PATTERN = /https:\/\/www\.city\.tachikawa\.lg\.jp\/[^\s'"<>)]+?\.pdf/g;

/** 投入用SQL・JSONなどのテキストから、市のPDFのURLを重複なしで取り出す（並びは昇順） */
export function extractPdfUrls(texts: string[]): string[] {
  const urls = new Set<string>();
  for (const text of texts) {
    for (const match of text.matchAll(PDF_URL_PATTERN)) {
      urls.add(match[0]);
    }
  }
  return [...urls].sort();
}

/** 1つのPDFを取得した結果。取得できなかったときは sha256 が null */
export type SourceEntry = {
  sha256: string | null;
  bytes: number | null;
  status: number | null;
  checkedAt: string;
};

/** URL → 取得結果 */
export type SourceManifest = Record<string, SourceEntry>;

export type SourceDiff = {
  /** 中身が変わったPDF（差し替え） */
  changed: string[];
  /** 前回は取れたが、今回は取れなかったPDF（削除・移動の可能性） */
  lost: string[];
  /** 前回は取れなかったが、今回は取れたPDF */
  recovered: string[];
  /** 今回はじめて監視したPDF */
  added: string[];
};

/** 前回と今回の取得結果を比べる。前回の記録が無いURLは added に入れ、差し替えとは扱わない */
export function diffManifests(
  prev: SourceManifest,
  next: SourceManifest
): SourceDiff {
  const diff: SourceDiff = { changed: [], lost: [], recovered: [], added: [] };
  for (const url of Object.keys(next).sort()) {
    const before = prev[url];
    const after = next[url];
    if (!before) {
      diff.added.push(url);
    } else if (before.sha256 && !after.sha256) {
      diff.lost.push(url);
    } else if (!before.sha256 && after.sha256) {
      diff.recovered.push(url);
    } else if (before.sha256 && after.sha256 !== before.sha256) {
      diff.changed.push(url);
    }
  }
  return diff;
}

/** 知らせる必要がある変化があるか（差し替え・取得できなくなった） */
export function needsAttention(diff: SourceDiff): boolean {
  return diff.changed.length > 0 || diff.lost.length > 0;
}

/** Issue の本文を作る */
export function buildIssueBody(
  diff: SourceDiff,
  prev: SourceManifest,
  next: SourceManifest,
  runUrl: string
): string {
  const lines: string[] = [
    "市のサイトのPDF（登録データの原典）に変化がありました。",
    "このPDFを元にした議案の解説・賛否・議決結果を確認してください。",
    "",
  ];
  if (diff.changed.length > 0) {
    lines.push(`## 中身が変わったPDF（${diff.changed.length} 件）`, "");
    for (const url of diff.changed) {
      lines.push(
        `- ${url}`,
        `  - 前回: ${prev[url]?.bytes ?? "?"} バイト（${prev[url]?.checkedAt ?? "?"} 取得）`,
        `  - 今回: ${next[url]?.bytes ?? "?"} バイト`
      );
    }
    lines.push("");
  }
  if (diff.lost.length > 0) {
    lines.push(
      `## 取得できなくなったPDF（${diff.lost.length} 件）`,
      "",
      "削除・移動・一時的な停止の可能性があります。",
      ""
    );
    for (const url of diff.lost) {
      lines.push(`- ${url}（HTTP ${next[url]?.status ?? "接続エラー"}）`);
    }
    lines.push("");
  }
  lines.push(
    "## 確認のしかた",
    "",
    "1. 上のPDFを開き、登録データ（解説・賛否・議決結果）と食い違いがないか確認する",
    "2. 食い違いがあれば、`supabase/seed-tachikawa/` のデータを直してPRを出す",
    "3. 確認が済んだらこのIssueを閉じる（次回からは今回の中身を基準に比べる）",
    "",
    `実行ログ: ${runUrl}`
  );
  return lines.join("\n");
}
