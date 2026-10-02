import { Container } from "@/components/layouts/container";
import { About } from "@/components/top/about";
import { ExploreNav } from "@/components/top/explore-nav";

import { Hero } from "@/components/top/hero";
import { TeamMirai } from "@/components/top/team-mirai";
import { siteConfig } from "@/config/site.config";
import { getDifficultyLevel } from "@/features/bill-difficulty/server/loaders/get-difficulty-level";
import { BillSearchForm } from "@/features/bill-search/server/components/bill-search-form";
import { BillDisclaimer } from "@/features/bills/client/components/bill-detail/bill-disclaimer";
import { BillsByTagSection } from "@/features/bills/server/components/bills-by-tag-section";
import { FeaturedBillSection } from "@/features/bills/server/components/featured-bill-section";
import { PreviousSessionSection } from "@/features/bills/server/components/previous-session-section";
import { loadHomeData } from "@/features/bills/server/loaders/load-home-data";
import type { BillWithContent } from "@/features/bills/shared/types";
import { HomeChatClient } from "@/features/chat/client/components/home-chat-client";
import { CurrentCouncilSession } from "@/features/council-sessions/client/components/current-council-session";
import { getCurrentCouncilSession } from "@/features/council-sessions/server/loaders/get-current-council-session";
import { getJapanTime } from "@/lib/utils/date";

export default async function Home() {
  const {
    billsByTag,
    featuredBills,
    previousSessionData,
    activeSessionData,
    activeSessionSlug,
  } = await loadHomeData();

  // ゆくゆくタグ機能がマージされたらBFFに統合する
  const [currentSession, currentDifficulty] = await Promise.all([
    getCurrentCouncilSession(getJapanTime()),
    getDifficultyLevel(),
  ]);

  const featuredBillIds = new Set(featuredBills.map((b) => b.id));

  const toBillChatContext = (bill: BillWithContent) => {
    return {
      name: `${bill.bill_content?.title}（${bill.name}）`,
      summary: bill.bill_content?.summary,
      tags: bill.tags?.map((tag) => tag.label) || [],
      isFeatured: featuredBills.some((b) => b.id === bill.id),
    };
  };

  return (
    <>
      <Hero />

      {/* 本日の定例会セクション */}
      <CurrentCouncilSession session={currentSession} />

      {/* 議案の検索窓 */}
      <Container>
        <div className="flex flex-col gap-4 pt-10">
          <BillSearchForm />
          {/* 議案一覧・委員会・請願陳情への入口 */}
          <ExploreNav activeSessionSlug={activeSessionSlug} />
        </div>
      </Container>

      {/* いまの定例会の議案（新しい順・トップから一覧への動線） */}
      {activeSessionData && (
        <Container>
          <div className="pt-8">
            <PreviousSessionSection
              variant="current"
              session={activeSessionData.session}
              bills={activeSessionData.bills}
              totalBillCount={activeSessionData.totalBillCount}
            />
          </div>
        </Container>
      )}

      {/* 議案一覧セクション */}
      <Container className="">
        <div className="py-10">
          <main className="flex flex-col gap-16">
            {/* 注目の議案セクション */}
            <FeaturedBillSection bills={featuredBills} />

            {/* タグ別議案一覧セクション */}
            <BillsByTagSection
              billsByTag={billsByTag}
              featuredBillIds={featuredBillIds}
              sessionSlug={activeSessionSlug}
            />
          </main>
        </div>
      </Container>
      {/* 前回の定例会セクション（Archive） */}
      {previousSessionData && (
        <div className="bg-mirai-surface-muted py-10">
          <Container>
            <PreviousSessionSection
              session={previousSessionData.session}
              bills={previousSessionData.bills}
              totalBillCount={previousSessionData.totalBillCount}
            />
          </Container>
        </div>
      )}

      <Container>
        {/* みらい議会とは セクション */}
        <About />

        {/* チームみらいについて セクション */}
        <TeamMirai />

        {/* 免責事項 */}
        <BillDisclaimer />
      </Container>

      {/* チャット機能 */}
      {siteConfig.features.aiChat && (
        <HomeChatClient
          currentDifficulty={currentDifficulty}
          bills={billsByTag
            .flatMap((x) => x.bills)
            .concat(featuredBills)
            .map(toBillChatContext)}
        />
      )}
    </>
  );
}
