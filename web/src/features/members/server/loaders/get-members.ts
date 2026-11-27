import { unstable_cache } from "next/cache";
import type {
  ElectionBlackout,
  GeneralQuestion,
  Member,
  MemberPledge,
} from "../../shared/types/member";
import {
  findElectionBlackouts,
  findGeneralQuestionsByMember,
  findMemberBySlug,
  findMembers,
  findPledgesByMember,
} from "../repositories/member-repository";

type MemberRow = NonNullable<Awaited<ReturnType<typeof findMemberBySlug>>>;
type QuestionRow = Awaited<
  ReturnType<typeof findGeneralQuestionsByMember>
>[number];

/** Supabase の1対1の結合は、型の上では配列のこともあるので1件に揃える */
function one<T>(value: T | T[] | null): T | null {
  if (Array.isArray(value)) return value[0] ?? null;
  return value;
}

function toMember(row: MemberRow): Member {
  return {
    id: row.id,
    slug: row.slug,
    name: row.name,
    nameKana: row.name_kana,
    homepageUrl: row.homepage_url,
    xUrl: row.x_url,
    linksCheckedAt: row.links_checked_at,
    isCurrent: row.is_current,
    terms: row.council_member_terms.map((t) => ({
      termStart: t.term_start,
      termEnd: t.term_end,
      seatNumber: t.seat_number,
      endReason: t.end_reason,
    })),
    factions: row.council_member_factions
      .map((f) => ({
        factionName: one(f.factions)?.name ?? "",
        startDate: f.start_date,
        endDate: f.end_date,
        sourceUrl: f.source_url,
      }))
      .sort((a, b) => b.startDate.localeCompare(a.startDate)),
    roles: row.council_member_roles.map((r) => ({
      role: r.role,
      startDate: r.start_date,
      endDate: r.end_date,
      sourceUrl: r.source_url,
    })),
  };
}

function toQuestion(row: QuestionRow): GeneralQuestion {
  const session = one(row.council_sessions);
  return {
    id: row.id,
    sessionName: session?.name ?? "",
    sessionSlug: session?.slug ?? "",
    sessionStartDate: session?.start_date ?? "",
    orderNumber: row.order_number,
    factionLabel: row.faction_label,
    questionStyle: row.question_style,
    aids: row.aids,
    questionDate: row.question_date,
    sourceUrl: row.source_url,
    sourceFetchedAt: row.source_fetched_at,
    minutesUrl: row.minutes_url,
    items: row.general_question_items.map((i) => ({
      id: i.id,
      parentId: i.parent_id,
      itemNumber: i.item_number,
      text: i.text,
      sortOrder: i.sort_order,
    })),
  };
}

function toBlackouts(
  rows: Awaited<ReturnType<typeof findElectionBlackouts>>
): ElectionBlackout[] {
  return rows.map((b) => ({
    electionName: b.election_name,
    startDate: b.start_date,
    endDate: b.end_date,
    memberId: b.member_id,
  }));
}

/** 議員の一覧と選挙期間 */
export const getMembers = unstable_cache(
  async () => {
    const [members, blackouts] = await Promise.all([
      findMembers(),
      findElectionBlackouts(),
    ]);
    return {
      members: members.map(toMember),
      blackouts: toBlackouts(blackouts),
    };
  },
  ["council-members"],
  { revalidate: 600 }
);

/** 議員1人分（一般質問・掲げたテーマ・選挙期間つき） */
export const getMemberDetail = unstable_cache(
  async (slug: string) => {
    const row = await findMemberBySlug(slug);
    if (!row) return null;
    const [questions, pledges, blackouts] = await Promise.all([
      findGeneralQuestionsByMember(row.id),
      findPledgesByMember(row.id),
      findElectionBlackouts(),
    ]);
    return {
      member: toMember(row),
      questions: questions.map(toQuestion),
      pledges: pledges.map(
        (p): MemberPledge => ({
          text: p.text,
          sourceType: p.source_type,
          sourceUrl: p.source_url,
          checkedAt: p.checked_at,
        })
      ),
      blackouts: toBlackouts(blackouts),
    };
  },
  ["council-member-detail"],
  { revalidate: 600 }
);
