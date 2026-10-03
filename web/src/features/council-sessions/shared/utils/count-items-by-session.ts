export type SessionItemCounts = {
  /** 議案（請願・陳情以外） */
  bills: number;
  /** 請願・陳情 */
  petitions: number;
};

/** 会期ごとに、議案と請願・陳情の件数を数える（会期のないものは数えない） */
export function countItemsBySession(
  rows: { council_session_id: string | null; bill_type: string }[]
): Map<string, SessionItemCounts> {
  const counts = new Map<string, SessionItemCounts>();
  for (const row of rows) {
    if (!row.council_session_id) continue;
    const current = counts.get(row.council_session_id) ?? {
      bills: 0,
      petitions: 0,
    };
    if (row.bill_type === "petition") current.petitions += 1;
    else current.bills += 1;
    counts.set(row.council_session_id, current);
  }
  return counts;
}
