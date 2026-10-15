type SiteUrlEnv = {
  NEXT_PUBLIC_WEB_URL?: string;
  VERCEL_ENV?: string;
  VERCEL_PROJECT_PRODUCTION_URL?: string;
  VERCEL_URL?: string;
};

const withHttps = (host: string) =>
  /^https?:\/\//.test(host) ? host : `https://${host}`;

/**
 * サイトの絶対URL（OGP画像・サイトマップ・構造化データで使う）を決める。
 * 1. NEXT_PUBLIC_WEB_URL が設定されていればそれ
 * 2. Vercel の本番なら本番のドメイン（VERCEL_PROJECT_PRODUCTION_URL）
 * 3. Vercel のプレビューならそのデプロイのURL（VERCEL_URL）
 * 4. どれもなければローカル開発用
 */
export function resolveSiteUrl(e: SiteUrlEnv): string {
  const url =
    e.NEXT_PUBLIC_WEB_URL?.trim() ||
    (e.VERCEL_ENV === "production" && e.VERCEL_PROJECT_PRODUCTION_URL
      ? withHttps(e.VERCEL_PROJECT_PRODUCTION_URL)
      : "") ||
    (e.VERCEL_URL ? withHttps(e.VERCEL_URL) : "") ||
    "http://localhost:3000";
  return url.replace(/\/+$/, "");
}
