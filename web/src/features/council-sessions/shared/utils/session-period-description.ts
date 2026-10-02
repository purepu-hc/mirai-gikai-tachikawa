type SessionPeriod = {
  name: string;
  start_date: string;
  end_date: string | null;
};

/** YYYY-MM-DD を比較用の日付文字列として取り出す */
function toDateOnly(value: string): string {
  return value.slice(0, 10);
}

/**
 * 会期の説明文を作る。今日の日付に応じて時制を変える。
 * - 会期前: 「2026.9月〜10月に開かれる予定の令和8年第3回定例会」
 * - 会期中: 「2026.9月〜10月に開かれている令和8年第3回定例会」
 * - 会期後: 「2026.9月〜10月に開かれた令和8年第3回定例会」
 *
 * @param today 日本時間の今日（YYYY-MM-DD）
 */
export function buildSessionPeriodDescription(
  session: SessionPeriod,
  today: string
): string {
  const start = toDateOnly(session.start_date);
  const end = toDateOnly(session.end_date ?? session.start_date);
  const [startYear, startMonth] = start.split("-").map(Number);
  const endMonth = Number(end.split("-")[1]);
  const period =
    startMonth === endMonth
      ? `${startYear}.${startMonth}月`
      : `${startYear}.${startMonth}月〜${endMonth}月`;

  const now = toDateOnly(today);
  let verb = "開かれた";
  if (now < start) {
    verb = "開かれる予定の";
  } else if (session.end_date === null || now <= end) {
    verb = "開かれている";
  }
  return `${period}に${verb}${session.name}`;
}
