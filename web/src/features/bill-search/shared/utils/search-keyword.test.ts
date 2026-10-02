import { describe, expect, it } from "vitest";
import {
  MAX_KEYWORD_LENGTH,
  normalizeSearchKeyword,
  toContainsPattern,
} from "./search-keyword";

describe("normalizeSearchKeyword", () => {
  it("前後の空白（全角含む）を取り除く", () => {
    expect(normalizeSearchKeyword("　公園 ")).toBe("公園");
  });

  it("連続する空白を1つにする", () => {
    expect(normalizeSearchKeyword("子ども　 福祉")).toBe("子ども 福祉");
  });

  it("空・未指定は null", () => {
    expect(normalizeSearchKeyword("")).toBeNull();
    expect(normalizeSearchKeyword("　 ")).toBeNull();
    expect(normalizeSearchKeyword(undefined)).toBeNull();
    expect(normalizeSearchKeyword(null)).toBeNull();
  });

  it("配列なら先頭を使う", () => {
    expect(normalizeSearchKeyword(["公園", "学童"])).toBe("公園");
  });

  it("長すぎる入力は切り詰める", () => {
    expect(normalizeSearchKeyword("あ".repeat(80))).toHaveLength(
      MAX_KEYWORD_LENGTH
    );
  });
});

describe("toContainsPattern", () => {
  it("部分一致のパターンにする", () => {
    expect(toContainsPattern("公園")).toBe("%公園%");
  });

  it("% _ \\ をエスケープする", () => {
    expect(toContainsPattern("100%")).toBe("%100\\%%");
    expect(toContainsPattern("a_b")).toBe("%a\\_b%");
    expect(toContainsPattern("a\\b")).toBe("%a\\\\b%");
  });
});
