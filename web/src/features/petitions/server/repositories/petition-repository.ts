import "server-only";
import { createAdminClient } from "@mirai-gikai/supabase";
import type { DifficultyLevelEnum } from "@/features/bill-difficulty/shared/types";

/**
 * 公開済みの請願・陳情を、解説・委員会名・会期名つきで取得する
 */
export async function findPublishedPetitions(
  difficultyLevel: DifficultyLevelEnum
) {
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
      ),
      committees ( name ),
      council_sessions ( name, start_date )
    `
    )
    .eq("bill_type", "petition")
    .eq("publish_status", "published")
    .eq("bill_contents.difficulty_level", difficultyLevel);

  if (error) {
    throw new Error(`Failed to fetch petitions: ${error.message}`);
  }
  return data;
}
