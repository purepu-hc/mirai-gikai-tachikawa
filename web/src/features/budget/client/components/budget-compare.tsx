"use client";

import type { Route } from "next";
import Link from "next/link";
import { useMemo, useState } from "react";
import { Button } from "@/components/ui/button";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { routes } from "@/lib/routes";
import type { ComparisonData } from "../../shared/types/budget";
import { COMPARE_DESC } from "../../shared/utils/budget-labels";
import {
  type CompareStat,
  compareStat,
  diffFromAverage,
  mean,
  perCapita,
  visibleSubs,
} from "../../shared/utils/compare-stats";
import { formatPerCapita } from "../../shared/utils/format-yen";
import { DumbbellMarks, IndexMarks } from "./budget-compare-chart";

type Mode = "amount" | "index";

const TARGET_NAME = "立川市";
/** 金額で見るとき、平均がこれ以上（円）の款を「大きい使い道」にする */
const BIG_THRESHOLD = 30000;

const SUB_NOTES: Record<string, string> = {
  教育費:
    "立川市の「幼稚園費」は0円です。統計の決まりで、市立の幼稚園がない市の幼稚園関係のお金は、ほかの使い道に入るためと考えられます。立川市の予算書には「幼稚園費」があります。",
  災害復旧費:
    "立川市の災害復旧費は、火災で焼けた第七中学校体育館の建て直し（第七中学校体育館復旧事業）です。新しい体育館は令和7年3月から使われています（立川市「令和6年度決算説明資料」）。",
};

const cardClass = "rounded-2xl border border-mirai-border bg-white p-4";

interface BudgetCompareProps {
  data: ComparisonData;
}

/** 立川市の1人あたり歳出（令和6年度決算）を多摩26市とくらべるページ */
export function BudgetCompare({ data }: BudgetCompareProps) {
  const cities = data.cities;
  const target = cities.find((c) => c.name === TARGET_NAME);
  const [mode, setMode] = useState<Mode>("amount");
  const [open, setOpen] = useState<Set<string>>(new Set());
  const [sortKey, setSortKey] = useState("total");
  const kans = data.kan_order;

  const statOf = useMemo(() => {
    const cache = new Map<string, CompareStat>();
    return (kan: string, sub?: string): CompareStat => {
      const key = `${kan}/${sub ?? ""}`;
      const hit = cache.get(key);
      if (hit) return hit;
      if (!target) throw new Error("立川市のデータがありません");
      const s = compareStat(cities, target, kan, sub);
      cache.set(key, s);
      return s;
    };
  }, [cities, target]);

  if (!target) return <p>立川市のデータが見つかりませんでした。</p>;

  const toggle = (kan: string) =>
    setOpen((prev) => {
      const next = new Set(prev);
      if (next.has(kan)) next.delete(kan);
      else next.add(kan);
      return next;
    });

  const valueCell = (s: CompareStat) =>
    mode === "amount" ? (
      <>
        {formatPerCapita(s.target)}
        <br />
        <span className="text-xs text-mirai-text-muted">
          平均 {formatPerCapita(s.average)}
        </span>
      </>
    ) : s.index === null ? (
      "—"
    ) : (
      <>
        {Math.round(s.index).toLocaleString("ja-JP")}
        <br />
        <span className="text-xs text-mirai-text-muted">
          {formatPerCapita(s.target)}
        </span>
      </>
    );

  const row = (
    kan: string,
    sub: string | undefined,
    max: number,
    clickable: boolean
  ) => {
    const s = statOf(kan, sub);
    const label = (
      <span className="text-sm">
        {clickable && "▸ "}
        {sub ?? (kan === "total" ? "歳出の合計" : kan)}
        {!sub && kan !== "total" && (
          <small className="block text-xs text-mirai-text-muted">
            {COMPARE_DESC[kan]}
          </small>
        )}
        {!sub && (
          <small className="block text-xs text-mirai-text-muted">
            多い順 {s.rank}/{cities.length}
          </small>
        )}
      </span>
    );
    const chart =
      mode === "amount" ? (
        <DumbbellMarks stat={s} max={max} />
      ) : (
        <IndexMarks stat={s} />
      );
    const inner = (
      <>
        {label}
        {chart}
        <span className="text-right text-sm tabular-nums">{valueCell(s)}</span>
      </>
    );
    const grid =
      "grid w-full grid-cols-[6.6em_1fr_5.4em] items-center gap-2 py-1 md:grid-cols-[9em_1fr_6.5em]";
    return clickable ? (
      <Button
        key={`${kan}/${sub ?? ""}`}
        variant="ghost"
        aria-expanded={open.has(kan)}
        onClick={() => toggle(kan)}
        className={`${grid} h-auto whitespace-normal rounded-lg px-1 text-left font-normal`}
      >
        {inner}
      </Button>
    ) : (
      <div key={`${kan}/${sub ?? ""}`} className={grid}>
        {inner}
      </div>
    );
  };

  const subPanel = (kan: string) => {
    const subs = visibleSubs(cities, target, kan);
    const max = Math.max(...subs.flatMap((sb) => statOf(kan, sb).values)) || 1;
    return (
      <div
        key={`${kan}-sub`}
        className="mb-2 rounded-lg border border-mirai-border bg-mirai-surface-grouped px-2 py-1"
      >
        {subs.map((sb) => row(kan, sb, max, false))}
        <p className="pb-1 text-xs text-mirai-text-muted">
          {mode === "amount"
            ? "内訳は目盛りを付け直しています（上の段とは物差しが違います）。"
            : "内訳も26市平均を100とした指数です。指数が大きくても金額が小さいことがあるので、右の金額も見てください。"}
          1人あたり100円未満の細かい項目は省いています。
          {SUB_NOTES[kan] ? ` ${SUB_NOTES[kan]}` : ""}
        </p>
      </div>
    );
  };

  const group = (title: string, keys: string[]) => {
    const max = Math.max(...keys.flatMap((k) => statOf(k).values));
    return (
      <div className="flex flex-col">
        <h3 className="mt-2 font-bold">{title}</h3>
        {keys.map((k) => {
          const hasSub = Object.keys(target.kan[k]?.sub ?? {}).length > 0;
          return (
            <div key={k}>
              {row(k, undefined, max, hasSub)}
              {hasSub && open.has(k) && subPanel(k)}
            </div>
          );
        })}
      </div>
    );
  };

  const big = kans.filter((k) => statOf(k).average >= BIG_THRESHOLD);
  const small = kans.filter((k) => statOf(k).average < BIG_THRESHOLD);
  const total = statOf("total");
  const welfare = statOf("民生費");
  const disaster = statOf("災害復旧費");
  const labor = statOf("労働費");
  const popRank =
    [...cities].sort((a, b) => b.pop - a.pop).findIndex((c) => c === target) +
    1;
  const totalDiff = diffFromAverage(total);

  const notes = [
    `災害復旧費は、立川市が${formatPerCapita(disaster.target)}（総額 ${(target.kan.災害復旧費.amt / 100000).toFixed(1)}億円）で、26市の中でいちばん多くなっています。中身は、火災で焼けた第七中学校体育館の建て直し（第七中学校体育館復旧事業）です。新しい体育館は令和7年3月から使われていて、防災倉庫・太陽光発電・蓄電池も備えた災害時の拠点になっています（立川市「令和6年度決算説明資料」）。その年だけの支出です。`,
    `労働費は、この統計では立川市が${formatPerCapita(labor.target)}（総額 ${(target.kan.労働費.amt / 100000).toFixed(1)}億円）ですが、立川市の一般会計の決算では労働費は1.5億円です（同資料）。総務省の統計は全国共通のルールで使い道を分け直しているため、市の決算書の分類とずれます。差の中身は、公開されている資料からは確認できませんでした。`,
    "競輪事業は特別会計なので、この普通会計の数字には入っていません（競輪からの収益の一部は一般会計に繰り入れられています）。",
    "立川市は駅周辺に商業や業務が集まる街で、昼間に市外から来る人が多い市です。1人あたりの金額は住民の数で割っているため、住民以外の人も使うサービスがある分、多めに出ることがあります。",
    "ごみ処理や消防などは、市が自分で行うか、ほかの団体（一部事務組合や東京消防庁）に任せるかで、どの使い道に計上されるかが市ごとに違います。",
  ];

  const ctxRows: [
    string,
    (c: (typeof cities)[number]) => number,
    (v: number) => string,
  ][] = [
    ["人口（人）", (c) => c.pop, (v) => Math.round(v).toLocaleString("ja-JP")],
    ["面積（km²）", (c) => c.area, (v) => v.toFixed(2)],
    ["財政力指数", (c) => c.zaiseiryoku, (v) => v.toFixed(2)],
    ["経常収支比率（％）", (c) => c.keijo, (v) => v.toFixed(1)],
  ];

  const sortValue = (c: (typeof cities)[number]) =>
    sortKey === "pop" ? c.pop : perCapita(c, sortKey);
  const tableCols = Array.from(
    new Set([
      "total",
      "民生費",
      "教育費",
      "土木費",
      "総務費",
      "衛生費",
      ...(sortKey !== "pop" ? [sortKey] : []),
    ])
  );
  const sorted = [...cities].sort((a, b) => sortValue(b) - sortValue(a));

  return (
    <div className="flex flex-col gap-8">
      <header className="flex flex-col gap-2">
        <p className="text-sm text-mirai-text-muted">予算の見える化</p>
        <h1 className="text-2xl font-bold md:text-3xl">
          立川市のお金の使い方を、多摩26市とくらべる
        </h1>
        <p>令和6年度（2024年度）の決算　市民1人あたりの金額</p>
        <p className="rounded-lg border-l-4 border-budget-highlight bg-white px-4 py-3 text-sm">
          このページは立川市の公式サイトではありません。総務省が公表している決算統計の数字を、そのまま並べたものです。平均より多い・少ないことは、それだけで良い・悪いを表すものではなく、特定の議員・会派・政党を応援したり批判したりするものでもありません。
        </p>
        <Link
          href={routes.budget() as Route}
          className="text-sm text-primary-accent underline underline-offset-2"
        >
          立川市の令和8年度予算の流れを見る
        </Link>
      </header>

      <section className="flex flex-col gap-3">
        <h2 className="text-xl font-bold">このページの前提</h2>
        <ul
          className={`${cardClass} flex list-disc flex-col gap-1 pl-8 text-sm`}
        >
          <li>
            <b>決算（実際に使った額）</b>
            でくらべています。全市そろって公表されている最新の令和6年度の数字です。
          </li>
          <li>
            <b>人口1人あたり</b>に直しています（{data.meta.pop_basis}
            ）。人口が違う市どうしでもくらべられます。
          </li>
          <li>
            総務省が全国の市を<b>同じルール（普通会計）</b>
            で集計した数字です。市の予算書の「一般会計」とは範囲や分類が少しずれるため、立川市の予算書の数字とは一致しません。
          </li>
          <li>「平均」は26市の1人あたり金額の単純平均です。</li>
        </ul>
      </section>

      <section className="flex flex-col gap-3">
        <h2 className="text-xl font-bold">まとめ</h2>
        <ul className="grid grid-cols-1 gap-3 sm:grid-cols-3">
          <li className={`${cardClass} flex flex-col gap-1`}>
            <span className="text-xs text-mirai-text-muted">
              立川市の1人あたり歳出（全体）
            </span>
            <b className="text-lg text-primary-accent tabular-nums">
              {formatPerCapita(total.target)}
            </b>
            <span className="text-xs">
              26市の平均は{formatPerCapita(total.average)}
              {totalDiff.direction !== "same" &&
                `（${formatPerCapita(totalDiff.amount)}${totalDiff.direction === "more" ? "多い" : "少ない"}）`}
              。多い順で{total.rank}番目
            </span>
          </li>
          <li className={`${cardClass} flex flex-col gap-1`}>
            <span className="text-xs text-mirai-text-muted">人口</span>
            <b className="text-lg text-primary-accent tabular-nums">
              {target.pop.toLocaleString("ja-JP")}人
            </b>
            <span className="text-xs">26市の中で{popRank}番目に多い</span>
          </li>
          <li className={`${cardClass} flex flex-col gap-1`}>
            <span className="text-xs text-mirai-text-muted">
              いちばん大きい使い道
            </span>
            <b className="text-lg text-primary-accent tabular-nums">
              民生費 {formatPerCapita(welfare.target)}
            </b>
            <span className="text-xs">
              平均は{formatPerCapita(welfare.average)}。多い順で{welfare.rank}
              番目
            </span>
          </li>
        </ul>
      </section>

      <section className="flex flex-col gap-3">
        <h2 className="text-xl font-bold">使い道ごとにくらべる</h2>
        <div
          className="flex flex-wrap items-center gap-2"
          role="group"
          aria-label="見方の切り替え"
        >
          <span className="text-sm">見方</span>
          <Button
            size="sm"
            variant={mode === "amount" ? "secondary" : "outline"}
            aria-pressed={mode === "amount"}
            onClick={() => setMode("amount")}
          >
            金額で見る
          </Button>
          <Button
            size="sm"
            variant={mode === "index" ? "secondary" : "outline"}
            aria-pressed={mode === "index"}
            onClick={() => setMode("index")}
          >
            指数で見る（平均＝100）
          </Button>
        </div>
        <ul className="flex flex-wrap gap-x-4 gap-y-1 text-xs text-mirai-text-muted">
          <li className="flex items-center gap-1">
            <span className="inline-block h-3 w-3 rounded-full bg-primary-accent" />
            立川市
          </li>
          {mode === "amount" && (
            <li className="flex items-center gap-1">
              <span className="inline-block h-3 w-3 rounded-full border border-mirai-text bg-white" />
              26市の平均
            </li>
          )}
          <li className="flex items-center gap-1">
            <span className="inline-block h-3 w-3 rounded-full bg-budget-dot" />
            ほかの市（1つの点が1つの市）
          </li>
          {mode === "index" && <li>縦線＝平均（100）</li>}
        </ul>
        <p className="text-xs text-mirai-text-muted">
          {mode === "amount"
            ? "1人あたりの金額です。大きい使い道と小さい使い道は、物差しを分けています。▸の付いた行は押すと内訳が開きます。"
            : "26市の平均を100とした数字です。200を超えるものは右端の▶で示し、数字は右に書いています。指数は金額の大きさを表さないので、右の金額も合わせて見てください。"}
        </p>
        <div className={cardClass}>
          <div className="flex flex-col">
            <h3 className="font-bold">全体</h3>
            {row("total", undefined, Math.max(...total.values), false)}
          </div>
          {mode === "amount" ? (
            <>
              {group("大きい使い道（1人あたり3万円以上）", big)}
              {group("小さい使い道（1人あたり3万円未満）", small)}
            </>
          ) : (
            group("すべての使い道", kans)
          )}
        </div>
      </section>

      <section className="flex flex-col gap-3">
        <h2 className="text-xl font-bold">市の大きさや財政の体力</h2>
        <p className="text-xs text-mirai-text-muted">
          財政力指数は1に近いほど・1を超えるほど、自分の税収で必要なお金をまかなえていることを表します。経常収支比率は、毎年必ずかかるお金に、毎年入るお金の何％が使われているかです。
        </p>
        <div className={`${cardClass} overflow-x-auto`}>
          <table className="w-full text-sm tabular-nums">
            <thead>
              <tr className="border-b border-mirai-border">
                <th className="py-1.5 text-left">項目</th>
                <th className="text-right">立川市</th>
                <th className="text-right">26市の平均</th>
                <th className="text-right">26市の範囲</th>
              </tr>
            </thead>
            <tbody>
              {ctxRows.map(([label, f, fmt]) => {
                const v = cities.map(f);
                return (
                  <tr key={label} className="border-b border-mirai-border/60">
                    <td className="py-1.5">{label}</td>
                    <td className="text-right">{fmt(f(target))}</td>
                    <td className="text-right">{fmt(mean(v))}</td>
                    <td className="text-right whitespace-nowrap">
                      {fmt(Math.min(...v))}〜{fmt(Math.max(...v))}
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </section>

      <section className="flex flex-col gap-3">
        <h2 className="text-xl font-bold">立川市について知っておきたいこと</h2>
        <ul
          className={`${cardClass} flex list-disc flex-col gap-2 pl-8 text-sm`}
        >
          {notes.map((n) => (
            <li key={n}>{n}</li>
          ))}
        </ul>
      </section>

      <section className="flex flex-col gap-3">
        <h2 className="text-xl font-bold">26市の一覧</h2>
        <div className="flex items-center gap-2">
          <span className="text-sm">並べかえる項目</span>
          <Select value={sortKey} onValueChange={setSortKey}>
            <SelectTrigger className="bg-white" aria-label="並べかえる項目">
              <SelectValue />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="total">歳出の合計</SelectItem>
              {kans.map((k) => (
                <SelectItem key={k} value={k}>
                  {k}
                </SelectItem>
              ))}
              <SelectItem value="pop">人口</SelectItem>
            </SelectContent>
          </Select>
        </div>
        <div className={`${cardClass} overflow-x-auto`}>
          <table className="w-full text-sm tabular-nums">
            <thead>
              <tr className="border-b border-mirai-border">
                <th className="py-1.5 text-left whitespace-nowrap">
                  市（1人あたり）
                </th>
                <th className="text-right">人口</th>
                {tableCols.map((k) => (
                  <th key={k} className="px-1 text-right whitespace-nowrap">
                    {k === "total" ? "合計" : k}
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {sorted.map((c) => (
                <tr
                  key={c.code}
                  className={`border-b border-mirai-border/60 ${c === target ? "font-bold text-primary-accent" : ""}`}
                >
                  <td className="py-1.5 whitespace-nowrap">{c.name}</td>
                  <td className="text-right">
                    {c.pop.toLocaleString("ja-JP")}
                  </td>
                  {tableCols.map((k) => (
                    <td key={k} className="px-1 text-right whitespace-nowrap">
                      {formatPerCapita(perCapita(c, k))}
                    </td>
                  ))}
                </tr>
              ))}
              <tr>
                <td className="py-1.5">26市の平均</td>
                <td className="text-right">
                  {Math.round(mean(cities.map((c) => c.pop))).toLocaleString(
                    "ja-JP"
                  )}
                </td>
                {tableCols.map((k) => (
                  <td key={k} className="px-1 text-right whitespace-nowrap">
                    {formatPerCapita(mean(cities.map((c) => perCapita(c, k))))}
                  </td>
                ))}
              </tr>
            </tbody>
          </table>
        </div>
      </section>

      <section className="flex flex-col gap-3">
        <h2 className="text-xl font-bold">出典と確かめ方</h2>
        <div className={`${cardClass} flex flex-col gap-1 text-sm`}>
          <p>
            出典：{data.meta.source}（
            <a
              href={data.meta.page}
              target="_blank"
              rel="noopener noreferrer"
              className="underline underline-offset-2"
            >
              総務省のページ
            </a>
            ）
          </p>
          <p>人口：{data.meta.pop_basis}（同じ資料の「概況」）</p>
          <p>
            確かめたこと：26市すべてで、使い道の内訳を足すと使い道の額に、使い道を足すと総務省の「歳出総額」に、1千円単位で一致することを確かめています。
          </p>
        </div>
      </section>
    </div>
  );
}
