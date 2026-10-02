/** 委員会IDごとの件数を数える（null は数えない） */
export function countByCommittee(
  committeeIds: (string | null)[]
): Map<string, number> {
  const counts = new Map<string, number>();
  for (const id of committeeIds) {
    if (!id) continue;
    counts.set(id, (counts.get(id) ?? 0) + 1);
  }
  return counts;
}
