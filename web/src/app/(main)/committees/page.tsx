import type { Metadata } from "next";
import { Container } from "@/components/layouts/container";
import { siteConfig } from "@/config/site.config";
import { CommitteeListPage } from "@/features/committees/server/components/committee-list-page";
import { getCommittees } from "@/features/committees/server/loaders/get-committees";

export const metadata: Metadata = {
  title: `委員会からさがす | ${siteConfig.siteName}`,
  description: `${siteConfig.councilName}の委員会ごとに、審査された議案・請願・陳情を見られます。`,
};

export default async function CommitteesPage() {
  const committees = await getCommittees();
  return (
    <Container className="pt-24 pb-12 md:pt-12">
      <CommitteeListPage committees={committees} />
    </Container>
  );
}
