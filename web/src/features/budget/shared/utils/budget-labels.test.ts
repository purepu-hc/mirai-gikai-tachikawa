import { describe, expect, it } from "vitest";
import {
  REVENUE_COLOR_GROUPS,
  revenueFillClass,
  revenueStrokeClass,
} from "./budget-labels";

describe("revenueFillClass / revenueStrokeClass", () => {
  it("市税（款1）は税の色になる", () => {
    expect(revenueFillClass(1)).toBe("fill-budget-tax");
    expect(revenueStrokeClass(1)).toBe("stroke-budget-tax");
  });

  it("どのグループにもない款は「その他」の色になる", () => {
    expect(revenueFillClass(99)).toBe("fill-budget-etc");
    expect(revenueStrokeClass(99)).toBe("stroke-budget-etc");
  });

  it("歳入23款すべてがちょうど1つのグループに入っている", () => {
    for (let code = 1; code <= 23; code++) {
      const hits = REVENUE_COLOR_GROUPS.filter((g) => g.codes.includes(code));
      expect(hits).toHaveLength(1);
    }
  });

  it("線の色は四角の色と同じトークンを使う", () => {
    for (const g of REVENUE_COLOR_GROUPS) {
      expect(g.strokeClassName.replace("stroke-", "")).toBe(
        g.className.replace("fill-", "")
      );
    }
  });
});
