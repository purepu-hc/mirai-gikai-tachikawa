import type { Metadata } from "next";
import { Container } from "@/components/layouts/container";
import { siteConfig } from "@/config/site.config";
import { PetitionListPage } from "@/features/petitions/server/components/petition-list-page";
import { getPetitions } from "@/features/petitions/server/loaders/get-petitions";

export const metadata: Metadata = {
  title: `請願・陳情 | ${siteConfig.siteName}`,
  description: `${siteConfig.councilName}に出された請願・陳情と、その審査状況の一覧です。`,
};

export default async function PetitionsPage() {
  const petitions = await getPetitions();
  return (
    <Container className="pt-24 pb-12 md:pt-12">
      <PetitionListPage petitions={petitions} />
    </Container>
  );
}
