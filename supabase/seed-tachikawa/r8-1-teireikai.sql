-- 生成元: packages/tachikawa-ingest（AI不使用）
-- 出典: https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html
-- 対象: 令和8年第1回定例会（議案 58 件、請願・陳情 0 件）
BEGIN;

-- 会期
INSERT INTO council_sessions (name, slug, start_date, end_date, council_url, is_active)
VALUES ('令和8年第1回定例会', 'r8-1-teireikai', '2026-02-18', '2026-03-24', 'https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html', false)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, council_url = EXCLUDED.council_url;
-- 過去の会期のため、いまの会期（is_active）は変更しない

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
VALUES ('令和8年議案第1号', 'bill', '専決処分について（令和7年度立川市一般会計補正予算(第11号)）', 'approved', '令和8年2月18日、承認', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian01.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '専決処分について（令和7年度立川市一般会計補正予算(第11号)）', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第1号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、承認
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian01.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第1号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '専決処分について（令和7年度立川市一般会計補正予算(第11号)）', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第1号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、承認
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian01.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第1号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第2号', 'bill', '令和8年度立川市一般会計予算', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和8年度立川市一般会計予算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第2号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第2号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和8年度立川市一般会計予算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第2号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第2号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第3号', 'bill', '令和8年度立川市特別会計競輪事業予算', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和8年度立川市特別会計競輪事業予算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第3号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第3号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和8年度立川市特別会計競輪事業予算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第3号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第3号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第4号', 'bill', '令和8年度立川市特別会計国民健康保険事業予算', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和8年度立川市特別会計国民健康保険事業予算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第4号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第4号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和8年度立川市特別会計国民健康保険事業予算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第4号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第4号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第5号', 'bill', '令和8年度立川市特別会計駐車場事業予算', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和8年度立川市特別会計駐車場事業予算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第5号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第5号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和8年度立川市特別会計駐車場事業予算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第5号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第5号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第6号', 'bill', '令和8年度立川市特別会計介護保険事業予算', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和8年度立川市特別会計介護保険事業予算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第6号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第6号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和8年度立川市特別会計介護保険事業予算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第6号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第6号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第7号', 'bill', '令和8年度立川市特別会計後期高齢者医療事業予算', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和8年度立川市特別会計後期高齢者医療事業予算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第7号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第7号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和8年度立川市特別会計後期高齢者医療事業予算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第7号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian02-07.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第7号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第8号', 'bill', '令和8年度立川市下水道事業会計予算', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian08.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和8年度立川市下水道事業会計予算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第8号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian08.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第8号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和8年度立川市下水道事業会計予算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第8号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian08.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第8号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第9号', 'bill', '令和7年度立川市一般会計補正予算(第12号)', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian09.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和7年度立川市一般会計補正予算(第12号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第9号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian09.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第9号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和7年度立川市一般会計補正予算(第12号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第9号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian09.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第9号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第10号', 'bill', '令和7年度立川市特別会計競輪事業補正予算(第5号)', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian10.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和7年度立川市特別会計競輪事業補正予算(第5号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第10号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian10.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第10号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和7年度立川市特別会計競輪事業補正予算(第5号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第10号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian10.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第10号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第11号', 'bill', '令和7年度立川市特別会計駐車場事業補正予算(第1号)', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian11.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和7年度立川市特別会計駐車場事業補正予算(第1号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第11号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian11.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第11号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和7年度立川市特別会計駐車場事業補正予算(第1号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第11号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian11.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第11号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第12号', 'bill', '令和7年度立川市特別会計介護保険事業補正予算(第3号)', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian12.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和7年度立川市特別会計介護保険事業補正予算(第3号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第12号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian12.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第12号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和7年度立川市特別会計介護保険事業補正予算(第3号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第12号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian12.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第12号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第13号', 'bill', '東京都後期高齢者医療広域連合規約の変更について', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian13.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '東京都後期高齢者医療広域連合規約の変更について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第13号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian13.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第13号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '東京都後期高齢者医療広域連合規約の変更について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第13号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian13.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第13号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第14号', 'bill', '立川市道北160号線の認定について', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian14.pdf', (SELECT id FROM committees WHERE name = '環境まちづくり委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市道北160号線の認定について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第14号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian14.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第14号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市道北160号線の認定について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第14号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian14.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第14号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第15号', 'bill', '立川市犯罪被害者等支援条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian15.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市犯罪被害者等支援条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第15号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian15.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第15号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市犯罪被害者等支援条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第15号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian15.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第15号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第16号', 'bill', '立川市特定乳児等通園支援事業の運営に関する基準を定める条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian16-2.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市特定乳児等通園支援事業の運営に関する基準を定める条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第16号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian16-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第16号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市特定乳児等通園支援事業の運営に関する基準を定める条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第16号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian16-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第16号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第17号', 'bill', '立川市土地開発基金条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian17.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市土地開発基金条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第17号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian17.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第17号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市土地開発基金条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第17号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian17.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第17号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第18号', 'bill', '立川市図書館条例の一部を改正する条例', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian18.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市図書館条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第18号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian18.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第18号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市図書館条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第18号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian18.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第18号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第19号', 'bill', '立川市歴史民俗資料館条例の一部を改正する条例', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian19.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市歴史民俗資料館条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第19号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian19.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第19号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市歴史民俗資料館条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第19号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian19.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第19号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第20号', 'bill', '立川市市民会館条例の一部を改正する条例', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian20.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市市民会館条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第20号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian20.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第20号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市市民会館条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第20号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian20.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第20号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第21号', 'bill', '立川市女性総合センター条例の一部を改正する条例', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian21.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市女性総合センター条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第21号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian21.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第21号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市女性総合センター条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第21号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian21.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第21号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第22号', 'bill', '立川市立学校の学校給食費に関する条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian22.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市立学校の学校給食費に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第22号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian22.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第22号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市立学校の学校給食費に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第22号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian22.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第22号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第23号', 'bill', '立川市市税賦課徴収条例の一部を改正する条例', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian23.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市市税賦課徴収条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第23号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian23.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第23号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市市税賦課徴収条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第23号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian23.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第23号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第24号', 'bill', '立川市高齢者集合住宅条例の一部を改正する条例', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian24.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市高齢者集合住宅条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第24号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian24.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第24号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市高齢者集合住宅条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第24号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian24.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第24号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第25号', 'bill', '立川市営住宅条例の一部を改正する条例', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian25.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市営住宅条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第25号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian25.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第25号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市営住宅条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第25号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian25.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第25号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第26号', 'bill', '立川市事務手数料条例の一部を改正する条例', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian26.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市事務手数料条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第26号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian26.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第26号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市事務手数料条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第26号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian26.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第26号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第27号', 'bill', '立川市道路占用料等条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian27.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市道路占用料等条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第27号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian27.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第27号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市道路占用料等条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第27号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian27.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第27号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第28号', 'bill', '立川市下水道事業の設置等に関する条例の一部を改正する条例', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian28.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市下水道事業の設置等に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第28号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian28.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第28号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市下水道事業の設置等に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第28号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian28.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第28号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第29号', 'bill', '立川市国民健康保険条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian29.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市国民健康保険条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第29号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian29.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第29号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市国民健康保険条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第29号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian29.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第29号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第30号', 'bill', '立川市後期高齢者医療条例の一部を改正する条例', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian30.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市後期高齢者医療条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第30号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian30.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第30号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市後期高齢者医療条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第30号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian30.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第30号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第31号', 'bill', '立川市介護保険条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian31.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市介護保険条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第31号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian31.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第31号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市介護保険条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第31号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian31.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第31号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第32号', 'bill', '立川市乳児等通園支援事業の設備及び運営に関する基準を定める条例の一部を改正する条例', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian32.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市乳児等通園支援事業の設備及び運営に関する基準を定める条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第32号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian32.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第32号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市乳児等通園支援事業の設備及び運営に関する基準を定める条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第32号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian32.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第32号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第33号', 'bill', '立川市学童保育所条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian33.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市学童保育所条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第33号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian33.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第33号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市学童保育所条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第33号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian33.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第33号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第34号', 'bill', '立川市子どものいじめ防止条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian34.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市子どものいじめ防止条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第34号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian34.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第34号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市子どものいじめ防止条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第34号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian34.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第34号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第35号', 'bill', '立川市消防団員の任用、給与、分限及び懲戒、服務等に関する条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian35.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市消防団員の任用、給与、分限及び懲戒、服務等に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第35号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian35.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第35号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市消防団員の任用、給与、分限及び懲戒、服務等に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第35号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian35.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第35号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第36号', 'bill', '立川市職員の勤務時間、休日、休暇等に関する条例の一部を改正する条例', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian36.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市職員の勤務時間、休日、休暇等に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第36号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian36.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第36号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市職員の勤務時間、休日、休暇等に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第36号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian36.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第36号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第37号', 'bill', '立川市長等の損害賠償責任の一部免責に関する条例の一部を改正する条例', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian37.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市長等の損害賠償責任の一部免責に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第37号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian37.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第37号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市長等の損害賠償責任の一部免責に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第37号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian37.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第37号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第38号', 'bill', '立川市議会議員の報酬及び費用弁償等に関する条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian38.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市議会議員の報酬及び費用弁償等に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第38号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian38.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第38号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市議会議員の報酬及び費用弁償等に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第38号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian38.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第38号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第39号', 'bill', '立川市実費弁償条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian39.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市実費弁償条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第39号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian39.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第39号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市実費弁償条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第39号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian39.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第39号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第40号', 'bill', '立川市一般職の職員の旅費に関する条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian40.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市一般職の職員の旅費に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第40号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian40.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第40号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市一般職の職員の旅費に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第40号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian40.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第40号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第41号', 'bill', '立川市会計年度任用職員の報酬等に関する条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian41.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市会計年度任用職員の報酬等に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第41号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian41.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第41号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市会計年度任用職員の報酬等に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第41号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian41.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第41号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第42号', 'bill', '立川市常勤特別職職員給与等支給条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian42.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市常勤特別職職員給与等支給条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第42号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian42.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第42号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市常勤特別職職員給与等支給条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第42号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian42.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第42号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第43号', 'bill', '立川市非常勤職員給与等支給条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian43.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市非常勤職員給与等支給条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第43号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian43.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第43号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市非常勤職員給与等支給条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第43号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian43.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第43号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第44号', 'bill', '立川市一般職の職員の給与に関する条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian44.pdf', (SELECT id FROM committees WHERE name = '予算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市一般職の職員の給与に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第44号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian44.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第44号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市一般職の職員の給与に関する条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第44号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian44.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第44号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第45号', 'bill', '立川市職員退職手当支給条例の一部を改正する条例', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian45.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市職員退職手当支給条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第45号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian45.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第45号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市職員退職手当支給条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第45号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian45.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第45号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第46号', 'bill', '立川市行政手続条例の一部を改正する条例', 'approved', '令和8年2月18日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian46.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市行政手続条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第46号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian46.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第46号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市行政手続条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第46号
- 区分：市長提出議案
- 審議の状況：令和8年2月18日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian46.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第46号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第47号', 'bill', '立川市組織条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian47.pdf', (SELECT id FROM committees WHERE name = '総務委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市組織条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第47号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian47.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第47号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市組織条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第47号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian47.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第47号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第48号', 'bill', '令和7年度立川市一般会計補正予算(第13号)', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian48.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和7年度立川市一般会計補正予算(第13号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第48号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian48.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第48号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和7年度立川市一般会計補正予算(第13号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第48号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian48.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第48号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第49号', 'bill', '令和7年度立川市特別会計競輪事業補正予算(第6号)', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian49.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和7年度立川市特別会計競輪事業補正予算(第6号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第49号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian49.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第49号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和7年度立川市特別会計競輪事業補正予算(第6号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第49号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian49.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第49号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第50号', 'bill', '令和7年度立川市特別会計国民健康保険事業補正予算(第2号)', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian50.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和7年度立川市特別会計国民健康保険事業補正予算(第2号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第50号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian50.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第50号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和7年度立川市特別会計国民健康保険事業補正予算(第2号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第50号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian50.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第50号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第51号', 'bill', '令和7年度立川市特別会計駐車場事業補正予算(第2号)', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian51.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和7年度立川市特別会計駐車場事業補正予算(第2号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第51号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian51.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第51号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和7年度立川市特別会計駐車場事業補正予算(第2号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第51号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian51.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第51号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第52号', 'bill', '令和7年度立川市特別会計後期高齢者医療事業補正予算(第2号)', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian52.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和7年度立川市特別会計後期高齢者医療事業補正予算(第2号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第52号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian52.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第52号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和7年度立川市特別会計後期高齢者医療事業補正予算(第2号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第52号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian52.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第52号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第53号', 'bill', '令和7年度立川市下水道事業会計補正予算(第4号)', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian53.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和7年度立川市下水道事業会計補正予算(第4号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第53号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian53.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第53号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和7年度立川市下水道事業会計補正予算(第4号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第53号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian53.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第53号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第54号', 'bill', '立川市立第二小学校等複合施設整備事業施設整備請負変更契約', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian54.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市立第二小学校等複合施設整備事業施設整備請負変更契約', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第54号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian54.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第54号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市立第二小学校等複合施設整備事業施設整備請負変更契約', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第54号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian54.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第54号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第55号', 'bill', '立川市家庭的保育事業等の設備及び運営に関する基準を定める条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian55.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市家庭的保育事業等の設備及び運営に関する基準を定める条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第55号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian55.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第55号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市家庭的保育事業等の設備及び運営に関する基準を定める条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第55号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian55.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第55号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第56号', 'bill', '立川市特定教育・保育施設及び特定地域型保育事業の運営に関する基準を定める条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian56.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市特定教育・保育施設及び特定地域型保育事業の運営に関する基準を定める条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第56号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian56.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第56号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市特定教育・保育施設及び特定地域型保育事業の運営に関する基準を定める条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第56号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian56.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第56号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第57号', 'bill', '立川市災害被災者等援護条例の一部を改正する条例', 'approved', '令和8年3月24日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian57.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市災害被災者等援護条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第57号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian57.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第57号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市災害被災者等援護条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第57号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/380/r8gian57.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第57号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第58号', 'bill', '立川市監査委員の選任について', 'approved', '令和8年3月24日、同意', NULL, NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市監査委員の選任について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第58号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第58号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市監査委員の選任について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：議案第58号
- 区分：市長提出議案
- 審議の状況：令和8年3月24日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026380.html' FROM bills WHERE bill_number = '令和8年議案第58号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;

COMMIT;
