import type { MetadataRoute } from "next";
import { env } from "@/lib/env";

export default function robots(): MetadataRoute.Robots {
  return {
    rules: {
      userAgent: "*",
      allow: "/",
      // 管理用のプレビュー（トークン付き）とAPIは検索対象にしない
      disallow: ["/preview/", "/api/"],
    },
    sitemap: `${env.webUrl}/sitemap.xml`,
  };
}
