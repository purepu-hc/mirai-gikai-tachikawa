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
  /** 各定例会・臨時会の概要（年ごとの会期の一覧） */
  councilSessionsUrl:
    "https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/index.html",
  /** 請願と陳情の提出方法（市議会の公式ページ） */
  petitionGuideUrl:
    "https://www.city.tachikawa.lg.jp/shigikai/gian/1007179.html",
  /**
   * 定例会の枠（トップページの年間パネル用）。例年の開催月と主な審議内容。
   * 出典：令和7年第4回・令和8年第1〜3回定例会の日程表
   */
  regularSessionSlots: [
    {
      number: 1,
      monthsLabel: "2〜3月",
      startMonth: 2,
      endMonth: 3,
      description: "新しい年度の予算を決める",
    },
    {
      number: 2,
      monthsLabel: "5月",
      startMonth: 5,
      endMonth: 5,
      description: "条例の改正や補正予算などを審議",
    },
    {
      number: 3,
      monthsLabel: "9〜10月",
      startMonth: 9,
      endMonth: 10,
      description: "前の年度の決算や補正予算などを審議",
    },
    {
      number: 4,
      monthsLabel: "11〜12月",
      startMonth: 11,
      endMonth: 12,
      description: "年内最後の議案を審議",
    },
  ],
  twitterHashtag: "みらい議会立川市", // # なし
  externalLinks: {
    /** 問題報告先（みらい議会＠立川市の X アカウント） */
    report: "https://x.com/miraigikai_tckw",
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
   */
  operator: {
    name: "ぷれ" as string,
    contactUrl: "https://x.com/miraigikai_tckw" as string,
    /** 利用規約の準拠法・管轄裁判所（第一審の専属的合意管轄） */
    jurisdiction: "東京地方裁判所立川支部" as string,
  },
  /**
   * AI機能の有効/無効設定
   * 本番環境のコスト管理のため、機能ごとにオン/オフを切り替えられます。
   * 立川市版は API 費用を発生させない方針のため、AI機能はすべて無効にしています。
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
    /**
     * Google アナリティクス（アクセス解析）
     * true かつ環境変数 NEXT_PUBLIC_GA_TRACKING_ID が設定されている場合のみ計測する。
     * プライバシーポリシーの記載もこの値で自動的に切り替わる。
     */
    googleAnalytics: false as boolean,
  },
} as const;
