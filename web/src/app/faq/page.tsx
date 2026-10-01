import type { Metadata } from "next";
import Link from "next/link";
import { Container } from "@/components/layouts/container";
import { routes } from "@/lib/routes";
import {
  LegalPageLayout,
  LegalParagraph,
  LegalSectionTitle,
} from "@/components/layouts/legal-page-layout";
import { siteConfig } from "@/config/site.config";

export const metadata: Metadata = {
  title: `よくあるご質問 | ${siteConfig.siteName}`,
  description: `${siteConfig.siteName}に関するよくあるご質問`,
};

type FaqItem = {
  question: string;
  answer: React.ReactNode;
};

const faqs: FaqItem[] = [
  {
    question: `${siteConfig.siteName}とは何ですか？`,
    answer: (
      <>
        {siteConfig.siteDescription}。{siteConfig.councilName}
        で審議される議案の内容や審議の状況を、市民の皆さまが把握しやすくすることを目的とした、個人運営の非公式サイトです。
      </>
    ),
  },
  {
    question: "チームみらいの公式サービスですか？",
    answer: (
      <>
        いいえ、{siteConfig.siteName}
        はチームみらいの公式サービスではありません。「チームみらい」が開発・公開した「みらい議会」をベースに、有志が独自に運営している非公式サービスです。
        <br />
        ご意見・不具合等は、チームみらい公式ではなく、運営者（
        <a
          href={siteConfig.operator.contactUrl}
          target="_blank"
          rel="noreferrer"
          className="underline underline-offset-2"
        >
          {siteConfig.operator.name}
        </a>
        ）にご連絡ください。
      </>
    ),
  },
  {
    question: "議案の情報はどこから取得していますか？",
    answer: (
      <>
        <a
          href={siteConfig.councilBillsDetailUrl}
          target="_blank"
          rel="noreferrer"
          className="underline underline-offset-2"
        >
          {siteConfig.councilName}公式サイト
        </a>
        に公開されている情報をもとに掲載しています。最新情報や正確な内容については公式サイトをご確認ください。
      </>
    ),
  },
  {
    question: `${siteConfig.cityName}・${siteConfig.councilName}の公式サービスですか？`,
    answer: (
      <>
        いいえ、{siteConfig.cityName}・{siteConfig.councilName}
        の公式サービスではありません。市民有志（運営者個人）による非公式のサイトです。
      </>
    ),
  },
  {
    question: "議案の解説は誰が書いていますか？正確ですか？",
    answer:
      "解説文は、公式に公開されている議案書などの資料をもとに運営者が作成しています（作成の補助にAIツールを使うことがありますが、掲載前に運営者が内容を確認しています）。わかりやすさを優先して要約しているため、正確性・完全性・最新性を保証するものではありません。重要な判断の際は必ず公式情報をご確認ください。",
  },
  {
    question: "特定の政党や会派を応援するサイトですか？",
    answer:
      "いいえ。特定の政党・会派・議員を支持または批判することを目的としたものではありません。議案の内容をできるだけ中立にわかりやすく紹介することを目指しています。",
  },
  {
    question: "個人情報はどのように扱われますか？",
    answer: (
      <>
        詳細は
        <Link href={routes.privacy()} className="underline underline-offset-2">
          プライバシーポリシー
        </Link>
        をご確認ください。本サイトには、会員登録や投稿など個人情報を入力する機能はありません。
      </>
    ),
  },
  {
    question: "不具合や意見はどこに連絡すればいいですか？",
    answer: (
      <>
        運営者（
        <a
          href={siteConfig.operator.contactUrl}
          target="_blank"
          rel="noreferrer"
          className="underline underline-offset-2"
        >
          {siteConfig.operator.name}
        </a>
        ）までご連絡ください。なお、チームみらいの公式窓口への連絡はご遠慮ください。
      </>
    ),
  },
  {
    question: "「注目の議案」はどのような基準で選ばれているのでしょうか？",
    answer: (
      <>
        議案の内容や報道の状況などを見ながら、注目度の高い議案を運営者が選定しています。
      </>
    ),
  },
  {
    question: "ふりがな（ルビ）はどのようにふっているのですか？",
    answer: (
      <>
        ふりがな（ルビ）は、一般財団法人ルビ財団の「ルビフルボタン」というサービスを使用して、自動で表示しています。
        固有名詞などふりがなが不正確な箇所については、今後手動で正しいふりがなに変更していく予定です。
      </>
    ),
  },
];

export default function FaqPage() {
  return (
    <LegalPageLayout
      title="よくあるご質問"
      description={`${siteConfig.siteName}に関するよくあるご質問をまとめています。`}
      className="pt-24 md:pt-12"
    >
      <Container className="space-y-10">
        {faqs.map((faq) => (
          <section key={faq.question} className="space-y-3">
            <LegalSectionTitle>{faq.question}</LegalSectionTitle>
            <LegalParagraph>{faq.answer}</LegalParagraph>
          </section>
        ))}
      </Container>
    </LegalPageLayout>
  );
}
