import { describe, expect, it } from "vitest";
import {
  getStatusBadgeLabel,
  getStatusBadgeVariant,
  isPetition,
} from "./status-badge-label";

describe("isPetition", () => {
  it("petition だけ true", () => {
    expect(isPetition("petition")).toBe(true);
    expect(isPetition("bill")).toBe(false);
    expect(isPetition(undefined)).toBe(false);
  });
});

describe("getStatusBadgeLabel", () => {
  it("議案は従来どおりのラベル", () => {
    expect(getStatusBadgeLabel("approved")).toBe("可決");
    expect(getStatusBadgeLabel("rejected", "bill")).toBe("否決");
    expect(getStatusBadgeLabel("in_committee", "bill")).toBe("委員会審査中");
  });

  it("請願・陳情は採択／不採択／審査中で表す", () => {
    expect(getStatusBadgeLabel("adopted", "petition")).toBe("採択");
    expect(getStatusBadgeLabel("partially_adopted", "petition")).toBe(
      "一部採択"
    );
    expect(getStatusBadgeLabel("rejected", "petition")).toBe("不採択");
    expect(getStatusBadgeLabel("in_committee", "petition")).toBe("審査中");
    expect(getStatusBadgeLabel("submitted", "petition")).toBe("受理");
  });
});

describe("getStatusBadgeVariant", () => {
  it("採択系は default、不採択・否決は dark、審議中は light", () => {
    expect(getStatusBadgeVariant("adopted")).toBe("default");
    expect(getStatusBadgeVariant("rejected")).toBe("dark");
    expect(getStatusBadgeVariant("in_committee")).toBe("light");
    expect(getStatusBadgeVariant("preparing")).toBe("muted");
  });
});
