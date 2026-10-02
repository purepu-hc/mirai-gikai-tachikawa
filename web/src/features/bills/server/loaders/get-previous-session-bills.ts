import { getPreviousCouncilSession } from "@/features/council-sessions/server/loaders/get-previous-council-session";
import type { CouncilSession } from "@/features/council-sessions/shared/types";
import type { BillWithContent } from "../../shared/types";
import { getBillsByCouncilSession } from "./get-bills-by-council-session";

const MAX_PREVIEW_BILLS = 5;

export type PreviousSessionBillsResult = {
  session: CouncilSession;
  bills: BillWithContent[];
  totalBillCount: number;
} | null;

/**
 * 前回の定例会とその議案を取得（プレビュー用、新しい順に最大5件）
 * 前回の会期がない場合はnullを返す
 */
export async function getPreviousSessionBills(): Promise<PreviousSessionBillsResult> {
  const previousSession = await getPreviousCouncilSession();
  if (!previousSession) {
    return null;
  }

  const bills = await getBillsByCouncilSession(previousSession.id);

  return {
    session: previousSession,
    bills: bills.slice(0, MAX_PREVIEW_BILLS),
    totalBillCount: bills.length,
  };
}
