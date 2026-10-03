import { describe, expect, it } from "vitest";
import { splitSiteName } from "./split-site-name";

describe("splitSiteName", () => {
  it("全角の＠で本体と地域名に分ける", () => {
    expect(splitSiteName("みらい議会＠立川市")).toEqual({
      main: "みらい議会",
      sub: "＠立川市",
    });
  });

  it("半角の@でも分ける", () => {
    expect(splitSiteName("みらい議会@川崎市")).toEqual({
      main: "みらい議会",
      sub: "@川崎市",
    });
  });

  it("区切りがなければ分けない", () => {
    expect(splitSiteName("みらい議会")).toEqual({
      main: "みらい議会",
      sub: null,
    });
  });

  it("先頭が＠のときは分けない", () => {
    expect(splitSiteName("＠立川市")).toEqual({ main: "＠立川市", sub: null });
  });
});
