import { describe, expect, it } from "vitest";
import {
  formatExactYen,
  formatOku,
  formatPerCapita,
  formatPercent,
} from "./format-yen";

describe("formatOku", () => {
  it("1億円以上は億円（小数1桁）で表す", () => {
    expect(formatOku(93506000)).toBe("935.1億円");
    expect(formatOku(100000)).toBe("1.0億円");
  });
  it("1万円以上1億円未満は万円で表す", () => {
    expect(formatOku(72901)).toBe("7,290万円");
    expect(formatOku(10)).toBe("1万円");
  });
  it("1万円未満は円で表す（予算書の1千円も消さない）", () => {
    expect(formatOku(1)).toBe("1,000円");
    expect(formatOku(0)).toBe("0円");
  });
  it("マイナスは先頭に符号を付ける", () => {
    expect(formatOku(-2572245)).toBe("-25.7億円");
  });
});

describe("formatExactYen", () => {
  it("億・万・千円を丸めずに表す", () => {
    expect(formatExactYen(93506000)).toBe("935億600万円");
    expect(formatExactYen(47458233)).toBe("474億5,823万3,000円");
    expect(formatExactYen(1)).toBe("1,000円");
    expect(formatExactYen(0)).toBe("0円");
  });
});

describe("formatPerCapita", () => {
  it("1万円以上は万円、未満は円", () => {
    expect(formatPerCapita(493558)).toBe("49.4万円");
    expect(formatPerCapita(2360.4)).toBe("2,360円");
  });
});

describe("formatPercent", () => {
  it("小数1桁の百分率", () => {
    expect(formatPercent(44350430, 93506000)).toBe("47.4%");
  });
  it("分母が0なら0.0%", () => {
    expect(formatPercent(1, 0)).toBe("0.0%");
  });
});
