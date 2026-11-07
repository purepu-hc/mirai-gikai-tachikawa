import type { Metadata } from "next";
import { Container } from "@/components/layouts/container";
import { siteConfig } from "@/config/site.config";
import { BudgetOverview } from "@/features/budget/client/components/budget-overview";
import tachikawa from "@/features/budget/shared/data/tachikawa-r8-ippan.json";
import type { CityBudget } from "@/features/budget/shared/types/budget";

export const metadata: Metadata = {
  title: `立川市のお金の流れ（令和8年度予算） | ${siteConfig.siteName}`,
  description:
    "立川市の令和8年度一般会計当初予算を、入ってくるお金から使い道まで、款・項・目・事業ごとに図で見られます。",
};

export default function BudgetPage() {
  return (
    <Container className="pt-24 pb-12 md:pt-12 pc:max-w-6xl">
      <BudgetOverview data={tachikawa as CityBudget} />
    </Container>
  );
}
