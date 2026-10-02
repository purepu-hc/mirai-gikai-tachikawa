import { getDifficultyLevel } from "@/features/bill-difficulty/server/loaders/get-difficulty-level";
import { findTagsByBillIds } from "@/features/bills/server/repositories/bill-repository";
import type { BillWithContent } from "@/features/bills/shared/types";
import { sortBillsByNumberDesc } from "@/features/bills/shared/utils/sort-bills-by-number";
import { shouldIncludeCommitteeBills } from "../../shared/utils/committee-match";
import { toContainsPattern } from "../../shared/utils/search-keyword";
import {
  findActiveCommitteesByKeyword,
  findPublishedBillIdsByCommitteeIds,
  findPublishedBillIdsByKeyword,
  findPublishedBillsWithContentsByIds,
  MAX_RESULTS,
} from "../repositories/bill-search-repository";

export type SearchResult = {
  /** 議案・請願・陳情（新しい順） */
  bills: BillWithContent[];
  /** 名前がキーワードに一致した委員会（委員会ページへの案内用） */
  committees: { id: string; name: string }[];
};

/**
 * キーワードで議案・請願・陳情を検索し、新しい順（番号の大きい順）に返す。
 * 委員会名に一致した場合は、委員会ページへの案内を返し、
 * 一致した委員会が少なければ、その委員会に付託された案件も結果に含める。
 */
export async function searchBills(keyword: string): Promise<SearchResult> {
  const pattern = toContainsPattern(keyword);
  const [keywordBillIds, committees] = await Promise.all([
    findPublishedBillIdsByKeyword(pattern),
    findActiveCommitteesByKeyword(pattern),
  ]);

  const committeeBillIds = shouldIncludeCommitteeBills(committees.length)
    ? await findPublishedBillIdsByCommitteeIds(committees.map((c) => c.id))
    : [];

  // 言葉に一致したものを優先し、件数の上限を超えないようにする
  const billIds = [...new Set([...keywordBillIds, ...committeeBillIds])].slice(
    0,
    MAX_RESULTS
  );
  if (billIds.length === 0) return { bills: [], committees };

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

  return { bills: sortBillsByNumberDesc(bills), committees };
}
