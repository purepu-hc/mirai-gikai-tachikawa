import { describe, expect, it } from "vitest";
import {
  MAX_COMMITTEES_TO_EXPAND,
  shouldIncludeCommitteeBills,
} from "./committee-match";

describe("shouldIncludeCommitteeBills", () => {
  it("委員会に一致しなければ含めない", () => {
    expect(shouldIncludeCommitteeBills(0)).toBe(false);
  });

  it("一致した委員会が上限以下なら含める", () => {
    expect(shouldIncludeCommitteeBills(1)).toBe(true);
    expect(shouldIncludeCommitteeBills(MAX_COMMITTEES_TO_EXPAND)).toBe(true);
  });

  it("「委員会」などで多くの委員会に一致したときは含めない", () => {
    expect(shouldIncludeCommitteeBills(MAX_COMMITTEES_TO_EXPAND + 1)).toBe(
      false
    );
    expect(shouldIncludeCommitteeBills(8)).toBe(false);
  });
});
