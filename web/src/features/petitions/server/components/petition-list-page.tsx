import { ExternalLink } from "lucide-react";
import type { Route } from "next";
import Link from "next/link";
import { siteConfig } from "@/config/site.config";
import { CompactBillCard } from "@/features/bills/client/components/bill-list/compact-bill-card";
import { routes } from "@/lib/routes";
import { groupPetitionsByKind } from "../../shared/utils/group-petitions";
import type { PetitionWithMeta } from "../loaders/get-petitions";

interface PetitionListPageProps {
  petitions: PetitionWithMeta[];
}

export function PetitionListPage({ petitions }: PetitionListPageProps) {
  const groups = groupPetitionsByKind(petitions);

  return (
    <div className="flex flex-col gap-8">
      <div className="flex flex-col gap-2">
        <h1 className="text-[28px] font-bold leading-tight">請願・陳情</h1>
        <p className="text-sm text-mirai-text-secondary leading-relaxed">
          市民や団体から{siteConfig.councilName}
          に出された「こうしてほしい」というお願いです。
          <br />
          「請願」は議員の紹介を受けて出されるもの、「陳情」は議員の紹介なしで出されるものです。どちらも委員会で審査され、本会議で「採択」か「不採択」かが決まります。
        </p>
        <a
          href={siteConfig.petitionGuideUrl}
          target="_blank"
          rel="noreferrer"
          className="flex w-fit items-center gap-1 text-sm font-bold text-primary-accent hover:underline"
        >
          請願・陳情の出し方（{siteConfig.councilName}のページ）
          <ExternalLink className="h-4 w-4" aria-hidden="true" />
        </a>
      </div>

      {groups.length === 0 ? (
        <p className="py-12 text-center text-muted-foreground">
          掲載中の請願・陳情はまだありません。
        </p>
      ) : (
        groups.map((group) => (
          <section key={group.kind} className="flex flex-col gap-3">
            <h2 className="text-lg font-bold">
              {group.kind}
              <span className="ml-2 text-sm font-medium text-mirai-text-muted">
                {group.items.length}件
              </span>
            </h2>
            <div className="flex flex-col gap-3">
              {group.items.map((petition) => (
                <Link
                  key={petition.id}
                  href={routes.billDetail(petition.id) as Route}
                  className="flex flex-col gap-1"
                >
                  <CompactBillCard bill={petition} />
                  {(petition.committeeName || petition.sessionName) && (
                    <span className="px-2 text-xs text-mirai-text-muted">
                      {[petition.sessionName, petition.committeeName]
                        .filter(Boolean)
                        .join("・")}
                    </span>
                  )}
                </Link>
              ))}
            </div>
          </section>
        ))
      )}
    </div>
  );
}
