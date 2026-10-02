import type { Metadata } from "next";
import { Container } from "@/components/layouts/container";
import { siteConfig } from "@/config/site.config";
import { SessionArchivePage } from "@/features/council-sessions/server/components/session-archive-page";
import { getSessionArchive } from "@/features/council-sessions/server/loaders/get-session-archive";

export const metadata: Metadata = {
  title: `定例会・臨時会の一覧 | ${siteConfig.siteName}`,
  description: `${siteConfig.councilName}の定例会・臨時会ごとに、出された議案をさがせます。`,
};

export default async function SessionsPage() {
  const sessions = await getSessionArchive();

  return (
    <Container className="pt-24 pb-12 md:pt-12">
      <SessionArchivePage sessions={sessions} />
    </Container>
  );
}
