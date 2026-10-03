// トップページの「令和〇年の定例会」パネル用に、その年の定例会4回分のカードを作る。
// サイトに取り込み済みの会期（slug が r{令和年}-{回}-teireikai）は、その日付で状況を決める。
// 取り込んでいない会期は、例年の開催月から決める（開催月にあたる間は「日程確認中」）。

export type YearSessionSlot = {
  /** 第何回か */
  number: number;
  /** 例年の開催月（表示用） */
  monthsLabel: string;
  /** 例年の開催月の範囲（取り込み前の会期の状況判定に使う） */
  startMonth: number;
  endMonth: number;
  /** 主に審議すること（表示用） */
  description: string;
};

export type YearSessionStatus = "done" | "open" | "upcoming" | "unconfirmed";

export type YearSessionCard = YearSessionSlot & {
  status: YearSessionStatus;
  /** サイトに取り込み済みの会期 */
  session: { slug: string; name: string; endDate: string | null } | null;
};

type SessionLike = {
  slug: string | null;
  name: string;
  start_date: string;
  end_date: string | null;
};

/** 令和の年（2026年 → 8） */
export function toReiwaYear(year: number): number {
  return year - 2018;
}

/** 定例会の slug（例：r8-3-teireikai） */
export function regularSessionSlug(reiwaYear: number, number: number): string {
  return `r${reiwaYear}-${number}-teireikai`;
}

function statusFromDates(
  today: string,
  start: string,
  end: string | null
): YearSessionStatus {
  if (today < start.slice(0, 10)) return "upcoming";
  if (end && today > end.slice(0, 10)) return "done";
  return "open";
}

function statusFromMonths(today: string, slot: YearSessionSlot) {
  const month = Number(today.slice(5, 7));
  if (month > slot.endMonth) return "done";
  if (month < slot.startMonth) return "upcoming";
  // 例年の開催月にあたるが、まだサイトに会期がない（開会前か開会中か、ここでは判断しない）
  return "unconfirmed";
}

/**
 * パネルに表示する年。その年の第1回定例会の例年の開催月より前（1月など）は、
 * まだその年の定例会がないため、前の年を表示する。
 */
export function panelYear(
  today: string,
  slots: readonly YearSessionSlot[]
): number {
  const year = Number(today.slice(0, 4));
  const month = Number(today.slice(5, 7));
  const firstMonth = Math.min(...slots.map((s) => s.startMonth));
  return month < firstMonth ? year - 1 : year;
}

/**
 * @param today 日本時間の今日（YYYY-MM-DD）
 * @param slots その議会の定例会の枠（例年の開催月など）
 * @param sessions サイトに登録済みの会期
 */
export function buildYearSessionCards(
  today: string,
  slots: readonly YearSessionSlot[],
  sessions: SessionLike[]
): YearSessionCard[] {
  const year = panelYear(today, slots);
  const reiwaYear = toReiwaYear(year);
  return slots.map((slot) => {
    const slug = regularSessionSlug(reiwaYear, slot.number);
    const found = sessions.find((s) => s.slug === slug);
    if (!found) {
      // 前の年を表示しているときは、その年の会期はすべて終わっている
      const status =
        year < Number(today.slice(0, 4))
          ? "done"
          : statusFromMonths(today, slot);
      return { ...slot, status, session: null };
    }
    return {
      ...slot,
      status: statusFromDates(today, found.start_date, found.end_date),
      session: { slug, name: found.name, endDate: found.end_date },
    };
  });
}
