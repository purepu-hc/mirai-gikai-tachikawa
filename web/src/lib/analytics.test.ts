import { describe, expect, it } from "vitest";
import { resolveGaTrackingId } from "./analytics";

describe("resolveGaTrackingId", () => {
  it("有効かつIDがあればIDを返す", () => {
    expect(resolveGaTrackingId(true, "G-ABC123")).toBe("G-ABC123");
  });

  it("前後の空白を取り除いて返す", () => {
    expect(resolveGaTrackingId(true, "  G-ABC123 ")).toBe("G-ABC123");
  });

  it("無効ならIDがあっても null を返す", () => {
    expect(resolveGaTrackingId(false, "G-ABC123")).toBeNull();
  });

  it("有効でもIDが未設定なら null を返す", () => {
    expect(resolveGaTrackingId(true, undefined)).toBeNull();
  });

  it("有効でもIDが空文字・空白のみなら null を返す", () => {
    expect(resolveGaTrackingId(true, "")).toBeNull();
    expect(resolveGaTrackingId(true, "   ")).toBeNull();
  });
});
