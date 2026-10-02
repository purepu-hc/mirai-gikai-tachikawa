import { ChevronRight } from "lucide-react";
import type { Route } from "next";
import Link from "next/link";
import { siteConfig } from "@/config/site.config";
import { routes } from "@/lib/routes";
import type { CommitteeSummary } from "../loaders/get-committees";

interface CommitteeListPageProps {
  committees: CommitteeSummary[];
}

export function CommitteeListPage({ committees }: CommitteeListPageProps) {
  return (
    <div className="flex flex-col gap-8">
      <div className="flex flex-col gap-2">
        <h1 className="text-[28px] font-bold leading-tight">
          委員会からさがす
        </h1>
        <p className="text-sm text-mirai-text-secondary leading-relaxed">
          {siteConfig.councilName}
          では、議案や請願・陳情をテーマごとの「委員会」でくわしく審査してから、本会議で決めます。委員会を選ぶと、そこで審査された議案などが見られます。
        </p>
      </div>

      <ul className="flex flex-col gap-3">
        {committees.map((committee) => (
          <li key={committee.id}>
            <Link
              href={routes.committeeDetail(committee.id) as Route}
              className="flex items-center justify-between gap-3 rounded-2xl border border-mirai-border bg-white px-5 py-4 hover:bg-muted/50"
            >
              <div className="flex flex-col gap-0.5">
                <span className="font-bold">{committee.name}</span>
                {committee.description && (
                  <span className="text-xs text-mirai-text-muted">
                    {committee.description}
                  </span>
                )}
              </div>
              <span className="flex shrink-0 items-center gap-1 text-sm text-mirai-text-secondary">
                {committee.billCount}件
                <ChevronRight className="h-4 w-4" aria-hidden="true" />
              </span>
            </Link>
          </li>
        ))}
      </ul>
    </div>
  );
}
