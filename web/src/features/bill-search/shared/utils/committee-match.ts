/**
 * 委員会名に一致したとき、その委員会に付託された議案・請願・陳情も検索結果に含める上限。
 * 「委員会」のような広い言葉ですべての委員会に一致した場合に、
 * ほぼ全件が結果に並ぶのを避けるため、一致した委員会が少ないときだけ含める。
 */
export const MAX_COMMITTEES_TO_EXPAND = 2;

/** 一致した委員会の付託案件を検索結果に含めるかどうか */
export function shouldIncludeCommitteeBills(matchedCommitteeCount: number) {
  return (
    matchedCommitteeCount >= 1 &&
    matchedCommitteeCount <= MAX_COMMITTEES_TO_EXPAND
  );
}
