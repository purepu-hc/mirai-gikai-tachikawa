/**
 * 千円単位の金額を、読みやすい日本語の金額表記にする純粋関数群。
 */

/** 千円 → 「935.1億円」「7,290万円」「1,000円」 */
export function formatOku(senYen: number): string {
  const abs = Math.abs(senYen);
  const sign = senYen < 0 ? "-" : "";
  if (abs >= 100000) {
    return `${sign}${(abs / 100000).toLocaleString("ja-JP", {
      minimumFractionDigits: 1,
      maximumFractionDigits: 1,
    })}億円`;
  }
  if (abs >= 10) {
    return `${sign}${Math.round(abs / 10).toLocaleString("ja-JP")}万円`;
  }
  return `${sign}${(abs * 1000).toLocaleString("ja-JP")}円`;
}

/** 千円 → 「935億600万円」のような正確な表記（丸めなし） */
export function formatExactYen(senYen: number): string {
  const oku = Math.floor(senYen / 100000);
  const man = Math.floor((senYen % 100000) / 10);
  const sen = senYen % 10;
  let text = "";
  if (oku) text += `${oku.toLocaleString("ja-JP")}億`;
  if (man) text += `${man.toLocaleString("ja-JP")}万`;
  if (sen) text += (sen * 1000).toLocaleString("ja-JP");
  return `${text || "0"}円`;
}

/** 円 → 「49.4万円」「2,360円」（1人あたり金額用） */
export function formatPerCapita(yen: number): string {
  if (Math.abs(yen) >= 10000) {
    return `${(yen / 10000).toLocaleString("ja-JP", {
      maximumFractionDigits: 1,
    })}万円`;
  }
  return `${Math.round(yen).toLocaleString("ja-JP")}円`;
}

/** 割合を「47.4%」に */
export function formatPercent(part: number, whole: number): string {
  if (whole === 0) return "0.0%";
  return `${((part / whole) * 100).toFixed(1)}%`;
}
