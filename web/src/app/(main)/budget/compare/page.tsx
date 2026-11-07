import type { Metadata } from "next";
import { Container } from "@/components/layouts/container";
import { siteConfig } from "@/config/site.config";
import { BudgetCompare } from "@/features/budget/client/components/budget-compare";
import tama26 from "@/features/budget/shared/data/tama26-r6-kessan.json";
import type { ComparisonData } from "@/features/budget/shared/types/budget";

export const metadata: Metadata = {
  title: `多摩26市とくらべる（令和6年度決算） | ${siteConfig.siteName}`,
  description:
    "立川市の市民1人あたりの歳出を、総務省の決算統計で多摩26市の平均とくらべます。",
};

export default function BudgetComparePage() {
  return (
    <Container className="pt-24 pb-12 md:pt-12 pc:max-w-6xl">
      <BudgetCompare data={tama26 as ComparisonData} />
    </Container>
  );
}
