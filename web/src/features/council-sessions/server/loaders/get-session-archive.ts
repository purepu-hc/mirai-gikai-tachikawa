import "server-only";
import { unstable_cache } from "next/cache";
import { DEFAULT_DIFFICULTY } from "@/features/bill-difficulty/shared/types";
import { CACHE_TAGS } from "@/lib/cache-tags";
import type { CouncilSession } from "../../shared/types";
import {
  countItemsBySession,
  type SessionItemCounts,
} from "../../shared/utils/count-items-by-session";
import {
  findCouncilSessionsWithSlug,
  findPublishedBillSessionTypes,
} from "../repositories/council-session-repository";

export type SessionArchiveItem = CouncilSession & {
  slug: string;
  counts: SessionItemCounts;
};

/**
 * 定例会・臨時会の一覧（新しい順）と、それぞれの議案・請願・陳情の件数。
 * ページを持たない（slug のない）会期は除く。
 */
export const getSessionArchive = unstable_cache(
  async (): Promise<SessionArchiveItem[]> => {
    const [sessions, rows] = await Promise.all([
      findCouncilSessionsWithSlug(),
      // 会期ページの一覧と同じ条件（標準の難易度の解説がある）で数える
      findPublishedBillSessionTypes(DEFAULT_DIFFICULTY),
    ]);
    const counts = countItemsBySession(rows);
    return sessions.flatMap((session) =>
      session.slug
        ? [
            {
              ...session,
              slug: session.slug,
              counts: counts.get(session.id) ?? { bills: 0, petitions: 0 },
            },
          ]
        : []
    );
  },
  ["session-archive"],
  { revalidate: 3600, tags: [CACHE_TAGS.COUNCIL_SESSIONS, CACHE_TAGS.BILLS] }
);
