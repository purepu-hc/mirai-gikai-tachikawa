import { describe, expect, it } from "vitest";
import {
  computeFlowLayout,
  flowChartWidth,
  linkPath,
  spreadLabels,
} from "./flow-layout";

const options = {
  width: 800,
  height: 400,
  nodeWidth: 14,
  padding: 10,
  leftX: 200,
  rightX: 600,
  minNodeHeight: 0,
};

describe("computeFlowLayout", () => {
  const layout = computeFlowLayout(
    [
      { id: "a", label: "A", value: 60 },
      { id: "b", label: "B", value: 40 },
    ],
    [
      { id: "x", label: "X", value: 70 },
      { id: "y", label: "Y", value: 20 },
      { id: "z", label: "Z", value: 10 },
    ],
    "全体",
    options
  );

  it("線の太さは金額に比例し、左右で合計の太さが同じになる", () => {
    const inW = layout.links
      .filter((l) => l.targetId === "center")
      .reduce((s, l) => s + l.width, 0);
    const outW = layout.links
      .filter((l) => l.sourceId === "center")
      .reduce((s, l) => s + l.width, 0);
    expect(inW).toBeCloseTo(outW);
    expect(inW).toBeCloseTo(layout.center.y1 - layout.center.y0);
    const a = layout.links.find((l) => l.sourceId === "a");
    const b = layout.links.find((l) => l.sourceId === "b");
    expect((a?.width ?? 0) / (b?.width ?? 1)).toBeCloseTo(1.5);
  });

  it("列は高さの中に収まり、上から順に重ならずに並ぶ", () => {
    const last = layout.right[layout.right.length - 1];
    expect(last.y1).toBeLessThanOrEqual(options.height + 1e-9);
    for (let i = 1; i < layout.right.length; i++) {
      expect(layout.right[i].y0).toBeGreaterThan(layout.right[i - 1].y1);
    }
  });

  it("3列とも上端が0にそろう", () => {
    expect(layout.left[0].y0).toBe(0);
    expect(layout.center.y0).toBe(0);
    expect(layout.right[0].y0).toBe(0);
  });

  it("中央の列の太さは、入ってくる線の合計と同じ", () => {
    const first = layout.links.find((l) => l.targetId === "center");
    expect(first?.yTarget).toBeCloseTo((first?.width ?? 0) / 2);
  });

  it("小さい値にも最小の高さを確保する", () => {
    const l = computeFlowLayout(
      [
        { id: "a", label: "A", value: 1000000 },
        { id: "b", label: "B", value: 1 },
      ],
      [{ id: "x", label: "X", value: 1000001 }],
      "全体",
      { ...options, minNodeHeight: 2 }
    );
    expect(l.left[1].y1 - l.left[1].y0).toBeGreaterThanOrEqual(2);
  });

  it("合計が0なら例外にする", () => {
    expect(() => computeFlowLayout([], [], "全体", options)).toThrow();
  });
});

describe("linkPath", () => {
  it("始点と終点を結ぶ3次ベジェ曲線", () => {
    expect(linkPath(0, 10, 100, 50)).toBe("M0,10 C50,10 50,50 100,50");
  });
});

describe("flowChartWidth", () => {
  it("置き場所が広ければその幅になる", () => {
    expect(flowChartWidth(1100.6, 820)).toBe(1100);
  });

  it("置き場所が狭ければ最小幅になる", () => {
    expect(flowChartWidth(360, 820)).toBe(820);
  });

  it("幅が測れないときは最小幅になる", () => {
    expect(flowChartWidth(0, 820)).toBe(820);
    expect(flowChartWidth(Number.NaN, 820)).toBe(820);
  });
});

describe("spreadLabels", () => {
  it("間隔が足りていればそのままの位置", () => {
    expect(spreadLabels([0, 20, 50], 14)).toEqual([0, 20, 50]);
  });

  it("近すぎるラベルは下へずらす", () => {
    expect(spreadLabels([0, 3, 6, 100], 14)).toEqual([0, 14, 28, 100]);
  });

  it("ずらしが後ろへ連鎖する", () => {
    expect(spreadLabels([0, 2, 20], 14)).toEqual([0, 14, 28]);
  });
});
