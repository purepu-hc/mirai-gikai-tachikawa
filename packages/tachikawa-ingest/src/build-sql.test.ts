import { describe, expect, it } from "vitest";
import {
  buildBillNumber,
  buildPlaceholderContent,
  buildSql,
  resolveRowStatus,
  sqlString,
} from "./build-sql";
import { SESSIONS } from "./masters";
import type { BillListRow } from "./parse-bill-list";

const session = SESSIONS["r8-3-teireikai"];
const row: BillListRow = {
  kind: "bill",
  category: "市長提出議案",
  number: "議案第107号",
  name: "立川市子どもの福祉審議会条例",
  pdfUrl: "https://example.com/r8gian107.pdf",
  committeeName: "厚生委員会",
  decisionText: null,
};

const petitionRow: BillListRow = {
  kind: "petition",
  category: "陳情",
  number: "陳情第11号",
  name: "テスト用の陳情",
  pdfUrl: null,
  committeeName: "文教委員会",
  decisionText: "令和8年9月30日、不採択",
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

  it("番号にすでに年が付いていれば（継続審査の請願など）その年を使う", () => {
    expect(buildBillNumber("令和8年", "令和7年陳情第5号")).toBe(
      "令和7年陳情第5号"
    );
  });
});

describe("buildPlaceholderContent", () => {
  it("事実だけの仮コンテンツを作る", () => {
    const c = buildPlaceholderContent(row, session);
    expect(c.title).toBe(row.name);
    expect(c.content).toContain("厚生委員会に付託");
    expect(c.content).toContain(row.pdfUrl);
    expect(c.content).toContain(session.billListUrl);
  });

  it("請願・陳情は見出しと出典を請願・陳情用にする", () => {
    const c = buildPlaceholderContent(petitionRow, session);
    expect(c.content).toContain("## この請願・陳情について");
    expect(c.content).toContain(session.petitionListUrl);
  });
});

describe("resolveRowStatus", () => {
  it("議案は議案の判定（採択 → approved）", () => {
    expect(
      resolveRowStatus({ ...row, decisionText: "令和8年9月10日、採択" })
    ).toBe("approved");
  });

  it("請願・陳情は請願の判定（採択 → adopted）", () => {
    expect(
      resolveRowStatus({ ...petitionRow, decisionText: "令和8年9月30日、採択" })
    ).toBe("adopted");
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

describe("buildSql（請願・陳情）", () => {
  const sql = buildSql({
    session,
    committees: [],
    factions: [],
    rows: [petitionRow],
  });

  it("bill_type を petition にして年付きの番号で登録する", () => {
    expect(sql).toContain("'令和8年陳情第11号', 'petition'");
    expect(sql).toContain("bill_type = EXCLUDED.bill_type");
    expect(sql).toContain("'rejected'");
  });

  it("件数と出典を請願・陳情一覧ページで書く", () => {
    expect(sql).toContain("議案 0 件、請願・陳情 1 件");
    expect(sql).toContain(`-- 出典: ${session.petitionListUrl}`);
    expect(sql).not.toContain(`-- 出典: ${session.billListUrl}`);
  });
});

describe("buildSql（議案と請願・陳情が混在）", () => {
  const sql = buildSql({
    session,
    committees: [],
    factions: [],
    rows: [row, petitionRow],
  });

  it("両方の件数と出典を書く", () => {
    expect(sql).toContain("議案 1 件、請願・陳情 1 件");
    expect(sql).toContain(`-- 出典: ${session.billListUrl}`);
    expect(sql).toContain(`-- 出典: ${session.petitionListUrl}`);
  });
});
