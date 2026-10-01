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
  title: `プライバシーポリシー | ${siteConfig.siteName}`,
  description: `${siteConfig.siteName}のプライバシーポリシー`,
};

export default function PrivacyPage() {
  return (
    <LegalPageLayout
      className="bg-transparent pt-24 md:pt-12"
      title="プライバシーポリシー"
      description={`${siteConfig.siteName}における利用者情報の取り扱いについてご説明します。`}
    >
      <Container className="space-y-8">
        <p className="text-sm text-mirai-text-muted">
          最終更新日：2026年10月1日
        </p>

        <LegalParagraph>
          {siteConfig.siteName}
          （以下「本サービス」といいます。）の運営者（
          {siteConfig.operator.name}
          。以下「運営者」といいます。）は、利用者の情報を以下のとおり取り扱います。
        </LegalParagraph>

        <section className="space-y-4">
          <LegalSectionTitle>1. 本サービスで取得する情報</LegalSectionTitle>
          <LegalParagraph>
            本サービスには、会員登録、投稿、AIとの対話など、利用者が個人情報を入力する機能はありません。本サービスで取得する情報は、以下に限られます。
          </LegalParagraph>
          <LegalList
            items={[
              "アクセス情報：閲覧したページ、アクセス日時、ブラウザ・端末の種類などの情報（後述の外部サービスによる）",
              "表示設定：解説の難易度やふりがな表示のオン・オフなど、利用者が選んだ表示設定（利用者の端末内のCookie・ローカルストレージに保存され、運営者が個人を識別する目的では使用しません）",
              "お問い合わせ内容：運営者へ連絡いただいた場合の、連絡に使われたアカウント名やメッセージの内容",
            ]}
          />
        </section>

        <section className="space-y-4">
          <LegalSectionTitle>2. 利用目的</LegalSectionTitle>
          <LegalList
            items={[
              "本サービスの提供・運営",
              "利用状況の把握と、本サービスの改善",
              "不正アクセスや障害への対応",
              "お問い合わせへの回答",
            ]}
          />
        </section>

        <section className="space-y-4">
          <LegalSectionTitle>3. 利用している外部サービス</LegalSectionTitle>
          <LegalParagraph>
            本サービスは、以下の外部サービスを利用しています。各サービスによる情報の取り扱いは、それぞれのサービス提供者のプライバシーポリシーに従います。
          </LegalParagraph>
          <LegalList
            items={[
              "Vercel（ウェブサイトの配信、表示速度の計測）",
              "Supabase（掲載データの保管）",
              ...(siteConfig.features.googleAnalytics
                ? [
                    "Google アナリティクス（アクセス解析。Cookieを使用し、個人を特定しない形で利用状況を収集します。ブラウザの設定によりCookieを無効にできます）",
                  ]
                : []),
              "ルビフル（一般財団法人ルビ財団。ふりがな表示のためのスクリプト）",
              "X（旧Twitter）（運営者へのお問い合わせ窓口）",
            ]}
          />
        </section>

        <section className="space-y-4">
          <LegalSectionTitle>4. 第三者への提供</LegalSectionTitle>
          <LegalParagraph>
            運営者は、以下の場合を除き、取得した情報を第三者に提供しません。
          </LegalParagraph>
          <LegalList
            items={[
              "本人の同意がある場合",
              "個人を特定できない統計情報として提供する場合",
              "法令に基づく開示請求があった場合",
              "人の生命・身体・財産の保護のために必要で、本人の同意を得ることが困難な場合",
            ]}
          />
        </section>

        <section className="space-y-4">
          <LegalSectionTitle>5. 保管期間</LegalSectionTitle>
          <LegalParagraph>
            お問い合わせの内容は、対応に必要な期間保管した後、削除します。アクセス情報の保管期間は、各外部サービスの定めに従います。
          </LegalParagraph>
        </section>

        <section className="space-y-4">
          <LegalSectionTitle>6. 改訂</LegalSectionTitle>
          <LegalParagraph>
            本ポリシーは必要に応じて改訂します。改訂後の内容は、本サービス上に掲載した時点から効力を生じます。
          </LegalParagraph>
        </section>

        <section className="space-y-4">
          <LegalSectionTitle>7. お問い合わせ窓口</LegalSectionTitle>
          <LegalParagraph>
            本ポリシーに関するお問い合わせは、下記までご連絡ください。
          </LegalParagraph>
          <LegalParagraph>運営者：{siteConfig.operator.name}</LegalParagraph>
          <LegalParagraph>
            <a
              href={siteConfig.operator.contactUrl}
              target="_blank"
              rel="noreferrer"
              className="underline underline-offset-2"
            >
              {siteConfig.operator.contactUrl}
            </a>
          </LegalParagraph>
        </section>
      </Container>
    </LegalPageLayout>
  );
}
