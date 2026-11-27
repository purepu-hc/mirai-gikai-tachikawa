/** 期間つきの記録（終わっていなければ endDate は null） */
export type Period = {
  startDate: string;
  endDate: string | null;
};

export type MemberTerm = {
  termStart: string;
  termEnd: string | null;
  seatNumber: number | null;
  endReason: string | null;
};

export type MemberFaction = Period & {
  factionName: string;
  sourceUrl: string | null;
};

export type MemberRole = Period & {
  role: string;
  sourceUrl: string | null;
};

export type Member = {
  id: string;
  slug: string;
  name: string;
  nameKana: string;
  homepageUrl: string | null;
  xUrl: string | null;
  linksCheckedAt: string | null;
  isCurrent: boolean;
  terms: MemberTerm[];
  factions: MemberFaction[];
  roles: MemberRole[];
};

export type GeneralQuestionItem = {
  id: string;
  parentId: string | null;
  itemNumber: number;
  text: string;
  sortOrder: number;
};

export type GeneralQuestionTopic = {
  number: number;
  title: string;
  subs: string[];
};

export type GeneralQuestion = {
  id: string;
  sessionName: string;
  sessionSlug: string;
  sessionStartDate: string;
  orderNumber: number;
  factionLabel: string | null;
  questionStyle: string | null;
  aids: string[];
  questionDate: string | null;
  sourceUrl: string;
  sourceFetchedAt: string;
  minutesUrl: string | null;
  items: GeneralQuestionItem[];
};

export type MemberPledge = {
  text: string;
  sourceType: string;
  sourceUrl: string;
  checkedAt: string;
};

export type ElectionBlackout = Period & {
  electionName: string;
  memberId: string | null;
};
