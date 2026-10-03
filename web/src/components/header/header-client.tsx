"use client";

import { Search } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { siteConfig } from "@/config/site.config";
import { DifficultySelector } from "@/features/bill-difficulty/client/components/difficulty-selector";
import type { DifficultyLevelEnum } from "@/features/bill-difficulty/shared/types";
import type { CouncilSession } from "@/features/council-sessions/shared/types";
import { InterviewHeaderActions } from "@/features/interview-session/client/components/interview-header-actions";
import { isInterviewPage, isMainPage } from "@/lib/page-layout-utils";
import { routes } from "@/lib/routes";
import { splitSiteName } from "@/lib/split-site-name";
import { HamburgerMenu } from "./hamburger-menu";

interface HeaderClientProps {
  difficultyLevel: DifficultyLevelEnum;
  sessions: CouncilSession[];
}

export function HeaderClient({ difficultyLevel, sessions }: HeaderClientProps) {
  const pathname = usePathname();
  const showDifficultySelector = isMainPage(pathname);
  const showInterviewActions = isInterviewPage(pathname);
  const siteName = splitSiteName(siteConfig.siteName);

  return (
    <header className="px-3 fixed top-4 left-0 right-0 z-40 max-w-[1440px] mx-auto">
      <div className="rounded-2xl bg-white shadow-sm mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center h-16">
          {/* Logo / Site Title */}
          <div className="flex min-w-0 items-center">
            <Link
              href={routes.home()}
              className="flex min-w-0 items-center space-x-2"
              aria-label="ホーム"
            >
              {siteConfig.features.showTeamMiraiSection && (
                <Image
                  src="/img/logo.svg"
                  alt={siteConfig.siteName}
                  width={42}
                  height={36}
                />
              )}
              {/* スマホでは「みらい議会」「＠立川市」の2段、sm以上は1行 */}
              <div className="font-bold leading-tight whitespace-nowrap">
                <span className="block text-lg sm:inline sm:text-xl">
                  {siteName.main}
                </span>
                {siteName.sub && (
                  <span className="block text-xs text-mirai-text-secondary sm:inline sm:text-xl sm:text-mirai-text">
                    {siteName.sub}
                  </span>
                )}
              </div>
            </Link>
          </div>

          {/* Navigation */}
          <nav
            className="flex shrink-0 items-center space-x-1 sm:space-x-2"
            aria-label="補助ナビゲーション"
          >
            {showDifficultySelector && (
              <DifficultySelector currentLevel={difficultyLevel} />
            )}
            {showInterviewActions && <InterviewHeaderActions />}
            <Link
              href={routes.search()}
              aria-label="議案・請願・陳情をさがす"
              className="flex h-10 w-10 items-center justify-center rounded-full text-mirai-text hover:bg-muted"
            >
              <Search className="h-5 w-5" aria-hidden="true" />
            </Link>
            <HamburgerMenu sessions={sessions} />
          </nav>
        </div>
      </div>
    </header>
  );
}
