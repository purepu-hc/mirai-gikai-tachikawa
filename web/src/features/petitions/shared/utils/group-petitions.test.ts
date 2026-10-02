import { describe, expect, it } from "vitest";
import { groupPetitionsByKind, petitionKind } from "./group-petitions";

describe("petitionKind", () => {
  it("番号から請願・陳情を判定する", () => {
    expect(petitionKind("令和8年請願第1号")).toBe("請願");
    expect(petitionKind("令和8年陳情第11号")).toBe("陳情");
  });

  it("どちらでもなければ「その他」", () => {
    expect(petitionKind("")).toBe("その他");
    expect(petitionKind("令和8年議案第1号")).toBe("その他");
  });
});

describe("groupPetitionsByKind", () => {
  it("請願 → 陳情 → その他 の順にまとめ、並び順は保つ", () => {
    const groups = groupPetitionsByKind([
      { bill_number: "令和8年陳情第12号" },
      { bill_number: "令和8年請願第1号" },
      { bill_number: "令和8年陳情第11号" },
      { bill_number: "" },
    ]);
    expect(groups.map((g) => g.kind)).toEqual(["請願", "陳情", "その他"]);
    expect(groups[1].items.map((p) => p.bill_number)).toEqual([
      "令和8年陳情第12号",
      "令和8年陳情第11号",
    ]);
  });

  it("空のグループは返さない", () => {
    const groups = groupPetitionsByKind([{ bill_number: "令和8年陳情第1号" }]);
    expect(groups.map((g) => g.kind)).toEqual(["陳情"]);
    expect(groupPetitionsByKind([])).toEqual([]);
  });
});
