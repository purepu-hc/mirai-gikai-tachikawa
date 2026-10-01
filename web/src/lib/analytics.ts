/**
 * Google アナリティクスの計測IDを解決する。
 *
 * サイト設定で有効化されていて、かつ計測IDが設定されている場合のみIDを返す。
 * どちらかが欠けている場合は null を返し、計測スクリプト自体を読み込まない
 * （ID が空のまま gtag.js を読み込むと、計測しないのに Google へ通信が発生するため）。
 */
export function resolveGaTrackingId(
  enabled: boolean,
  trackingId: string | undefined
): string | null {
  if (!enabled) {
    return null;
  }
  const id = trackingId?.trim();
  return id ? id : null;
}
