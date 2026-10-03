import { parse } from "parse5";

/** 一覧表の種類（議案 or 請願・陳情） */
export type BillKind = "bill" | "petition";

/** 議案一覧（または請願・陳情一覧）の1行分 */
export type BillListRow = {
  /** 議案か請願・陳情か（DB の bills.bill_type に入る） */
  kind: BillKind;
  /** 表の区分（例: 市長提出議案、議員提出議案、請願、陳情） */
  category: string;
  /** 番号（例: 議案第95号） */
  number: string;
  /** 議案名（PDFサイズ表記を除いたもの） */
  name: string;
  /** 議案書PDFの絶対URL */
  pdfUrl: string | null;
  /** 付託委員会名（空欄なら null。「付託省略」はそのまま） */
  committeeName: string | null;
  /** 議決年月日、結果（空欄なら null） */
  decisionText: string | null;
};

// parse5 のノードを最小限の型で扱う
type Node = {
  nodeName: string;
  tagName?: string;
  value?: string;
  attrs?: { name: string; value: string }[];
  childNodes?: Node[];
};

function children(node: Node): Node[] {
  return node.childNodes ?? [];
}

function findAll(node: Node, tag: string, out: Node[] = []): Node[] {
  for (const child of children(node)) {
    if (child.tagName === tag) out.push(child);
    findAll(child, tag, out);
  }
  return out;
}

function textOf(node: Node): string {
  if (node.nodeName === "#text") return node.value ?? "";
  return children(node).map(textOf).join("");
}

function attr(node: Node, name: string): string | null {
  return node.attrs?.find((a) => a.name === name)?.value ?? null;
}

/** 連続する空白（全角含む）を1つにまとめ、前後を削る */
export function normalizeSpace(text: string): string {
  return text.replace(/[\s　]+/g, " ").trim();
}

/** 「令和7年度…決算 （PDF 47.7 KB）」からファイル表記を取り除く */
export function stripFileSizeNote(name: string): string {
  return normalizeSpace(
    name.replace(/[（(]\s*(PDF|Word|Excel)[^）)]*[）)]\s*$/i, "")
  );
}

/**
 * 番号の空白と、末尾の注記（例：「議案第78号（※）」の「（※）」）を取り除く
 */
export function normalizeBillNumber(text: string): string {
  return normalizeSpace(text)
    .replace(/\s/g, "")
    .replace(/[（(][^）)]*[）)]$/, "");
}

/**
 * 請願・陳情一覧の番号は「第1号」だけなので、表の区分（請願・陳情）を前に付ける。
 * 議案一覧のように番号に種別が入っている場合（議案第95号）はそのまま。
 */
export function withCategoryPrefix(number: string, category: string): string {
  if (!number.startsWith("第")) return number;
  if (category === "請願" || category === "陳情") return `${category}${number}`;
  return number;
}

/**
 * 表の caption から、どの一覧表かを判定する。対象外の表は null。
 * - 「議案一覧」を含む → 議案
 * - 「請願一覧」「陳情一覧」を含む → 請願・陳情
 */
export function detectTableKind(captionText: string): BillKind | null {
  if (captionText.includes("議案一覧")) return "bill";
  if (/(請願|陳情)一覧/.test(captionText)) return "petition";
  return null;
}

/**
 * 立川市議会「議案一覧」「請願・陳情一覧」ページのHTMLから行を取り出す。
 * caption で一覧表を見分け、それ以外の表（検索ボックス等）は無視する。
 *
 * 列は「番号・件名・…・付託委員会・結果」を想定し、番号と件名は先頭2列、
 * 付託委員会と結果は末尾2列から読む（請願表に提出者などの列が増えても読めるように）。
 */
export function parseBillList(html: string, pageUrl: string): BillListRow[] {
  const document = parse(html) as unknown as Node;
  const rows: BillListRow[] = [];

  for (const table of findAll(document, "table")) {
    const caption = findAll(table, "caption")[0];
    const captionText = caption ? normalizeSpace(textOf(caption)) : "";
    const kind = detectTableKind(captionText);
    if (!kind) continue;
    const category = captionText.replace(/一覧$/, "");

    for (const tr of findAll(table, "tr")) {
      const cells = children(tr).filter((c) => c.tagName === "td");
      if (cells.length < 4) continue; // 見出し行（th）などは飛ばす

      const [numberCell, nameCell] = cells;
      const committeeCell = cells[cells.length - 2];
      const decisionCell = cells[cells.length - 1];
      const link = findAll(nameCell, "a")[0];
      const href = link ? attr(link, "href") : null;

      const committee = normalizeSpace(textOf(committeeCell));
      const decision = normalizeSpace(textOf(decisionCell));

      rows.push({
        kind,
        category,
        number: withCategoryPrefix(normalizeBillNumber(textOf(numberCell)), category),
        name: stripFileSizeNote(textOf(nameCell)),
        pdfUrl: href ? new URL(href, pageUrl).toString() : null,
        committeeName: committee === "" ? null : committee,
        decisionText: decision === "" ? null : decision,
      });
    }
  }

  return rows;
}
