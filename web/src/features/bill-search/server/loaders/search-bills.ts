import { getDifficultyLevel } from "@/features/bill-difficulty/server/loaders/get-difficulty-level";
import { findTagsByBillIds } from "@/features/bills/server/repositories/bill-repository";
import type { BillWithContent } from "@/features/bills/shared/types";
import { sortBillsByNumberDesc } from "@/features/bills/shared/utils/sort-bills-by-number";
import { toContainsPattern } from "../../shared/utils/search-keyword";
import {
  findPublishedBillIdsByKeyword,
  findPublishedBillsWithContentsByIds,
} from "../repositories/bill-search-repository";

/**
 * キーワードで議案を検索し、新しい順（議案番号の大きい順）に返す
 */
export async function searchBills(keyword: string): Promise<BillWithContent[]> {
  const billIds = await findPublishedBillIdsByKeyword(
    toContainsPattern(keyword)
  );
  if (billIds.length === 0) return [];

  const difficultyLevel = await getDifficultyLevel();
  const data = await findPublishedBillsWithContentsByIds(
    billIds,
    difficultyLevel
  );
  const tagsByBillId = await findTagsByBillIds(data.map((b) => b.id));

  const bills: BillWithContent[] = data.map((item) => {
    const { bill_contents, ...bill } = item;
    return {
      ...bill,
      bill_content: Array.isArray(bill_contents) ? bill_contents[0] : undefined,
      tags: tagsByBillId.get(item.id) ?? [],
      hasPublicInterview: false,
    };
  });

  return sortBillsByNumberDesc(bills);
}
