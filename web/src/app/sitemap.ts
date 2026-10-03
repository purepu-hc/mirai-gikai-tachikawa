import type { MetadataRoute } from "next";
import { getBills } from "@/features/bills/server/loaders/get-bills";
import { getCommittees } from "@/features/committees/server/loaders/get-committees";
import { getPetitions } from "@/features/petitions/server/loaders/get-petitions";
import { env } from "@/lib/env";
import { routes } from "@/lib/routes";

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const baseUrl = process.env.VERCEL_URL
    ? `https://${process.env.VERCEL_URL}`
    : env.webUrl;

  const [bills, petitions, committees] = await Promise.all([
    getBills(),
    getPetitions(),
    getCommittees(),
  ]);

  // 議案一覧は請願・陳情を含まないため、請願・陳情の詳細ページは別に足す
  const billUrls = [...bills, ...petitions].map((bill) => ({
    url: `${baseUrl}${routes.billDetail(bill.id)}`,
    lastModified: new Date(bill.updated_at),
    changeFrequency: "weekly" as const,
    priority: 0.8,
  }));

  return [
    {
      url: baseUrl,
      lastModified: new Date(),
      changeFrequency: "daily" as const,
      priority: 1,
    },
    ...[routes.committees(), routes.petitions(), routes.sessions()].map(
      (path) => ({
        url: `${baseUrl}${path}`,
        lastModified: new Date(),
        changeFrequency: "weekly" as const,
        priority: 0.6,
      })
    ),
    ...committees.map((committee) => ({
      url: `${baseUrl}${routes.committeeDetail(committee.id)}`,
      lastModified: new Date(),
      changeFrequency: "weekly" as const,
      priority: 0.5,
    })),
    ...billUrls,
  ];
}
