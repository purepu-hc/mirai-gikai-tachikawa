import { describe, expect, it } from "vitest";
import {
  buildYearSessionCards,
  panelYear,
  regularSessionSlug,
  toReiwaYear,
  type YearSessionSlot,
} from "./year-session-cards";

const slots: YearSessionSlot[] = [
  {
    number: 1,
    monthsLabel: "2〜3月",
    startMonth: 2,
    endMonth: 3,
    description: "予算",
  },
  {
    number: 2,
    monthsLabel: "5月",
    startMonth: 5,
    endMonth: 5,
    description: "条例",
  },
  {
    number: 3,
    monthsLabel: "9〜10月",
    startMonth: 9,
    endMonth: 10,
    description: "決算",
  },
  {
    number: 4,
    monthsLabel: "11〜12月",
    startMonth: 11,
    endMonth: 12,
    description: "年内最後",
  },
];

const r8_3 = {
  slug: "r8-3-teireikai",
  name: "令和8年第3回定例会",
  start_date: "2026-09-04",
  end_date: "2026-10-02",
};

describe("toReiwaYear / regularSessionSlug", () => {
  it("令和の年と slug を作る", () => {
    expect(toReiwaYear(2026)).toBe(8);
    expect(regularSessionSlug(8, 3)).toBe("r8-3-teireikai");
  });
});

describe("buildYearSessionCards", () => {
  it("取り込み済みの会期は日付で状況を決め、会期の情報をつける", () => {
    const open = buildYearSessionCards("2026-09-15", slots, [r8_3]);
    expect(open[2].status).toBe("open");
    expect(open[2].session).toEqual({
      slug: "r8-3-teireikai",
      name: "令和8年第3回定例会",
      endDate: "2026-10-02",
    });

    expect(buildYearSessionCards("2026-10-03", slots, [r8_3])[2].status).toBe(
      "done"
    );
    expect(buildYearSessionCards("2026-09-03", slots, [r8_3])[2].status).toBe(
      "upcoming"
    );
    // 最終日は開会中
    expect(buildYearSessionCards("2026-10-02", slots, [r8_3])[2].status).toBe(
      "open"
    );
  });

  it("取り込んでいない会期は、例年の開催月で決める", () => {
    const cards = buildYearSessionCards("2026-10-03", slots, [r8_3]);
    expect(cards[0]).toMatchObject({ status: "done", session: null });
    expect(cards[3]).toMatchObject({ status: "upcoming", session: null });
  });

  it("例年の開催月にあたるが会期が登録されていなければ「日程確認中」", () => {
    expect(buildYearSessionCards("2026-11-10", slots, [])[3].status).toBe(
      "unconfirmed"
    );
    expect(buildYearSessionCards("2026-12-25", slots, [])[3].status).toBe(
      "unconfirmed"
    );
  });

  it("終了日のない会期は、始まったら開会中のまま", () => {
    const noEnd = { ...r8_3, end_date: null };
    expect(buildYearSessionCards("2026-12-01", slots, [noEnd])[2].status).toBe(
      "open"
    );
  });

  it("slug のない会期は使わない", () => {
    const noSlug = { ...r8_3, slug: null };
    expect(
      buildYearSessionCards("2026-09-15", slots, [noSlug])[2].session
    ).toBeNull();
  });

  it("別の年の会期は使わない", () => {
    const cards = buildYearSessionCards("2027-03-01", slots, [r8_3]);
    expect(cards[2].session).toBeNull();
  });

  it("第1回の開催月より前（1月）は前の年を表示し、すべて「おわった」", () => {
    const cards = buildYearSessionCards("2027-01-05", slots, [r8_3]);
    expect(cards[2].session?.slug).toBe("r8-3-teireikai");
    expect(cards.map((c) => c.status)).toEqual([
      "done",
      "done",
      "done",
      "done",
    ]);
  });
});

describe("panelYear", () => {
  it("第1回の開催月より前は前の年、以降はその年", () => {
    expect(panelYear("2027-01-31", slots)).toBe(2026);
    expect(panelYear("2027-02-01", slots)).toBe(2027);
    expect(panelYear("2026-12-31", slots)).toBe(2026);
  });
});
