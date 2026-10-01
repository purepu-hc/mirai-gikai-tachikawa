import type { Metadata } from "next";
import { Container } from "@/components/layouts/container";
import {
  LegalList,
  LegalPageLayout,
  LegalParagraph,
  LegalSectionTitle,
} from "@/components/layouts/legal-page-layout";
import { siteConfig } from "@/config/site.config";

export const metadata: Metadata = {
  title: `利用規約 | ${siteConfig.siteName}`,
  description: `${siteConfig.siteName}の利用規約`,
};

export default function TermsPage() {
  return (
    <LegalPageLayout
      title="利用規約"
      description={`${siteConfig.siteName}をご利用いただくにあたっての基本的なルールを定めています。`}
      className="pt-24 md:pt-12"
    >
      <Container className="space-y-10">
        <LegalParagraph className="text-right">
          最終更新日：2026年10月1日
        </LegalParagraph>

        <LegalParagraph>
          {siteConfig.siteName}
          （以下「本サービス」といいます。）は、
          {siteConfig.operator.name}
          （以下「運営者」といいます。）が個人として運営する非公式のウェブサイトです。本サービスをご利用いただく場合、以下の規約に同意いただいたものとみなします。
        </LegalParagraph>

        <section className="space-y-4">
          <LegalSectionTitle>第1条（本サービスの位置づけ）</LegalSectionTitle>
          <LegalList
            items={[
              `本サービスは、${siteConfig.councilName}で審議される議案等を、市民の皆さまにわかりやすく紹介することを目的としています。`,
              `本サービスは、${siteConfig.cityName}・${siteConfig.councilName}の公式サービスではありません。`,
              "本サービスは、政党チームみらいが運営しているものではありません。チームみらいが公開したオープンソースソフトウェア「みらい議会」をもとに、運営者が独自に運営しています。",
              "本サービスは、特定の政党・会派・議員・候補者を支持または批判することを目的としたものではありません。",
            ]}
          />
        </section>

        <section className="space-y-4">
          <LegalSectionTitle>第2条（禁止事項）</LegalSectionTitle>
          <LegalParagraph>
            ユーザーは、本サービスの利用にあたり、以下の行為を行ってはなりません。
          </LegalParagraph>
          <LegalList
            items={[
              "法令または公序良俗に違反する行為。",
              "本サービスの運営を妨げる行為（サーバへの過剰な負荷、システムへの不正アクセス・妨害等）。",
              "自動化ツール、ボット等による過度なアクセス。",
              "本サービスの掲載内容を改ざん・加工し、事実と異なる形や誤解を招く形で利用する行為。",
              "運営者、他の人物または団体になりすます行為。",
              "その他、運営者が不適切と判断する行為。",
            ]}
          />
        </section>

        <section className="space-y-4">
          <LegalSectionTitle>第3条（掲載情報について）</LegalSectionTitle>
          <LegalList
            items={[
              `議案の名称、審議状況、議決結果等は、${siteConfig.councilName}の公式サイト等で公開されている情報をもとに掲載しています。`,
              "議案の解説文は、公式資料をもとに運営者が作成したものであり、市・市議会の公式見解ではありません。",
              `正確な内容および最新の情報については、必ず${siteConfig.councilName}の公式サイト等の一次情報をご確認ください。`,
            ]}
          />
        </section>

        <section className="space-y-4">
          <LegalSectionTitle>第4条（知的財産権）</LegalSectionTitle>
          <LegalList
            items={[
              "本サービスのプログラムは、GNU Affero General Public License v3.0（AGPL-3.0）に基づくオープンソースソフトウェアです。ソースコードは同ライセンスの条件に従って利用できます。",
              "運営者が作成した解説文・画像等の権利は運営者に帰属します。出典を明記した引用など、法令で認められる範囲でご利用ください。",
              "公式サイト等から掲載した情報の権利は、それぞれの権利者に帰属します。",
            ]}
          />
        </section>

        <section className="space-y-4">
          <LegalSectionTitle>第5条（情報に係る不保証・免責）</LegalSectionTitle>
          <LegalParagraph>
            運営者は、本サービスが提供する情報の正確性、完全性、最新性、有用性等について、いかなる保証も行いません。本サービスの利用により生じた損害について、運営者は一切の責任を負いません。
          </LegalParagraph>
        </section>

        <section className="space-y-4">
          <LegalSectionTitle>第6条（サービスの変更・停止）</LegalSectionTitle>
          <LegalParagraph>
            運営者は、ユーザーへの事前通知なく本サービスの内容を変更し、または提供を停止・終了できるものとし、それにより生じた損害について一切の責任を負いません。
          </LegalParagraph>
        </section>

        <section className="space-y-4">
          <LegalSectionTitle>第7条（規約の変更）</LegalSectionTitle>
          <LegalParagraph>
            運営者は必要に応じて本規約を変更することができます。変更後の規約は本サービス上に掲載した時点から効力を生じ、変更後にユーザーが本サービスを利用した場合、当該変更に同意したものとみなします。
          </LegalParagraph>
        </section>

        <section className="space-y-4">
          <LegalSectionTitle>第8条（準拠法・管轄）</LegalSectionTitle>
          <LegalParagraph>
            本規約は日本法に準拠し、本サービスに関連して生じる一切の紛争については、
            {siteConfig.operator.jurisdiction}
            を第一審の専属的合意管轄裁判所とします。
          </LegalParagraph>
        </section>
      </Container>
    </LegalPageLayout>
  );
}
