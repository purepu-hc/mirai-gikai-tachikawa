import { ChevronRight } from "lucide-react";
import type { Route } from "next";
import Image from "next/image";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import type { CouncilSession } from "@/features/council-sessions/shared/types";
import { buildSessionPeriodDescription } from "@/features/council-sessions/shared/utils/session-period-description";
import { routes } from "@/lib/routes";
import { getJapanDateString } from "@/lib/utils/date";
import { CompactBillCard } from "../../client/components/bill-list/compact-bill-card";
import type { BillWithContent } from "../../shared/types";

interface PreviousSessionSectionProps {
  session: CouncilSession;
  bills: BillWithContent[];
  totalBillCount: number;
  /**
   * current: いま開かれている定例会（トップページ上部に表示）
   * archive: 過去の定例会（従来の Archive 表示）
   */
  variant?: "current" | "archive";
}

const VISIBLE_BILLS = 5;

export function PreviousSessionSection({
  session,
  bills,
  totalBillCount,
  variant = "archive",
}: PreviousSessionSectionProps) {
  const visibleBills = bills.slice(0, VISIBLE_BILLS);
  const showMoreButton = totalBillCount > visibleBills.length;

  // slugがない場合はセクションを表示しない
  if (!session.slug || bills.length === 0) {
    return null;
  }

  const sessionBillsUrl = `/sessions/${session.slug}/bills`;
  const sessionDescription = buildSessionPeriodDescription(
    session,
    getJapanDateString()
  );
  const isCurrent = variant === "current";

  return (
    <section className="flex flex-col gap-6">
      {/* セクション見出し */}
      <div className="flex flex-col gap-1">
        {isCurrent ? (
          <h2 className="text-[28px] font-bold leading-tight text-black">
            いまの議会の議案
          </h2>
        ) : (
          <h2>
            <Image
              src="/icons/archive-typography.svg"
              alt="Archive"
              width={156}
              height={36}
              priority
            />
          </h2>
        )}
        <p className="text-sm font-bold text-primary-accent">
          {isCurrent
            ? "新しく提出された議案から順に並んでいます"
            : "過去の定例会に上程された議案"}
        </p>
      </div>

      {/* セクションヘッダー（リンク付き） */}
      <div className="flex flex-col gap-1.5">
        <Link href={sessionBillsUrl as Route} className="group">
          <h3 className="text-[22px] font-bold text-black leading-[1.48] flex items-center gap-1.5">
            <span className="flex items-center gap-4">
              {new Date(session.start_date).getFullYear()}年 {session.name}
              の議案
              <span className="shrink-0">{totalBillCount}件</span>
            </span>
            <ChevronRight className="h-6 w-6 text-gray-600 group-hover:translate-x-0.5 transition-transform" />
          </h3>
        </Link>
        <p className="text-xs font-medium text-mirai-text">
          {sessionDescription}
        </p>
      </div>

      {/* 議案カードリスト */}
      <div className="relative flex flex-col gap-3">
        {visibleBills.map((bill) => (
          <Link key={bill.id} href={routes.billDetail(bill.id) as Route}>
            <CompactBillCard bill={bill} />
          </Link>
        ))}

        {/* もっと読むリンク（グラデーションオーバーレイ付き） */}
        {showMoreButton && (
          <div className="pointer-events-none absolute inset-x-0 bottom-0 h-[118px] bg-mirai-white-fade rounded-b-2xl">
            <div className="absolute inset-x-0 bottom-6 flex justify-center pointer-events-auto">
              <Button
                variant="outline"
                size="lg"
                asChild
                className="w-[214px] h-12 text-base font-bold border-mirai-text rounded-full hover:bg-gray-50 bg-white"
              >
                <Link href={sessionBillsUrl as Route}>
                  {isCurrent
                    ? `すべての議案を見る（${totalBillCount}件）`
                    : "もっと読む"}
                </Link>
              </Button>
            </div>
          </div>
        )}
      </div>

      {/* 過去の定例会の一覧へ */}
      {!isCurrent && (
        <Link
          href={routes.sessions() as Route}
          className="flex items-center gap-1 self-end text-sm font-bold text-mirai-text hover:underline"
        >
          過去の定例会をすべて見る
          <ChevronRight className="h-4 w-4" aria-hidden="true" />
        </Link>
      )}
    </section>
  );
}
