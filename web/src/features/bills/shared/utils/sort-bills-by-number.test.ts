import { describe, expect, it } from "vitest";
import {
  billNumberSortKey,
  sortBillsByNumberDesc,
} from "./sort-bills-by-number";

describe("billNumberSortKey", () => {
  it("年と号数から数値を作る", () => {
    expect(billNumberSortKey("令和8年議案第116号")).toBe(2026 * 10000 + 116);
  });

  it("令和元年に対応する", () => {
    expect(billNumberSortKey("令和元年議案第3号")).toBe(2019 * 10000 + 3);
  });

  it("年が無くても号数で並べられる", () => {
    expect(billNumberSortKey("議案第5号")).toBe(5);
  });

  it("号数が読めなければ null", () => {
    expect(billNumberSortKey("")).toBeNull();
  });
});

describe("sortBillsByNumberDesc", () => {
  it("番号の大きい順（新しい順）に並べる", () => {
    const bills = [
      { bill_number: "令和8年議案第104号" },
      { bill_number: "令和8年議案第116号" },
      { bill_number: "令和8年議案第95号" },
    ];
    expect(sortBillsByNumberDesc(bills).map((b) => b.bill_number)).toEqual([
      "令和8年議案第116号",
      "令和8年議案第104号",
      "令和8年議案第95号",
    ]);
  });

  it("年が新しい議案を先にする", () => {
    const bills = [
      { bill_number: "令和7年議案第120号" },
      { bill_number: "令和8年議案第1号" },
    ];
    expect(sortBillsByNumberDesc(bills)[0].bill_number).toBe(
      "令和8年議案第1号"
    );
  });

  it("番号が読めない議案は後ろに回し、公開日時の新しい順にする", () => {
    const bills = [
      { bill_number: "", published_at: "2026-09-01" },
      { bill_number: "令和8年議案第95号", published_at: "2026-08-01" },
      { bill_number: "", published_at: "2026-09-10" },
    ];
    expect(sortBillsByNumberDesc(bills).map((b) => b.published_at)).toEqual([
      "2026-08-01",
      "2026-09-10",
      "2026-09-01",
    ]);
  });

  it("元の配列を変更しない", () => {
    const bills = [{ bill_number: "議案第1号" }, { bill_number: "議案第2号" }];
    sortBillsByNumberDesc(bills);
    expect(bills[0].bill_number).toBe("議案第1号");
  });
});
