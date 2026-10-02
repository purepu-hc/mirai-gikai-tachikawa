export type PetitionKind = "請願" | "陳情" | "その他";

const PETITION_KIND_ORDER: readonly PetitionKind[] = ["請願", "陳情", "その他"];

/** 請願・陳情の種類を番号の文字列から判定する（例: 令和8年陳情第11号 → 陳情） */
export function petitionKind(billNumber: string): PetitionKind {
  if (billNumber.includes("請願")) return "請願";
  if (billNumber.includes("陳情")) return "陳情";
  return "その他";
}

/** 請願 → 陳情 → その他 の順にまとめる。空のグループは返さない */
export function groupPetitionsByKind<T extends { bill_number: string }>(
  petitions: T[]
): { kind: PetitionKind; items: T[] }[] {
  return PETITION_KIND_ORDER.map((kind) => ({
    kind,
    items: petitions.filter((p) => petitionKind(p.bill_number) === kind),
  })).filter((group) => group.items.length > 0);
}
