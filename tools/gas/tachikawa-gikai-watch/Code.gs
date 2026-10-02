/**
 * 立川市議会ホームページ 更新通知（Google Apps Script）
 *
 * 毎日1回、立川市議会の「各定例会・臨時会の概要」から新しい会期を自動で見つけ、
 * 日程表・議案一覧・請願陳情などのページの表とリンクを前回と比べます。
 * 変化があればメール（と、設定すればGoogleカレンダー）で知らせます。
 *
 * - AI・有料APIは使いません（UrlFetchApp と MailApp / CalendarApp のみ）
 * - 初回の実行では「いまの状態」を記録するだけで、通知はしません
 * - 設置手順は同じフォルダの README.md を参照
 */

const CONFIG = {
  /** 各定例会・臨時会の概要（年ごとのページへのリンクが新しい順に並ぶ） */
  ROOT_URL:
    "https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/index.html",
  /** 追加で見張るページ（議案一覧の一覧） */
  EXTRA_URLS: ["https://www.city.tachikawa.lg.jp/shigikai/gian/1007177.html"],
  /** 新しいほうから何年分の年ページを見るか（年明けに前年の第4回を取りこぼさないため2） */
  YEARS_TO_WATCH: 2,
  /** 新しいほうから何会期分を見張るか */
  SESSIONS_TO_WATCH: 3,
  /** 通知先メール（空なら、このスクリプトを実行しているGoogleアカウント） */
  NOTIFY_EMAIL: "",
  /** Googleカレンダーにも終日予定として登録するか */
  CREATE_CALENDAR_EVENT: true,
  /** 登録するカレンダーのID（空ならメインのカレンダー） */
  CALENDAR_ID: "",
  /** 毎日何時ごろに実行するか（0〜23） */
  RUN_HOUR: 7,
};

const STORE_PREFIX = "page:";

/** 毎日の実行（トリガーから呼ばれる） */
function checkUpdates() {
  const props = PropertiesService.getScriptProperties();
  const initialized = Boolean(props.getProperty("initialized"));
  const { urls, complete } = discoverWatchUrls_();
  // 前回見張っていたページ。ここに無いページが現れたら「新しいページ」として知らせる
  const prevWatch = new Set(JSON.parse(props.getProperty("watchList") || "[]"));
  const pending = {}; // 通知のあとでまとめて保存する（通知に失敗しても変化を失わないため）
  const changes = [];

  for (const url of urls) {
    let lines;
    try {
      lines = extractLines_(fetchHtml_(url), url);
    } catch (e) {
      console.warn(`取得に失敗: ${url} ${e}`);
      continue;
    }
    const key = STORE_PREFIX + url;
    const prevRaw = props.getProperty(key);
    const snapshot = toSnapshot_(lines);

    if (prevRaw === null) {
      // 記録の無いページ：前回の見張り先に無かったものだけ「新しいページ」として知らせる
      // （前回取得に失敗しただけのページは、黙って記録する）
      if (initialized && !prevWatch.has(url)) {
        changes.push({ url, title: lines.title, added: lines.items, removedCount: 0, isNew: true });
      }
    } else if (prevRaw !== snapshot) {
      const diff = diffLines_(fromSnapshot_(prevRaw).hashes, lines.items);
      if (diff.added.length || diff.removedCount) {
        changes.push({ url, title: lines.title, ...diff });
      }
    }
    pending[key] = snapshot;
  }

  if (initialized && changes.length > 0) notify_(changes); // 失敗したら例外で止まり、保存しない

  pending.watchList = JSON.stringify(urls);
  if (!initialized) pending.initialized = new Date().toISOString();
  props.setProperties(pending);
  if (complete) removeStaleSnapshots_(props, urls);

  if (!initialized) {
    console.log(`初回の記録をしました（${urls.length}ページ）。次回から変化を通知します。`);
  } else {
    console.log(`確認 ${urls.length}ページ、変化 ${changes.length}ページ`);
  }
}

/** 見張り先から外れたページの記録を消す（保存容量の上限に達しないように） */
function removeStaleSnapshots_(props, urls) {
  const keep = new Set(urls.map((u) => STORE_PREFIX + u));
  for (const key of props.getKeys()) {
    if (key.startsWith(STORE_PREFIX) && !keep.has(key)) props.deleteProperty(key);
  }
}

/** 初回の設置：毎日のトリガーを作り、いまの状態を記録する */
function setup() {
  for (const t of ScriptApp.getProjectTriggers()) {
    if (t.getHandlerFunction() === "checkUpdates") ScriptApp.deleteTrigger(t);
  }
  ScriptApp.newTrigger("checkUpdates")
    .timeBased()
    .everyDays(1)
    .atHour(CONFIG.RUN_HOUR)
    .create();
  checkUpdates();
}

/** 動作確認用：いま見張っているページの一覧をログに出す */
function listWatchedPages() {
  const { urls, complete } = discoverWatchUrls_();
  urls.forEach((u) => console.log(u));
  if (!complete) console.warn("一部のページを取得できませんでした");
}

/** 記録を消して、次の実行を「初回」に戻す（通知はされない） */
function resetSnapshots() {
  PropertiesService.getScriptProperties().deleteAllProperties();
  console.log("記録を消しました。次の checkUpdates は初回扱いになります。");
}

// ─────────────────────────────────────────────
// 見張るページを見つける
// ─────────────────────────────────────────────

/**
 * 見張るページを集める。市のページは年・会期とも新しい順に並んでいる（2026年10月に確認）。
 * complete は、途中のページをすべて取得できたかどうか（古い記録を消してよいかの判断に使う）
 */
function discoverWatchUrls_() {
  const urls = new Set(CONFIG.EXTRA_URLS);
  let complete = true;
  // ここが取れないと何も見張れないので、失敗したらそのまま例外にする
  const rootLinks = contentLinks_(fetchHtml_(CONFIG.ROOT_URL), CONFIG.ROOT_URL);
  const yearPages = uniqueByUrl_(
    rootLinks.filter((l) => /\/katsudo\/1007184\/\d+\/index\.html$/.test(l.url))
  ).slice(0, CONFIG.YEARS_TO_WATCH);

  const sessionPages = [];
  for (const year of yearPages) {
    urls.add(year.url); // 新しい会期のページが増えたことに気づくため
    try {
      for (const l of contentLinks_(fetchHtml_(year.url), year.url)) {
        if (/\/katsudo\/1007184\/\d+\/\d+\/index\.html$/.test(l.url)) sessionPages.push(l);
      }
    } catch (e) {
      complete = false;
      console.warn(`年ページの取得に失敗: ${year.url} ${e}`);
    }
  }

  for (const session of uniqueByUrl_(sessionPages).slice(0, CONFIG.SESSIONS_TO_WATCH)) {
    urls.add(session.url);
    try {
      for (const l of contentLinks_(fetchHtml_(session.url), session.url)) {
        // 会期の下の各ページ（日程表・議案一覧・請願陳情など）
        if (/\/katsudo\/1007184\/\d+\/\d+\/\d+\.html$/.test(l.url)) urls.add(l.url);
      }
    } catch (e) {
      complete = false;
      console.warn(`会期ページの取得に失敗: ${session.url} ${e}`);
    }
  }
  return { urls: [...urls], complete };
}

function uniqueByUrl_(links) {
  const seen = new Set();
  return links.filter((l) => (seen.has(l.url) ? false : seen.add(l.url)));
}

// ─────────────────────────────────────────────
// HTML から比較用の行を取り出す
// ─────────────────────────────────────────────

function fetchHtml_(url) {
  const res = UrlFetchApp.fetch(url, { muteHttpExceptions: true, followRedirects: true });
  if (res.getResponseCode() !== 200) {
    throw new Error(`HTTP ${res.getResponseCode()}`);
  }
  return res.getContentText("UTF-8");
}

/**
 * 本文（<div id="voice">〜</article>）だけを取り出す。
 * 見つからないときは空にする（サイト共通のメニューの変更で通知しないため）
 */
function mainContent_(html) {
  const start = html.indexOf('id="voice"');
  if (start < 0) {
    console.warn("本文（id=voice）が見つかりません。ページの構成が変わった可能性があります");
    return "";
  }
  let end = html.indexOf("</article>", start);
  if (end < 0) end = html.indexOf("</main>", start);
  return end < 0 ? "" : html.slice(start, end);
}

function stripTags_(s) {
  return decodeEntities_(s.replace(/<[^>]+>/g, " "))
    .replace(/[\s　]+/g, " ")
    .trim();
}

function decodeEntities_(s) {
  return s
    .replace(/&nbsp;/g, " ")
    .replace(/&amp;/g, "&")
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/&#(\d+);/g, (_, n) => String.fromCharCode(Number(n)));
}

function resolveUrl_(rawHref, base) {
  const href = decodeEntities_(rawHref).replace(/[?#].*$/, "");
  if (/^https?:\/\//.test(href)) return href;
  if (href.startsWith("//")) return `https:${href}`;
  const baseParts = base.replace(/[?#].*$/, "").split("/");
  baseParts.pop(); // ファイル名を外す
  const origin = baseParts.slice(0, 3).join("/");
  // 「/」で始まるリンクはサイトの最上位から
  const path = href.startsWith("/") ? [] : baseParts.slice(3);
  for (const part of href.split("/")) {
    if (part === "..") path.pop();
    else if (part !== "." && part !== "") path.push(part);
  }
  return `${origin}/${path.join("/")}`;
}

/** 本文中のリンク（立川市のサイト内の .html / .pdf のみ） */
function contentLinks_(html, baseUrl) {
  const body = mainContent_(html);
  const links = [];
  const re = /<a\b[^>]*href=["']([^"']+)["'][^>]*>([\s\S]*?)<\/a>/gi;
  let m;
  while ((m = re.exec(body)) !== null) {
    const href = m[1];
    if (/^(javascript:|#|mailto:)/.test(href)) continue;
    const url = resolveUrl_(href, baseUrl);
    if (!/^https:\/\/www\.city\.tachikawa\.lg\.jp\//.test(url)) continue;
    if (!/\.(html|pdf)$/i.test(url)) continue;
    links.push({ text: stripTags_(m[2]), url });
  }
  return links;
}

/** 比較用の行：表の各行と、本文中のリンク */
function extractLines_(html, url) {
  const titleMatch = html.match(/<title>([\s\S]*?)<\/title>/i);
  const title = titleMatch ? stripTags_(titleMatch[1]) : url;
  const body = mainContent_(html)
    .replace(/<script[\s\S]*?<\/script>/gi, "")
    .replace(/<style[\s\S]*?<\/style>/gi, "");
  const items = [];

  const tableRe = /<table\b([^>]*)>([\s\S]*?)<\/table>/gi;
  let t;
  while ((t = tableRe.exec(body)) !== null) {
    if (/gsc|presentation/.test(t[1])) continue; // 検索ボックスなどの表は除く
    const capMatch = t[2].match(/<caption[^>]*>([\s\S]*?)<\/caption>/i);
    const caption = capMatch ? stripTags_(capMatch[1]) : "表";
    for (const row of t[2].split(/<\/tr>/i)) {
      const cells = [];
      const cellRe = /<t[dh]\b[^>]*>([\s\S]*?)<\/t[dh]>/gi;
      let c;
      while ((c = cellRe.exec(row)) !== null) cells.push(stripTags_(c[1]));
      if (cells.length) items.push(`［${caption}］ ${cells.join(" ｜ ")}`);
    }
  }

  for (const l of contentLinks_(html, url)) {
    items.push(`［リンク］ ${l.text}`);
  }
  return { title, items: [...new Set(items)] };
}

// ─────────────────────────────────────────────
// 記録と比較
// ─────────────────────────────────────────────

/**
 * 記録用の文字列。行そのものではなく、行ごとの短いハッシュを保存する
 * （PropertiesService は1値あたり約9KBまでで、日本語の行をそのまま保存すると足りないため）
 */
function toSnapshot_(lines) {
  return JSON.stringify({ h: lines.items.map(shortHash_) });
}

function fromSnapshot_(raw) {
  try {
    const parsed = JSON.parse(raw);
    return { hashes: Array.isArray(parsed.h) ? parsed.h : [] };
  } catch (e) {
    return { hashes: [] };
  }
}

function shortHash_(s) {
  return Utilities.base64Encode(
    Utilities.computeDigest(Utilities.DigestAlgorithm.SHA_256, s, Utilities.Charset.UTF_8)
  ).slice(0, 12);
}

/** 増えた行（文字で）と、なくなった行の数 */
function diffLines_(prevHashes, nextItems) {
  const prev = new Set(prevHashes);
  const nextHashes = nextItems.map(shortHash_);
  const next = new Set(nextHashes);
  const added = nextItems.filter((_, i) => !prev.has(nextHashes[i]));
  const removedCount = prevHashes.filter((h) => !next.has(h)).length;
  return { added, removedCount };
}

// ─────────────────────────────────────────────
// 通知
// ─────────────────────────────────────────────

function notify_(changes) {
  const to = CONFIG.NOTIFY_EMAIL || Session.getEffectiveUser().getEmail();
  const subject = `【立川市議会】ホームページが更新されました（${changes.length}ページ）`;
  const lines = [];
  for (const ch of changes) {
    lines.push(`■ ${ch.isNew ? "【新しいページ】" : ""}${ch.title}`);
    lines.push(ch.url);
    ch.added.slice(0, 30).forEach((x) => lines.push(`  ＋ ${x}`));
    if (ch.added.length > 30) lines.push(`  …ほか ${ch.added.length - 30} 行`);
    if (ch.removedCount) lines.push(`  － なくなった・書き換わった行：${ch.removedCount} 行`);
    lines.push("");
  }
  lines.push("みらい議会＠立川市：議案一覧の取り込み・解説の作成が必要か確認してください。");
  const body = lines.join("\n");

  MailApp.sendEmail(to, subject, body);

  if (CONFIG.CREATE_CALENDAR_EVENT) {
    // メールは送れているので、カレンダーの失敗では全体を止めない
    try {
      const cal = CONFIG.CALENDAR_ID
        ? CalendarApp.getCalendarById(CONFIG.CALENDAR_ID)
        : CalendarApp.getDefaultCalendar();
      if (cal) {
        cal.createAllDayEvent(`立川市議会 更新あり（${changes.length}ページ）`, new Date(), {
          description: body.slice(0, 8000),
        });
      }
    } catch (e) {
      console.warn(`カレンダーへの登録に失敗: ${e}`);
    }
  }
}
