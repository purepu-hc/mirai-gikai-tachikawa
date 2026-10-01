/** 和暦の元号ごとの元年（西暦） */
const ERA_START: Record<string, number> = { 令和: 2019, 平成: 1989 };

/**
 * 議案番号（例: 令和8年議案第116号）から並び替え用の数値を取り出す。
 * 年 × 10000 + 号数。読み取れない場合は null。
 */
export function billNumberSortKey(billNumber: string): number | null {
  const year = billNumber.match(/(令和|平成)(元|\d+)年/);
  const num = billNumber.match(/第(\d+)号/);
  if (!num) return null;
  const westernYear = year
    ? ERA_START[year[1]] + (year[2] === "元" ? 1 : Number(year[2])) - 1
    : 0;
  return westernYear * 10000 + Number(num[1]);
}

type SortableBill = {
  bill_number: string;
  published_at?: string | null;
};

/**
 * 議案を新しい順（議案番号の大きい順）に並べる。
 * 番号が読み取れない議案は後ろに回し、公開日時の新しい順で並べる。
 * 元の配列は変更しない。
 */
export function sortBillsByNumberDesc<T extends SortableBill>(bills: T[]): T[] {
  return [...bills].sort((a, b) => {
    const ka = billNumberSortKey(a.bill_number);
    const kb = billNumberSortKey(b.bill_number);
    if (ka !== null && kb !== null && ka !== kb) return kb - ka;
    if (ka !== null && kb === null) return -1;
    if (ka === null && kb !== null) return 1;
    return (b.published_at ?? "").localeCompare(a.published_at ?? "");
  });
}
