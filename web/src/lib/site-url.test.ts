import { describe, expect, it } from "vitest";
import { resolveSiteUrl } from "./site-url";

describe("resolveSiteUrl", () => {
  it("NEXT_PUBLIC_WEB_URL を最優先し、末尾のスラッシュを除く", () => {
    expect(
      resolveSiteUrl({
        NEXT_PUBLIC_WEB_URL: "https://example.jp/",
        VERCEL_ENV: "production",
        VERCEL_PROJECT_PRODUCTION_URL: "app.vercel.app",
      })
    ).toBe("https://example.jp");
  });

  it("Vercel の本番では本番のドメインを使う", () => {
    expect(
      resolveSiteUrl({
        VERCEL_ENV: "production",
        VERCEL_PROJECT_PRODUCTION_URL: "app.vercel.app",
        VERCEL_URL: "app-abc123.vercel.app",
      })
    ).toBe("https://app.vercel.app");
  });

  it("Vercel のプレビューではそのデプロイのURLを使う", () => {
    expect(
      resolveSiteUrl({
        VERCEL_ENV: "preview",
        VERCEL_PROJECT_PRODUCTION_URL: "app.vercel.app",
        VERCEL_URL: "app-abc123.vercel.app",
      })
    ).toBe("https://app-abc123.vercel.app");
  });

  it("空白だけの NEXT_PUBLIC_WEB_URL は無視する", () => {
    expect(resolveSiteUrl({ NEXT_PUBLIC_WEB_URL: " " })).toBe(
      "http://localhost:3000"
    );
  });

  it("何もなければローカル開発用", () => {
    expect(resolveSiteUrl({})).toBe("http://localhost:3000");
  });
});
