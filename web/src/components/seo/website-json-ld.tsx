import { siteConfig } from "@/config/site.config";
import { env } from "@/lib/env";
import { buildWebsiteJsonLd, serializeJsonLd } from "@/lib/website-json-ld";

/** トップページ用：検索結果にサイト名を正しく出すための構造化データ */
export function WebsiteJsonLd() {
  const data = buildWebsiteJsonLd({
    name: siteConfig.siteName,
    alternateNames: siteConfig.siteAlternateNames,
    url: env.webUrl,
    description: siteConfig.siteDescription,
  });
  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: serializeJsonLd(data) }}
    />
  );
}
