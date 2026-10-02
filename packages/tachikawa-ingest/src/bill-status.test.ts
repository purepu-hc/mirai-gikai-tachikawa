import { describe, expect, it } from "vitest";
import {
  buildStatusNote,
  parseDecision,
  resolveBillStatus,
  resolvePetitionStatus,
  warekiToIso,
} from "./bill-status";

describe("warekiToIso", () => {
  it("令和の日付を西暦に変換する", () => {
    expect(warekiToIso("令和8年9月10日")).toBe("2026-09-10");
    expect(warekiToIso("令和元年5月1日")).toBe("2019-05-01");
  });

  it("平成にも対応する", () => {
    expect(warekiToIso("平成31年3月22日")).toBe("2019-03-22");
  });

  it("読めない場合は null", () => {
    expect(warekiToIso("未定")).toBeNull();
  });
});

describe("parseDecision", () => {
  it("日付と結果に分ける", () => {
    expect(parseDecision("令和8年9月10日、可決")).toEqual({
      date: "2026-09-10",
      result: "可決",
    });
  });

  it("空欄は null", () => {
    expect(parseDecision(null)).toBeNull();
    expect(parseDecision("")).toBeNull();
  });
});

describe("resolveBillStatus", () => {
  it("可決・承認・同意・認定・採択は approved", () => {
    for (const r of ["可決", "承認", "同意", "認定", "採択"]) {
      expect(resolveBillStatus("付託省略", `令和8年9月10日、${r}`)).toBe(
        "approved"
      );
    }
  });

  it("否決・不採択・不承認は rejected（採択より先に判定）", () => {
    for (const r of ["否決", "不採択", "不承認"]) {
      expect(resolveBillStatus("総務委員会", `令和8年9月10日、${r}`)).toBe(
        "rejected"
      );
    }
  });

  it("議決前で委員会に付託されていれば in_committee", () => {
    expect(resolveBillStatus("決算特別委員会", null)).toBe("in_committee");
  });

  it("議決前で付託省略なら plenary_session", () => {
    expect(resolveBillStatus("付託省略", null)).toBe("plenary_session");
  });

  it("どちらも空欄なら submitted", () => {
    expect(resolveBillStatus(null, null)).toBe("submitted");
  });
});

describe("resolvePetitionStatus", () => {
  it("採択は adopted", () => {
    expect(resolvePetitionStatus("文教委員会", "令和8年9月30日、採択")).toBe(
      "adopted"
    );
  });

  it("不採択は rejected（採択より先に判定）", () => {
    expect(resolvePetitionStatus("文教委員会", "令和8年9月30日、不採択")).toBe(
      "rejected"
    );
  });

  it("一部採択・趣旨採択は partially_adopted", () => {
    for (const r of ["一部採択", "趣旨採択"]) {
      expect(resolvePetitionStatus("厚生委員会", `令和8年9月30日、${r}`)).toBe(
        "partially_adopted"
      );
    }
  });

  it("結果が出ていなければ付託状況から判定する", () => {
    expect(resolvePetitionStatus("厚生委員会", null)).toBe("in_committee");
    expect(resolvePetitionStatus("厚生委員会", "継続審査")).toBe(
      "in_committee"
    );
    expect(resolvePetitionStatus("付託省略", null)).toBe("plenary_session");
    expect(resolvePetitionStatus(null, null)).toBe("submitted");
  });
});

describe("buildStatusNote", () => {
  it("議決結果があればそのまま", () => {
    expect(buildStatusNote("付託省略", "令和8年9月10日、可決")).toBe(
      "令和8年9月10日、可決"
    );
  });

  it("付託先があれば「〇〇に付託」", () => {
    expect(buildStatusNote("厚生委員会", null)).toBe("厚生委員会に付託");
  });

  it("空欄なら「提出」", () => {
    expect(buildStatusNote(null, null)).toBe("提出");
  });
});
