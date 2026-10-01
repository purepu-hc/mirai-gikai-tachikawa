import { describe, expect, it } from "vitest";
import { needsAnonymousAuth } from "./feature-flags";

describe("needsAnonymousAuth", () => {
  it("AI機能がすべて無効なら不要", () => {
    expect(needsAnonymousAuth({ aiChat: false, aiInterview: false })).toBe(
      false
    );
  });

  it("AIチャットが有効なら必要", () => {
    expect(needsAnonymousAuth({ aiChat: true, aiInterview: false })).toBe(true);
  });

  it("AIインタビューが有効なら必要", () => {
    expect(needsAnonymousAuth({ aiChat: false, aiInterview: true })).toBe(true);
  });
});
