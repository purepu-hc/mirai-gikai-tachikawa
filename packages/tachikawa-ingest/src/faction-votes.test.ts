import { readFileSync } from "node:fs";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { describe, expect, it } from "vitest";
import {
  buildFactionVoteSql,
  expandSplitVotes,
  type FactionVoteData,
  validateFactionVoteData,
} from "./faction-votes";

const base: FactionVoteData = {
  session: "r8-1-teireikai",
  source: { title: "市議会便り", url: "https://example.com/a.pdf" },
  factions: [
    { name: "A党", abbr: "A" },
    { name: "B党", abbr: "B" },
    { name: "C'会", abbr: "C" },
  ],
  split: [{ billNumber: "令和8年議案第2号", title: "予算", against: ["B党"] }],
  unanimous: {
    billCount: 5,
    adoptedPetitions: ["令和8年陳情第9号"],
    rejectedPetitions: ["令和8年陳情第1号"],
  },
  notVoted: ["令和8年陳情第8号"],
};

const here = dirname(fileURLToPath(import.meta.url));
const loadVotes = (session: string) =>
  JSON.parse(
    readFileSync(
      resolve(here, `../../../supabase/seed-tachikawa/votes/${session}.json`),
      "utf8"
    )
  ) as FactionVoteData;

describe("validateFactionVoteData", () => {
  it("正しい入力ではエラーなし", () => {
    expect(validateFactionVoteData(base)).toEqual([]);
  });

  it("会派名の重複を検出する", () => {
    const data = {
      ...base,
      factions: [...base.factions, { name: "A党", abbr: "A2" }],
    };
    expect(validateFactionVoteData(data)).toContain("会派名が重複しています");
  });

  it("番号の重複・反対会派なし・未登録の会派を検出する", () => {
    const data: FactionVoteData = {
      ...base,
      split: [
        { billNumber: "X", title: "x", against: [] },
        {
          billNumber: "令和8年陳情第1号",
          title: "x",
          against: ["A党"],
          comments: { D党: "退席" },
        },
      ],
    };
    const errors = validateFactionVoteData(data);
    expect(errors).toContain("議案・請願・陳情の番号が重複しています");
    expect(errors.some((e) => e.includes("反対した会派がありません"))).toBe(
      true
    );
    expect(errors.some((e) => e.includes("「D党」が factions にありません"))).toBe(
      true
    );
  });
});

describe("expandSplitVotes", () => {
  it("議案 × 会派 に展開し、against の会派だけ反対、comments を添える", () => {
    const rows = expandSplitVotes({
      ...base,
      split: [{ ...base.split[0], comments: { "C'会": "1人退席" } }],
    });
    expect(rows).toEqual([
      { billNumber: "令和8年議案第2号", faction: "A党", type: "for", comment: null },
      { billNumber: "令和8年議案第2号", faction: "B党", type: "against", comment: null },
      { billNumber: "令和8年議案第2号", faction: "C'会", type: "for", comment: "1人退席" },
    ]);
  });
});

describe("buildFactionVoteSql", () => {
  const sql = buildFactionVoteSql(base);

  it("トランザクションで囲み、件数確認を入れる", () => {
    expect(sql).toContain("BEGIN;");
    expect(sql).toContain("COMMIT;");
    expect(sql).toContain("件数が合いません（全員一致の議案）: % 件 / 入力 5 件");
    expect(sql).toContain("件数が合いません（入力にない請願・陳情）");
  });

  it("会派は過去の会派（is_active = false）として、無いときだけ追加する", () => {
    expect(sql).toContain("SELECT 'A党', 'A党', 101, false");
    expect(sql).toContain("SELECT 'C''会', 'C''会', 103, false");
    expect(sql).toContain(
      "WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = 'A党')"
    );
  });

  it("賛否とコメントは上書き（何度流しても同じ結果）", () => {
    expect(sql).toContain(
      "ON CONFLICT (bill_id, faction_id) DO UPDATE SET type = EXCLUDED.type, comment = EXCLUDED.comment"
    );
    expect(sql).toContain(
      "'against', NULL FROM bills b, factions f WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai') AND b.bill_number = '令和8年議案第2号' AND f.name = 'B党'"
    );
  });

  it("全員一致の議案からは、賛否が分かれたものと表決なしを除く", () => {
    expect(sql).toContain(
      "b.bill_type <> 'petition' AND b.bill_number NOT IN ('令和8年議案第2号', '令和8年陳情第8号')"
    );
  });

  it("請願・陳情は採択→全会派 賛成、不採択→全会派 反対", () => {
    expect(sql).toMatch(
      /SELECT b\.id, f\.id, 'for', NULL FROM bills b CROSS JOIN factions f\nWHERE .* b\.bill_number IN \('令和8年陳情第9号'\)/
    );
    expect(sql).toMatch(
      /SELECT b\.id, f\.id, 'against', NULL FROM bills b CROSS JOIN factions f\nWHERE .* b\.bill_number IN \('令和8年陳情第1号'\)/
    );
  });

  it("表決なしの陳情は登録しない", () => {
    const inserts = sql
      .split("\n")
      .filter((l) => l.startsWith("WHERE") || l.startsWith("SELECT b.id"));
    expect(inserts.some((l) => l.includes("IN ('令和8年陳情第8号')"))).toBe(
      false
    );
  });

  it("入力に誤りがあれば SQL を作らない", () => {
    expect(() =>
      buildFactionVoteSql({ ...base, split: [{ ...base.split[0], against: [] }] })
    ).toThrow();
  });
});

describe("supabase/seed-tachikawa/votes/r8-1-teireikai.json", () => {
  const data = loadVotes("r8-1-teireikai");

  it("入力に矛盾がない", () => {
    expect(validateFactionVoteData(data)).toEqual([]);
  });

  it("賛否が分かれた3議案 × 9会派、反対は各1会派", () => {
    const rows = expandSplitVotes(data);
    expect(rows).toHaveLength(27);
    expect(
      rows.filter((r) => r.type === "against").map((r) => [r.billNumber, r.faction])
    ).toEqual([
      ["令和8年議案第2号", "自由民主党"],
      ["令和8年議案第4号", "日本共産党"],
      ["令和8年議案第29号", "日本共産党"],
    ]);
  });
});

describe("supabase/seed-tachikawa/votes/r8-2-teireikai.json", () => {
  const data = loadVotes("r8-2-teireikai");

  it("入力に矛盾がない", () => {
    expect(validateFactionVoteData(data)).toEqual([]);
  });

  it("賛否が分かれたのは陳情第6号のみで、全会派が反対（日本共産党は1人退席）", () => {
    const rows = expandSplitVotes(data);
    expect(rows).toHaveLength(9);
    expect(rows.every((r) => r.type === "against")).toBe(true);
    expect(rows.filter((r) => r.comment).map((r) => r.faction)).toEqual([
      "日本共産党",
    ]);
  });
});
