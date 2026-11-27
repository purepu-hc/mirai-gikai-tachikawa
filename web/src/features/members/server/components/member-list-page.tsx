import { ChevronRight } from "lucide-react";
import type { Route } from "next";
import Link from "next/link";
import { Badge } from "@/components/ui/badge";
import { siteConfig } from "@/config/site.config";
import { routes } from "@/lib/routes";
import type { ElectionBlackout, Member } from "../../shared/types/member";
import {
  displayName,
  findFactionOn,
  findRolesOn,
  findTermOn,
  splitMembersByCurrent,
} from "../../shared/utils/member-status";
import { MEIBO_URL } from "../../shared/utils/sources";
import { BlackoutNotice, NoEvaluationNote } from "./member-notices";
import { SeatPlan } from "./seat-plan";

interface MemberListPageProps {
  members: Member[];
  today: string;
  blackout: ElectionBlackout | undefined;
}

export function MemberListPage({
  members,
  today,
  blackout,
}: MemberListPageProps) {
  const { current, former } = splitMembersByCurrent(members, today);

  return (
    <div className="flex flex-col gap-8">
      <div className="flex flex-col gap-2">
        <h1 className="text-[28px] font-bold leading-tight">議員からさがす</h1>
        <p className="text-sm leading-relaxed text-mirai-text-secondary">
          {siteConfig.councilName}
          の議員が、どんなテーマを掲げ、議会で何を取り上げたかを紹介します。連絡先などは
          <a
            href={MEIBO_URL}
            target="_blank"
            rel="noopener noreferrer"
            className="underline hover:text-primary-accent"
          >
            市議会の議員名簿
          </a>
          をご覧ください。
        </p>
      </div>

      {blackout ? (
        <BlackoutNotice blackout={blackout} />
      ) : (
        <>
          <SeatPlan members={current} today={today} />
          <NoEvaluationNote />
          <section className="flex flex-col gap-3">
            <h2 className="text-lg font-bold">
              いまの議員
              <span className="ml-2 text-sm font-medium text-mirai-text-muted">
                {current.length}人
              </span>
            </h2>
            <MemberRows members={current} date={today} />
          </section>

          {former.length > 0 && (
            <section className="flex flex-col gap-3">
              <h2 className="text-lg font-bold">以前の議員</h2>
              <p className="text-xs text-mirai-text-muted">
                このサイトで記録を載せている任期に在任していた議員です。
              </p>
              <MemberRows members={former} date={null} />
            </section>
          )}
        </>
      )}
    </div>
  );
}

function MemberRows({
  members,
  date,
}: {
  members: Member[];
  /** いまの議員は今日の会派・役職を、以前の議員は最後の会派を出す */
  date: string | null;
}) {
  return (
    <ul className="flex flex-col gap-2">
      {members.map((m) => {
        const faction = date ? findFactionOn(m.factions, date) : m.factions[0];
        const roles = date ? findRolesOn(m.roles, date) : [];
        const seat = date ? findTermOn(m.terms, date)?.seatNumber : null;
        return (
          <li key={m.id}>
            <Link
              href={routes.memberDetail(m.slug) as Route}
              className="flex items-center justify-between gap-3 rounded-2xl border border-mirai-border bg-white px-5 py-3 hover:bg-muted/50"
            >
              <div className="flex min-w-0 flex-col gap-0.5">
                <span className="text-xs text-mirai-text-muted">
                  {m.nameKana.replace(/　/g, " ")}
                </span>
                <span className="flex flex-wrap items-center gap-2">
                  <span className="font-bold">{displayName(m.name)}</span>
                  {roles.map((r) => (
                    <Badge key={r.role} variant="light">
                      {r.role}
                    </Badge>
                  ))}
                </span>
                <span className="text-xs text-mirai-text-secondary">
                  {faction?.factionName ?? "会派の記録なし"}
                  {seat ? `・議席${seat}番` : ""}
                </span>
              </div>
              <ChevronRight
                className="h-4 w-4 shrink-0 text-mirai-text-secondary"
                aria-hidden="true"
              />
            </Link>
          </li>
        );
      })}
    </ul>
  );
}
