/**
 * 「入ってくるお金 → 全体 → 使い道」の3列の流れ図の配置を計算する純粋関数。
 * 線の太さは金額に比例し、左右の列はそれぞれ上から順に積み上げる。
 */

export interface FlowInput {
  id: string;
  label: string;
  value: number;
}

export interface FlowNode extends FlowInput {
  x: number;
  y0: number;
  y1: number;
}

export interface FlowLink {
  sourceId: string;
  targetId: string;
  value: number;
  /** 線の太さ */
  width: number;
  /** 左端・右端での線の中心の y 座標 */
  ySource: number;
  yTarget: number;
}

export interface FlowLayout {
  left: FlowNode[];
  center: FlowNode;
  right: FlowNode[];
  links: FlowLink[];
}

interface LayoutOptions {
  width: number;
  height: number;
  nodeWidth: number;
  padding: number;
  /** 左右の列の x 位置（ラベル領域を空けるため） */
  leftX: number;
  rightX: number;
  /** 線が見えなくならないための最小の太さ */
  minNodeHeight?: number;
}

function stack(
  items: FlowInput[],
  x: number,
  top: number,
  scale: number,
  padding: number,
  minH: number
): FlowNode[] {
  let y = top;
  return items.map((item) => {
    const h = Math.max(item.value * scale, minH);
    const node = { ...item, x, y0: y, y1: y + h };
    y += h + padding;
    return node;
  });
}

export function computeFlowLayout(
  inputs: FlowInput[],
  outputs: FlowInput[],
  centerLabel: string,
  options: LayoutOptions
): FlowLayout {
  const minH = options.minNodeHeight ?? 1.5;
  const total = inputs.reduce((s, i) => s + i.value, 0);
  const totalOut = outputs.reduce((s, o) => s + o.value, 0);
  if (total <= 0 || totalOut <= 0) {
    throw new Error("流れ図の合計が0以下です");
  }
  // 項目数の多い側の余白を引いた高さに、合計がちょうど収まる縮尺
  const maxCount = Math.max(inputs.length, outputs.length);
  const usable =
    options.height - options.padding * (maxCount - 1) - minH * maxCount;
  const scale = usable / Math.max(total, totalOut);

  const left = stack(inputs, options.leftX, 0, scale, options.padding, minH);
  const right = stack(outputs, options.rightX, 0, scale, options.padding, minH);
  const centerH = total * scale;
  const centerTop = (options.height - centerH) / 2;
  const centerX = (options.leftX + options.rightX) / 2;
  const center: FlowNode = {
    id: "center",
    label: centerLabel,
    value: total,
    x: centerX,
    y0: centerTop,
    y1: centerTop + centerH,
  };

  const links: FlowLink[] = [];
  let inCursor = centerTop;
  for (const node of left) {
    const width = node.value * scale;
    links.push({
      sourceId: node.id,
      targetId: center.id,
      value: node.value,
      width,
      ySource: node.y0 + width / 2,
      yTarget: inCursor + width / 2,
    });
    inCursor += width;
  }
  let outCursor = centerTop;
  for (const node of right) {
    const width = node.value * scale;
    links.push({
      sourceId: center.id,
      targetId: node.id,
      value: node.value,
      width,
      ySource: outCursor + width / 2,
      yTarget: node.y0 + width / 2,
    });
    outCursor += width;
  }
  return { left, center, right, links };
}

/** 2点を水平方向のなめらかな曲線で結ぶ SVG パス */
export function linkPath(x0: number, y0: number, x1: number, y1: number) {
  const mx = (x0 + x1) / 2;
  return `M${x0},${y0} C${mx},${y0} ${mx},${y1} ${x1},${y1}`;
}
