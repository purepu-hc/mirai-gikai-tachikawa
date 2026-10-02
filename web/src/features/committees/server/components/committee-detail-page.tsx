import { ChevronLeft } from "lucide-react";
import type { Route } from "next";
import Link from "next/link";
import { CompactBillCard } from "@/features/bills/client/components/bill-list/compact-bill-card";
import type { BillWithContent } from "@/features/bills/shared/types";
import { routes } from "@/lib/routes";
import { splitByBillType } from "../../shared/utils/split-by-bill-type";

interface CommitteeDetailPageProps {
  committee: { id: string; name: string; description: string | null };
  bills: BillWithContent[];
}

export function CommitteeDetailPage({
  committee,
  bills,
}: CommitteeDetailPageProps) {
  const groups = splitByBillType(bills);

  return (
    <div className="flex flex-col gap-8">
      <Link
        href={routes.committees() as Route}
        className="inline-flex w-fit items-center gap-1 text-sm text-mirai-text-secondary hover:text-primary-accent"
      >
        <ChevronLeft className="h-4 w-4" aria-hidden="true" />
        委員会の一覧へ
      </Link>

      <div className="flex flex-col gap-1">
        <h1 className="text-[28px] font-bold leading-tight">
          {committee.name}
        </h1>
        {committee.description && (
          <p className="text-sm text-mirai-text-muted">
            {committee.description}
          </p>
        )}
      </div>

      {bills.length === 0 ? (
        <p className="py-8 text-center text-muted-foreground">
          この委員会で掲載中の議案・請願・陳情はまだありません。
        </p>
      ) : (
        <>
          <BillGroup title="議案" bills={groups.bills} />
          <BillGroup title="請願・陳情" bills={groups.petitions} />
        </>
      )}
    </div>
  );
}

function BillGroup({
  title,
  bills,
}: {
  title: string;
  bills: BillWithContent[];
}) {
  if (bills.length === 0) return null;

  return (
    <section className="flex flex-col gap-3">
      <h2 className="text-lg font-bold">
        {title}
        <span className="ml-2 text-sm font-medium text-mirai-text-muted">
          {bills.length}件
        </span>
      </h2>
      <div className="flex flex-col gap-3">
        {bills.map((bill) => (
          <Link key={bill.id} href={routes.billDetail(bill.id) as Route}>
            <CompactBillCard bill={bill} />
          </Link>
        ))}
      </div>
    </section>
  );
}
