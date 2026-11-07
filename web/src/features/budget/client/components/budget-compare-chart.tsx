"use client";

import type { CompareStat } from "../../shared/utils/compare-stats";

const W = 300;
const PAD = 6;
const INDEX_CAP = 200;

/** 金額のダンベル図：灰色の点がほかの市、白丸が平均、緑が立川市 */
export function DumbbellMarks({
  stat,
  max,
}: {
  stat: CompareStat;
  max: number;
}) {
  const x = (v: number) => PAD + (max > 0 ? v / max : 0) * (W - PAD * 2);
  return (
    <svg
      viewBox={`0 0 ${W} 28`}
      preserveAspectRatio="none"
      className="h-7 w-full overflow-visible"
      aria-hidden="true"
    >
      <line
        x1={PAD}
        x2={W - PAD}
        y1={14}
        y2={14}
        className="stroke-mirai-border"
      />
      {stat.values.map((v, i) => (
        <circle
          // biome-ignore lint/suspicious/noArrayIndexKey: 市の並び順は固定
          key={i}
          cx={x(v)}
          cy={14}
          r={2.6}
          className="fill-budget-dot opacity-70"
        />
      ))}
      <line
        x1={x(stat.average)}
        x2={x(stat.target)}
        y1={14}
        y2={14}
        className="stroke-mirai-text opacity-50"
        strokeWidth={2}
      />
      <circle
        cx={x(stat.average)}
        cy={14}
        r={5}
        className="fill-white stroke-mirai-text"
        strokeWidth={1.5}
      />
      <circle
        cx={x(stat.target)}
        cy={14}
        r={6}
        className="fill-primary-accent stroke-white"
        strokeWidth={1.5}
      />
    </svg>
  );
}

/** 指数の棒：縦線が平均（100）、灰色の点がほかの市。200を超えたら右端に▶ */
export function IndexMarks({ stat }: { stat: CompareStat }) {
  const x = (v: number) =>
    PAD + (Math.min(v, INDEX_CAP) / INDEX_CAP) * (W - PAD * 2);
  const idx = stat.index;
  return (
    <svg
      viewBox={`0 0 ${W} 28`}
      preserveAspectRatio="none"
      className="h-7 w-full overflow-visible"
      aria-hidden="true"
    >
      <line
        x1={x(100)}
        x2={x(100)}
        y1={2}
        y2={26}
        className="stroke-mirai-text-muted"
        strokeWidth={1.2}
      />
      {stat.average > 0 &&
        stat.values.map((v, i) => (
          <circle
            // biome-ignore lint/suspicious/noArrayIndexKey: 市の並び順は固定
            key={i}
            cx={x((v / stat.average) * 100)}
            cy={14}
            r={2.6}
            className="fill-budget-dot opacity-70"
          />
        ))}
      {idx === 0 && (
        <text
          x={x(100) - 6}
          y={18}
          textAnchor="end"
          className="fill-mirai-text-muted text-[11px]"
        >
          立川市は0円
        </text>
      )}
      {idx !== null && idx > 0 && (
        <>
          <line
            x1={x(100)}
            x2={x(idx)}
            y1={14}
            y2={14}
            className="stroke-primary-accent"
            strokeWidth={7}
            strokeLinecap="round"
          />
          {idx > INDEX_CAP && (
            <path
              d={`M${W - 10},6 L${W - 2},14 L${W - 10},22 Z`}
              className="fill-primary-accent"
            />
          )}
        </>
      )}
    </svg>
  );
}
