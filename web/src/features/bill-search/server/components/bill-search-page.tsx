import { ChevronRight, Landmark } from "lucide-react";
import type { Route } from "next";
import Link from "next/link";
import { CompactBillCard } from "@/features/bills/client/components/bill-list/compact-bill-card";
import type { BillWithContent } from "@/features/bills/shared/types";
import { splitByBillType } from "@/features/bills/shared/utils/split-by-bill-type";
import { routes } from "@/lib/routes";
import { searchBills } from "../loaders/search-bills";
import { BillSearchForm } from "./bill-search-form";

interface BillSearchPageProps {
  keyword: string | null;
}

export async function BillSearchPage({ keyword }: BillSearchPageProps) {
  const { bills, committees } = keyword
    ? await searchBills(keyword)
    : { bills: [], committees: [] };
  const groups = splitByBillType(bills);

  return (
    <div className="flex flex-col gap-8">
      <div className="flex flex-col gap-4">
        <h1 className="text-[28px] font-bold leading-tight">
          議案・請願・陳情をさがす
        </h1>
        <BillSearchForm defaultValue={keyword ?? ""} />
        <p className="text-xs text-mirai-text-muted">
          議案・請願・陳情の名前と解説の文章から、入力した言葉を含むものをさがします。委員会の名前（例：厚生）でもさがせます。
        </p>
      </div>

      {keyword && (
        <section className="flex flex-col gap-6" aria-live="polite">
          <h2 className="text-lg font-bold">
            「{keyword}」の検索結果 {bills.length}件
          </h2>

          {committees.length > 0 && (
            <nav aria-label="一致した委員会" className="flex flex-col gap-2">
              {committees.map((committee) => (
                <Link
                  key={committee.id}
                  href={routes.committeeDetail(committee.id) as Route}
                  className="flex items-center justify-between gap-3 rounded-2xl border border-mirai-border bg-white px-4 py-3 hover:bg-muted/50"
                >
                  <span className="flex items-center gap-2 font-bold">
                    <Landmark
                      className="h-5 w-5 shrink-0 text-primary-accent"
                      aria-hidden="true"
                    />
                    {committee.name}のページへ
                  </span>
                  <ChevronRight className="h-4 w-4" aria-hidden="true" />
                </Link>
              ))}
            </nav>
          )}

          {bills.length === 0 ? (
            <p className="py-8 text-center text-muted-foreground">
              {committees.length > 0
                ? "この言葉を含む議案・請願・陳情はありませんでした。上の委員会のページもご覧ください。"
                : "見つかりませんでした。別の言葉や、短い言葉でお試しください。"}
            </p>
          ) : (
            <>
              <ResultGroup title="議案" bills={groups.bills} />
              <ResultGroup title="請願・陳情" bills={groups.petitions} />
            </>
          )}
        </section>
      )}
    </div>
  );
}

function ResultGroup({
  title,
  bills,
}: {
  title: string;
  bills: BillWithContent[];
}) {
  if (bills.length === 0) return null;

  return (
    <div className="flex flex-col gap-3">
      <h3 className="font-bold">
        {title}
        <span className="ml-2 text-sm font-medium text-mirai-text-muted">
          {bills.length}件
        </span>
      </h3>
      {bills.map((bill) => (
        <Link key={bill.id} href={routes.billDetail(bill.id) as Route}>
          <CompactBillCard bill={bill} />
        </Link>
      ))}
    </div>
  );
}
