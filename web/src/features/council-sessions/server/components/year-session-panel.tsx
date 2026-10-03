import "server-only";
import { ChevronRight, ExternalLink } from "lucide-react";
import type { Route } from "next";
import Link from "next/link";
import { siteConfig } from "@/config/site.config";
import { routes } from "@/lib/routes";
import { getJapanDateString } from "@/lib/utils/date";
import {
  buildYearSessionCards,
  panelYear,
  toReiwaYear,
  type YearSessionCard,
  type YearSessionStatus,
} from "../../shared/utils/year-session-cards";
import { getAllCouncilSessions } from "../loaders/get-all-council-sessions";

const STATUS_LABEL: Record<YearSessionStatus, string> = {
  done: "おわった",
  open: "いま開会中",
  upcoming: "これから",
  unconfirmed: "日程確認中",
};

/** 「〇〇年の定例会」パネル：その年の定例会4回の状況と、各会期の議案への入口 */
export async function YearSessionPanel() {
  const today = getJapanDateString();
  const sessions = await getAllCouncilSessions();
  const cards = buildYearSessionCards(
    today,
    siteConfig.regularSessionSlots,
    sessions
  );
  const reiwaYear = toReiwaYear(
    panelYear(today, siteConfig.regularSessionSlots)
  );

  return (
    <section className="rounded-3xl bg-white px-5 py-8 md:px-8">
      <div className="mb-6 flex flex-col gap-2 md:flex-row md:items-end md:justify-between">
        <h2 className="text-xl font-bold md:text-2xl">
          令和{reiwaYear}年の定例会
        </h2>
        <p className="text-sm text-mirai-text-secondary">
          定例会は年4回。議案はここで審議・採決されます。このほか、必要なときに臨時会が開かれます。
        </p>
      </div>

      <ul className="grid grid-cols-1 gap-3 sm:grid-cols-2 lg:grid-cols-4">
        {cards.map((card) => (
          <li key={card.number}>
            <SessionCard card={card} />
          </li>
        ))}
      </ul>

      <div className="mt-6 flex justify-end">
        <Link
          href={routes.sessions() as Route}
          className="flex items-center gap-1 text-sm font-bold text-mirai-text hover:underline"
        >
          過去の年度はこちらから
          <ChevronRight className="h-4 w-4" aria-hidden="true" />
        </Link>
      </div>
    </section>
  );
}

function SessionCard({ card }: { card: YearSessionCard }) {
  const isOpen = card.status === "open";
  return (
    <div
      className={`flex h-full flex-col gap-2 rounded-2xl px-4 py-4 ${
        isOpen
          ? "border-2 border-primary-accent bg-mirai-surface"
          : "bg-mirai-surface"
      }`}
    >
      <div className="flex items-center justify-between gap-2">
        <span className="text-lg font-bold">
          第{card.number}回
          <span className="ml-2 text-sm font-medium text-mirai-text-secondary">
            {card.monthsLabel}
          </span>
        </span>
        <span
          className={`shrink-0 rounded-full px-2.5 py-0.5 text-xs ${
            isOpen
              ? "bg-primary font-bold text-primary-foreground"
              : "bg-mirai-surface-warm text-mirai-text-secondary"
          }`}
        >
          {STATUS_LABEL[card.status]}
        </span>
      </div>
      <p className="text-sm text-mirai-text-secondary">{card.description}</p>
      <div className="mt-auto text-sm">
        <CardFooter card={card} />
      </div>
    </div>
  );
}

function CardFooter({ card }: { card: YearSessionCard }) {
  if (card.session) {
    return (
      <div className="flex flex-col gap-1">
        {card.status === "open" && card.session.endDate && (
          <span className="text-xs text-mirai-text-secondary">
            {Number(card.session.endDate.slice(5, 7))}月
            {Number(card.session.endDate.slice(8, 10))}日まで
          </span>
        )}
        {card.status !== "upcoming" && (
          <Link
            href={routes.sessionBills(card.session.slug) as Route}
            className="flex items-center gap-0.5 font-bold text-primary-accent hover:underline"
          >
            議案を見る
            <ChevronRight className="h-4 w-4" aria-hidden="true" />
          </Link>
        )}
      </div>
    );
  }
  if (card.status === "done") {
    // サイトに取り込んでいない会期は、市議会のページへ案内する
    return (
      <a
        href={siteConfig.councilSessionsUrl}
        target="_blank"
        rel="noreferrer"
        className="flex items-center gap-1 text-mirai-text-secondary hover:underline"
      >
        市議会のページで見る
        <ExternalLink className="h-3.5 w-3.5" aria-hidden="true" />
      </a>
    );
  }
  return null;
}
