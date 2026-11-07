/**
 * 予算の見える化で使う、款ごとのやさしい説明と色分け。
 * 説明は予算書・決算統計の分類の中身を言いかえたもので、評価を含めない。
 */

/** 歳入の款を、似た種類ごとに色分けするためのグループ（色だけに使う） */
// Tailwind は文字列を組み立てたクラス名を生成しないため、
// 線用の stroke クラスも省略せずに書いておく。
export const REVENUE_COLOR_GROUPS: {
  className: string;
  strokeClassName: string;
  codes: number[];
}[] = [
  {
    className: "fill-budget-tax",
    strokeClassName: "stroke-budget-tax",
    codes: [1],
  },
  {
    className: "fill-budget-kuni",
    strokeClassName: "stroke-budget-kuni",
    codes: [16],
  },
  {
    className: "fill-budget-to",
    strokeClassName: "stroke-budget-to",
    codes: [17],
  },
  {
    className: "fill-budget-kofu",
    strokeClassName: "stroke-budget-kofu",
    codes: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13],
  },
  {
    className: "fill-budget-kikin",
    strokeClassName: "stroke-budget-kikin",
    codes: [20],
  },
  {
    className: "fill-budget-shiyo",
    strokeClassName: "stroke-budget-shiyo",
    codes: [15],
  },
  {
    className: "fill-budget-sai",
    strokeClassName: "stroke-budget-sai",
    codes: [23],
  },
  {
    className: "fill-budget-etc",
    strokeClassName: "stroke-budget-etc",
    codes: [14, 18, 19, 21, 22],
  },
];

function revenueGroup(code: number) {
  return (
    REVENUE_COLOR_GROUPS.find((g) => g.codes.includes(code)) ??
    REVENUE_COLOR_GROUPS[REVENUE_COLOR_GROUPS.length - 1]
  );
}

export function revenueFillClass(code: number): string {
  return revenueGroup(code).className;
}

/** 流れ図の線の色（四角と同じ色の stroke クラス） */
export function revenueStrokeClass(code: number): string {
  return revenueGroup(code).strokeClassName;
}

/** 歳入の款のひとこと説明（款の番号ごと） */
export const REVENUE_DESC: Record<number, string> = {
  1: "立川市が自分で集める税金",
  7: "国や都が集めた消費税の一部が市に配られるもの",
  15: "施設の使用料や、証明書の手数料など",
  16: "国が使い道を決めて市に渡すお金（児童手当・生活保護など）",
  17: "東京都が使い道を決めて市に渡すお金",
  20: "市の基金（貯金）や他の会計から持ってくるお金",
  21: "前の年度に使い切らずに残ったお金",
  22: "競輪の収益事業収入、貸付金の返済、雑入など",
  23: "施設の建設などのために借りるお金（市の借金）",
};

/** 立川市の予算書（一般会計・歳出）の款のひとこと説明 */
export const EXPENDITURE_DESC: Record<string, string> = {
  議会費: "市議会の運営（議員報酬、会議録の作成、議会報など）",
  総務費:
    "市役所全体の運営、税の徴収、戸籍・住民票、選挙、統計、基金への積み立てなど",
  民生費:
    "福祉。子育て・保育、高齢者、障害のある人、生活保護、国民健康保険などへの繰出し",
  衛生費: "健康づくり・予防接種・健診と、ごみ・し尿の処理",
  労働費: "働く人の支援（就労支援など）",
  農林費: "市内の農業の支援、農業委員会",
  商工費: "商店・企業の支援、観光、消費生活の相談",
  土木費: "道路・橋、公園、まちづくり、市営住宅、下水道事業への繰出し",
  消防費: "常備消防の委託、消防団、防災",
  教育費:
    "小中学校、幼稚園、図書館、生涯学習、スポーツ施設、学校給食の共同調理場",
  公債費: "これまでに借りたお金（市債）の返済と利子",
  予備費: "予想していなかった支出に備えて、使い道を決めずにとっておくお金",
};

/** 総務省の決算統計（普通会計）の款のひとこと説明 */
export const COMPARE_DESC: Record<string, string> = {
  議会費: "市議会の運営",
  総務費: "市役所全体の運営、税の徴収、戸籍、選挙など",
  民生費: "福祉（子ども・高齢者・障害・生活保護など）",
  衛生費: "健康づくり、ごみ処理など",
  労働費: "働く人の支援",
  農林水産業費: "農業の支援など",
  商工費: "商店・企業の支援、観光",
  土木費: "道路・公園・まちづくり・下水道など",
  消防費: "消防・防災",
  教育費: "学校・図書館・スポーツ・給食など",
  災害復旧費: "災害で壊れた施設の復旧",
  公債費: "借りたお金の返済と利子",
};

export const BUDGET_WORDS: [string, string][] = [
  [
    "一般会計",
    "市の基本的な仕事のお金をまとめた「財布」。このほかに国民健康保険・介護保険・競輪事業などの「特別会計」と、下水道事業会計があります。",
  ],
  [
    "当初予算",
    "年度が始まる前に議会で決めた、1年分の予定。年度の途中で「補正予算」で増減することがあります。実際に使った額は「決算」でわかります。",
  ],
  [
    "歳入・歳出",
    "歳入は1年間に入ってくるお金、歳出は1年間に使うお金。一般会計では必ず同じ額になるように組みます。",
  ],
  [
    "款・項・目",
    "予算の分類の大きさ。款（かん）がいちばん大きく、項（こう）、目（もく）の順に細かくなります。その下に、市が行う「事業」が並びます。",
  ],
  [
    "一般財源",
    "市税など、使い道が決まっていないお金。市が自分の判断で使い道を決められます。",
  ],
  [
    "特定財源",
    "国や都からの補助金、使用料、市債など、使い道が決まって入ってくるお金。",
  ],
  [
    "繰出金（くりだしきん）",
    "一般会計から、国民健康保険・介護保険・後期高齢者医療・下水道事業などの別の会計へ送るお金。",
  ],
  [
    "市債",
    "市の借金。学校や施設を建てるときなど、何年もかけて返すお金を借ります。返済は「公債費」として毎年の歳出に出てきます。",
  ],
  [
    "千円単位",
    "予算書の数字はすべて千円単位です。このページでは読みやすくするため「億円」「万円」に直しています（四捨五入あり）。",
  ],
];
