import type { Metadata } from "next";
import { Container } from "@/components/layouts/container";
import { siteConfig } from "@/config/site.config";
import { MemberListPage } from "@/features/members/server/components/member-list-page";
import { getMembers } from "@/features/members/server/loaders/get-members";
import { findActiveBlackout } from "@/features/members/shared/utils/member-status";
import { getJapanDateString } from "@/lib/utils/date";

export const metadata: Metadata = {
  title: `議員からさがす | ${siteConfig.siteName}`,
  description: `${siteConfig.councilName}の議員が掲げたテーマと、議会で取り上げたテーマを紹介します。`,
  // 試作中のため検索エンジンには載せない
  robots: { index: false, follow: false },
};

export default async function MembersPage() {
  const { members, blackouts } = await getMembers();
  const today = getJapanDateString();
  return (
    <Container className="pt-24 pb-12 md:pt-12">
      <MemberListPage
        members={members}
        today={today}
        blackout={findActiveBlackout(blackouts, today)}
      />
    </Container>
  );
}
