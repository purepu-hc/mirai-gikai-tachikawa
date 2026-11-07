import { describe, expect, it } from "vitest";
import tachikawa from "../data/tachikawa-r8-ippan.json";
import type { CityBudget } from "../types/budget";
import {
  flattenJigyo,
  searchJigyo,
  summarizeBudget,
  verifyBudget,
} from "./budget-summary";

const data = tachikawa as CityBudget;

describe("立川市 令和8年度一般会計のデータ", () => {
  it("款・項・目・事業と財源内訳の合計がすべて一致する", () => {
    expect(verifyBudget(data)).toEqual([]);
  });
  it("予算書の総額・款数・事業数と一致する", () => {
    expect(data.meta.total).toBe(93506000);
    expect(data.sainyu).toHaveLength(23);
    expect(data.saishutsu).toHaveLength(12);
    expect(flattenJigyo(data)).toHaveLength(640);
  });
});

describe("summarizeBudget", () => {
  it("いちばん多い歳入・歳出と、増減のいちばん大きい款", () => {
    const s = summarizeBudget(data);
    expect(s.topRevenue.name).toBe("市税");
    expect(s.topExpenditure.name).toBe("民生費");
    expect(s.ippanTotal).toBe(56891243);
    expect(s.mostIncreased?.name).toBe("総務費");
    expect(s.mostDecreased?.name).toBe("教育費");
  });
});

describe("verifyBudget", () => {
  it("合計がずれていれば場所を返す", () => {
    const broken = structuredClone(data);
    broken.saishutsu[0].kou[0].moku[0].jigyo[0].amt += 1;
    expect(verifyBudget(broken)).toContain(
      `目 ${broken.saishutsu[0].kou[0].moku[0].name}`
    );
  });
});

describe("searchJigyo", () => {
  const all = flattenJigyo(data);
  it("空の検索語では何も返さない", () => {
    expect(searchJigyo(all, "  ")).toEqual([]);
  });
  it("事業名・担当課で絞り込み、金額の大きい順に並べる", () => {
    const hit = searchJigyo(all, "給食");
    expect(hit.length).toBeGreaterThan(0);
    for (let i = 1; i < hit.length; i++) {
      expect(hit[i - 1].amt).toBeGreaterThanOrEqual(hit[i].amt);
    }
  });
});
