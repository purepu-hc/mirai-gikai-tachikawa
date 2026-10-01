type AiFeatureFlags = {
  aiChat: boolean;
  aiInterview: boolean;
};

/**
 * 匿名ログイン（Supabase Anonymous Auth）が必要かどうかを判定する。
 *
 * 匿名ログインは AI チャット・AI インタビュー（およびインタビューへのリアクション）で
 * 利用者を区別するためのもの。どちらも無効なら不要で、訪問者ごとに匿名ユーザーと
 * 認証 Cookie が作られるのを避けるため false を返す。
 */
export function needsAnonymousAuth(features: AiFeatureFlags): boolean {
  return features.aiChat || features.aiInterview;
}
