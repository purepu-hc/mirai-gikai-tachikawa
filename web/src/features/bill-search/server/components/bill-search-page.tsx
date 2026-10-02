import type { Route } from "next";
import Link from "next/link";
import { CompactBillCard } from "@/features/bills/client/components/bill-list/compact-bill-card";
import { routes } from "@/lib/routes";
import { searchBills } from "../loaders/search-bills";
import { BillSearchForm } from "./bill-search-form";

interface BillSearchPageProps {
  keyword: string | null;
}

export async function BillSearchPage({ keyword }: BillSearchPageProps) {
  const bills = keyword ? await searchBills(keyword) : [];

  return (
    <div className="flex flex-col gap-8">
      <div className="flex flex-col gap-4">
        <h1 className="text-[28px] font-bold leading-tight">議案をさがす</h1>
        <BillSearchForm defaultValue={keyword ?? ""} />
        <p className="text-xs text-mirai-text-muted">
          議案名と解説の文章から、入力した言葉を含む議案をさがします。
        </p>
      </div>

      {keyword && (
        <section className="flex flex-col gap-4" aria-live="polite">
          <h2 className="text-lg font-bold">
            「{keyword}」の検索結果 {bills.length}件
          </h2>
          {bills.length === 0 ? (
            <p className="py-8 text-center text-muted-foreground">
              見つかりませんでした。別の言葉や、短い言葉でお試しください。
            </p>
          ) : (
            <div className="flex flex-col gap-3">
              {bills.map((bill) => (
                <Link key={bill.id} href={routes.billDetail(bill.id) as Route}>
                  <CompactBillCard bill={bill} />
                </Link>
              ))}
            </div>
          )}
        </section>
      )}
    </div>
  );
}
