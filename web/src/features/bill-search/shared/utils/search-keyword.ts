/** 検索キーワードの最大文字数 */
export const MAX_KEYWORD_LENGTH = 50;

/**
 * 入力された検索キーワードを整える。
 * 前後の空白（全角含む）を除き、連続する空白を1つにし、長すぎる入力は切り詰める。
 * 空なら null。
 */
export function normalizeSearchKeyword(
  raw: string | string[] | undefined | null
): string | null {
  const value = Array.isArray(raw) ? raw[0] : raw;
  if (!value) return null;
  const normalized = value
    .replace(/[\s　]+/g, " ")
    .trim()
    .slice(0, MAX_KEYWORD_LENGTH);
  return normalized === "" ? null : normalized;
}

/**
 * LIKE / ILIKE のパターン用に特殊文字（\ % _）をエスケープし、部分一致の形にする。
 * 例: "100%" → "%100\%%"
 */
export function toContainsPattern(keyword: string): string {
  const escaped = keyword.replace(/[\\%_]/g, (c) => `\\${c}`);
  return `%${escaped}%`;
}
