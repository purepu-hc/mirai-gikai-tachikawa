import type { ComparisonCity } from "../types/budget";

/**
 * 多摩26市くらべの集計（人口1人あたり金額・平均・順位・指数）を行う純粋関数群。
 * 金額データは千円単位、1人あたりは円単位で返す。
 */

export type KanKey = string | "total";

/** 1人あたり金額（円）。sub を指定すると款の内訳 */
export function perCapita(
  city: ComparisonCity,
  kan: KanKey,
  sub?: string
): number {
  const senYen =
    kan === "total"
      ? city.total
      : sub
        ? (city.kan[kan]?.sub[sub] ?? 0)
        : (city.kan[kan]?.amt ?? 0);
  return (senYen * 1000) / city.pop;
}

export function mean(values: number[]): number {
  if (values.length === 0) return 0;
  return values.reduce((s, v) => s + v, 0) / values.length;
}

export function median(values: number[]): number {
  if (values.length === 0) return 0;
  const sorted = [...values].sort((a, b) => a - b);
  const mid = Math.floor(sorted.length / 2);
  return sorted.length % 2 ? sorted[mid] : (sorted[mid - 1] + sorted[mid]) / 2;
}

export interface CompareStat {
  values: number[];
  target: number;
  average: number;
  median: number;
  min: number;
  max: number;
  /** 多い順の順位（1始まり） */
  rank: number;
  /** 平均を100とした指数。平均が0なら null */
  index: number | null;
}

export function compareStat(
  cities: ComparisonCity[],
  target: ComparisonCity,
  kan: KanKey,
  sub?: string
): CompareStat {
  const values = cities.map((c) => perCapita(c, kan, sub));
  const t = perCapita(target, kan, sub);
  const average = mean(values);
  return {
    values,
    target: t,
    average,
    median: median(values),
    min: Math.min(...values),
    max: Math.max(...values),
    rank: values.filter((v) => v > t).length + 1,
    index: average > 0 ? (t / average) * 100 : null,
  };
}

/**
 * 表示する内訳を選ぶ。どの市も小さすぎる項目（1人あたり threshold 円未満）は省く。
 * 立川市（target）の金額の大きい順に並べる。
 */
export function visibleSubs(
  cities: ComparisonCity[],
  target: ComparisonCity,
  kan: string,
  threshold = 100
): string[] {
  const subs = Object.keys(target.kan[kan]?.sub ?? {});
  return subs
    .filter((sub) => {
      const s = compareStat(cities, target, kan, sub);
      return s.average >= threshold || s.target >= threshold;
    })
    .sort((a, b) => perCapita(target, kan, b) - perCapita(target, kan, a));
}

/** 平均との差を「平均より○○多い／少ない」で表すための符号と大きさ */
export function diffFromAverage(stat: CompareStat): {
  direction: "more" | "less" | "same";
  amount: number;
} {
  const d = stat.target - stat.average;
  if (Math.abs(d) < 0.5) return { direction: "same", amount: 0 };
  return { direction: d > 0 ? "more" : "less", amount: Math.abs(d) };
}
