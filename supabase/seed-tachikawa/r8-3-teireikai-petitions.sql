-- 生成元: packages/tachikawa-ingest（AI不使用）
-- 出典: https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028162.html
-- 対象: 令和8年第3回定例会（議案 0 件、請願・陳情 4 件）
BEGIN;

-- 会期
INSERT INTO council_sessions (name, slug, start_date, end_date, council_url, is_active)
VALUES ('令和8年第3回定例会', 'r8-3-teireikai', '2026-09-04', '2026-10-02', 'https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html', false)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, council_url = EXCLUDED.council_url;
SELECT set_active_council_session((SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'));

-- 委員会
INSERT INTO committees (name, description, sort_order)
SELECT '総務委員会', '常任委員会', 1
WHERE NOT EXISTS (SELECT 1 FROM committees WHERE name = '総務委員会');
INSERT INTO committees (name, description, sort_order)
SELECT '厚生委員会', '常任委員会', 2
WHERE NOT EXISTS (SELECT 1 FROM committees WHERE name = '厚生委員会');
INSERT INTO committees (name, description, sort_order)
SELECT '環境まちづくり委員会', '常任委員会', 3
WHERE NOT EXISTS (SELECT 1 FROM committees WHERE name = '環境まちづくり委員会');
INSERT INTO committees (name, description, sort_order)
SELECT '文教委員会', '常任委員会', 4
WHERE NOT EXISTS (SELECT 1 FROM committees WHERE name = '文教委員会');
INSERT INTO committees (name, description, sort_order)
SELECT '予算特別委員会', '特別委員会', 5
WHERE NOT EXISTS (SELECT 1 FROM committees WHERE name = '予算特別委員会');
INSERT INTO committees (name, description, sort_order)
SELECT '決算特別委員会', '特別委員会', 6
WHERE NOT EXISTS (SELECT 1 FROM committees WHERE name = '決算特別委員会');
INSERT INTO committees (name, description, sort_order)
SELECT '議会改革特別委員会', '特別委員会', 7
WHERE NOT EXISTS (SELECT 1 FROM committees WHERE name = '議会改革特別委員会');
INSERT INTO committees (name, description, sort_order)
SELECT '議会運営委員会', '議会運営委員会', 8
WHERE NOT EXISTS (SELECT 1 FROM committees WHERE name = '議会運営委員会');

-- 会派
INSERT INTO factions (name, display_name, sort_order)
SELECT '公明党', '公明党', 1
WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = '公明党');
INSERT INTO factions (name, display_name, sort_order)
SELECT '自民党安進会・維新の会', '自民党安進会・維新の会', 2
WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = '自民党安進会・維新の会');
INSERT INTO factions (name, display_name, sort_order)
SELECT '立憲ネット緑たちかわ', '立憲ネット緑たちかわ', 3
WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = '立憲ネット緑たちかわ');
INSERT INTO factions (name, display_name, sort_order)
SELECT '日本共産党', '日本共産党', 4
WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = '日本共産党');
INSERT INTO factions (name, display_name, sort_order)
SELECT '立川けやき会', '立川けやき会', 5
WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = '立川けやき会');
INSERT INTO factions (name, display_name, sort_order)
SELECT 'たちかわ自由民主党 参政党', 'たちかわ自由民主党 参政党', 6
WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = 'たちかわ自由民主党 参政党');

-- 議案・請願・陳情
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年請願第1号', 'petition', '重度障害者等就労支援特別事業の実施を求める請願', 'in_committee', '厚生委員会に付託', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8seigan01-2.pdf', (SELECT id FROM committees WHERE name = '厚生委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '重度障害者等就労支援特別事業の実施を求める請願', 'やさしい解説は準備中です。', '## この請願・陳情について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：請願第1号
- 区分：請願
- 審議の状況：厚生委員会に付託
- 資料（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8seigan01-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028162.html' FROM bills WHERE bill_number = '令和8年請願第1号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '重度障害者等就労支援特別事業の実施を求める請願', 'やさしい解説は準備中です。', '## この請願・陳情について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：請願第1号
- 区分：請願
- 審議の状況：厚生委員会に付託
- 資料（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8seigan01-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028162.html' FROM bills WHERE bill_number = '令和8年請願第1号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年陳情第11号', 'petition', '市内公共施設内の点字ブロックをシルバーや灰色から黄色に変更していただきたい。またはコントラストをはっきりしていただきたい。に関する陳情', 'in_committee', '厚生委員会に付託', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8chinjou11.pdf', (SELECT id FROM committees WHERE name = '厚生委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '市内公共施設内の点字ブロックをシルバーや灰色から黄色に変更していただきたい。またはコントラストをはっきりしていただきたい。に関する陳情', 'やさしい解説は準備中です。', '## この請願・陳情について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：陳情第11号
- 区分：陳情
- 審議の状況：厚生委員会に付託
- 資料（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8chinjou11.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028162.html' FROM bills WHERE bill_number = '令和8年陳情第11号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '市内公共施設内の点字ブロックをシルバーや灰色から黄色に変更していただきたい。またはコントラストをはっきりしていただきたい。に関する陳情', 'やさしい解説は準備中です。', '## この請願・陳情について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：陳情第11号
- 区分：陳情
- 審議の状況：厚生委員会に付託
- 資料（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8chinjou11.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028162.html' FROM bills WHERE bill_number = '令和8年陳情第11号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年陳情第12号', 'petition', '11月11日以降も立川市役所などで、電話応対だけでも17時もしくは16時半まで対応していただきたいに関する陳情', 'in_committee', '総務委員会に付託', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8chinjou12.pdf', (SELECT id FROM committees WHERE name = '総務委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '11月11日以降も立川市役所などで、電話応対だけでも17時もしくは16時半まで対応していただきたいに関する陳情', 'やさしい解説は準備中です。', '## この請願・陳情について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：陳情第12号
- 区分：陳情
- 審議の状況：総務委員会に付託
- 資料（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8chinjou12.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028162.html' FROM bills WHERE bill_number = '令和8年陳情第12号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '11月11日以降も立川市役所などで、電話応対だけでも17時もしくは16時半まで対応していただきたいに関する陳情', 'やさしい解説は準備中です。', '## この請願・陳情について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：陳情第12号
- 区分：陳情
- 審議の状況：総務委員会に付託
- 資料（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8chinjou12.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028162.html' FROM bills WHERE bill_number = '令和8年陳情第12号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年陳情第13号', 'petition', '立川市産後ケア事業における流産・死産等(グリーフケア)支援の拡充に関する陳情', 'in_committee', '厚生委員会に付託', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8chinjou13.pdf', (SELECT id FROM committees WHERE name = '厚生委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市産後ケア事業における流産・死産等(グリーフケア)支援の拡充に関する陳情', 'やさしい解説は準備中です。', '## この請願・陳情について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：陳情第13号
- 区分：陳情
- 審議の状況：厚生委員会に付託
- 資料（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8chinjou13.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028162.html' FROM bills WHERE bill_number = '令和8年陳情第13号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市産後ケア事業における流産・死産等(グリーフケア)支援の拡充に関する陳情', 'やさしい解説は準備中です。', '## この請願・陳情について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：陳情第13号
- 区分：陳情
- 審議の状況：厚生委員会に付託
- 資料（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8chinjou13.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028162.html' FROM bills WHERE bill_number = '令和8年陳情第13号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;

COMMIT;
