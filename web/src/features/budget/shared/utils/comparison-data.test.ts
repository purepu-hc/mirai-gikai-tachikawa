import { describe, expect, it } from "vitest";
import tama26 from "../data/tama26-r6-kessan.json";
import type { ComparisonData } from "../types/budget";

const data = tama26 as ComparisonData;

describe("多摩26市 令和6年度決算（総務省 市町村別決算状況調）のデータ", () => {
  it("26市がそろっている", () => {
    expect(data.cities).toHaveLength(26);
    expect(data.cities.map((c) => c.name)).toContain("立川市");
  });
  it("各市で、使い道を足すと歳出総額に一致する", () => {
    for (const c of data.cities) {
      const sum = Object.values(c.kan).reduce((s, k) => s + k.amt, 0);
      expect(sum, c.name).toBe(c.total);
    }
  });
  it("内訳のある使い道は、内訳を足すと使い道の額に一致する", () => {
    for (const c of data.cities) {
      for (const [name, k] of Object.entries(c.kan)) {
        const subs = Object.values(k.sub);
        if (subs.length === 0) continue;
        expect(
          subs.reduce((s, v) => s + v, 0),
          `${c.name} ${name}`
        ).toBe(k.amt);
      }
    }
  });
});
