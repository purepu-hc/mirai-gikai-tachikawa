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
  unanimous: { billCount: 5, petitionCount: 1 },
};

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

  it("議案番号の重複・反対会派なし・未登録の会派を検出する", () => {
    const data: FactionVoteData = {
      ...base,
      split: [
        { billNumber: "X", title: "x", against: [] },
        { billNumber: "X", title: "x", against: ["D党"] },
      ],
    };
    const errors = validateFactionVoteData(data);
    expect(errors).toContain("賛否が分かれた議案の番号が重複しています");
    expect(errors.some((e) => e.includes("反対した会派がありません"))).toBe(
      true
    );
    expect(errors.some((e) => e.includes("「D党」が factions にありません"))).toBe(
      true
    );
  });
});

describe("expandSplitVotes", () => {
  it("議案 × 会派 に展開し、against の会派だけ反対になる", () => {
    const rows = expandSplitVotes(base);
    expect(rows).toEqual([
      { billNumber: "令和8年議案第2号", faction: "A党", type: "for" },
      { billNumber: "令和8年議案第2号", faction: "B党", type: "against" },
      { billNumber: "令和8年議案第2号", faction: "C'会", type: "for" },
    ]);
  });
});

describe("buildFactionVoteSql", () => {
  const sql = buildFactionVoteSql(base);

  it("トランザクションで囲み、件数確認を入れる", () => {
    expect(sql).toContain("BEGIN;");
    expect(sql).toContain("COMMIT;");
    expect(sql).toContain("RAISE EXCEPTION");
    expect(sql).toContain("n_bill <> 5");
    expect(sql).toContain("n_petition <> 1");
  });

  it("会派は過去の会派（is_active = false）として、無いときだけ追加する", () => {
    expect(sql).toContain("SELECT 'A党', 'A党', 101, false");
    expect(sql).toContain("SELECT 'C''会', 'C''会', 103, false");
    expect(sql).toContain("WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = 'A党')");
  });

  it("賛否は上書き（何度流しても同じ結果）", () => {
    expect(sql).toContain("ON CONFLICT (bill_id, faction_id) DO UPDATE");
    expect(sql).toContain(
      "SELECT b.id, f.id, 'against' FROM bills b, factions f WHERE b.bill_number = '令和8年議案第2号' AND f.name = 'B党'"
    );
  });

  it("請願・陳情は全会派 反対（不採択）として登録する", () => {
    expect(sql).toMatch(
      /SELECT b\.id, f\.id, 'against' FROM bills b CROSS JOIN factions f\nWHERE .* b\.bill_type = 'petition'/
    );
  });

  it("入力に誤りがあれば SQL を作らない", () => {
    expect(() =>
      buildFactionVoteSql({ ...base, split: [{ ...base.split[0], against: [] }] })
    ).toThrow();
  });
});

describe("supabase/seed-tachikawa/votes/r8-1-teireikai.json", () => {
  const here = dirname(fileURLToPath(import.meta.url));
  const data = JSON.parse(
    readFileSync(
      resolve(here, "../../../supabase/seed-tachikawa/votes/r8-1-teireikai.json"),
      "utf8"
    )
  ) as FactionVoteData;

  it("入力に矛盾がない", () => {
    expect(validateFactionVoteData(data)).toEqual([]);
  });

  it("賛否が分かれた3議案 × 9会派、反対は各1会派", () => {
    const rows = expandSplitVotes(data);
    expect(rows).toHaveLength(27);
    expect(rows.filter((r) => r.type === "against")).toEqual([
      { billNumber: "令和8年議案第2号", faction: "自由民主党", type: "against" },
      { billNumber: "令和8年議案第4号", faction: "日本共産党", type: "against" },
      { billNumber: "令和8年議案第29号", faction: "日本共産党", type: "against" },
    ]);
  });
});
