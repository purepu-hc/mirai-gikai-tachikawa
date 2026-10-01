import { describe, expect, it } from "vitest";
import { buildBillNumber, buildPlaceholderContent, buildSql, sqlString } from "./build-sql";
import { SESSIONS } from "./masters";
import type { BillListRow } from "./parse-bill-list";

const session = SESSIONS["r8-3-teireikai"];
const row: BillListRow = {
  category: "市長提出議案",
  number: "議案第107号",
  name: "立川市子どもの福祉審議会条例",
  pdfUrl: "https://example.com/r8gian107.pdf",
  committeeName: "厚生委員会",
  decisionText: null,
};

describe("sqlString", () => {
  it("シングルクォートを二重にする", () => {
    expect(sqlString("O'Reilly")).toBe("'O''Reilly'");
  });

  it("null は NULL", () => {
    expect(sqlString(null)).toBe("NULL");
  });
});

describe("buildBillNumber", () => {
  it("年を付けて重複しない番号にする", () => {
    expect(buildBillNumber("令和8年", "議案第95号")).toBe("令和8年議案第95号");
  });
});

describe("buildPlaceholderContent", () => {
  it("事実だけの仮コンテンツを作る", () => {
    const c = buildPlaceholderContent(row, session);
    expect(c.title).toBe(row.name);
    expect(c.content).toContain("厚生委員会に付託");
    expect(c.content).toContain(row.pdfUrl);
  });
});

describe("buildSql", () => {
  const sql = buildSql({
    session,
    committees: [{ name: "厚生委員会", description: "常任委員会" }],
    factions: ["公明党"],
    rows: [row],
  });

  it("トランザクションで囲む", () => {
    expect(sql).toContain("BEGIN;");
    expect(sql.trim().endsWith("COMMIT;")).toBe(true);
  });

  it("議案は議案番号で上書き更新する", () => {
    expect(sql).toContain("'令和8年議案第107号'");
    expect(sql).toContain("ON CONFLICT (bill_number) WHERE bill_number != ''");
    expect(sql).toContain("'in_committee'");
  });

  it("書いた解説を上書きしない", () => {
    expect(sql).toContain("ON CONFLICT (bill_id, difficulty_level) DO NOTHING");
  });

  it("委員会・会派は重複して追加しない", () => {
    expect(sql).toContain("WHERE NOT EXISTS (SELECT 1 FROM committees WHERE name = '厚生委員会')");
    expect(sql).toContain("WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = '公明党')");
  });
});
