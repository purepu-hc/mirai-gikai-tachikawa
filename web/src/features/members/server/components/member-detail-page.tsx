import { ChevronLeft, ExternalLink } from "lucide-react";
import type { Route } from "next";
import Link from "next/link";
import type { ReactNode } from "react";
import { Badge } from "@/components/ui/badge";
import { routes } from "@/lib/routes";
import type {
  GeneralQuestion,
  Member,
  MemberPledge,
} from "../../shared/types/member";
import {
  buildQuestionTopics,
  displayName,
  findChairPeriods,
  findFactionOn,
  findRolesOn,
  formatJapaneseDate,
  formatPeriod,
  sortQuestionsBySessionDesc,
} from "../../shared/utils/member-status";
import { CHAIR_NOTE, MEIBO_URL } from "../../shared/utils/sources";
import { NoEvaluationNote } from "./member-notices";

interface MemberDetailPageProps {
  member: Member;
  questions: GeneralQuestion[];
  pledges: MemberPledge[];
  today: string;
}

export function MemberDetailPage({
  member,
  questions,
  pledges,
  today,
}: MemberDetailPageProps) {
  const faction = findFactionOn(member.factions, today) ?? member.factions[0];
  const roles = findRolesOn(member.roles, today);
  const chairPeriods = findChairPeriods(member.roles);

  return (
    <div className="flex flex-col gap-8">
      <Link
        href={routes.members() as Route}
        className="inline-flex w-fit items-center gap-1 text-sm text-mirai-text-secondary hover:text-primary-accent"
      >
        <ChevronLeft className="h-4 w-4" aria-hidden="true" />
        議員の一覧へ
      </Link>

      <div className="flex flex-col gap-1">
        <span className="text-sm text-mirai-text-muted">
          {member.nameKana.replace(/　/g, " ")}
        </span>
        <h1 className="flex flex-wrap items-center gap-2 text-[28px] font-bold leading-tight">
          {displayName(member.name)}
          {roles.map((r) => (
            <Badge key={r.role} variant="light">
              {r.role}
            </Badge>
          ))}
        </h1>
        <p className="text-sm text-mirai-text-secondary">
          {faction?.factionName ?? "会派の記録なし"}
          {!member.isCurrent && "（以前の議員）"}
        </p>
      </div>

      {chairPeriods.length > 0 && (
        <div className="flex flex-col gap-2 rounded-2xl border border-primary bg-white px-5 py-4 text-sm leading-relaxed">
          <p className="font-bold">
            議長の在任期間：
            {chairPeriods.map((p) => formatPeriod(p)).join("、")}
          </p>
          <p className="text-mirai-text-secondary">{CHAIR_NOTE}</p>
        </div>
      )}

      <NoEvaluationNote />

      <Section title="本人の発信">
        <MemberLinks member={member} />
      </Section>

      <Section title="掲げたテーマ">
        {pledges.length === 0 ? (
          <Empty>
            まだ調べていません。本人のホームページなどで公開されているテーマを、出典つきで載せる予定です。
          </Empty>
        ) : (
          <ul className="flex flex-col gap-2 text-sm">
            {pledges.map((p) => (
              <li key={p.text} className="flex flex-col gap-0.5">
                <span>{p.text}</span>
                <a
                  href={p.sourceUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-xs text-mirai-text-muted underline"
                >
                  出典：{p.sourceType}（{formatJapaneseDate(p.checkedAt)}確認）
                </a>
              </li>
            ))}
          </ul>
        )}
      </Section>

      <Section title="議会で取り上げたテーマ（一般質問）">
        {questions.length === 0 ? (
          <Empty>まだ登録していません。</Empty>
        ) : (
          <div className="flex flex-col gap-4">
            {sortQuestionsBySessionDesc(questions).map((q) => (
              <QuestionCard key={q.id} question={q} />
            ))}
          </div>
        )}
      </Section>

      <Section title="任期と会派">
        <div className="flex flex-col gap-4 text-sm">
          <ul className="flex flex-col gap-1">
            {[...member.terms]
              .sort((a, b) => b.termStart.localeCompare(a.termStart))
              .map((t) => (
                <li key={t.termStart}>
                  任期{" "}
                  {formatPeriod({ startDate: t.termStart, endDate: t.termEnd })}
                  {t.seatNumber ? `（議席${t.seatNumber}番）` : ""}
                  {t.endReason ? `・${t.endReason}` : ""}
                </li>
              ))}
          </ul>
          <ul className="flex flex-col gap-1">
            {member.factions.map((f) => (
              <li key={`${f.factionName}-${f.startDate}`}>
                {f.factionName}：{formatPeriod(f)}
              </li>
            ))}
          </ul>
          <p className="text-xs text-mirai-text-muted">
            会派の期間は届け出の日ではなく、市議会の公開資料（会派・党派のページ、市議会だより）で確認できた期間です。
          </p>
        </div>
      </Section>

      <p className="text-xs text-mirai-text-muted">
        議員の連絡先などは
        <a
          href={MEIBO_URL}
          target="_blank"
          rel="noopener noreferrer"
          className="underline"
        >
          市議会の議員名簿
        </a>
        をご覧ください。
      </p>
    </div>
  );
}

function Section({ title, children }: { title: string; children: ReactNode }) {
  return (
    <section className="flex flex-col gap-3">
      <h2 className="text-lg font-bold">{title}</h2>
      {children}
    </section>
  );
}

function Empty({ children }: { children: ReactNode }) {
  return <p className="text-sm text-mirai-text-muted">{children}</p>;
}

function MemberLinks({ member }: { member: Member }) {
  const links = [
    { label: "ホームページ", url: member.homepageUrl },
    { label: "X（旧Twitter）", url: member.xUrl },
  ].filter((l): l is { label: string; url: string } => l.url !== null);

  if (links.length === 0) return <Empty>公開情報なし</Empty>;

  return (
    <div className="flex flex-col gap-2">
      <ul className="flex flex-wrap gap-2">
        {links.map((l) => (
          <li key={l.label}>
            <a
              href={l.url}
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center gap-1 rounded-full border border-mirai-border bg-white px-4 py-2 text-sm hover:bg-muted/50"
            >
              {l.label}
              <ExternalLink className="h-3.5 w-3.5" aria-hidden="true" />
            </a>
          </li>
        ))}
      </ul>
      {member.linksCheckedAt && (
        <p className="text-xs text-mirai-text-muted">
          本人のものと確認できたリンクだけを載せています（
          {formatJapaneseDate(member.linksCheckedAt)}確認）。
        </p>
      )}
    </div>
  );
}

function QuestionCard({ question }: { question: GeneralQuestion }) {
  const topics = buildQuestionTopics(question.items);
  const meta = [
    `質問順 ${question.orderNumber}番`,
    question.questionStyle,
    question.aids.length > 0 ? `${question.aids.join("・")}を使用` : null,
  ].filter(Boolean);

  return (
    <div className="flex flex-col gap-3 rounded-2xl border border-mirai-border bg-white px-5 py-4">
      <div className="flex flex-col gap-0.5">
        <span className="font-bold">{question.sessionName}</span>
        <span className="text-xs text-mirai-text-muted">{meta.join("・")}</span>
      </div>
      <ol className="flex flex-col gap-3 text-sm">
        {topics.map((t) => (
          <li key={t.number} className="flex flex-col gap-1">
            <span className="font-bold">
              {t.number}. {t.title}
            </span>
            {t.subs.length > 0 && (
              <ul className="flex flex-col gap-0.5 pl-4 text-mirai-text-secondary">
                {t.subs.map((s) => (
                  <li key={s} className="list-disc">
                    {s}
                  </li>
                ))}
              </ul>
            )}
          </li>
        ))}
      </ol>
      <div className="flex flex-wrap gap-x-4 gap-y-1 text-xs text-mirai-text-muted">
        <a
          href={question.sourceUrl}
          target="_blank"
          rel="noopener noreferrer"
          className="underline"
        >
          出典：一般質問順序表（{formatJapaneseDate(question.sourceFetchedAt)}
          取得）
        </a>
        {question.minutesUrl && (
          <a
            href={question.minutesUrl}
            target="_blank"
            rel="noopener noreferrer"
            className="underline"
          >
            会議録
          </a>
        )}
      </div>
    </div>
  );
}
