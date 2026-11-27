import { readFileSync } from "node:fs";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { describe, expect, it } from "vitest";
import {
  buildGeneralQuestionSql,
  type GeneralQuestionData,
  nameKey,
  resolveQuestionMembers,
} from "./general-questions";
import { MEMBER_TERMS, MEMBERS, type MemberDef } from "./members";

const here = dirname(fileURLToPath(import.meta.url));
const r84 = JSON.parse(
  readFileSync(
    resolve(
      here,
      "../../../supabase/seed-tachikawa/general-questions/r8-4-teireikai.json"
    ),
    "utf8"
  )
) as GeneralQuestionData;

const members: MemberDef[] = [
  {
    slug: "yamada-taro",
    name: "山田　太郎",
    nameKana: "やまだ　たろう",
    homepageUrl: null,
    xUrl: null,
    isCurrent: true,
  },
];
const terms = [
  {
    slug: "yamada-taro",
    termStart: "2026-07-14",
    termEnd: null,
    seatNumber: 3,
    endReason: null,
  },
];

function small(): GeneralQuestionData {
  return {
    session: {
      slug: "test-session",
      name: "テスト定例会",
      startDate: "2026-11-30",
      endDate: "2026-12-18",
      councilUrl: "https://example.com/schedule",
    },
    sourceUrl: "https://example.com/order.pdf",
    sourceFetchedAt: "2026-11-27",
    questions: [
      {
        orderNumber: 1,
        seatNumber: 3,
        name: "山田太郎",
        factionLabel: "テスト会派",
        questionStyle: "一問一答",
        aids: ["モニター"],
        items: [{ number: 1, title: "市の'公園'について", subs: ["整備", "管理"] }],
      },
    ],
  };
}

describe("nameKey", () => {
  it("スペースと髙の字体の違いを無視する", () => {
    expect(nameKey("髙畠　奈美")).toBe(nameKey("高畠奈美"));
  });
});

describe("第4回定例会の順序表", () => {
  it("25人全員が議員マスターの議員と議席に一致する", () => {
    const { slugs, errors } = resolveQuestionMembers(
      r84,
      MEMBERS,
      MEMBER_TERMS
    );
    expect(errors).toEqual([]);
    expect(new Set(slugs).size).toBe(25);
  });

  it("受理番号は1〜25", () => {
    expect(r84.questions.map((q) => q.orderNumber)).toEqual(
      Array.from({ length: 25 }, (_, i) => i + 1)
    );
  });
});

describe("resolveQuestionMembers", () => {
  it("議席がマスターと違えば知らせる", () => {
    const data = small();
    data.questions[0].seatNumber = 9;
    expect(resolveQuestionMembers(data, members, terms).errors).toEqual([
      "議席が議員マスターと違う: 山田太郎（順序表 9、マスター 3）",
    ]);
  });

  it("名簿にない名前を知らせる", () => {
    const data = small();
    data.questions[0].name = "鈴木一郎";
    expect(resolveQuestionMembers(data, members, terms).errors).toContain(
      "議員を1人に決められない: 鈴木一郎（0 人）"
    );
  });

  it("会期の初日に任期外の議員を知らせる", () => {
    const data = small();
    data.session.startDate = "2026-01-10";
    expect(resolveQuestionMembers(data, members, terms).errors).toContain(
      "会期の初日に在任していない: 山田太郎"
    );
  });
});

describe("buildGeneralQuestionSql", () => {
  const sql = buildGeneralQuestionSql(small(), members, terms);

  it("会期がなければ作り、あれば変えない", () => {
    expect(sql).toContain("ON CONFLICT (slug) DO NOTHING;");
  });

  it("質問を会期と議員で上書きし、件名を入れ直す", () => {
    expect(sql).toContain("ON CONFLICT (council_session_id, member_id) DO UPDATE");
    expect(sql).toContain("DELETE FROM general_question_items WHERE question_id =");
  });

  it("備考を配列で、件名の引用符をエスケープして入れる", () => {
    expect(sql).toContain("ARRAY['モニター']::text[]");
    expect(sql).toContain("'市の''公園''について'");
  });

  it("小項目は件名を親にして通し番号で並べる", () => {
    expect(sql).toContain("parent_id IS NULL AND item_number = 1), 2, '管理', 3);");
  });

  it("データに問題があればSQLを作らない", () => {
    const data = small();
    data.questions[0].name = "鈴木一郎";
    expect(() => buildGeneralQuestionSql(data, members, terms)).toThrow(
      "議員を1人に決められない"
    );
  });
});
