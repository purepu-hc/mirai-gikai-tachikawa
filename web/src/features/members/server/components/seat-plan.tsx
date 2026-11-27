import type { Route } from "next";
import Link from "next/link";
import { routes } from "@/lib/routes";
import type { Member } from "../../shared/types/member";
import {
  displayName,
  findFactionOn,
  findTermOn,
} from "../../shared/utils/member-status";
import {
  buildSeatLayout,
  SEAT_PLAN_HEIGHT,
} from "../../shared/utils/seat-layout";

interface SeatPlanProps {
  members: Member[];
  today: string;
}

/**
 * 議席番号の配置図（トップの絵）。席をタップすると、その議員のページへ。
 * 「議員の発信リンク集」（2026-11-26 作成）の議席図を、このサイト用に移したもの。
 */
export function SeatPlan({ members, today }: SeatPlanProps) {
  const bySeat = new Map<number, Member>();
  for (const m of members) {
    const seat = findTermOn(m.terms, today)?.seatNumber;
    if (seat) bySeat.set(seat, m);
  }
  const layout = buildSeatLayout([...bySeat.keys()]);

  return (
    <figure className="flex flex-col gap-2">
      <div
        className="relative w-full rounded-2xl border border-mirai-border bg-white"
        style={{ aspectRatio: `100 / ${SEAT_PLAN_HEIGHT}` }}
      >
        <span className="absolute bottom-[3%] left-1/2 -translate-x-1/2 rounded bg-muted px-3 py-0.5 text-[10px] text-mirai-text-muted sm:text-xs">
          議長席・演壇
        </span>
        {layout.map((s) => {
          const m = bySeat.get(s.seatNumber);
          if (!m) return null;
          const faction = findFactionOn(m.factions, today)?.factionName;
          return (
            <Link
              key={s.seatNumber}
              href={routes.memberDetail(m.slug) as Route}
              aria-label={`議席${s.seatNumber} ${displayName(m.name)}${faction ? `（${faction}）` : ""}`}
              title={displayName(m.name)}
              className="absolute flex size-6 -translate-x-1/2 -translate-y-1/2 items-center justify-center rounded-full border-2 border-primary-accent bg-white text-[10px] font-bold hover:bg-primary focus-visible:outline-2 focus-visible:outline-primary-accent sm:size-10 sm:text-sm"
              style={{ left: `${s.leftPct}%`, top: `${s.topPct}%` }}
            >
              {s.seatNumber}
            </Link>
          );
        })}
      </div>
      <figcaption className="text-xs text-mirai-text-muted">
        議席番号の順に並べた図です（実際の議場の配置とは異なります）。番号をタップすると、その議員のページを開きます。
      </figcaption>
    </figure>
  );
}
