import { describe, expect, it } from "vitest";
import { countItemsBySession } from "./count-items-by-session";

describe("countItemsBySession", () => {
  it("会期ごとに議案と請願・陳情を分けて数える", () => {
    const counts = countItemsBySession([
      { council_session_id: "s1", bill_type: "bill" },
      { council_session_id: "s1", bill_type: "petition" },
      { council_session_id: "s1", bill_type: "member_bill" },
      { council_session_id: "s2", bill_type: "petition" },
    ]);
    expect(counts.get("s1")).toEqual({ bills: 2, petitions: 1 });
    expect(counts.get("s2")).toEqual({ bills: 0, petitions: 1 });
  });

  it("空なら空", () => {
    expect(countItemsBySession([]).size).toBe(0);
  });

  it("会期のないものは数えない", () => {
    const counts = countItemsBySession([
      { council_session_id: null, bill_type: "bill" },
    ]);
    expect(counts.size).toBe(0);
  });
});
