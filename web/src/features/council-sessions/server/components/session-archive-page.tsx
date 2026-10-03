import "server-only";
import { ChevronRight } from "lucide-react";
import type { Route } from "next";
import Link from "next/link";
import { siteConfig } from "@/config/site.config";
import { routes } from "@/lib/routes";
import { getJapanDateString } from "@/lib/utils/date";
import { buildSessionPeriodDescription } from "../../shared/utils/session-period-description";
import type { SessionArchiveItem } from "../loaders/get-session-archive";

interface SessionArchivePageProps {
  sessions: SessionArchiveItem[];
}

/** 定例会・臨時会の一覧（アーカイブ） */
export function SessionArchivePage({ sessions }: SessionArchivePageProps) {
  const today = getJapanDateString();

  return (
    <div className="flex flex-col gap-8">
      <div className="flex flex-col gap-2">
        <h1 className="text-[28px] font-bold leading-tight">
          定例会・臨時会の一覧
        </h1>
        <p className="text-sm text-mirai-text-secondary leading-relaxed">
          {siteConfig.councilName}
          は、年4回の「定例会」と、必要なときに開く「臨時会」で議案を話し合います。会期を選ぶと、その会期に出された議案を見られます。
        </p>
      </div>

      {sessions.length === 0 ? (
        <p className="py-12 text-center text-muted-foreground">
          掲載中の定例会はまだありません。
        </p>
      ) : (
        <ul className="flex flex-col gap-3">
          {sessions.map((session) => (
            <li key={session.id}>
              <Link
                href={routes.sessionBills(session.slug) as Route}
                className="flex items-center justify-between gap-3 rounded-2xl border border-mirai-border bg-white px-5 py-4 hover:bg-muted/50"
              >
                <div className="flex flex-col gap-1">
                  <span className="font-bold">
                    {session.name}
                    {session.is_active && (
                      <span className="ml-2 rounded-full bg-primary px-2 py-0.5 align-middle text-xs font-bold text-primary-foreground">
                        いまの議会
                      </span>
                    )}
                  </span>
                  <span className="text-xs text-mirai-text-muted">
                    {buildSessionPeriodDescription(session, today)}
                  </span>
                  <span className="text-xs text-mirai-text-secondary">
                    議案 {session.counts.bills}件
                    {session.counts.petitions > 0 &&
                      `・請願・陳情 ${session.counts.petitions}件`}
                  </span>
                </div>
                <ChevronRight
                  className="h-5 w-5 shrink-0 text-mirai-text-secondary"
                  aria-hidden="true"
                />
              </Link>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
