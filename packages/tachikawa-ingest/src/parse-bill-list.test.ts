import { readFileSync } from "node:fs";
import { resolve } from "node:path";
import { describe, expect, it } from "vitest";
import { parseBillList, stripFileSizeNote } from "./parse-bill-list";

const PAGE_URL =
  "https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html";
const fixture = readFileSync(
  resolve(__dirname, "__fixtures__/r8-3-bill-list.html"),
  "utf-8"
);

describe("parseBillList", () => {
  const rows = parseBillList(fixture, PAGE_URL);

  it("議案一覧の表から全22件を読み取る", () => {
    expect(rows).toHaveLength(22);
    expect(rows[0].number).toBe("議案第95号");
    expect(rows[21].number).toBe("議案第116号");
  });

  it("議案名からPDFサイズ表記と前後の空白を取り除く", () => {
    expect(rows[0].name).toBe("令和7年度立川市一般会計歳入歳出決算");
    expect(rows[7].name).toBe("令和8年度立川市一般会計補正予算(第3号)");
  });

  it("PDFのリンクを絶対URLにする", () => {
    expect(rows[7].pdfUrl).toBe(
      "https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian102.pdf"
    );
  });

  it("付託委員会と議決結果を読み取り、空欄は null にする", () => {
    expect(rows[0].committeeName).toBe("決算特別委員会");
    expect(rows[0].decisionText).toBeNull();
    expect(rows[7].committeeName).toBe("付託省略");
    expect(rows[7].decisionText).toBe("令和8年9月10日、可決");
    expect(rows[17].committeeName).toBeNull();
  });

  it("表の区分を caption から取る", () => {
    expect(rows[0].category).toBe("市長提出議案");
  });

  it("caption に「議案一覧」を含まない表は無視する", () => {
    const html = `<table><tr><td>a</td><td>b</td><td>c</td><td>d</td></tr></table>`;
    expect(parseBillList(html, PAGE_URL)).toEqual([]);
  });
});

describe("stripFileSizeNote", () => {
  it("全角・半角括弧のファイル表記を取り除く", () => {
    expect(stripFileSizeNote("条例 （PDF 47.7 KB）")).toBe("条例");
    expect(stripFileSizeNote("条例 (PDF 1.2 MB)")).toBe("条例");
  });

  it("議案名の中の括弧は残す", () => {
    expect(stripFileSizeNote("補正予算(第3号) （PDF 993.0 KB）")).toBe(
      "補正予算(第3号)"
    );
  });
});
