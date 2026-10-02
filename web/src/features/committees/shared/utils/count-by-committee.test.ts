import { describe, expect, it } from "vitest";
import { countByCommittee } from "./count-by-committee";

describe("countByCommittee", () => {
  it("委員会ごとに数え、null は数えない", () => {
    const counts = countByCommittee(["a", "b", "a", null]);
    expect(counts.get("a")).toBe(2);
    expect(counts.get("b")).toBe(1);
    expect(counts.size).toBe(2);
  });

  it("空なら空", () => {
    expect(countByCommittee([]).size).toBe(0);
  });
});
