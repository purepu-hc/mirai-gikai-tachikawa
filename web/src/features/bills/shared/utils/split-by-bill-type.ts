/** 議案と請願・陳情に分ける（それぞれ元の並び順を保つ） */
export function splitByBillType<T extends { bill_type: string }>(
  bills: T[]
): { bills: T[]; petitions: T[] } {
  return {
    bills: bills.filter((b) => b.bill_type !== "petition"),
    petitions: bills.filter((b) => b.bill_type === "petition"),
  };
}
