import { describe, expect, it } from "vitest";
import {
  LINKS_CHECKED_AT,
  MEMBER_FACTIONS,
  MEMBER_ROLES,
  MEMBER_TERMS,
  MEMBERS,
} from "./members";
import {
  buildMemberSql,
  type MemberMasterData,
  validateMemberData,
} from "./members-sql";

const real: MemberMasterData = {
  members: MEMBERS,
  terms: MEMBER_TERMS,
  factions: MEMBER_FACTIONS,
  roles: MEMBER_ROLES,
  linksCheckedAt: LINKS_CHECKED_AT,
};

function small(): MemberMasterData {
  return {
    members: [
      {
        slug: "yamada-taro",
        name: "山田　太郎",
        nameKana: "やまだ　たろう",
        homepageUrl: null,
        xUrl: "https://x.com/example",
        isCurrent: true,
      },
      {
        slug: "sato-hanako",
        name: "佐藤　花子",
        nameKana: "さとう　はなこ",
        homepageUrl: null,
        xUrl: null,
        isCurrent: false,
      },
    ],
    terms: [
      {
        slug: "yamada-taro",
        termStart: "2026-07-14",
        termEnd: null,
        seatNumber: 1,
        endReason: null,
      },
      {
        slug: "sato-hanako",
        termStart: "2022-07-14",
        termEnd: "2026-07-13",
        seatNumber: 1,
        endReason: "任期満了",
      },
    ],
    factions: [
      {
        slug: "yamada-taro",
        faction: "テスト会派",
        startDate: "2026-07-14",
        endDate: null,
        sourceUrl: "https://example.com",
      },
    ],
    roles: [],
    linksCheckedAt: "2026-11-26",
  };
}

describe("議員マスターの実データ", () => {
  it("食い違いがない", () => {
    expect(validateMemberData(real)).toEqual([]);
  });

  it("現職は28人、改選前に退いた議員は5人", () => {
    expect(MEMBERS.filter((m) => m.isCurrent)).toHaveLength(28);
    expect(MEMBERS.filter((m) => !m.isCurrent)).toHaveLength(5);
  });

  it("現任期の議席は1〜28番が1人ずつ", () => {
    const seats = MEMBER_TERMS.filter((t) => t.termEnd === null)
      .map((t) => t.seatNumber)
      .sort((a, b) => (a ?? 0) - (b ?? 0));
    expect(seats).toEqual(Array.from({ length: 28 }, (_, i) => i + 1));
  });

  it("議長・副議長は今それぞれ1人", () => {
    const now = MEMBER_ROLES.filter((r) => r.endDate === null);
    expect(now.map((r) => [r.role, r.slug])).toEqual([
      ["議長", "kihara-hiroshi"],
      ["副議長", "oosawa-junichi"],
    ]);
  });
});

describe("validateMemberData", () => {
  it("同じ任期の議席の重複を見つける", () => {
    const data = small();
    data.terms[1] = { ...data.terms[1], termStart: "2026-07-14" };
    data.members[1].isCurrent = true;
    data.terms[1].termEnd = null;
    expect(validateMemberData(data)).toContain(
      "議席の重複: 2026-07-14 の 1 番（yamada-taro と sato-hanako）"
    );
  });

  it("現職なのに現在の任期がない議員を見つける", () => {
    const data = small();
    data.terms = data.terms.filter((t) => t.slug !== "yamada-taro");
    expect(validateMemberData(data)).toContain(
      "現職なのに現在の任期が 0 件: yamada-taro"
    );
  });

  it("会派の期間の重なりを見つける", () => {
    const data = small();
    data.factions.push({
      slug: "yamada-taro",
      faction: "別の会派",
      startDate: "2026-08-01",
      endDate: null,
      sourceUrl: "https://example.com",
    });
    expect(validateMemberData(data)).toContain(
      "会派の期間が重なっている: yamada-taro"
    );
  });

  it("退任日と次の就任日が同じ日の役職は正常とみなす", () => {
    const data = small();
    data.roles = [
      {
        slug: "sato-hanako",
        role: "議長",
        startDate: "2024-01-01",
        endDate: "2024-06-26",
        sourceUrl: "https://example.com",
      },
      {
        slug: "yamada-taro",
        role: "議長",
        startDate: "2024-06-26",
        endDate: null,
        sourceUrl: "https://example.com",
      },
    ];
    expect(validateMemberData(data)).toEqual([]);
  });

  it("未登録の議員を参照していたら見つける", () => {
    const data = small();
    data.factions[0].slug = "nobody-here";
    expect(validateMemberData(data)).toContain(
      "factions に未登録の議員: nobody-here"
    );
  });
});

describe("buildMemberSql", () => {
  it("議員を slug で上書きする INSERT を作る", () => {
    const sql = buildMemberSql(small());
    expect(sql).toContain(
      "VALUES ('yamada-taro', '山田　太郎', 'やまだ　たろう', 1, NULL, 'https://x.com/example', '2026-11-26'::date, true)"
    );
    expect(sql).toContain("ON CONFLICT (slug) DO UPDATE");
  });

  it("会派が1件だけあることを先に確かめる", () => {
    const sql = buildMemberSql(small());
    expect(sql).toContain(
      "SELECT count(*) INTO n FROM factions WHERE name = 'テスト会派';"
    );
  });

  it("任期の終わりと議席を入れる", () => {
    const sql = buildMemberSql(small());
    expect(sql).toContain(
      "VALUES ((SELECT id FROM council_members WHERE slug = 'sato-hanako'), '2022-07-14'::date, '2026-07-13'::date, 1, '任期満了')"
    );
  });

  it("データに問題があればSQLを作らない", () => {
    const data = small();
    data.members.push({ ...data.members[0] });
    expect(() => buildMemberSql(data)).toThrow("slug が重複: yamada-taro");
  });
});
