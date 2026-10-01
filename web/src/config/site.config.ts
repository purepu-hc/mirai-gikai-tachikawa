/**
 * サイト設定ファイル
 * Fork して別の地方議会向けに使用する場合はこのファイルを変更してください。
 * @see docs/kawasaki/20260304_1000_別地域向けfork手順.md
 */
export const siteConfig = {
  siteName: "みらい議会＠立川市",
  siteDescription:
    "立川市議会で今どんな議案が検討されているか、わかりやすく伝えるプラットフォームです",
  cityName: "立川市",
  councilName: "立川市議会",
  keywords: [
    "みらい議会＠立川市",
    "議案",
    "立川市",
    "市議会",
    "地方政治",
    "政策",
    "解説",
  ],
  councilBaseUrl: "https://www.city.tachikawa.lg.jp/shigikai/",
  /** 議案・議決結果の一覧ページ */
  councilBillsDetailUrl:
    "https://www.city.tachikawa.lg.jp/shigikai/gian/1007177.html",
  twitterHashtag: "みらい議会立川市", // # なし
  externalLinks: {
    /** 問題報告先（専用フォームを用意するまでは GitHub Issues） */
    report: "https://github.com/purepu-hc/mirai-gikai-tachikawa/issues/new",
    aboutNote: "",
    donation: "https://team-mir.ai/support/donation",
    teamAbout: "https://team-mir.ai/about",
    /** 規約類は本サービス内のページを使う（チームみらいの規約には飛ばさない） */
    terms: "/terms",
    privacy: "/privacy",
    faq: "/faq",
    /** AGPL-3.0 第13条: 改変後ソースコードの入手先 */
    sourceCode: "https://github.com/purepu-hc/mirai-gikai-tachikawa",
    /** 本家「みらい議会」（FORK_GUIDELINES 推奨リンク） */
    upstreamService: "https://gikai.team-mir.ai/",
  },
  /**
   * ページを管理する政党名（空文字列の場合は政党名を省略した汎用表現を使用）
   * 例: "チームみらい"
   */
  managingParty: "" as string,
  /**
   * サービス運営者情報
   * 利用規約や問い合わせ先に使用します。
   * TODO: 公開前に運営者名・問い合わせ先を確定する
   */
  operator: {
    name: "みらい議会＠立川市 運営者（市民有志）" as string,
    contactUrl:
      "https://github.com/purepu-hc/mirai-gikai-tachikawa/issues" as string,
    /** 利用規約の準拠法・管轄裁判所（第一審の専属的合意管轄） */
    jurisdiction: "東京地方裁判所立川支部" as string,
  },
  /**
   * AI機能の有効/無効設定
   * 本番環境のコスト管理のため、機能ごとにオン/オフを切り替えられます。
   * 立川市版は API 費用を発生させない方針のため、すべて無効にしています。
   */
  features: {
    /** AIチャット機能（議案への質問・テキスト選択からの質問）*/
    aiChat: false,
    /** AIインタビュー機能（議案当事者へのヒアリング）*/
    aiInterview: false,
    /**
     * チームみらいセクションの表示（トップページ・フッター・デスクトップメニュー）
     * 非公式運営など、党の公式サービスとして出さない場合は false にする。
     */
    showTeamMiraiSection: false as boolean,
  },
} as const;
