import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { Container } from "@/components/layouts/container";
import { siteConfig } from "@/config/site.config";
import { MemberDetailPage } from "@/features/members/server/components/member-detail-page";
import { BlackoutNotice } from "@/features/members/server/components/member-notices";
import { getMemberDetail } from "@/features/members/server/loaders/get-members";
import {
  displayName,
  findActiveBlackout,
} from "@/features/members/shared/utils/member-status";
import { getJapanDateString } from "@/lib/utils/date";

type Props = {
  params: Promise<{ slug: string }>;
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params;
  const result = await getMemberDetail(slug);
  // 試作中のため検索エンジンには載せない
  const robots = { index: false, follow: false };
  if (!result)
    return { title: `議員が見つかりません | ${siteConfig.siteName}`, robots };
  return {
    title: `${displayName(result.member.name)} | ${siteConfig.siteName}`,
    description: `${siteConfig.councilName}議員が掲げたテーマと、議会で取り上げたテーマ（一般質問）です。`,
    robots,
  };
}

export default async function MemberPage({ params }: Props) {
  const { slug } = await params;
  const result = await getMemberDetail(slug);
  if (!result) notFound();
  const today = getJapanDateString();
  const blackout = findActiveBlackout(
    result.blackouts,
    today,
    result.member.id
  );
  return (
    <Container className="pt-24 pb-12 md:pt-12">
      {blackout ? (
        <BlackoutNotice blackout={blackout} />
      ) : (
        <MemberDetailPage
          member={result.member}
          questions={result.questions}
          pledges={result.pledges}
          today={today}
        />
      )}
    </Container>
  );
}
