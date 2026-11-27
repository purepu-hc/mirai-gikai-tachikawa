/**
 * 立川市議会の議員（議員ページ用）。AI不使用・手で記載（出典は各項目のコメント）。
 *
 * 出典
 * - 現職28人の氏名・ふりがな・議席・会派: 市議会「50音順議員名簿」（2026年11月12日更新）
 *   https://www.city.tachikawa.lg.jp/shigikai/shokai/1007182.html
 * - 会派の構成: 市議会「会派・党派」（2026年7月23日更新）
 *   https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html
 * - 改選前（2022年7月14日〜2026年7月13日の任期）の議席: 令和8年第1回定例会 2月18日の会議録（出席議員）
 * - 改選前の会派: 市議会だより第342号・第343号 8面「各議案等に対する賛否」の会派欄
 * - 改選前の議員の読み: 運営者が確認（2026-11-27）
 * - 本人のHP・X: Project資料「議員の公開X・HP一覧」（2026-11-26調査。本人のものだけ）
 * - 議長・副議長: 市議会「歴代議長」「歴代副議長」（2026年7月23日更新）
 *
 * 会派の所属期間（startDate/endDate）は、届出日ではなく「出典で確認できた期間」。
 * - 現職: 任期の初日（2026-07-14）から
 * - 改選前: 令和8年第1回定例会の初日（2026-02-18）から任期満了（2026-07-13）まで
 *   （いしとび議員は第342号で「都民ファーストの会立川市議会」、第343号で「立川の未来」）
 */

export const MEIBO_URL =
  "https://www.city.tachikawa.lg.jp/shigikai/shokai/1007182.html";
export const FACTION_PAGE_URL =
  "https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html";
const DAYORI_342_URL =
  "https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf";
const DAYORI_343_URL =
  "https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/892/343-8.pdf";
const GICHO_URL =
  "https://www.city.tachikawa.lg.jp/shigikai/gicho-fukugicho/1007606.html";
const FUKUGICHO_URL =
  "https://www.city.tachikawa.lg.jp/shigikai/gicho-fukugicho/1007608.html";

/** HP・Xを確認した日 */
export const LINKS_CHECKED_AT = "2026-11-26";

export const TERM_2022 = { start: "2022-07-14", end: "2026-07-13" } as const;
export const TERM_2026 = { start: "2026-07-14" } as const;

export type MemberDef = {
  slug: string;
  /** 市議会名簿の表記（姓と名の間は全角スペース） */
  name: string;
  nameKana: string;
  homepageUrl: string | null;
  xUrl: string | null;
  isCurrent: boolean;
};

export type MemberTermDef = {
  slug: string;
  termStart: string;
  termEnd: string | null;
  seatNumber: number | null;
  endReason: string | null;
};

export type MemberFactionDef = {
  slug: string;
  /** factions.name */
  faction: string;
  startDate: string;
  endDate: string | null;
  sourceUrl: string;
};

export type MemberRoleDef = {
  slug: string;
  role: "議長" | "副議長";
  startDate: string;
  endDate: string | null;
  sourceUrl: string;
};

/** 50音順（市議会名簿の並び。改選前の議員も読みで同じ順に入れる） */
export const MEMBERS: MemberDef[] = [
  { slug: "asakawa-shuichi", name: "浅川　修一", nameKana: "あさかわ　しゅういち", homepageUrl: "http://senkyo.jcp-tokyo.net/asakawa/", xUrl: "https://x.com/asakawasyuuitij", isCurrent: true },
  { slug: "abe-misa", name: "あべ　みさ", nameKana: "あべ　みさ", homepageUrl: "https://abemisa.seikatsusha.me/", xUrl: "https://x.com/misa946", isCurrent: true },
  { slug: "ishitobi-kaori", name: "いしとび　かおり", nameKana: "いしとび　かおり", homepageUrl: "https://ishitobi.tokyo/", xUrl: "https://x.com/kaori_ishitobi", isCurrent: true },
  { slug: "ichinose-yoko", name: "いちのせ　陽子", nameKana: "いちのせ　ようこ", homepageUrl: "https://ichinoseyoko.jp/", xUrl: "https://x.com/youko_ichinose", isCurrent: true },
  { slug: "ito-yukihide", name: "伊藤　幸秀", nameKana: "いとう　ゆきひで", homepageUrl: "http://www.komei.or.jp/km/ito-yukihide/", xUrl: null, isCurrent: true },
  { slug: "inahashi-yumiko", name: "稲橋　ゆみ子", nameKana: "いなはし　ゆみこ", homepageUrl: "https://inahashiyumiko.jp/", xUrl: "https://x.com/YumikoInahashi", isCurrent: true },
  { slug: "uebayashi-takaya", name: "上林　たかや", nameKana: "うえばやし　たかや", homepageUrl: null, xUrl: null, isCurrent: true },
  { slug: "eguchi-genki", name: "江口　元気", nameKana: "えぐち　げんき", homepageUrl: "https://eguchi-genki.studio.site/", xUrl: "https://x.com/genkieguchi1", isCurrent: true },
  { slug: "ooishi-fumio", name: "大石　ふみお", nameKana: "おおいし　ふみお", homepageUrl: null, xUrl: null, isCurrent: false },
  { slug: "oosawa-junichi", name: "大沢　純一", nameKana: "おおさわ　じゅんいち", homepageUrl: "http://j-osawa.com/", xUrl: "https://x.com/jun1osawa", isCurrent: true },
  { slug: "kadokura-masako", name: "門倉　正子", nameKana: "かどくら　まさこ", homepageUrl: "http://www.komei.or.jp/km/tachikawa-kadokura-masako/", xUrl: "https://x.com/masako_kadokura", isCurrent: true },
  { slug: "kamijo-shoichi", name: "上條　彰一", nameKana: "かみじょう　しょういち", homepageUrl: null, xUrl: null, isCurrent: false },
  { slug: "kihara-hiroshi", name: "木原　宏", nameKana: "きはら　ひろし", homepageUrl: "https://kihara-hiroshi.jp/", xUrl: "https://x.com/kihara_hirosh", isCurrent: true },
  { slug: "kumekawa-toshio", name: "粂川　敏男", nameKana: "くめかわ　としお", homepageUrl: null, xUrl: null, isCurrent: false },
  { slug: "gondo-yoshitsugu", name: "権藤　よしつぐ", nameKana: "ごんどう　よしつぐ", homepageUrl: "https://gondou.net/", xUrl: "https://x.com/gondoyoshitsugu", isCurrent: true },
  { slug: "sasaki-takamasa", name: "佐々木　たかまさ", nameKana: "ささき　たかまさ", homepageUrl: "https://sasataka.com/", xUrl: "https://x.com/sasaki_takamasa", isCurrent: true },
  { slug: "se-nobuhiro", name: "瀬　順弘", nameKana: "せ　のぶひろ", homepageUrl: "http://www.komei.or.jp/km/tachikawa-se-nobuhiro/", xUrl: "https://x.com/se_nobu", isCurrent: true },
  { slug: "takaguchi-yasuhiko", name: "高口　靖彦", nameKana: "たかぐち　やすひこ", homepageUrl: null, xUrl: null, isCurrent: false },
  { slug: "takahata-nami", name: "髙畠　奈美", nameKana: "たかはた　なみ", homepageUrl: "https://takahata-nami.net/", xUrl: "https://x.com/takahatanami", isCurrent: true },
  { slug: "toyama-taro", name: "頭山　太郎", nameKana: "とうやま　たろう", homepageUrl: null, xUrl: null, isCurrent: true },
  { slug: "tomita-itaru", name: "冨田　いたる", nameKana: "とみた　いたる", homepageUrl: "https://www.itaru-tomita.com/", xUrl: "https://x.com/itaru1964", isCurrent: true },
  { slug: "nakai-akiko", name: "中井　あきこ", nameKana: "なかい　あきこ", homepageUrl: "https://lit.link/nakai-akiko", xUrl: "https://x.com/nakai_akikomei", isCurrent: true },
  { slug: "nakamachi-satoshi", name: "中町　聡", nameKana: "なかまち　さとし", homepageUrl: "https://jcp-tachikawa.jp/hp/giin#profile_nakamachi", xUrl: "https://x.com/Sts_Nakamachi", isCurrent: true },
  { slug: "nagamoto-kyoko", name: "永元　香子", nameKana: "ながもと　きょうこ", homepageUrl: "https://jcp-tachikawa.jp/hp/", xUrl: "https://x.com/kyoko8129", isCurrent: true },
  { slug: "nakayama-hitomi", name: "中山　ひと美", nameKana: "なかやま　ひとみ", homepageUrl: "http://www.nakayama-hitomi.jp/", xUrl: "https://x.com/nakayamahitomi", isCurrent: true },
  { slug: "hara-yuki", name: "原　ゆき", nameKana: "はら　ゆき", homepageUrl: "https://harayuki.com/", xUrl: "https://x.com/yukiharappa", isCurrent: true },
  { slug: "hiyama-shogo", name: "ひやま　昇吾", nameKana: "ひやま　しょうご", homepageUrl: "https://s-hiyama.com/", xUrl: "https://x.com/shtachikawa06", isCurrent: true },
  { slug: "fukushima-masami", name: "福島　正美", nameKana: "ふくしま　まさみ", homepageUrl: "https://www.komei.or.jp/km/tachikawa-fukushima-masami/", xUrl: "https://x.com/mamfunks1960", isCurrent: true },
  { slug: "yata-kazuhisa", name: "やた　一久", nameKana: "やた　かずひさ", homepageUrl: "https://1link.jp/kazuhisayata", xUrl: "https://x.com/kazuhisayata", isCurrent: true },
  { slug: "yamamoto-michiyo", name: "山本　みちよ", nameKana: "やまもと　みちよ", homepageUrl: null, xUrl: null, isCurrent: false },
  { slug: "yamamoto-yosuke", name: "山本　洋輔", nameKana: "やまもと　ようすけ", homepageUrl: "http://yamamoto-yosuke.com/", xUrl: "https://x.com/Y_Yamamoto1106", isCurrent: true },
  { slug: "wakaki-sanae", name: "若木　早苗", nameKana: "わかき　さなえ", homepageUrl: "https://jcp-tachikawa.jp/hp/", xUrl: "https://x.com/wakakisanae", isCurrent: true },
  { slug: "watanabe-chuji", name: "わたなべ　忠司", nameKana: "わたなべ　ちゅうじ", homepageUrl: "http://watanabe.chu.jp/", xUrl: "https://x.com/watanabe_chuji", isCurrent: true },
];

export const MEMBER_TERMS: MemberTermDef[] = [
  // 現任期（2026年7月14日〜）。議席は50音順議員名簿
  { slug: "asakawa-shuichi", termStart: TERM_2026.start, termEnd: null, seatNumber: 20, endReason: null },
  { slug: "abe-misa", termStart: TERM_2026.start, termEnd: null, seatNumber: 17, endReason: null },
  { slug: "ishitobi-kaori", termStart: TERM_2026.start, termEnd: null, seatNumber: 2, endReason: null },
  { slug: "ichinose-yoko", termStart: TERM_2026.start, termEnd: null, seatNumber: 9, endReason: null },
  { slug: "ito-yukihide", termStart: TERM_2026.start, termEnd: null, seatNumber: 26, endReason: null },
  { slug: "inahashi-yumiko", termStart: TERM_2026.start, termEnd: null, seatNumber: 22, endReason: null },
  { slug: "uebayashi-takaya", termStart: TERM_2026.start, termEnd: null, seatNumber: 8, endReason: null },
  { slug: "eguchi-genki", termStart: TERM_2026.start, termEnd: null, seatNumber: 11, endReason: null },
  { slug: "oosawa-junichi", termStart: TERM_2026.start, termEnd: null, seatNumber: 14, endReason: null },
  { slug: "kadokura-masako", termStart: TERM_2026.start, termEnd: null, seatNumber: 24, endReason: null },
  { slug: "kihara-hiroshi", termStart: TERM_2026.start, termEnd: null, seatNumber: 28, endReason: null },
  { slug: "gondo-yoshitsugu", termStart: TERM_2026.start, termEnd: null, seatNumber: 7, endReason: null },
  { slug: "sasaki-takamasa", termStart: TERM_2026.start, termEnd: null, seatNumber: 4, endReason: null },
  { slug: "se-nobuhiro", termStart: TERM_2026.start, termEnd: null, seatNumber: 13, endReason: null },
  { slug: "takahata-nami", termStart: TERM_2026.start, termEnd: null, seatNumber: 12, endReason: null },
  { slug: "toyama-taro", termStart: TERM_2026.start, termEnd: null, seatNumber: 27, endReason: null },
  { slug: "tomita-itaru", termStart: TERM_2026.start, termEnd: null, seatNumber: 1, endReason: null },
  { slug: "nakai-akiko", termStart: TERM_2026.start, termEnd: null, seatNumber: 6, endReason: null },
  { slug: "nakamachi-satoshi", termStart: TERM_2026.start, termEnd: null, seatNumber: 19, endReason: null },
  { slug: "nagamoto-kyoko", termStart: TERM_2026.start, termEnd: null, seatNumber: 18, endReason: null },
  { slug: "nakayama-hitomi", termStart: TERM_2026.start, termEnd: null, seatNumber: 10, endReason: null },
  { slug: "hara-yuki", termStart: TERM_2026.start, termEnd: null, seatNumber: 15, endReason: null },
  { slug: "hiyama-shogo", termStart: TERM_2026.start, termEnd: null, seatNumber: 3, endReason: null },
  { slug: "fukushima-masami", termStart: TERM_2026.start, termEnd: null, seatNumber: 25, endReason: null },
  { slug: "yata-kazuhisa", termStart: TERM_2026.start, termEnd: null, seatNumber: 5, endReason: null },
  { slug: "yamamoto-yosuke", termStart: TERM_2026.start, termEnd: null, seatNumber: 16, endReason: null },
  { slug: "wakaki-sanae", termStart: TERM_2026.start, termEnd: null, seatNumber: 21, endReason: null },
  { slug: "watanabe-chuji", termStart: TERM_2026.start, termEnd: null, seatNumber: 23, endReason: null },
  // 前の任期（2022年7月14日〜2026年7月13日）。議席は令和8年第1回定例会の会議録
  { slug: "asakawa-shuichi", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 18, endReason: "任期満了" },
  { slug: "abe-misa", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 2, endReason: "任期満了" },
  { slug: "ishitobi-kaori", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 5, endReason: "任期満了" },
  { slug: "ito-yukihide", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 26, endReason: "任期満了" },
  { slug: "inahashi-yumiko", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 21, endReason: "任期満了" },
  { slug: "eguchi-genki", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 10, endReason: "任期満了" },
  { slug: "ooishi-fumio", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 15, endReason: "任期満了" },
  { slug: "oosawa-junichi", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 13, endReason: "任期満了" },
  { slug: "kadokura-masako", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 14, endReason: "任期満了" },
  { slug: "kamijo-shoichi", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 20, endReason: "任期満了" },
  { slug: "kumekawa-toshio", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 8, endReason: "任期満了" },
  { slug: "se-nobuhiro", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 12, endReason: "任期満了" },
  { slug: "takaguchi-yasuhiko", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 23, endReason: "任期満了" },
  { slug: "takahata-nami", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 7, endReason: "任期満了" },
  { slug: "toyama-taro", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 11, endReason: "任期満了" },
  { slug: "nakamachi-satoshi", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 19, endReason: "任期満了" },
  { slug: "nagamoto-kyoko", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 1, endReason: "任期満了" },
  { slug: "nakayama-hitomi", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 22, endReason: "任期満了" },
  { slug: "hara-yuki", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 3, endReason: "任期満了" },
  { slug: "fukushima-masami", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 25, endReason: "任期満了" },
  { slug: "yamamoto-michiyo", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 24, endReason: "任期満了" },
  { slug: "yamamoto-yosuke", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 4, endReason: "任期満了" },
  { slug: "wakaki-sanae", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 17, endReason: "任期満了" },
  { slug: "watanabe-chuji", termStart: TERM_2022.start, termEnd: TERM_2022.end, seatNumber: 16, endReason: "任期満了" },
];

export const MEMBER_FACTIONS: MemberFactionDef[] = [
  { slug: "asakawa-shuichi", faction: "日本共産党", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "abe-misa", faction: "立憲ネット緑たちかわ", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "ishitobi-kaori", faction: "立川の未来", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "ichinose-yoko", faction: "たちかわ自由民主党 参政党", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "ito-yukihide", faction: "公明党", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "inahashi-yumiko", faction: "立憲ネット緑たちかわ", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "uebayashi-takaya", faction: "たちかわ自由民主党 参政党", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "eguchi-genki", faction: "自民党安進会・維新の会", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "oosawa-junichi", faction: "公明党", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "kadokura-masako", faction: "公明党", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "kihara-hiroshi", faction: "自民党安進会・維新の会", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "gondo-yoshitsugu", faction: "自民党安進会・維新の会", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "sasaki-takamasa", faction: "立川けやき会", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "se-nobuhiro", faction: "公明党", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "takahata-nami", faction: "自民党安進会・維新の会", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "toyama-taro", faction: "自民党安進会・維新の会", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "tomita-itaru", faction: "日本保守党", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "nakai-akiko", faction: "公明党", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "nakamachi-satoshi", faction: "日本共産党", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "nagamoto-kyoko", faction: "日本共産党", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "nakayama-hitomi", faction: "たちかわ自由民主党 参政党", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "hara-yuki", faction: "立憲ネット緑たちかわ", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "hiyama-shogo", faction: "立川けやき会", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "fukushima-masami", faction: "公明党", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "yata-kazuhisa", faction: "立川けやき会", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "yamamoto-yosuke", faction: "立憲ネット緑たちかわ", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "wakaki-sanae", faction: "日本共産党", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  { slug: "watanabe-chuji", faction: "立憲ネット緑たちかわ", startDate: TERM_2026.start, endDate: null, sourceUrl: FACTION_PAGE_URL },
  // 前の任期
  { slug: "asakawa-shuichi", faction: "日本共産党", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "abe-misa", faction: "立憲ネット緑たちかわ", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "ito-yukihide", faction: "公明党", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "inahashi-yumiko", faction: "立憲ネット緑たちかわ", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "ooishi-fumio", faction: "国民民主党", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "oosawa-junichi", faction: "公明党", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "kadokura-masako", faction: "公明党", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "kamijo-shoichi", faction: "日本共産党", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "kumekawa-toshio", faction: "自由民主党", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "se-nobuhiro", faction: "公明党", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "takaguchi-yasuhiko", faction: "公明党", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "takahata-nami", faction: "たちかわ自民党", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "toyama-taro", faction: "安進会", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "nakamachi-satoshi", faction: "日本共産党", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "nagamoto-kyoko", faction: "日本共産党", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "nakayama-hitomi", faction: "自民党クラブ", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "hara-yuki", faction: "立憲ネット緑たちかわ", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "fukushima-masami", faction: "公明党", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "yamamoto-michiyo", faction: "公明党", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "yamamoto-yosuke", faction: "立憲ネット緑たちかわ", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "wakaki-sanae", faction: "日本共産党", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "watanabe-chuji", faction: "立憲ネット緑たちかわ", startDate: "2026-02-18", endDate: TERM_2022.end, sourceUrl: DAYORI_342_URL },
  { slug: "ishitobi-kaori", faction: "都民ファーストの会立川市議会", startDate: "2026-02-18", endDate: "2026-03-24", sourceUrl: DAYORI_342_URL },
  { slug: "ishitobi-kaori", faction: "立川の未来", startDate: "2026-05-07", endDate: TERM_2022.end, sourceUrl: DAYORI_343_URL },
  // 江口議員は改選前、賛否表の会派名の欄が空白（会派を構成しない議員）のため登録しない
];

/** 登録した任期に関係する議長・副議長（歴代議長・歴代副議長のページ） */
export const MEMBER_ROLES: MemberRoleDef[] = [
  { slug: "toyama-taro", role: "議長", startDate: "2023-09-25", endDate: "2024-06-26", sourceUrl: GICHO_URL },
  { slug: "fukushima-masami", role: "議長", startDate: "2024-06-26", endDate: "2026-07-13", sourceUrl: GICHO_URL },
  { slug: "kihara-hiroshi", role: "議長", startDate: "2026-07-21", endDate: null, sourceUrl: GICHO_URL },
  { slug: "takaguchi-yasuhiko", role: "副議長", startDate: "2022-07-21", endDate: "2024-06-26", sourceUrl: FUKUGICHO_URL },
  { slug: "ooishi-fumio", role: "副議長", startDate: "2024-06-26", endDate: "2026-07-13", sourceUrl: FUKUGICHO_URL },
  { slug: "oosawa-junichi", role: "副議長", startDate: "2026-07-21", endDate: null, sourceUrl: FUKUGICHO_URL },
];
