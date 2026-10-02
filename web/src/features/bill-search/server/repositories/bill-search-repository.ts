import "server-only";
import { createAdminClient } from "@mirai-gikai/supabase";
import type { DifficultyLevelEnum } from "@/features/bill-difficulty/shared/types";

/** 1回の検索で返す議案の上限 */
const MAX_RESULTS = 100;

/**
 * キーワードを含む公開済み議案のIDを集める。
 * 議案名・解説（タイトル・要約・本文、難易度を問わない）のいずれかに含まれていれば対象。
 * 検索はデータベースの部分一致（ILIKE）のみで、AIは使わない。
 *
 * @param pattern toContainsPattern でエスケープ済みのパターン
 */
export async function findPublishedBillIdsByKeyword(
  pattern: string
): Promise<string[]> {
  const supabase = createAdminClient();

  const [byName, byTitle, bySummary, byContent] = await Promise.all([
    supabase
      .from("bills")
      .select("id")
      .eq("publish_status", "published")
      .ilike("name", pattern)
      .limit(MAX_RESULTS),
    supabase
      .from("bill_contents")
      .select("bill_id")
      .ilike("title", pattern)
      .limit(MAX_RESULTS),
    supabase
      .from("bill_contents")
      .select("bill_id")
      .ilike("summary", pattern)
      .limit(MAX_RESULTS),
    supabase
      .from("bill_contents")
      .select("bill_id")
      .ilike("content", pattern)
      .limit(MAX_RESULTS),
  ]);

  for (const result of [byName, byTitle, bySummary, byContent]) {
    if (result.error) {
      throw new Error(`Failed to search bills: ${result.error.message}`);
    }
  }

  const ids = new Set<string>();
  for (const row of byName.data ?? []) ids.add(row.id);
  for (const rows of [byTitle.data, bySummary.data, byContent.data]) {
    for (const row of rows ?? []) ids.add(row.bill_id);
  }
  return [...ids].slice(0, MAX_RESULTS);
}

/**
 * 指定IDの公開済み議案を、難易度に合った解説付きで取得する
 */
export async function findPublishedBillsWithContentsByIds(
  billIds: string[],
  difficultyLevel: DifficultyLevelEnum
) {
  if (billIds.length === 0) return [];
  const supabase = createAdminClient();
  const { data, error } = await supabase
    .from("bills")
    .select(
      `
      *,
      bill_contents!inner (
        id,
        bill_id,
        title,
        summary,
        content,
        difficulty_level,
        created_at,
        updated_at
      )
    `
    )
    .in("id", billIds)
    .eq("publish_status", "published")
    .eq("bill_contents.difficulty_level", difficultyLevel);

  if (error) {
    throw new Error(`Failed to fetch searched bills: ${error.message}`);
  }
  return data;
}
