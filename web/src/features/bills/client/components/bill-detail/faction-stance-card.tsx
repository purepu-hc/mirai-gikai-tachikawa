import type {
  BillStatusEnum,
  FactionStance,
  StanceTypeEnum,
} from "../../../shared/types";
import { STANCE_LABELS } from "../../../shared/types";

function getStanceBadgeStyle(type: StanceTypeEnum) {
  switch (type) {
    case "for":
    case "conditional_for":
      return {
        bg: "bg-stance-for-bg",
        textColor: "text-primary-accent",
      };
    case "against":
    case "conditional_against":
      return {
        bg: "bg-stance-against-bg",
        textColor: "text-stance-against",
      };
    default:
      return {
        bg: "bg-mirai-surface-muted",
        textColor: "text-black",
      };
  }
}

type FactionStanceRowProps = {
  stance: FactionStance;
};

function FactionStanceRow({ stance }: FactionStanceRowProps) {
  const style = getStanceBadgeStyle(stance.stance);

  return (
    <div className="flex flex-col gap-2 py-4 border-b last:border-0">
      <div className="flex items-center justify-between gap-4">
        <span className="font-semibold text-base">
          {stance.faction.display_name}
        </span>
        <span
          className={`shrink-0 px-4 py-1.5 rounded-full text-sm font-bold ${style.bg} ${style.textColor}`}
        >
          {STANCE_LABELS[stance.stance]}
        </span>
      </div>
      {stance.comment && (
        <p className="text-sm leading-relaxed text-gray-700 whitespace-pre-wrap">
          {stance.comment}
        </p>
      )}
    </div>
  );
}

interface FactionStanceCardProps {
  stances: FactionStance[];
  billStatus?: BillStatusEnum;
  /** 請願・陳情のとき true（賛成・反対の意味の注記を出す） */
  isPetition?: boolean;
  /** 賛否の出典などの注記 */
  sourceNote?: string;
  /** 請願・陳情での賛成・反対の意味の注記 */
  petitionNote?: string;
  /** 賛否がまだ無い議案に表示する文 */
  pendingNote?: string;
}

export function FactionStanceCard({
  stances,
  billStatus,
  isPetition = false,
  sourceNote,
  petitionNote,
  pendingNote = "議案上程後に各会派の賛否を表明します。",
}: FactionStanceCardProps) {
  const isPreparing = billStatus === "preparing";

  if (!isPreparing && stances.length === 0) {
    return null;
  }

  return (
    <>
      <h2 className="text-[22px] font-bold mb-4">🗳️会派の賛否</h2>
      <div className="rounded-2xl border bg-white px-6 py-2">
        {isPreparing && stances.length === 0 ? (
          <p className="py-6 text-center text-sm text-gray-500">
            {pendingNote}
          </p>
        ) : (
          <div>
            {stances.map((stance) => (
              <FactionStanceRow key={stance.id} stance={stance} />
            ))}
          </div>
        )}
      </div>
      {stances.length > 0 && (
        <FactionStanceNotes
          notes={[isPetition ? petitionNote : undefined, sourceNote]}
        />
      )}
    </>
  );
}

function FactionStanceNotes({ notes }: { notes: (string | undefined)[] }) {
  const visible = notes.filter((note): note is string => Boolean(note));
  if (visible.length === 0) {
    return null;
  }
  return (
    <div className="mt-3 flex flex-col gap-1 text-xs leading-relaxed text-gray-500">
      {visible.map((note) => (
        <p key={note}>※{note}</p>
      ))}
    </div>
  );
}
