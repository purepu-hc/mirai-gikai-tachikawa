import type { Metadata } from "next";
import { Container } from "@/components/layouts/container";
import { siteConfig } from "@/config/site.config";
import { BillSearchPage } from "@/features/bill-search/server/components/bill-search-page";
import { normalizeSearchKeyword } from "@/features/bill-search/shared/utils/search-keyword";

export const metadata: Metadata = {
  title: `議案・請願・陳情をさがす | ${siteConfig.siteName}`,
  description: `${siteConfig.councilName}の議案・請願・陳情を言葉でさがせます。`,
  robots: { index: false },
};

type Props = {
  searchParams: Promise<{ q?: string | string[] }>;
};

export default async function SearchPage({ searchParams }: Props) {
  const { q } = await searchParams;
  return (
    <Container className="pt-24 pb-12 md:pt-12">
      <BillSearchPage keyword={normalizeSearchKeyword(q)} />
    </Container>
  );
}
