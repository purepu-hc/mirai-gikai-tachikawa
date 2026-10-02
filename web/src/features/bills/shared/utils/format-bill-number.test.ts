import { describe, expect, it } from "vitest";
import { formatBillNumberLabel } from "./format-bill-number";

describe("formatBillNumberLabel", () => {
  it("先頭の年を省く", () => {
    expect(formatBillNumberLabel("令和8年議案第116号")).toBe("議案第116号");
    expect(formatBillNumberLabel("令和元年議案第3号")).toBe("議案第3号");
  });

  it("年が無ければそのまま", () => {
    expect(formatBillNumberLabel("議員提出議案第1号")).toBe(
      "議員提出議案第1号"
    );
  });

  it("空なら null", () => {
    expect(formatBillNumberLabel("")).toBeNull();
    expect(formatBillNumberLabel(null)).toBeNull();
    expect(formatBillNumberLabel("  ")).toBeNull();
  });
});
