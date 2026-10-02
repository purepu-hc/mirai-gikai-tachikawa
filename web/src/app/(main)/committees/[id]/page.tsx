import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { Container } from "@/components/layouts/container";
import { siteConfig } from "@/config/site.config";
import { CommitteeDetailPage } from "@/features/committees/server/components/committee-detail-page";
import { getCommitteeWithBills } from "@/features/committees/server/loaders/get-committees";

type Props = {
  params: Promise<{ id: string }>;
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { id } = await params;
  const result = await getCommitteeWithBills(id);
  if (!result)
    return { title: `委員会が見つかりません | ${siteConfig.siteName}` };
  return {
    title: `${result.committee.name} | ${siteConfig.siteName}`,
    description: `${siteConfig.councilName}の${result.committee.name}で審査された議案・請願・陳情の一覧です。`,
  };
}

export default async function CommitteePage({ params }: Props) {
  const { id } = await params;
  const result = await getCommitteeWithBills(id);
  if (!result) notFound();
  return (
    <Container className="pt-24 pb-12 md:pt-12">
      <CommitteeDetailPage committee={result.committee} bills={result.bills} />
    </Container>
  );
}
