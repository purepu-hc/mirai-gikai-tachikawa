import { describe, expect, it } from "vitest";
import {
  buildIssueBody,
  diffManifests,
  extractPdfUrls,
  needsAttention,
  type SourceEntry,
  type SourceManifest,
} from "./source-watch";

const A = "https://www.city.tachikawa.lg.jp/_res/a/r8gian70-2.pdf";
const B = "https://www.city.tachikawa.lg.jp/_res/b/345-8.pdf";

const entry = (sha256: string | null, status = 200): SourceEntry => ({
  sha256,
  bytes: sha256 ? 100 : null,
  status,
  checkedAt: "2026-11-16T00:00:00Z",
});

describe("extractPdfUrls", () => {
  it("SQL・JSONから市のPDFのURLだけを重複なしで昇順に取り出す", () => {
    const sql = `VALUES ('x', '${B}'), ('y', '${A}');`;
    const json = `{"url": "${A}", "other": "https://example.com/c.pdf"}`;
    expect(extractPdfUrls([sql, json])).toEqual([A, B]);
  });

  it("文中のURLは句読点や括弧の手前で切る", () => {
    expect(extractPdfUrls([`資料（PDF）：${A}）。`])).toEqual([A]);
  });
});

describe("diffManifests", () => {
  it("中身の変化・取得不可・復旧・新規を分けて返す", () => {
    const prev: SourceManifest = {
      [A]: entry("aaa"),
      [B]: entry("bbb"),
      c: entry(null, 404),
    };
    const next: SourceManifest = {
      [A]: entry("aaa2"),
      [B]: entry(null, 404),
      c: entry("ccc"),
      d: entry("ddd"),
    };
    expect(diffManifests(prev, next)).toEqual({
      changed: [A],
      lost: [B],
      recovered: ["c"],
      added: ["d"],
    });
  });

  it("前回の記録が無い（初回）ときは差し替えとして扱わない", () => {
    const diff = diffManifests({}, { [A]: entry("aaa") });
    expect(diff.added).toEqual([A]);
    expect(needsAttention(diff)).toBe(false);
  });

  it("同じ中身なら知らせない", () => {
    const m = { [A]: entry("aaa") };
    expect(needsAttention(diffManifests(m, m))).toBe(false);
  });
});

describe("buildIssueBody", () => {
  it("変わったPDFと取得できなくなったPDFを本文に含める", () => {
    const prev = { [A]: entry("aaa"), [B]: entry("bbb") };
    const next = { [A]: entry("aaa2"), [B]: entry(null, 404) };
    const body = buildIssueBody(
      diffManifests(prev, next),
      prev,
      next,
      "https://github.com/run/1"
    );
    expect(body).toContain("中身が変わったPDF（1 件）");
    expect(body).toContain(A);
    expect(body).toContain(`${B}（HTTP 404）`);
    expect(body).toContain("実行ログ: https://github.com/run/1");
  });
});
