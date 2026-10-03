/**
 * サイト名を「本体」と「地域名」に分ける（例：「みらい議会＠立川市」→「みらい議会」「＠立川市」）。
 * スマホのヘッダーで2段に表示するために使う。区切りの「＠」「@」がなければ分けない。
 */
export function splitSiteName(siteName: string): {
  main: string;
  sub: string | null;
} {
  const index = siteName.search(/[＠@]/);
  if (index <= 0) return { main: siteName, sub: null };
  return { main: siteName.slice(0, index), sub: siteName.slice(index) };
}
