import { getBillsByFeaturedTags } from "@/features/bills/server/loaders/get-bills-by-featured-tags";
import { getActiveCouncilSession } from "@/features/council-sessions/server/loaders/get-active-council-session";
import { getBillsByCouncilSession } from "./get-bills-by-council-session";
import { getFeaturedBills } from "./get-featured-bills";

const MAX_PREVIEW_BILLS = 5;

/**
 * トップページ用のデータを並列取得する
 * BFF (Backend For Frontend) パターン
 */
export async function loadHomeData() {
  const [featuredBills, billsByTag, activeSession] = await Promise.all([
    getFeaturedBills(),
    getBillsByFeaturedTags(),
    getActiveCouncilSession(),
  ]);

  // いまの定例会の議案（新しい順）。トップから議案一覧へ進めるようにする
  const activeSessionBills = activeSession
    ? await getBillsByCouncilSession(activeSession.id)
    : [];
  const activeSessionData = activeSession
    ? {
        session: activeSession,
        bills: activeSessionBills.slice(0, MAX_PREVIEW_BILLS),
        totalBillCount: activeSessionBills.length,
      }
    : null;

  return {
    billsByTag,
    featuredBills,
    activeSessionData,
    activeSessionSlug: activeSession?.slug ?? null,
  };
}
