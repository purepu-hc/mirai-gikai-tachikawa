"use client";

import type { SaishutsuKan } from "../../shared/types/budget";
import { EXPENDITURE_DESC } from "../../shared/utils/budget-labels";
import {
  formatExactYen,
  formatOku,
  formatPercent,
} from "../../shared/utils/format-yen";

const ZAIGEN: {
  key: keyof SaishutsuKan["zaigen"];
  label: string;
  cls: string;
}[] = [
  { key: "kokuto", label: "国・都からのお金", cls: "bg-budget-kuni" },
  { key: "chihousai", label: "借りるお金（市債）", cls: "bg-budget-sai" },
  { key: "sonota", label: "その他の決まったお金", cls: "bg-budget-kikin" },
  { key: "ippan", label: "一般財源（使い道自由なお金）", cls: "bg-primary" },
];

interface BudgetKanDetailProps {
  kan: SaishutsuKan;
  total: number;
}

/** 選んだ歳出の款の中身（財源の内訳と、項・目・事業） */
export function BudgetKanDetail({ kan, total }: BudgetKanDetailProps) {
  const diff = kan.amt - kan.prev;
  return (
    <div className="flex flex-col gap-3">
      <h2 className="text-xl font-bold">
        {kan.name}　<span className="tabular-nums">{formatOku(kan.amt)}</span>
      </h2>
      <p className="text-sm">{EXPENDITURE_DESC[kan.name] ?? ""}</p>
      <p className="text-xs text-mirai-text-muted tabular-nums">
        全体の{formatPercent(kan.amt, total)}　／　前の年 {formatOku(kan.prev)}{" "}
        から {diff >= 0 ? `${formatOku(diff)}増` : `${formatOku(-diff)}減`}
        　／　正確には {formatExactYen(kan.amt)}
      </p>

      <h3 className="font-bold">このお金はどこから？</h3>
      <div
        className="flex h-[18px] overflow-hidden rounded border border-mirai-border"
        aria-hidden="true"
      >
        {ZAIGEN.map((z) =>
          kan.zaigen[z.key] ? (
            <span
              key={z.key}
              className={`block h-full ${z.cls}`}
              style={{ width: `${(kan.zaigen[z.key] / kan.amt) * 100}%` }}
            />
          ) : null
        )}
      </div>
      <ul className="flex flex-wrap gap-x-4 gap-y-1 text-xs">
        {ZAIGEN.map((z) =>
          kan.zaigen[z.key] ? (
            <li key={z.key} className="flex items-center gap-1">
              <span className={`inline-block h-3 w-3 rounded-sm ${z.cls}`} />
              {z.label} {formatOku(kan.zaigen[z.key])}（
              {formatPercent(kan.zaigen[z.key], kan.amt)}）
            </li>
          ) : null
        )}
      </ul>

      <h3 className="font-bold">中身（項・目・事業）</h3>
      <p className="text-xs text-mirai-text-muted">
        目を押すと事業が出ます。事業の下の細い線は、緑が一般財源、青が国・都などから使い道を決めて渡されたお金の割合です。
      </p>
      {kan.kou.map((kou) => (
        <div key={kou.code} className="flex flex-col">
          <h4 className="flex justify-between gap-2 border-b-2 border-mirai-surface-muted pb-0.5 font-bold">
            <span>{kou.name}</span>
            <span className="tabular-nums">{formatOku(kou.amt)}</span>
          </h4>
          {kou.moku.map((moku) => (
            <details
              key={moku.code}
              className="border-b border-mirai-border/60 py-1.5"
            >
              <summary className="flex cursor-pointer justify-between gap-2 text-sm">
                <span>
                  {moku.name}{" "}
                  <span className="text-xs text-mirai-text-muted">
                    （{moku.jigyo.length}事業）
                  </span>
                </span>
                <span className="tabular-nums">{formatOku(moku.amt)}</span>
              </summary>
              <ul className="flex flex-col pl-4">
                {[...moku.jigyo]
                  .sort((a, b) => b.amt - a.amt)
                  .map((j) => (
                    <li
                      key={`${moku.code}-${j.no}`}
                      className="grid grid-cols-[1fr_auto] gap-x-2 border-b border-dashed border-mirai-border/60 py-1.5 text-sm"
                    >
                      <span>
                        {j.name}{" "}
                        <span className="text-xs text-mirai-text-muted">
                          【{j.ka}】
                        </span>
                      </span>
                      <span className="tabular-nums">{formatOku(j.amt)}</span>
                      <span
                        className="col-span-2 mt-1 flex h-1.5 overflow-hidden rounded bg-mirai-surface-muted"
                        title={`一般財源 ${formatOku(j.ippan)}／特定財源 ${formatOku(j.tokutei)}`}
                      >
                        <span
                          className="block h-full bg-primary"
                          style={{
                            width: `${j.amt ? (j.ippan / j.amt) * 100 : 0}%`,
                          }}
                        />
                        <span
                          className="block h-full bg-budget-kuni"
                          style={{
                            width: `${j.amt ? (j.tokutei / j.amt) * 100 : 0}%`,
                          }}
                        />
                      </span>
                    </li>
                  ))}
              </ul>
            </details>
          ))}
        </div>
      ))}
    </div>
  );
}
