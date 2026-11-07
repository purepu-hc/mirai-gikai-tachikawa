"use client";

import type { Route } from "next";
import Link from "next/link";
import { useMemo, useRef, useState } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { routes } from "@/lib/routes";
import type { CityBudget } from "../../shared/types/budget";
import { BUDGET_WORDS, REVENUE_DESC } from "../../shared/utils/budget-labels";
import {
  flattenJigyo,
  searchJigyo,
  summarizeBudget,
  verifyBudget,
} from "../../shared/utils/budget-summary";
import {
  formatExactYen,
  formatOku,
  formatPercent,
} from "../../shared/utils/format-yen";
import { BudgetFlowChart } from "./budget-flow-chart";
import { BudgetKanDetail } from "./budget-kan-detail";

interface BudgetOverviewProps {
  data: CityBudget;
}

const cardClass = "rounded-2xl border border-mirai-border bg-white p-4";

/** 立川市の一般会計 当初予算を、流れ図と款・項・目・事業で見るページ */
export function BudgetOverview({ data }: BudgetOverviewProps) {
  const T = data.meta.total;
  const summary = useMemo(() => summarizeBudget(data), [data]);
  const allJigyo = useMemo(() => flattenJigyo(data), [data]);
  const errors = useMemo(() => verifyBudget(data), [data]);
  const [selected, setSelected] = useState<number>(3);
  const [query, setQuery] = useState("");
  const detailRef = useRef<HTMLDivElement>(null);
  const kan = data.saishutsu.find((k) => k.code === selected);
  const hits = useMemo(() => searchJigyo(allJigyo, query), [allJigyo, query]);
  const maxKan = Math.max(...data.saishutsu.map((k) => k.amt));
  const nKou = data.saishutsu.reduce((s, k) => s + k.kou.length, 0);
  const nMoku = data.saishutsu.reduce(
    (s, k) => s + k.kou.reduce((t, p) => t + p.moku.length, 0),
    0
  );

  const select = (code: number) => {
    setSelected(code);
    requestAnimationFrame(() =>
      detailRef.current?.scrollIntoView({ behavior: "smooth", block: "start" })
    );
  };

  const facts: [string, string, string][] = [
    [
      "予算の大きさ",
      formatOku(T),
      `前の年（${formatOku(summary.prevTotal)}）より${formatOku(T - summary.prevTotal)}多い`,
    ],
    [
      "入ってくるお金でいちばん多いのは",
      `${summary.topRevenue.name} ${formatPercent(summary.topRevenue.amt, T)}`,
      `${formatOku(summary.topRevenue.amt)}。残りは国・都からのお金などです`,
    ],
    [
      "使い道でいちばん多いのは",
      `${summary.topExpenditure.name}（福祉）${formatPercent(summary.topExpenditure.amt, T)}`,
      `${formatOku(summary.topExpenditure.amt)}。子育て・高齢者・障害・生活保護など`,
    ],
    [
      "使い道が自由なお金（一般財源）の割合",
      formatPercent(summary.ippanTotal, T),
      `${formatOku(summary.ippanTotal)}。残りは国や都などから、使い道を決めて渡されたお金などです`,
    ],
  ];
  if (summary.mostIncreased) {
    const m = summary.mostIncreased;
    facts.push([
      "前の年からいちばん増えた使い道",
      m.name,
      `${formatOku(m.prev)} → ${formatOku(m.amt)}（${formatOku(m.amt - m.prev)}増）`,
    ]);
  }
  if (summary.mostDecreased) {
    const m = summary.mostDecreased;
    facts.push([
      "前の年からいちばん減った使い道",
      m.name,
      `${formatOku(m.prev)} → ${formatOku(m.amt)}（${formatOku(m.prev - m.amt)}減）`,
    ]);
  }

  return (
    <div className="flex flex-col gap-8">
      <header className="flex flex-col gap-2">
        <p className="text-sm text-mirai-text-muted">予算の見える化</p>
        <h1 className="text-2xl font-bold md:text-3xl">
          立川市のお金は、どこから来て、どこへ行くの？
        </h1>
        <p>
          {data.meta.fiscal} {data.meta.kind}
        </p>
        <p className="text-4xl font-bold text-primary-accent tabular-nums">
          {formatExactYen(T)}
        </p>
        <p className="rounded-lg border-l-4 border-budget-highlight bg-white px-4 py-3 text-sm">
          このページは立川市の公式サイトではありません。立川市が公開している予算書の数字をそのまま図にしたもので、特定の議員・会派・政党を応援したり批判したりするものではありません。正式な内容は
          <a
            href={data.meta.source_url}
            target="_blank"
            rel="noopener noreferrer"
            className="underline underline-offset-2"
          >
            立川市の予算書（PDF）
          </a>
          で確認してください。
        </p>
        <Link
          href={routes.budgetCompare() as Route}
          className="text-sm text-primary-accent underline underline-offset-2"
        >
          多摩26市とくらべる（令和6年度決算）
        </Link>
      </header>

      <section className="flex flex-col gap-3">
        <h2 className="text-xl font-bold">まずはここだけ</h2>
        <ul className="grid grid-cols-1 gap-3 sm:grid-cols-2 md:grid-cols-3">
          {facts.map(([label, big, note]) => (
            <li key={label} className={`${cardClass} flex flex-col gap-1`}>
              <span className="text-xs text-mirai-text-muted">{label}</span>
              <b className="text-lg text-primary-accent tabular-nums">{big}</b>
              <span className="text-xs">{note}</span>
            </li>
          ))}
        </ul>
      </section>

      <section className="flex flex-col gap-3">
        <h2 className="text-xl font-bold">お金の流れ</h2>
        <p className="text-sm text-mirai-text-muted">
          左が「入ってくるお金」（予算書の23の款）、右が「使い道」（12の款）です。線の太さが金額の大きさです。右側の四角を押すと、下にその中身が出ます。左側の色は、似た種類のお金を見分けやすくするためのものです。スマホでは図を横にずらして見られます。
        </p>
        <div className={cardClass}>
          <BudgetFlowChart
            inputs={data.sainyu.map((k) => ({
              id: String(k.code),
              label: k.name,
              value: Math.max(k.amt, 1),
            }))}
            outputs={data.saishutsu.map((k) => ({
              id: String(k.code),
              label: k.name,
              value: k.amt,
            }))}
            total={T}
            selectedCode={selected}
            onSelect={select}
            inputDescriptions={Object.fromEntries(
              data.sainyu.map((k) => [
                String(k.code),
                [
                  REVENUE_DESC[k.code] ?? "",
                  k.kou.length > 1
                    ? `内訳：${k.kou.map((p) => `${p.name} ${formatOku(p.amt)}`).join("、")}`
                    : "",
                ]
                  .filter(Boolean)
                  .join("\n"),
              ])
            )}
          />
        </div>
      </section>

      <section className="flex flex-col gap-3">
        <h2 className="text-xl font-bold">入ってくるお金の内訳</h2>
        <p className="text-sm text-mirai-text-muted">
          予算書の歳入23の款と、その下の項です。押すと項が出ます。
        </p>
        <div className={cardClass}>
          {data.sainyu.map((k) => (
            <details
              key={k.code}
              className="border-b border-mirai-border/60 py-1.5 last:border-b-0"
            >
              <summary className="flex cursor-pointer justify-between gap-2 text-sm">
                <span>
                  {k.code}. {k.name}{" "}
                  <span className="text-xs text-mirai-text-muted">
                    {formatPercent(k.amt, T)}
                    {REVENUE_DESC[k.code] ? `　${REVENUE_DESC[k.code]}` : ""}
                  </span>
                </span>
                <span className="tabular-nums">{formatOku(k.amt)}</span>
              </summary>
              <ul className="pl-4 text-sm">
                {k.kou.map((p) => (
                  <li
                    key={p.code}
                    className="flex justify-between gap-2 border-b border-dashed border-mirai-border/60 py-1"
                  >
                    <span>{p.name}</span>
                    <span className="tabular-nums">{formatOku(p.amt)}</span>
                  </li>
                ))}
              </ul>
              <p className="pl-4 text-xs text-mirai-text-muted">
                前の年 {formatOku(k.prev)}　／　正確には {formatExactYen(k.amt)}
              </p>
            </details>
          ))}
        </div>
      </section>

      <section className="flex flex-col gap-3">
        <h2 className="text-xl font-bold">使い道を選ぶ</h2>
        <p className="text-sm text-mirai-text-muted">
          使い道の大きな分類（「款（かん）」といいます）です。押すと中身が開きます。
        </p>
        <div className="flex flex-col gap-1.5">
          {data.saishutsu.map((k) => (
            <Button
              key={k.code}
              variant="ghost"
              aria-pressed={selected === k.code}
              onClick={() => select(k.code)}
              className={`grid h-auto grid-cols-[7em_1fr_6em] items-center gap-2 rounded-lg border bg-white px-3 py-2 text-left font-normal ${
                selected === k.code
                  ? "border-primary-accent ring-2 ring-primary-accent"
                  : "border-mirai-border"
              }`}
            >
              <b>{k.name}</b>
              <span className="h-3 overflow-hidden rounded bg-mirai-surface-muted">
                <span
                  className="block h-full bg-primary"
                  style={{ width: `${(k.amt / maxKan) * 100}%` }}
                />
              </span>
              <span className="text-right tabular-nums">
                {formatOku(k.amt)}
              </span>
            </Button>
          ))}
        </div>
      </section>

      <section
        ref={detailRef}
        className={`${cardClass} scroll-mt-24`}
        aria-live="polite"
      >
        {kan && <BudgetKanDetail kan={kan} total={T} />}
      </section>

      <section className="flex flex-col gap-3">
        <h2 className="text-xl font-bold">事業をさがす</h2>
        <label
          htmlFor="budget-search"
          className="text-sm text-mirai-text-muted"
        >
          予算書に載っている{allJigyo.length}
          の事業から、名前や担当課でさがせます（例：給食、保育、公園、図書館）。
        </label>
        <Input
          id="budget-search"
          type="search"
          value={query}
          placeholder="キーワードを入れてください"
          onChange={(e) => setQuery(e.target.value)}
          className="bg-white"
        />
        {query.trim() && (
          <div className="flex flex-col">
            <p className="text-xs text-mirai-text-muted">
              {hits.length}件{hits.length > 60 && "（大きい順に60件まで表示）"}
            </p>
            {hits.slice(0, 60).map((j) => (
              <div
                key={`${j.kan}-${j.moku}-${j.no}`}
                className="grid grid-cols-[1fr_auto] gap-2 border-b border-dashed border-mirai-border/60 py-1.5 text-sm"
              >
                <span>
                  {j.name}{" "}
                  <span className="text-xs text-mirai-text-muted">
                    【{j.ka}】 {j.kan} ＞ {j.kou} ＞ {j.moku}
                  </span>
                </span>
                <span className="tabular-nums">{formatOku(j.amt)}</span>
              </div>
            ))}
          </div>
        )}
      </section>

      <section className="flex flex-col gap-3">
        <h2 className="text-xl font-bold">ことばの説明</h2>
        <dl
          className={`${cardClass} grid gap-x-4 gap-y-2 sm:grid-cols-[9em_1fr]`}
        >
          {BUDGET_WORDS.map(([term, desc]) => (
            <div key={term} className="contents">
              <dt className="font-bold">{term}</dt>
              <dd className="mb-2 text-sm sm:mb-0">{desc}</dd>
            </div>
          ))}
        </dl>
      </section>

      <section className="flex flex-col gap-3">
        <h2 className="text-xl font-bold">数字の確かめ方</h2>
        <div className={`${cardClass} flex flex-col gap-2 text-sm`}>
          <p>
            <span className="rounded-full bg-mirai-surface-grouped px-2.5 font-bold text-primary-accent">
              {errors.length === 0 ? "照合済み" : "要確認"}
            </span>
            　出典：{data.meta.source}
          </p>
          <p>
            予算書のPDFから数字を取り出し、次のすべてが1千円単位で一致することを確かめています（このページを表示するたびに同じ確認をしています）。
          </p>
          <ul className="list-disc pl-5">
            <li>
              歳入 款{data.sainyu.length}・項
              {data.sainyu.reduce((s, k) => s + k.kou.length, 0)} の合計 ＝{" "}
              {formatExactYen(T)}
            </li>
            <li>
              歳出 款{data.saishutsu.length}・項{nKou}・目{nMoku}・事業
              {allJigyo.length}
              ：下の階層を足すと、すべて上の階層の額と一致
            </li>
            <li>
              款ごとの財源内訳（国都支出金・地方債・その他・一般財源）と、事業ごとの特定財源・一般財源の合計が一致
            </li>
          </ul>
          {errors.length > 0 && (
            <p className="text-stance-against">
              一致しない箇所：{errors.join("、")}
            </p>
          )}
          <p className="text-mirai-text-muted">
            款・項・目・事業の名前と担当課は、予算書の表記のままです。流れ図の左側の色分けだけは、見やすくするためにこのページで付けたものです。予備費には事業の内訳がないため、予備費そのものを1つの事業として表示しています。
          </p>
        </div>
      </section>
    </div>
  );
}
