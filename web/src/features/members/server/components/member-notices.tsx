import { Info } from "lucide-react";
import type { ElectionBlackout } from "../../shared/types/member";
import { formatPeriod } from "../../shared/utils/member-status";

/** 選挙期間中の表示（議員ページを閉じている間） */
export function BlackoutNotice({ blackout }: { blackout: ElectionBlackout }) {
  return (
    <div className="rounded-2xl border border-mirai-border bg-white px-5 py-6 text-sm leading-relaxed">
      <p className="font-bold">{blackout.electionName}の期間中です</p>
      <p className="mt-2 text-mirai-text-secondary">
        選挙期間中（{formatPeriod(blackout)}
        ）は、公平のため議員紹介ページを公開していません。議会の記録（議案・賛否・会議録）は引き続きご覧いただけます。
      </p>
    </div>
  );
}

/** 評価をしないことの説明（一覧・個別ページ共通） */
export function NoEvaluationNote() {
  return (
    <p className="flex gap-2 rounded-xl bg-muted/50 px-4 py-3 text-xs leading-relaxed text-mirai-text-secondary">
      <Info className="mt-0.5 h-4 w-4 shrink-0" aria-hidden="true" />
      <span>
        このページは、議員が掲げたテーマと議会で取り上げたテーマを、公開資料から並べて紹介するものです。運営者による評価・採点や、質問数などによる比較は行いません。並びは市議会の名簿と同じ50音順です。
      </span>
    </p>
  );
}
