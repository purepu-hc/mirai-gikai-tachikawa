import { describe, expect, it } from "vitest";
import type { ComparisonCity } from "../types/budget";
import {
  compareStat,
  diffFromAverage,
  mean,
  median,
  perCapita,
  visibleSubs,
} from "./compare-stats";

function city(
  name: string,
  pop: number,
  welfare: number,
  sub: Record<string, number>
): ComparisonCity {
  return {
    code: name,
    name,
    pop,
    area: 10,
    zaiseiryoku: 1,
    keijo: 90,
    total: welfare,
    kan: { 民生費: { amt: welfare, sub } },
  };
}

const a = city("A市", 1000, 300, { 生活保護費: 200, 災害救助費: 0 });
const b = city("B市", 2000, 400, { 生活保護費: 200, 災害救助費: 0.01 });
const c = city("C市", 1000, 100, { 生活保護費: 50, 災害救助費: 0 });
const all = [a, b, c];

describe("perCapita", () => {
  it("千円単位の金額を人口で割って円にする", () => {
    expect(perCapita(a, "民生費")).toBe(300);
    expect(perCapita(b, "total")).toBe(200);
    expect(perCapita(a, "民生費", "生活保護費")).toBe(200);
  });
  it("ない款・内訳は0円", () => {
    expect(perCapita(a, "教育費")).toBe(0);
    expect(perCapita(a, "民生費", "老人福祉費")).toBe(0);
  });
});

describe("mean / median", () => {
  it("単純平均と中央値", () => {
    expect(mean([1, 2, 6])).toBe(3);
    expect(median([5, 1, 3])).toBe(3);
    expect(median([1, 2, 3, 4])).toBe(2.5);
    expect(mean([])).toBe(0);
  });
});

describe("compareStat", () => {
  it("平均・順位・指数を出す", () => {
    const s = compareStat(all, a, "民生費");
    expect(s.target).toBe(300);
    expect(s.average).toBe(200);
    expect(s.rank).toBe(1);
    expect(s.index).toBe(150);
    expect(compareStat(all, c, "民生費").rank).toBe(3);
  });
  it("同じ値は同じ順位", () => {
    const s = compareStat(all, b, "民生費");
    expect(s.target).toBe(200);
    expect(s.rank).toBe(2);
  });
  it("平均が0なら指数は null", () => {
    expect(compareStat(all, a, "教育費").index).toBeNull();
  });
});

describe("visibleSubs", () => {
  it("どの市も小さすぎる内訳は省き、対象市の多い順に並べる", () => {
    expect(visibleSubs(all, a, "民生費")).toEqual(["生活保護費"]);
  });
});

describe("diffFromAverage", () => {
  it("平均との差の向きと大きさ", () => {
    expect(diffFromAverage(compareStat(all, a, "民生費"))).toEqual({
      direction: "more",
      amount: 100,
    });
    expect(diffFromAverage(compareStat(all, b, "民生費")).direction).toBe(
      "same"
    );
  });
});
