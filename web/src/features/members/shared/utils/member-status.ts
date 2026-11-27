import type {
  ElectionBlackout,
  GeneralQuestion,
  GeneralQuestionItem,
  GeneralQuestionTopic,
  Member,
  MemberFaction,
  MemberRole,
  MemberTerm,
  Period,
} from "../types/member";

/** その日（YYYY-MM-DD）が期間に入っているか（初日と最終日を含む） */
export function isWithin(period: Period, date: string): boolean {
  return (
    period.startDate <= date &&
    (period.endDate === null || date <= period.endDate)
  );
}

/** その日に在任している任期 */
export function findTermOn(
  terms: MemberTerm[],
  date: string
): MemberTerm | undefined {
  return terms.find((t) =>
    isWithin({ startDate: t.termStart, endDate: t.termEnd }, date)
  );
}

/** その日に所属している会派 */
export function findFactionOn(
  factions: MemberFaction[],
  date: string
): MemberFaction | undefined {
  return factions.find((f) => isWithin(f, date));
}

/** その日に就いている役職（議長・副議長） */
export function findRolesOn(roles: MemberRole[], date: string): MemberRole[] {
  return roles.filter((r) => isWithin(r, date));
}

/** 議長だった期間（補足文を期間ごとに出すため、古い順） */
export function findChairPeriods(roles: MemberRole[]): MemberRole[] {
  return roles
    .filter((r) => r.role === "議長")
    .sort((a, b) => a.startDate.localeCompare(b.startDate));
}

/**
 * その日に閉じているか。
 * 議員を指定しない選挙期間（市議選）は全員、議員を指定したものはその議員だけを閉じる。
 */
export function findActiveBlackout(
  blackouts: ElectionBlackout[],
  date: string,
  memberId?: string
): ElectionBlackout | undefined {
  return blackouts.find(
    (b) =>
      isWithin(b, date) &&
      (b.memberId === null ||
        (memberId !== undefined && b.memberId === memberId))
  );
}

/** 一覧を「いまの議員」と「以前の議員」に分ける（並びは名簿の順のまま） */
export function splitMembersByCurrent(
  members: Member[],
  date: string
): { current: Member[]; former: Member[] } {
  const current: Member[] = [];
  const former: Member[] = [];
  for (const m of members) {
    (findTermOn(m.terms, date) ? current : former).push(m);
  }
  return { current, former };
}

/** 一般質問の項目を「件名 → 小項目」の形にする */
export function buildQuestionTopics(
  items: GeneralQuestionItem[]
): GeneralQuestionTopic[] {
  const sorted = [...items].sort((a, b) => a.sortOrder - b.sortOrder);
  return sorted
    .filter((i) => i.parentId === null)
    .map((parent) => ({
      number: parent.itemNumber,
      title: parent.text,
      subs: sorted.filter((i) => i.parentId === parent.id).map((i) => i.text),
    }));
}

/** 一般質問を会期の新しい順に並べる */
export function sortQuestionsBySessionDesc(
  questions: GeneralQuestion[]
): GeneralQuestion[] {
  return [...questions].sort((a, b) =>
    b.sessionStartDate.localeCompare(a.sessionStartDate)
  );
}

/** 「2026-07-21」を「2026年7月21日」にする（時差の影響を受けないよう文字列から作る） */
export function formatJapaneseDate(date: string): string {
  const [y, m, d] = date.split("-").map(Number);
  return `${y}年${m}月${d}日`;
}

/** 期間を「2026年7月21日〜」「2024年6月26日〜2026年7月13日」にする */
export function formatPeriod(period: Period): string {
  const start = formatJapaneseDate(period.startDate);
  return period.endDate === null
    ? `${start}〜`
    : `${start}〜${formatJapaneseDate(period.endDate)}`;
}

/** 名簿の「浅川　修一」を表示用に整える（全角スペースを細いスペースに） */
export function displayName(name: string): string {
  return name.replace(/　/g, " ");
}
