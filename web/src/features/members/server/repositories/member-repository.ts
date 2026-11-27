import "server-only";
import { createAdminClient } from "@mirai-gikai/supabase";

const MEMBER_COLUMNS = `
  id, slug, name, name_kana, homepage_url, x_url, links_checked_at, is_current, sort_order,
  council_member_terms ( term_start, term_end, seat_number, end_reason ),
  council_member_factions ( start_date, end_date, source_url, factions ( name ) ),
  council_member_roles ( role, start_date, end_date, source_url )
`;

/** 議員を名簿の順（50音順）で取得する（任期・会派・役職つき） */
export async function findMembers() {
  const supabase = createAdminClient();
  const { data, error } = await supabase
    .from("council_members")
    .select(MEMBER_COLUMNS)
    .order("sort_order", { ascending: true });

  if (error) {
    throw new Error(`Failed to fetch council members: ${error.message}`);
  }
  return data;
}

/** 議員を1人取得する */
export async function findMemberBySlug(slug: string) {
  const supabase = createAdminClient();
  const { data, error } = await supabase
    .from("council_members")
    .select(MEMBER_COLUMNS)
    .eq("slug", slug)
    .maybeSingle();

  if (error) {
    throw new Error(`Failed to fetch council member: ${error.message}`);
  }
  return data;
}

/** 議員の一般質問（件名・小項目と会期つき） */
export async function findGeneralQuestionsByMember(memberId: string) {
  const supabase = createAdminClient();
  const { data, error } = await supabase
    .from("general_questions")
    .select(
      `id, order_number, faction_label, question_style, aids, question_date,
       source_url, source_fetched_at, minutes_url,
       council_sessions ( name, slug, start_date ),
       general_question_items ( id, parent_id, item_number, text, sort_order )`
    )
    .eq("member_id", memberId);

  if (error) {
    throw new Error(`Failed to fetch general questions: ${error.message}`);
  }
  return data;
}

/** 議員が掲げたテーマ */
export async function findPledgesByMember(memberId: string) {
  const supabase = createAdminClient();
  const { data, error } = await supabase
    .from("council_member_pledges")
    .select("text, source_type, source_url, checked_at")
    .eq("member_id", memberId)
    .order("sort_order", { ascending: true });

  if (error) {
    throw new Error(`Failed to fetch member pledges: ${error.message}`);
  }
  return data;
}

/** 選挙期間（議員ページを閉じる期間） */
export async function findElectionBlackouts() {
  const supabase = createAdminClient();
  const { data, error } = await supabase
    .from("election_blackouts")
    .select("election_name, start_date, end_date, member_id");

  if (error) {
    throw new Error(`Failed to fetch election blackouts: ${error.message}`);
  }
  return data;
}
