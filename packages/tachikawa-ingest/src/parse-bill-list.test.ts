import { readFileSync } from "node:fs";
import { resolve } from "node:path";
import { describe, expect, it } from "vitest";
import {
  detectTableKind,
  normalizeBillNumber,
  parseBillList,
  stripFileSizeNote,
  withCategoryPrefix,
  withPetitionYear,
} from "./parse-bill-list";

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

  it("議案の表は kind を bill にする", () => {
    expect(rows.every((r) => r.kind === "bill")).toBe(true);
  });

  it("caption に「議案一覧」を含まない表は無視する", () => {
    const html = `<table><tr><td>a</td><td>b</td><td>c</td><td>d</td></tr></table>`;
    expect(parseBillList(html, PAGE_URL)).toEqual([]);
  });
});

describe("detectTableKind", () => {
  it("caption で議案・請願・陳情の表を見分ける", () => {
    expect(detectTableKind("市長提出議案一覧")).toBe("bill");
    expect(detectTableKind("請願一覧")).toBe("petition");
    expect(detectTableKind("陳情一覧")).toBe("petition");
    expect(detectTableKind("検索")).toBeNull();
  });
});

describe("parseBillList（請願・陳情）", () => {
  const PETITION_URL =
    "https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028162.html";
  const rows = parseBillList(
    readFileSync(
      resolve(__dirname, "__fixtures__/r8-3-petition-list.html"),
      "utf-8"
    ),
    PETITION_URL
  );

  it("請願1件・陳情3件を kind petition で読み取る", () => {
    expect(rows).toHaveLength(4);
    expect(rows.every((r) => r.kind === "petition")).toBe(true);
    expect(rows.map((r) => r.category)).toEqual([
      "請願",
      "陳情",
      "陳情",
      "陳情",
    ]);
  });

  it("「第1号」だけの番号に請願・陳情と、資料PDFの年を付ける", () => {
    expect(rows.map((r) => r.number)).toEqual([
      "令和8年請願第1号",
      "令和8年陳情第11号",
      "令和8年陳情第12号",
      "令和8年陳情第13号",
    ]);
  });

  it("件名・PDF・付託委員会を読み取り、未議決の結果は null", () => {
    expect(rows[0].name).toBe("重度障害者等就労支援特別事業の実施を求める請願");
    expect(rows[0].pdfUrl).toBe(
      "https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8seigan01-2.pdf"
    );
    expect(rows[2].committeeName).toBe("総務委員会");
    expect(rows[0].decisionText).toBeNull();
  });

  it("列が増えても、付託委員会と結果は末尾2列から読む", () => {
    const html = `<table><caption>陳情一覧</caption>
      <tr><td>第5号</td><td>テスト</td><td>提出者</td><td>文教委員会</td><td>令和8年9月30日、不採択</td></tr>
    </table>`;
    const [row] = parseBillList(html, PETITION_URL);
    expect(row.committeeName).toBe("文教委員会");
    expect(row.decisionText).toBe("令和8年9月30日、不採択");
  });
});

describe("normalizeBillNumber", () => {
  it("空白と末尾の注記を取り除く", () => {
    expect(normalizeBillNumber(" 議案第78号（※）")).toBe("議案第78号");
    expect(normalizeBillNumber("議案第 95 号")).toBe("議案第95号");
    expect(normalizeBillNumber("第1号")).toBe("第1号");
  });
});

describe("withCategoryPrefix", () => {
  it("請願・陳情の「第N号」に区分を付ける", () => {
    expect(withCategoryPrefix("第1号", "請願")).toBe("請願第1号");
    expect(withCategoryPrefix("第11号", "陳情")).toBe("陳情第11号");
  });

  it("すでに種別がある番号や、議案の表はそのまま", () => {
    expect(withCategoryPrefix("陳情第11号", "陳情")).toBe("陳情第11号");
    expect(withCategoryPrefix("議案第95号", "市長提出議案")).toBe("議案第95号");
    expect(withCategoryPrefix("第1号", "市長提出議案")).toBe("第1号");
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

describe("withPetitionYear", () => {
  it("継続審査の陳情は、資料PDFのファイル名の年を番号の前に付ける", () => {
    expect(
      withPetitionYear(
        "陳情第25号",
        "https://example.jp/001/026/381/r7chinjou25.pdf"
      )
    ).toBe("令和7年陳情第25号");
  });

  it("請願のファイル名（seigan）にも対応する", () => {
    expect(
      withPetitionYear("請願第3号", "https://example.jp/r8seigan03.pdf")
    ).toBe("令和8年請願第3号");
  });

  it("ファイル名から年が分からないときはそのまま", () => {
    expect(withPetitionYear("陳情第1号", "https://example.jp/shiryo.pdf")).toBe(
      "陳情第1号"
    );
    expect(withPetitionYear("陳情第1号", null)).toBe("陳情第1号");
  });

  it("すでに年が付いている番号はそのまま", () => {
    expect(
      withPetitionYear("令和7年陳情第25号", "https://example.jp/r7chinjou25.pdf")
    ).toBe("令和7年陳情第25号");
  });
});
