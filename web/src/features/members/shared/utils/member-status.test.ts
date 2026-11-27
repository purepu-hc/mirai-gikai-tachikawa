import { describe, expect, it } from "vitest";
import type {
  ElectionBlackout,
  GeneralQuestion,
  Member,
  MemberRole,
} from "../types/member";
import {
  buildQuestionTopics,
  displayName,
  findActiveBlackout,
  findChairPeriods,
  findFactionOn,
  findRolesOn,
  formatJapaneseDate,
  formatPeriod,
  isWithin,
  sortQuestionsBySessionDesc,
  splitMembersByCurrent,
} from "./member-status";

function member(slug: string, termEnd: string | null): Member {
  return {
    id: slug,
    slug,
    name: "山田　太郎",
    nameKana: "やまだ　たろう",
    homepageUrl: null,
    xUrl: null,
    linksCheckedAt: null,
    isCurrent: termEnd === null,
    terms: [
      {
        termStart: termEnd ? "2022-07-14" : "2026-07-14",
        termEnd,
        seatNumber: 1,
        endReason: null,
      },
    ],
    factions: [],
    roles: [],
  };
}

describe("isWithin", () => {
  const period = { startDate: "2026-02-18", endDate: "2026-07-13" };

  it("初日と最終日を含む", () => {
    expect(isWithin(period, "2026-02-18")).toBe(true);
    expect(isWithin(period, "2026-07-13")).toBe(true);
  });

  it("期間の外は含まない", () => {
    expect(isWithin(period, "2026-02-17")).toBe(false);
    expect(isWithin(period, "2026-07-14")).toBe(false);
  });

  it("終わりのない期間は初日以降をすべて含む", () => {
    expect(
      isWithin({ startDate: "2026-07-14", endDate: null }, "2030-01-01")
    ).toBe(true);
  });
});

describe("findFactionOn", () => {
  it("その日に所属していた会派を返す（会派を移った議員）", () => {
    const factions = [
      {
        factionName: "立川の未来",
        startDate: "2026-05-07",
        endDate: null,
        sourceUrl: null,
      },
      {
        factionName: "都民ファーストの会立川市議会",
        startDate: "2026-02-18",
        endDate: "2026-03-24",
        sourceUrl: null,
      },
    ];
    expect(findFactionOn(factions, "2026-03-01")?.factionName).toBe(
      "都民ファーストの会立川市議会"
    );
    expect(findFactionOn(factions, "2026-11-27")?.factionName).toBe(
      "立川の未来"
    );
    expect(findFactionOn(factions, "2026-04-10")).toBeUndefined();
  });
});

describe("議長・副議長", () => {
  const roles: MemberRole[] = [
    {
      role: "議長",
      startDate: "2026-07-21",
      endDate: null,
      sourceUrl: null,
    },
    {
      role: "議長",
      startDate: "2022-07-21",
      endDate: "2023-09-18",
      sourceUrl: null,
    },
  ];

  it("その日の役職だけを返す", () => {
    expect(findRolesOn(roles, "2026-11-27").map((r) => r.startDate)).toEqual([
      "2026-07-21",
    ]);
    expect(findRolesOn(roles, "2025-01-01")).toEqual([]);
  });

  it("議長だった期間を古い順に返す", () => {
    expect(findChairPeriods(roles).map((r) => r.startDate)).toEqual([
      "2022-07-21",
      "2026-07-21",
    ]);
  });
});

describe("findActiveBlackout", () => {
  const blackouts: ElectionBlackout[] = [
    {
      electionName: "立川市議会議員選挙",
      startDate: "2030-06-01",
      endDate: "2030-06-08",
      memberId: null,
    },
    {
      electionName: "東京都議会議員選挙",
      startDate: "2029-06-15",
      endDate: "2029-06-24",
      memberId: "m1",
    },
  ];

  it("市議選の期間は全員のページを閉じる", () => {
    expect(findActiveBlackout(blackouts, "2030-06-05")?.electionName).toBe(
      "立川市議会議員選挙"
    );
    expect(findActiveBlackout(blackouts, "2030-06-05", "m2")).toBeDefined();
  });

  it("ほかの選挙に立候補した議員は、その議員のページだけを閉じる", () => {
    expect(findActiveBlackout(blackouts, "2029-06-20", "m1")).toBeDefined();
    expect(findActiveBlackout(blackouts, "2029-06-20", "m2")).toBeUndefined();
    expect(findActiveBlackout(blackouts, "2029-06-20")).toBeUndefined();
  });

  it("期間の外は閉じない", () => {
    expect(findActiveBlackout(blackouts, "2030-06-09")).toBeUndefined();
  });
});

describe("splitMembersByCurrent", () => {
  it("その日に在任している議員と、以前の議員に分ける", () => {
    const { current, former } = splitMembersByCurrent(
      [member("a", null), member("b", "2026-07-13"), member("c", null)],
      "2026-11-27"
    );
    expect(current.map((m) => m.slug)).toEqual(["a", "c"]);
    expect(former.map((m) => m.slug)).toEqual(["b"]);
  });
});

describe("buildQuestionTopics", () => {
  it("件名ごとに小項目をまとめ、並び順を守る", () => {
    const topics = buildQuestionTopics([
      { id: "s2", parentId: "p1", itemNumber: 2, text: "管理", sortOrder: 3 },
      { id: "p2", parentId: null, itemNumber: 2, text: "道路", sortOrder: 4 },
      { id: "p1", parentId: null, itemNumber: 1, text: "公園", sortOrder: 1 },
      { id: "s1", parentId: "p1", itemNumber: 1, text: "整備", sortOrder: 2 },
    ]);
    expect(topics).toEqual([
      { number: 1, title: "公園", subs: ["整備", "管理"] },
      { number: 2, title: "道路", subs: [] },
    ]);
  });
});

describe("sortQuestionsBySessionDesc", () => {
  it("会期の新しい順に並べる", () => {
    const q = (sessionStartDate: string) =>
      ({ id: sessionStartDate, sessionStartDate }) as GeneralQuestion;
    expect(
      sortQuestionsBySessionDesc([
        q("2026-02-18"),
        q("2026-11-30"),
        q("2026-05-07"),
      ]).map((x) => x.id)
    ).toEqual(["2026-11-30", "2026-05-07", "2026-02-18"]);
  });
});

describe("表示用の整形", () => {
  it("日付を和文にする", () => {
    expect(formatJapaneseDate("2026-07-01")).toBe("2026年7月1日");
  });

  it("期間を和文にする", () => {
    expect(formatPeriod({ startDate: "2026-07-21", endDate: null })).toBe(
      "2026年7月21日〜"
    );
    expect(
      formatPeriod({ startDate: "2024-06-26", endDate: "2026-07-13" })
    ).toBe("2024年6月26日〜2026年7月13日");
  });

  it("名簿の全角スペースを半角にする", () => {
    expect(displayName("浅川　修一")).toBe("浅川 修一");
  });
});
