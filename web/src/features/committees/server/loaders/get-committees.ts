import { unstable_cache } from "next/cache";
import { getDifficultyLevel } from "@/features/bill-difficulty/server/loaders/get-difficulty-level";
import type { DifficultyLevelEnum } from "@/features/bill-difficulty/shared/types";
import type { BillWithContent } from "@/features/bills/shared/types";
import { sortBillsByNumberDesc } from "@/features/bills/shared/utils/sort-bills-by-number";
import { CACHE_TAGS } from "@/lib/cache-tags";
import { countByCommittee } from "../../shared/utils/count-by-committee";
import {
  findActiveCommittees,
  findCommitteeById,
  findPublishedBillCommitteeIds,
  findPublishedBillsByCommittee,
} from "../repositories/committee-repository";

export type CommitteeSummary = {
  id: string;
  name: string;
  description: string | null;
  billCount: number;
};

/** 委員会の一覧（付託件数つき） */
export const getCommittees = unstable_cache(
  async (): Promise<CommitteeSummary[]> => {
    const [committees, committeeIds] = await Promise.all([
      findActiveCommittees(),
      findPublishedBillCommitteeIds(),
    ]);
    const counts = countByCommittee(committeeIds);
    return committees.map((c) => ({
      id: c.id,
      name: c.name,
      description: c.description,
      billCount: counts.get(c.id) ?? 0,
    }));
  },
  ["committees-with-counts"],
  { revalidate: 600, tags: [CACHE_TAGS.BILLS] }
);

/** 委員会と、付託された議案・請願・陳情（新しい順） */
export async function getCommitteeWithBills(committeeId: string) {
  const difficultyLevel = await getDifficultyLevel();
  return _getCachedCommitteeWithBills(committeeId, difficultyLevel);
}

const _getCachedCommitteeWithBills = unstable_cache(
  async (committeeId: string, difficultyLevel: DifficultyLevelEnum) => {
    const committee = await findCommitteeById(committeeId);
    if (!committee) return null;
    const data = await findPublishedBillsByCommittee(
      committeeId,
      difficultyLevel
    );
    const bills: BillWithContent[] = data.map((item) => {
      const { bill_contents, ...bill } = item;
      return {
        ...bill,
        bill_content: Array.isArray(bill_contents)
          ? bill_contents[0]
          : undefined,
        tags: [],
      };
    });
    return { committee, bills: sortBillsByNumberDesc(bills) };
  },
  ["committee-with-bills"],
  { revalidate: 600, tags: [CACHE_TAGS.BILLS] }
);

/**
 * 議案詳細ページの「担当の委員会」リンク用に、委員会を1件取得する（キャッシュあり）。
 * リンクは補助的な表示なので、取得に失敗してもページ全体は止めずに null を返す。
 */
export async function getCommitteeForBillLink(committeeId: string) {
  try {
    return await _getCachedCommittee(committeeId);
  } catch (error) {
    console.error("Failed to load committee for bill link:", error);
    return null;
  }
}

const _getCachedCommittee = unstable_cache(
  async (committeeId: string) => findCommitteeById(committeeId),
  ["committee-for-bill-link"],
  { revalidate: 600, tags: [CACHE_TAGS.BILLS] }
);
