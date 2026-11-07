/** 金額はすべて千円単位（予算書・決算統計の表記のまま） */

export interface BudgetJigyo {
  no: number;
  name: string;
  /** 担当課 */
  ka: string;
  amt: number;
  /** 特定財源（国・都の支出金、市債、使用料など使い道が決まったお金） */
  tokutei: number;
  /** 一般財源（使い道が決まっていないお金） */
  ippan: number;
  note?: string;
}

export interface BudgetMoku {
  code: number;
  name: string;
  amt: number;
  prev: number | null;
  jigyo: BudgetJigyo[];
}

export interface BudgetKou {
  code: number;
  name: string;
  amt: number;
  prev?: number | null;
  moku: BudgetMoku[];
}

export interface Zaigen {
  kokuto: number;
  chihousai: number;
  sonota: number;
  ippan: number;
}

export interface SaishutsuKan {
  code: number;
  name: string;
  amt: number;
  prev: number;
  kou: BudgetKou[];
  zaigen: Zaigen;
}

export interface SainyuKan {
  code: number;
  name: string;
  amt: number;
  prev: number;
  kou: { code: number; name: string; amt: number }[];
}

export interface CityBudget {
  meta: {
    city: string;
    fiscal: string;
    kind: string;
    unit: string;
    total: number;
    prev_total: number;
    source: string;
    source_url: string;
  };
  sainyu: SainyuKan[];
  saishutsu: SaishutsuKan[];
}

export interface ComparisonCity {
  code: string;
  name: string;
  /** 住民基本台帳人口 */
  pop: number;
  area: number;
  zaiseiryoku: number;
  keijo: number;
  /** 歳出総額（千円） */
  total: number;
  kan: Record<string, { amt: number; sub: Record<string, number> }>;
}

export interface ComparisonData {
  meta: {
    source: string;
    unit: string;
    pop_basis: string;
    urls: string[];
    page: string;
  };
  kan_order: string[];
  cities: ComparisonCity[];
}
