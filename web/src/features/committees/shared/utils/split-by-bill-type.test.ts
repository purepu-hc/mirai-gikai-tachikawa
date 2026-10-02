import { describe, expect, it } from "vitest";
import { splitByBillType } from "./split-by-bill-type";

describe("splitByBillType", () => {
  it("議案と請願・陳情に分け、並び順は保つ", () => {
    const result = splitByBillType([
      { id: "1", bill_type: "bill" },
      { id: "2", bill_type: "petition" },
      { id: "3", bill_type: "member_bill" },
      { id: "4", bill_type: "petition" },
    ]);
    expect(result.bills.map((b) => b.id)).toEqual(["1", "3"]);
    expect(result.petitions.map((b) => b.id)).toEqual(["2", "4"]);
  });

  it("空なら両方空", () => {
    expect(splitByBillType([])).toEqual({ bills: [], petitions: [] });
  });
});
