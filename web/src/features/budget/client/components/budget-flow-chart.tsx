"use client";

import { revenueFillClass } from "../../shared/utils/budget-labels";
import {
  computeFlowLayout,
  type FlowInput,
  linkPath,
} from "../../shared/utils/flow-layout";
import { formatOku, formatPercent } from "../../shared/utils/format-yen";

const WIDTH = 860;
const HEIGHT = 1060;
const NODE_WIDTH = 14;
const LEFT_X = 300;
const RIGHT_X = WIDTH - 175;

interface BudgetFlowChartProps {
  /** 歳入の款（id は款の番号） */
  inputs: FlowInput[];
  /** 歳出の款（id は款の番号） */
  outputs: FlowInput[];
  total: number;
  selectedCode: number | null;
  onSelect: (code: number) => void;
  inputDescriptions: Record<string, string>;
}

/**
 * 歳入の款 → 一般会計 → 歳出の款 の流れ図。線の太さが金額に比例する。
 * 右側（使い道）の四角かラベルを押すと onSelect が呼ばれる。
 */
export function BudgetFlowChart({
  inputs,
  outputs,
  total,
  selectedCode,
  onSelect,
  inputDescriptions,
}: BudgetFlowChartProps) {
  const layout = computeFlowLayout(inputs, outputs, "一般会計", {
    width: WIDTH,
    height: HEIGHT,
    nodeWidth: NODE_WIDTH,
    padding: 13,
    leftX: LEFT_X,
    rightX: RIGHT_X,
  });
  const cx = layout.center.x;

  return (
    <div className="overflow-x-auto">
      <svg
        viewBox={`0 0 ${WIDTH} ${HEIGHT}`}
        className="min-w-[820px] w-full h-auto"
        role="img"
        aria-label="立川市一般会計の、入ってくるお金から使い道への流れ図"
      >
        {layout.links.map((link) => {
          const fromLeft = link.targetId === "center";
          const fill = fromLeft
            ? revenueFillClass(Number(link.sourceId))
            : "fill-primary";
          const strokeClass = fill.replace("fill-", "stroke-");
          const d = fromLeft
            ? linkPath(LEFT_X + NODE_WIDTH, link.ySource, cx, link.yTarget)
            : linkPath(cx + NODE_WIDTH, link.ySource, RIGHT_X, link.yTarget);
          return (
            <path
              key={`${link.sourceId}-${link.targetId}`}
              d={d}
              className={`${strokeClass} fill-none opacity-30`}
              strokeWidth={Math.max(1, link.width)}
            />
          );
        })}
        <rect
          x={cx}
          y={layout.center.y0}
          width={NODE_WIDTH}
          height={layout.center.y1 - layout.center.y0}
          className="fill-primary-accent"
          rx={2}
        />
        {layout.left.map((node) => (
          <g key={`in-${node.id}`}>
            <rect
              x={node.x}
              y={node.y0}
              width={NODE_WIDTH}
              height={node.y1 - node.y0}
              className={revenueFillClass(Number(node.id))}
              rx={2}
            >
              <title>
                {`${node.label}：${formatOku(node.value)}（${formatPercent(node.value, total)}）${
                  inputDescriptions[node.id]
                    ? `\n${inputDescriptions[node.id]}`
                    : ""
                }`}
              </title>
            </rect>
            <text
              x={node.x - 6}
              y={(node.y0 + node.y1) / 2}
              dy="0.35em"
              textAnchor="end"
              className="fill-mirai-text text-[12px]"
            >
              {`${node.label}　${formatOku(node.value)}`}
            </text>
          </g>
        ))}
        {layout.right.map((node) => {
          const code = Number(node.id);
          const selected = selectedCode === code;
          return (
            <g
              key={`out-${node.id}`}
              role="button"
              tabIndex={0}
              aria-label={`${node.label}の中身を見る`}
              aria-pressed={selected}
              className="cursor-pointer focus:outline-none"
              onClick={() => onSelect(code)}
              onKeyDown={(e) => {
                if (e.key === "Enter" || e.key === " ") {
                  e.preventDefault();
                  onSelect(code);
                }
              }}
            >
              <rect
                x={node.x}
                y={node.y0}
                width={NODE_WIDTH}
                height={Math.max(1.5, node.y1 - node.y0)}
                className={`fill-primary ${selected ? "stroke-budget-highlight" : ""}`}
                strokeWidth={selected ? 3 : 0}
                rx={2}
              >
                <title>
                  {`${node.label}：${formatOku(node.value)}（${formatPercent(node.value, total)}）`}
                </title>
              </rect>
              <text
                x={node.x + NODE_WIDTH + 6}
                y={(node.y0 + node.y1) / 2}
                dy="0.35em"
                className={`fill-mirai-text text-[12px] ${selected ? "font-bold" : ""}`}
              >
                {`${node.label}　${formatOku(node.value)}`}
              </text>
            </g>
          );
        })}
      </svg>
    </div>
  );
}
