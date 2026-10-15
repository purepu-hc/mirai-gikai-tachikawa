import { describe, expect, it } from "vitest";
import { buildWebsiteJsonLd, serializeJsonLd } from "./website-json-ld";

describe("buildWebsiteJsonLd", () => {
  it("サイト名・別名・トップページのURLを持つ WebSite を作る", () => {
    expect(
      buildWebsiteJsonLd({
        name: "みらい議会＠立川市",
        alternateNames: ["みらい議会 立川市"],
        url: "https://example.jp",
        description: "説明",
      })
    ).toEqual({
      "@context": "https://schema.org",
      "@type": "WebSite",
      name: "みらい議会＠立川市",
      alternateName: ["みらい議会 立川市"],
      url: "https://example.jp/",
      description: "説明",
      inLanguage: "ja",
    });
  });

  it("別名が無ければ alternateName を出さない", () => {
    const data = buildWebsiteJsonLd({
      name: "a",
      alternateNames: [],
      url: "https://example.jp/",
      description: "b",
    });
    expect(data).not.toHaveProperty("alternateName");
    expect(data.url).toBe("https://example.jp/");
  });
});

describe("serializeJsonLd", () => {
  it("< をエスケープして script タグを閉じられないようにする", () => {
    expect(serializeJsonLd({ a: "</script>" })).toBe('{"a":"\\u003c/script>"}');
  });
});
