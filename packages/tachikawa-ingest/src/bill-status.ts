/** DB の bill_status_enum のうち、議案一覧から判定できるもの */
export type BillStatus =
  | "submitted"
  | "in_committee"
  | "plenary_session"
  | "approved"
  | "rejected"
  | "adopted"
  | "partially_adopted";

export type Decision = {
  /** ISO形式の日付（例: 2026-09-10） */
  date: string | null;
  /** 結果の語（例: 可決） */
  result: string;
};

/** 和暦の元号ごとの元年（西暦） */
const ERA_START: Record<string, number> = { 令和: 2019, 平成: 1989 };

/** 「令和8年9月10日」を「2026-09-10」に変換する。読めなければ null */
export function warekiToIso(text: string): string | null {
  const m = text.match(/(令和|平成)(元|\d+)年(\d+)月(\d+)日/);
  if (!m) return null;
  const [, era, yearText, month, day] = m;
  const year = ERA_START[era] + (yearText === "元" ? 1 : Number(yearText)) - 1;
  return `${year}-${month.padStart(2, "0")}-${day.padStart(2, "0")}`;
}

/** 「令和8年9月10日、可決」を日付と結果に分ける */
export function parseDecision(text: string | null): Decision | null {
  if (!text) return null;
  const parts = text.split(/[、,，]/).map((s) => s.trim());
  const result = parts[parts.length - 1] ?? "";
  if (!result) return null;
  return { date: warekiToIso(text), result };
}

// 否定を先に判定する（「不採択」が「採択」に一致してしまうのを防ぐ）
const REJECTED_WORDS = ["否決", "不採択", "不承認", "不同意", "不認定"];
const APPROVED_WORDS = ["可決", "原案可決", "修正可決", "承認", "同意", "認定", "採択"];

/** 付託先が「付託省略」かどうか */
export function isReferralOmitted(committeeName: string | null): boolean {
  return committeeName === "付託省略";
}

/**
 * 議案一覧の「付託委員会名」と「議決年月日、結果」から審議状況を判定する。
 * - 議決結果あり: 可決・承認など → approved、否決・不採択など → rejected
 * - 議決前で委員会に付託 → in_committee
 * - 議決前で付託省略 → plenary_session（本会議で審議）
 * - どちらも空欄 → submitted（提出済み）
 */
export function resolveBillStatus(
  committeeName: string | null,
  decisionText: string | null
): BillStatus {
  const decision = parseDecision(decisionText);
  if (decision) {
    if (REJECTED_WORDS.some((w) => decision.result.includes(w))) {
      return "rejected";
    }
    if (APPROVED_WORDS.some((w) => decision.result.includes(w))) {
      return "approved";
    }
  }
  if (committeeName && !isReferralOmitted(committeeName)) {
    return "in_committee";
  }
  if (isReferralOmitted(committeeName)) {
    return "plenary_session";
  }
  return "submitted";
}

/** 画面に添える短い状況説明 */
export function buildStatusNote(
  committeeName: string | null,
  decisionText: string | null
): string {
  if (decisionText) return decisionText;
  if (committeeName && !isReferralOmitted(committeeName)) {
    return `${committeeName}に付託`;
  }
  if (isReferralOmitted(committeeName)) return "委員会付託を省略し本会議で審議";
  return "提出";
}

/**
 * 請願・陳情の審議状況を判定する。
 * - 不採択 → rejected（「採択」より先に判定）
 * - 一部採択・趣旨採択 → partially_adopted（正確な結果の語は status_note に残る）
 * - 採択 → adopted
 * - 継続審査など結果が出ていない場合は、議案と同じく付託状況から判定する
 */
export function resolvePetitionStatus(
  committeeName: string | null,
  decisionText: string | null
): BillStatus {
  const decision = parseDecision(decisionText);
  if (decision) {
    const { result } = decision;
    if (result.includes("不採択")) return "rejected";
    if (result.includes("一部採択") || result.includes("趣旨採択")) {
      return "partially_adopted";
    }
    if (result.includes("採択")) return "adopted";
  }
  if (committeeName && !isReferralOmitted(committeeName)) {
    return "in_committee";
  }
  if (isReferralOmitted(committeeName)) {
    return "plenary_session";
  }
  return "submitted";
}
