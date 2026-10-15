/**
 * Google 検索の「サイト名」に使われる WebSite の構造化データ（JSON-LD）を作る。
 * https://developers.google.com/search/docs/appearance/site-names
 */
export function buildWebsiteJsonLd(input: {
  name: string;
  alternateNames: readonly string[];
  url: string;
  description: string;
}) {
  return {
    "@context": "https://schema.org",
    "@type": "WebSite",
    name: input.name,
    ...(input.alternateNames.length > 0
      ? { alternateName: [...input.alternateNames] }
      : {}),
    url: `${input.url.replace(/\/+$/, "")}/`,
    description: input.description,
    inLanguage: "ja",
  };
}

/** <script type="application/ld+json"> に埋め込める文字列にする（</script> 対策） */
export function serializeJsonLd(data: unknown): string {
  return JSON.stringify(data).replace(/</g, "\\u003c");
}
