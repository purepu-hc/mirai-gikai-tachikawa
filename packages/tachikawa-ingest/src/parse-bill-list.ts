import { parse } from "parse5";

/** 議案一覧の1行分 */
export type BillListRow = {
  /** 表の区分（例: 市長提出議案、議員提出議案、委員会提出議案） */
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
 * 立川市議会「議案一覧」ページのHTMLから議案の行を取り出す。
 * caption に「議案一覧」を含む表だけを対象にする（検索ボックス等の表は無視）。
 */
export function parseBillList(html: string, pageUrl: string): BillListRow[] {
  const document = parse(html) as unknown as Node;
  const rows: BillListRow[] = [];

  for (const table of findAll(document, "table")) {
    const caption = findAll(table, "caption")[0];
    const captionText = caption ? normalizeSpace(textOf(caption)) : "";
    if (!captionText.includes("議案一覧")) continue;
    const category = captionText.replace(/一覧$/, "");

    for (const tr of findAll(table, "tr")) {
      const cells = children(tr).filter((c) => c.tagName === "td");
      if (cells.length < 4) continue; // 見出し行（th）などは飛ばす

      const [numberCell, nameCell, committeeCell, decisionCell] = cells;
      const link = findAll(nameCell, "a")[0];
      const href = link ? attr(link, "href") : null;

      const committee = normalizeSpace(textOf(committeeCell));
      const decision = normalizeSpace(textOf(decisionCell));

      rows.push({
        category,
        number: normalizeSpace(textOf(numberCell)).replace(/\s/g, ""),
        name: stripFileSizeNote(textOf(nameCell)),
        pdfUrl: href ? new URL(href, pageUrl).toString() : null,
        committeeName: committee === "" ? null : committee,
        decisionText: decision === "" ? null : decision,
      });
    }
  }

  return rows;
}
