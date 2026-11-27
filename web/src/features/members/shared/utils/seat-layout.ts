/** 議席図の1席分の位置（図の幅・高さに対する割合、0〜100） */
export type SeatPosition = {
  seatNumber: number;
  leftPct: number;
  topPct: number;
};

/** 図の縦横比（幅100に対する高さ）。ページ側の aspect-ratio と合わせる */
export const SEAT_PLAN_HEIGHT = 60;

/**
 * 議席番号順に、半円の2列（内側・外側）へ並べる。
 * 実際の議場の配置ではなく、番号順に並べた図（「議員の発信リンク集」と同じ並べ方）。
 * 内側の列に若い番号から、左から右へ置き、残りを外側の列に置く。
 */
export function buildSeatLayout(
  seatNumbers: number[],
  innerCount = 12
): SeatPosition[] {
  const seats = [...seatNumbers].sort((a, b) => a - b);
  const rows = [
    { seats: seats.slice(0, innerCount), radius: 30 },
    { seats: seats.slice(innerCount), radius: 45 },
  ];
  const centerX = 50;
  const centerY = 54;
  const out: SeatPosition[] = [];
  for (const row of rows) {
    const n = row.seats.length;
    row.seats.forEach((seatNumber, j) => {
      const angle = Math.PI - (Math.PI * (j + 0.5)) / n;
      const x = centerX + row.radius * Math.cos(angle);
      const y = centerY - row.radius * Math.sin(angle);
      out.push({
        seatNumber,
        leftPct: round(x),
        topPct: round((y / SEAT_PLAN_HEIGHT) * 100),
      });
    });
  }
  return out;
}

function round(value: number): number {
  return Math.round(value * 10) / 10;
}
