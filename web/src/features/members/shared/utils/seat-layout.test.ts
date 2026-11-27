import { describe, expect, it } from "vitest";
import { buildSeatLayout } from "./seat-layout";

const all = Array.from({ length: 28 }, (_, i) => 28 - i);

describe("buildSeatLayout", () => {
  it("28席をすべて、番号順に1回ずつ置く", () => {
    const layout = buildSeatLayout(all);
    expect(layout.map((s) => s.seatNumber)).toEqual(
      Array.from({ length: 28 }, (_, i) => i + 1)
    );
  });

  it("内側の列は12席で、外側の列より中心に近い", () => {
    const layout = buildSeatLayout(all);
    const inner = layout.slice(0, 12);
    const outer = layout.slice(12);
    const minOuterTop = Math.min(...outer.map((s) => s.topPct));
    const minInnerTop = Math.min(...inner.map((s) => s.topPct));
    expect(minInnerTop).toBeGreaterThan(minOuterTop);
  });

  it("各列は左から右へ並び、左右対称になる", () => {
    const layout = buildSeatLayout(all);
    const inner = layout.slice(0, 12);
    expect(inner[0].leftPct).toBeLessThan(inner[11].leftPct);
    expect(inner[0].leftPct + inner[11].leftPct).toBeCloseTo(100, 0);
    expect(inner[0].topPct).toBeCloseTo(inner[11].topPct, 1);
  });

  it("どの席も図の中に収まる", () => {
    for (const s of buildSeatLayout(all)) {
      expect(s.leftPct).toBeGreaterThan(0);
      expect(s.leftPct).toBeLessThan(100);
      expect(s.topPct).toBeGreaterThan(0);
      expect(s.topPct).toBeLessThan(100);
    }
  });

  it("欠員で席が少ないときも、ある席だけを置く", () => {
    const layout = buildSeatLayout([3, 1, 2]);
    expect(layout.map((s) => s.seatNumber)).toEqual([1, 2, 3]);
  });
});
