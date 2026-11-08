"use client";

import { useRef } from "react";
import {
  revenueFillClass,
  revenueStrokeClass,
} from "../../shared/utils/budget-labels";
import {
  computeFlowLayout,
  type FlowInput,
  flowChartWidth,
  linkPath,
  spreadLabels,
} from "../../shared/utils/flow-layout";
import { formatOku, formatPercent } from "../../shared/utils/format-yen";
import { useElementWidth } from "../hooks/use-element-width";

/** これより狭いとラベルが重なるので、狭い画面では横スクロールにする */
const MIN_WIDTH = 820;
/** 金額を描く高さ（いちばん長い列がこの高さになる） */
const HEIGHT = 900;
/** 上の端のラベルが切れないための余白 */
const MARGIN_Y = 12;
/** ラベル同士が重ならない最小の間隔（文字の高さ＋α） */
const LABEL_GAP = 15;
const NODE_WIDTH = 14;
const LEFT_X = 300;
const RIGHT_LABEL_SPACE = 175;

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
  const wrapperRef = useRef<HTMLDivElement>(null);
  // 置き場所の幅に合わせて図を広げる（文字は拡大せず、線の間を広くする）
  const WIDTH = flowChartWidth(
    useElementWidth(wrapperRef, MIN_WIDTH),
    MIN_WIDTH
  );
  const RIGHT_X = WIDTH - RIGHT_LABEL_SPACE;
  const layout = computeFlowLayout(inputs, outputs, "一般会計", {
    width: WIDTH,
    height: HEIGHT,
    nodeWidth: NODE_WIDTH,
    // すき間を小さくして、列の長さがほぼ金額どおりになるようにする
    padding: 3,
    leftX: LEFT_X,
    rightX: RIGHT_X,
  });
  const cx = layout.center.x;
  const mid = (n: { y0: number; y1: number }) => (n.y0 + n.y1) / 2;
  const leftLabelY = spreadLabels(layout.left.map(mid), LABEL_GAP);
  const rightLabelY = spreadLabels(layout.right.map(mid), LABEL_GAP);
  const svgHeight =
    Math.max(
      HEIGHT,
      leftLabelY[leftLabelY.length - 1] ?? 0,
      rightLabelY[rightLabelY.length - 1] ?? 0
    ) +
    MARGIN_Y * 2;

  return (
    <div ref={wrapperRef} className="overflow-x-auto">
      <svg
        width={WIDTH}
        height={svgHeight}
        viewBox={`0 0 ${WIDTH} ${svgHeight}`}
        className="block"
        role="img"
        aria-label="立川市一般会計の、入ってくるお金から使い道への流れ図"
      >
        <g transform={`translate(0 ${MARGIN_Y})`}>
          {layout.links.map((link) => {
            const fromLeft = link.targetId === "center";
            const strokeClass = fromLeft
              ? revenueStrokeClass(Number(link.sourceId))
              : "stroke-primary";
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
          {layout.left.map((node, i) => (
            <g key={`in-${node.id}`}>
              {leftLabelY[i] - mid(node) > 1 && (
                <polyline
                  points={`${node.x - 2},${mid(node)} ${node.x - 5},${leftLabelY[i]}`}
                  className="stroke-mirai-border fill-none"
                  strokeWidth={1}
                />
              )}
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
                y={leftLabelY[i]}
                dy="0.35em"
                textAnchor="end"
                className="fill-mirai-text text-[12px]"
              >
                {`${node.label}　${formatOku(node.value)}`}
              </text>
            </g>
          ))}
          {layout.right.map((node, i) => {
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
                {rightLabelY[i] - mid(node) > 1 && (
                  <polyline
                    points={`${node.x + NODE_WIDTH + 2},${mid(node)} ${node.x + NODE_WIDTH + 5},${rightLabelY[i]}`}
                    className="stroke-mirai-border fill-none"
                    strokeWidth={1}
                  />
                )}
                <text
                  x={node.x + NODE_WIDTH + 6}
                  y={rightLabelY[i]}
                  dy="0.35em"
                  className={`fill-mirai-text text-[12px] ${selected ? "font-bold" : ""}`}
                >
                  {`${node.label}　${formatOku(node.value)}`}
                </text>
              </g>
            );
          })}
        </g>
      </svg>
    </div>
  );
}
