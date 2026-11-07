import type { BudgetJigyo, CityBudget } from "../types/budget";

/** 予算データから「まずはここだけ」の要点と照合結果を計算する純粋関数群 */

export interface BudgetSummary {
  total: number;
  prevTotal: number;
  topRevenue: { name: string; amt: number };
  topExpenditure: { name: string; amt: number };
  ippanTotal: number;
  mostIncreased: { name: string; prev: number; amt: number } | null;
  mostDecreased: { name: string; prev: number; amt: number } | null;
}

export function summarizeBudget(data: CityBudget): BudgetSummary {
  const byAmt = <T extends { amt: number }>(a: T, b: T) => b.amt - a.amt;
  const [topRevenue] = [...data.sainyu].sort(byAmt);
  const [topExpenditure] = [...data.saishutsu].sort(byAmt);
  const changes = data.saishutsu.map((k) => ({
    name: k.name,
    prev: k.prev,
    amt: k.amt,
    diff: k.amt - k.prev,
  }));
  const inc = changes.filter((c) => c.diff > 0).sort((a, b) => b.diff - a.diff);
  const dec = changes.filter((c) => c.diff < 0).sort((a, b) => a.diff - b.diff);
  return {
    total: data.meta.total,
    prevTotal: data.meta.prev_total,
    topRevenue: { name: topRevenue.name, amt: topRevenue.amt },
    topExpenditure: { name: topExpenditure.name, amt: topExpenditure.amt },
    ippanTotal: data.saishutsu.reduce((s, k) => s + k.zaigen.ippan, 0),
    mostIncreased: inc[0] ?? null,
    mostDecreased: dec[0] ?? null,
  };
}

export interface JigyoWithPath extends BudgetJigyo {
  kan: string;
  kou: string;
  moku: string;
}

export function flattenJigyo(data: CityBudget): JigyoWithPath[] {
  return data.saishutsu.flatMap((k) =>
    k.kou.flatMap((p) =>
      p.moku.flatMap((m) =>
        m.jigyo.map((j) => ({ ...j, kan: k.name, kou: p.name, moku: m.name }))
      )
    )
  );
}

/** 事業名・担当課・目の名前で絞り込み、金額の大きい順に返す */
export function searchJigyo(
  all: JigyoWithPath[],
  query: string
): JigyoWithPath[] {
  const q = query.trim();
  if (!q) return [];
  return all
    .filter((j) => j.name.includes(q) || j.ka.includes(q) || j.moku.includes(q))
    .sort((a, b) => b.amt - a.amt);
}

/**
 * 階層の合計がすべて一致しているかを確かめる。
 * 一致しない箇所の説明を返す（空配列なら全部一致）。
 */
export function verifyBudget(data: CityBudget): string[] {
  const errors: string[] = [];
  const sum = (xs: { amt: number }[]) => xs.reduce((s, x) => s + x.amt, 0);
  if (sum(data.sainyu) !== data.meta.total) errors.push("歳入の合計");
  if (sum(data.saishutsu) !== data.meta.total) errors.push("歳出の合計");
  for (const k of data.sainyu) {
    if (sum(k.kou) !== k.amt) errors.push(`歳入 ${k.name}`);
  }
  for (const k of data.saishutsu) {
    if (sum(k.kou) !== k.amt) errors.push(`歳出 ${k.name}`);
    const z = k.zaigen;
    if (z.kokuto + z.chihousai + z.sonota + z.ippan !== k.amt) {
      errors.push(`財源内訳 ${k.name}`);
    }
    for (const p of k.kou) {
      if (sum(p.moku) !== p.amt) errors.push(`項 ${p.name}`);
      for (const m of p.moku) {
        if (sum(m.jigyo) !== m.amt) errors.push(`目 ${m.name}`);
        for (const j of m.jigyo) {
          if (j.tokutei + j.ippan !== j.amt) errors.push(`事業 ${j.name}`);
        }
      }
    }
  }
  return errors;
}
