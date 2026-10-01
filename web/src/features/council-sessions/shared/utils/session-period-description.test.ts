import { describe, expect, it } from "vitest";
import { buildSessionPeriodDescription } from "./session-period-description";

const session = {
  name: "令和8年第3回定例会",
  start_date: "2026-09-04",
  end_date: "2026-10-02",
};

describe("buildSessionPeriodDescription", () => {
  it("会期中は「開かれている」", () => {
    expect(buildSessionPeriodDescription(session, "2026-10-01")).toBe(
      "2026.9月〜10月に開かれている令和8年第3回定例会"
    );
  });

  it("最終日も会期中として扱う", () => {
    expect(buildSessionPeriodDescription(session, "2026-10-02")).toContain(
      "開かれている"
    );
  });

  it("会期後は「開かれた」", () => {
    expect(buildSessionPeriodDescription(session, "2026-10-03")).toBe(
      "2026.9月〜10月に開かれた令和8年第3回定例会"
    );
  });

  it("会期前は「開かれる予定の」", () => {
    expect(buildSessionPeriodDescription(session, "2026-08-31")).toBe(
      "2026.9月〜10月に開かれる予定の令和8年第3回定例会"
    );
  });

  it("終了日が未定なら開始後は会期中として扱う", () => {
    expect(
      buildSessionPeriodDescription(
        { ...session, end_date: null },
        "2026-12-01"
      )
    ).toBe("2026.9月に開かれている令和8年第3回定例会");
  });

  it("同じ月に収まる会期は月を1つだけ書く", () => {
    expect(
      buildSessionPeriodDescription(
        { name: "臨時会", start_date: "2026-07-20", end_date: "2026-07-21" },
        "2026-08-01"
      )
    ).toBe("2026.7月に開かれた臨時会");
  });
});
