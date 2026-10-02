import { ChevronRight, Landmark } from "lucide-react";
import type { Route } from "next";
import Link from "next/link";
import { routes } from "@/lib/routes";
import { getCommitteeForBillLink } from "../loaders/get-committees";

interface BillCommitteeLinkProps {
  committeeId: string | null;
  className?: string;
}

/**
 * 議案・請願・陳情の詳細ページに出す「付託された委員会」へのリンク。
 * 付託先がない（付託省略・未付託）場合や、委員会が無効の場合は何も出さない。
 */
export async function BillCommitteeLink({
  committeeId,
  className,
}: BillCommitteeLinkProps) {
  if (!committeeId) return null;
  const committee = await getCommitteeForBillLink(committeeId);
  if (!committee) return null;

  return (
    <Link
      href={routes.committeeDetail(committee.id) as Route}
      className={`flex items-center justify-between gap-3 rounded-lg border border-mirai-border bg-white px-4 py-3 hover:bg-muted/50 ${className ?? ""}`}
    >
      <span className="flex items-center gap-2 text-sm">
        <Landmark
          className="h-5 w-5 shrink-0 text-primary-accent"
          aria-hidden="true"
        />
        <span>
          担当の委員会：
          <span className="font-bold">{committee.name}</span>
        </span>
      </span>
      <span className="flex shrink-0 items-center gap-1 text-xs text-mirai-text-secondary">
        この委員会の案件を見る
        <ChevronRight className="h-4 w-4" aria-hidden="true" />
      </span>
    </Link>
  );
}
