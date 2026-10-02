import "server-only";

import { createAdminClient } from "@mirai-gikai/supabase";
import type { DifficultyLevelEnum } from "@/features/bill-difficulty/shared/types";
import type { CouncilSession } from "../../shared/types";

/**
 * アクティブな定例会を取得
 */
export async function findActiveCouncilSession(): Promise<CouncilSession | null> {
  const supabase = createAdminClient();

  const { data, error } = await supabase
    .from("council_sessions")
    .select("*")
    .eq("is_active", true)
    .maybeSingle();

  if (error) {
    console.error("Failed to fetch active council session:", error);
    return null;
  }

  return data;
}

/**
 * 指定日時点で開催中の定例会を取得
 */
export async function findCurrentCouncilSession(
  targetDate: string
): Promise<CouncilSession | null> {
  const supabase = createAdminClient();

  const { data, error } = await supabase
    .from("council_sessions")
    .select("*")
    .lte("start_date", targetDate)
    .or(`end_date.gte.${targetDate},end_date.is.null`)
    .order("start_date", { ascending: false })
    .limit(1)
    .maybeSingle();

  if (error) {
    console.error("Failed to fetch current council session:", error);
    return null;
  }

  return data;
}

/**
 * 全定例会を開始日の降順で取得
 */
export async function findAllCouncilSessions(): Promise<CouncilSession[]> {
  const supabase = createAdminClient();

  const { data, error } = await supabase
    .from("council_sessions")
    .select("*")
    .order("start_date", { ascending: false });

  if (error) {
    console.error("Failed to fetch all council sessions:", error);
    return [];
  }

  return data ?? [];
}

/**
 * 指定日より前の直近の定例会を取得
 */
export async function findPreviousCouncilSession(
  beforeStartDate: string
): Promise<CouncilSession | null> {
  const supabase = createAdminClient();

  const { data, error } = await supabase
    .from("council_sessions")
    .select("*")
    .lt("start_date", beforeStartDate)
    .order("start_date", { ascending: false })
    .limit(1)
    .maybeSingle();

  if (error) {
    console.error("Failed to fetch previous council session:", error);
    return null;
  }

  return data;
}

/** 1回の取得件数（supabase の既定の上限 1000 件に合わせる） */
const PAGE_SIZE = 1000;

/**
 * 公開済みで、指定した難易度の解説がある議案・請願・陳情の会期と種別。
 * 会期ごとの件数を数えるため。会期ページの一覧と同じ条件（解説あり）にそろえる。
 * 件数が多くても取りこぼさないよう、1000件ずつ取得する。
 */
export async function findPublishedBillSessionTypes(
  difficultyLevel: DifficultyLevelEnum
): Promise<{ council_session_id: string | null; bill_type: string }[]> {
  const supabase = createAdminClient();
  const rows: { council_session_id: string | null; bill_type: string }[] = [];

  for (let from = 0; ; from += PAGE_SIZE) {
    const { data, error } = await supabase
      .from("bills")
      .select(
        "council_session_id, bill_type, bill_contents!inner(difficulty_level)"
      )
      .eq("publish_status", "published")
      .eq("bill_contents.difficulty_level", difficultyLevel)
      .order("id", { ascending: true })
      .range(from, from + PAGE_SIZE - 1);

    if (error) {
      throw new Error(`Failed to fetch bill session types: ${error.message}`);
    }
    for (const row of data) {
      rows.push({
        council_session_id: row.council_session_id,
        bill_type: row.bill_type,
      });
    }
    if (data.length < PAGE_SIZE) return rows;
  }
}

/**
 * ページのある（slug のある）会期を開始日の降順で取得する。
 * 失敗したら例外にする（「会期なし」としてキャッシュされないように）
 */
export async function findCouncilSessionsWithSlug(): Promise<CouncilSession[]> {
  const supabase = createAdminClient();

  const { data, error } = await supabase
    .from("council_sessions")
    .select("*")
    .not("slug", "is", null)
    .order("start_date", { ascending: false });

  if (error) {
    throw new Error(`Failed to fetch council sessions: ${error.message}`);
  }

  return data;
}
