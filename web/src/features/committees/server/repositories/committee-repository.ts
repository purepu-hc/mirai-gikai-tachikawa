import "server-only";
import { createAdminClient } from "@mirai-gikai/supabase";
import type { DifficultyLevelEnum } from "@/features/bill-difficulty/shared/types";

/** 有効な委員会を表示順に取得する */
export async function findActiveCommittees() {
  const supabase = createAdminClient();
  const { data, error } = await supabase
    .from("committees")
    .select("id, name, description, sort_order")
    .eq("is_active", true)
    .order("sort_order", { ascending: true });

  if (error) {
    throw new Error(`Failed to fetch committees: ${error.message}`);
  }
  return data;
}

/** 委員会を1件取得する */
export async function findCommitteeById(id: string) {
  const supabase = createAdminClient();
  const { data, error } = await supabase
    .from("committees")
    .select("id, name, description, sort_order")
    .eq("id", id)
    .eq("is_active", true)
    .maybeSingle();

  if (error) {
    // URL の id が UUID の形でない場合だけ「見つからない」扱いにする。
    // それ以外の失敗を null にすると、一時的なエラーが 404 としてキャッシュされてしまう。
    if (error.code === "22P02") return null;
    throw new Error(`Failed to fetch committee: ${error.message}`);
  }
  return data;
}

/** 委員会ごとの付託件数（公開済みの議案・請願・陳情） */
export async function findPublishedBillCommitteeIds(): Promise<
  (string | null)[]
> {
  const supabase = createAdminClient();
  const { data, error } = await supabase
    .from("bills")
    .select("committee_id")
    .eq("publish_status", "published")
    .not("committee_id", "is", null);

  if (error) {
    throw new Error(`Failed to count committee bills: ${error.message}`);
  }
  return data.map((row) => row.committee_id);
}

/** 委員会に付託された公開済みの議案・請願・陳情を取得する */
export async function findPublishedBillsByCommittee(
  committeeId: string,
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
      )
    `
    )
    .eq("committee_id", committeeId)
    .eq("publish_status", "published")
    .eq("bill_contents.difficulty_level", difficultyLevel);

  if (error) {
    throw new Error(`Failed to fetch committee bills: ${error.message}`);
  }
  return data;
}
