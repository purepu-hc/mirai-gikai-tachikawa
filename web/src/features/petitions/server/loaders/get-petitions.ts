import { unstable_cache } from "next/cache";
import { getDifficultyLevel } from "@/features/bill-difficulty/server/loaders/get-difficulty-level";
import type { DifficultyLevelEnum } from "@/features/bill-difficulty/shared/types";
import type { BillWithContent } from "@/features/bills/shared/types";
import { sortBillsByNumberDesc } from "@/features/bills/shared/utils/sort-bills-by-number";
import { CACHE_TAGS } from "@/lib/cache-tags";
import { findPublishedPetitions } from "../repositories/petition-repository";

export type PetitionWithMeta = BillWithContent & {
  committeeName: string | null;
  sessionName: string | null;
};

/**
 * 公開済みの請願・陳情を新しい順に取得する（会期をまたいで全件）
 */
export async function getPetitions(): Promise<PetitionWithMeta[]> {
  const difficultyLevel = await getDifficultyLevel();
  return _getCachedPetitions(difficultyLevel);
}

const _getCachedPetitions = unstable_cache(
  async (difficultyLevel: DifficultyLevelEnum): Promise<PetitionWithMeta[]> => {
    const data = await findPublishedPetitions(difficultyLevel);
    const petitions = data.map((item) => {
      const { bill_contents, committees, council_sessions, ...bill } = item;
      return {
        ...bill,
        bill_content: Array.isArray(bill_contents)
          ? bill_contents[0]
          : undefined,
        tags: [],
        committeeName: committees?.name ?? null,
        sessionName: council_sessions?.name ?? null,
      };
    });
    return sortBillsByNumberDesc(petitions);
  },
  ["petitions"],
  {
    revalidate: 600,
    tags: [CACHE_TAGS.BILLS],
  }
);
