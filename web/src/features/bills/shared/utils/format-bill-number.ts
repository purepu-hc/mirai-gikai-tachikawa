/**
 * 画面表示用の議案番号。
 * DB では年をまたいだ重複を防ぐため「令和8年議案第116号」の形で持っているが、
 * 一覧では定例会ごとに見るため先頭の年を省いて「議案第116号」と表示する。
 * 空なら null（番号のない議案は何も表示しない）。
 */
export function formatBillNumberLabel(
  billNumber: string | null | undefined
): string | null {
  const value = billNumber?.trim();
  if (!value) return null;
  return value.replace(/^(令和|平成)(元|\d+)年/, "");
}
