/**
 * 立川市議会の基本データ（会期・委員会・会派）。
 * いずれも立川市議会の公式ページを確認して手で記載したもの（AI不使用）。
 * 構成が変わったら、出典ページを見てここを更新する。
 */

export type CouncilSessionDef = {
  name: string;
  slug: string;
  startDate: string;
  endDate: string | null;
  /** 議案番号の前に付ける年（議案番号は年ごとに振り直されるため） */
  eraYearLabel: string;
  /** 議案一覧ページ */
  billListUrl: string;
  /** 請願・陳情一覧ページ（ある会期のみ） */
  petitionListUrl?: string;
};

/**
 * 出典: 令和8年第3回定例会日程表
 * https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028160.html
 */
export const SESSIONS: Record<string, CouncilSessionDef> = {
  "r8-3-teireikai": {
    name: "令和8年第3回定例会",
    slug: "r8-3-teireikai",
    startDate: "2026-09-04",
    endDate: "2026-10-02",
    eraYearLabel: "令和8年",
    billListUrl:
      "https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html",
    petitionListUrl:
      "https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028162.html",
  },
};

/**
 * 出典: 委員会構成（2026年9月25日更新）
 * https://www.city.tachikawa.lg.jp/shigikai/shokai/1007183.html
 * 予算・決算特別委員会は議案一覧の付託先として登場するため追加。
 */
export const COMMITTEES: { name: string; description: string }[] = [
  { name: "総務委員会", description: "常任委員会" },
  { name: "厚生委員会", description: "常任委員会" },
  { name: "環境まちづくり委員会", description: "常任委員会" },
  { name: "文教委員会", description: "常任委員会" },
  { name: "予算特別委員会", description: "特別委員会" },
  { name: "決算特別委員会", description: "特別委員会" },
  { name: "議会改革特別委員会", description: "特別委員会" },
  { name: "議会運営委員会", description: "議会運営委員会" },
];

/**
 * 出典: 会派・党派（2026年7月23日更新）
 * https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html
 * 並び順は公式ページの掲載順。「会派を構成しない議員」は会派ではないため登録しない。
 */
export const FACTIONS: string[] = [
  "公明党",
  "自民党安進会・維新の会",
  "立憲ネット緑たちかわ",
  "日本共産党",
  "立川けやき会",
  "たちかわ自由民主党 参政党",
];
