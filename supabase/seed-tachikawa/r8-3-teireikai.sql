-- 生成元: packages/tachikawa-ingest（AI不使用）
-- 出典: https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html
-- 対象: 令和8年第3回定例会（議案 22 件、請願・陳情 0 件）
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
VALUES ('令和8年議案第95号', 'bill', '令和7年度立川市一般会計歳入歳出決算', 'in_committee', '決算特別委員会に付託', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf', (SELECT id FROM committees WHERE name = '決算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和7年度立川市一般会計歳入歳出決算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第95号
- 区分：市長提出議案
- 審議の状況：決算特別委員会に付託
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第95号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和7年度立川市一般会計歳入歳出決算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第95号
- 区分：市長提出議案
- 審議の状況：決算特別委員会に付託
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第95号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第96号', 'bill', '令和7年度立川市特別会計競輪事業歳入歳出決算', 'in_committee', '決算特別委員会に付託', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf', (SELECT id FROM committees WHERE name = '決算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和7年度立川市特別会計競輪事業歳入歳出決算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第96号
- 区分：市長提出議案
- 審議の状況：決算特別委員会に付託
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第96号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和7年度立川市特別会計競輪事業歳入歳出決算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第96号
- 区分：市長提出議案
- 審議の状況：決算特別委員会に付託
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第96号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第97号', 'bill', '令和7年度立川市特別会計国民健康保険事業歳入歳出決算', 'in_committee', '決算特別委員会に付託', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf', (SELECT id FROM committees WHERE name = '決算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和7年度立川市特別会計国民健康保険事業歳入歳出決算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第97号
- 区分：市長提出議案
- 審議の状況：決算特別委員会に付託
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第97号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和7年度立川市特別会計国民健康保険事業歳入歳出決算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第97号
- 区分：市長提出議案
- 審議の状況：決算特別委員会に付託
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第97号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第98号', 'bill', '令和7年度立川市特別会計駐車場事業歳入歳出決算', 'in_committee', '決算特別委員会に付託', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf', (SELECT id FROM committees WHERE name = '決算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和7年度立川市特別会計駐車場事業歳入歳出決算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第98号
- 区分：市長提出議案
- 審議の状況：決算特別委員会に付託
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第98号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和7年度立川市特別会計駐車場事業歳入歳出決算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第98号
- 区分：市長提出議案
- 審議の状況：決算特別委員会に付託
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第98号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第99号', 'bill', '令和7年度立川市特別会計介護保険事業歳入歳出決算', 'in_committee', '決算特別委員会に付託', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf', (SELECT id FROM committees WHERE name = '決算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和7年度立川市特別会計介護保険事業歳入歳出決算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第99号
- 区分：市長提出議案
- 審議の状況：決算特別委員会に付託
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第99号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和7年度立川市特別会計介護保険事業歳入歳出決算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第99号
- 区分：市長提出議案
- 審議の状況：決算特別委員会に付託
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第99号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第100号', 'bill', '令和7年度立川市特別会計後期高齢者医療事業歳入歳出決算', 'in_committee', '決算特別委員会に付託', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf', (SELECT id FROM committees WHERE name = '決算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和7年度立川市特別会計後期高齢者医療事業歳入歳出決算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第100号
- 区分：市長提出議案
- 審議の状況：決算特別委員会に付託
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第100号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和7年度立川市特別会計後期高齢者医療事業歳入歳出決算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第100号
- 区分：市長提出議案
- 審議の状況：決算特別委員会に付託
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian95-100.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第100号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第101号', 'bill', '令和7年度立川市下水道事業会計決算', 'in_committee', '決算特別委員会に付託', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian101.pdf', (SELECT id FROM committees WHERE name = '決算特別委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和7年度立川市下水道事業会計決算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第101号
- 区分：市長提出議案
- 審議の状況：決算特別委員会に付託
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian101.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第101号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和7年度立川市下水道事業会計決算', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第101号
- 区分：市長提出議案
- 審議の状況：決算特別委員会に付託
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian101.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第101号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第102号', 'bill', '令和8年度立川市一般会計補正予算(第3号)', 'approved', '令和8年9月10日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian102.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和8年度立川市一般会計補正予算(第3号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第102号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian102.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第102号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和8年度立川市一般会計補正予算(第3号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第102号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian102.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第102号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第103号', 'bill', '令和8年度立川市特別会計競輪事業補正予算(第1号)', 'approved', '令和8年9月10日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian103.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和8年度立川市特別会計競輪事業補正予算(第1号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第103号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian103.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第103号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和8年度立川市特別会計競輪事業補正予算(第1号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第103号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian103.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第103号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第104号', 'bill', '令和8年度立川市特別会計国民健康保険事業補正予算(第1号)', 'approved', '令和8年9月10日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian104.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和8年度立川市特別会計国民健康保険事業補正予算(第1号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第104号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian104.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第104号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和8年度立川市特別会計国民健康保険事業補正予算(第1号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第104号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian104.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第104号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第105号', 'bill', '令和8年度立川市特別会計後期高齢者医療事業補正予算(第1号)', 'approved', '令和8年9月10日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian105.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和8年度立川市特別会計後期高齢者医療事業補正予算(第1号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第105号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian105.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第105号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和8年度立川市特別会計後期高齢者医療事業補正予算(第1号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第105号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian105.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第105号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第106号', 'bill', '東京都市公平委員会共同設置規約の変更について', 'approved', '令和8年9月10日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian106.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '東京都市公平委員会共同設置規約の変更について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第106号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian106.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第106号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '東京都市公平委員会共同設置規約の変更について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第106号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian106.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第106号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第107号', 'bill', '立川市子どもの福祉審議会条例', 'in_committee', '厚生委員会に付託', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian107.pdf', (SELECT id FROM committees WHERE name = '厚生委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市子どもの福祉審議会条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第107号
- 区分：市長提出議案
- 審議の状況：厚生委員会に付託
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian107.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第107号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市子どもの福祉審議会条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第107号
- 区分：市長提出議案
- 審議の状況：厚生委員会に付託
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian107.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第107号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第108号', 'bill', '立川市印鑑条例の一部を改正する条例', 'approved', '令和8年9月10日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian108.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市印鑑条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第108号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian108.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第108号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市印鑑条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第108号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian108.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第108号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第109号', 'bill', '立川市事務手数料条例の一部を改正する条例', 'approved', '令和8年9月10日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian109.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市事務手数料条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第109号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian109.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第109号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市事務手数料条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第109号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian109.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第109号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第110号', 'bill', '立川市景観条例の一部を改正する条例', 'approved', '令和8年9月10日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian110.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市景観条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第110号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian110.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第110号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市景観条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第110号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian110.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第110号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第111号', 'bill', '立川市保健医療推進協議会条例の一部を改正する条例', 'approved', '令和8年9月10日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian111.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市保健医療推進協議会条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第111号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian111.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第111号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市保健医療推進協議会条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第111号
- 区分：市長提出議案
- 審議の状況：令和8年9月10日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian111.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第111号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第112号', 'bill', '令和8年度立川市一般会計補正予算(第4号)', 'submitted', '提出', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian112.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和8年度立川市一般会計補正予算(第4号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第112号
- 区分：市長提出議案
- 審議の状況：提出
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian112.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第112号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和8年度立川市一般会計補正予算(第4号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第112号
- 区分：市長提出議案
- 審議の状況：提出
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian112.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第112号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第113号', 'bill', '令和8年度立川市下水道事業会計補正予算(第1号)', 'submitted', '提出', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian113.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和8年度立川市下水道事業会計補正予算(第1号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第113号
- 区分：市長提出議案
- 審議の状況：提出
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian113.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第113号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和8年度立川市下水道事業会計補正予算(第1号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第113号
- 区分：市長提出議案
- 審議の状況：提出
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian113.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第113号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第114号', 'bill', '立川市西砂学童保育所・西砂小くるプレルーム(仮称)建替工事(建築)請負変更契約', 'submitted', '提出', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian114.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市西砂学童保育所・西砂小くるプレルーム(仮称)建替工事(建築)請負変更契約', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第114号
- 区分：市長提出議案
- 審議の状況：提出
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian114.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第114号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市西砂学童保育所・西砂小くるプレルーム(仮称)建替工事(建築)請負変更契約', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第114号
- 区分：市長提出議案
- 審議の状況：提出
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian114.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第114号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第115号', 'bill', '訴えの提起について', 'submitted', '提出', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian115.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '訴えの提起について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第115号
- 区分：市長提出議案
- 審議の状況：提出
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian115.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第115号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '訴えの提起について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第115号
- 区分：市長提出議案
- 審議の状況：提出
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian115.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第115号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第116号', 'bill', '立川市公園条例の一部を改正する条例', 'submitted', '提出', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian116.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市公園条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第116号
- 区分：市長提出議案
- 審議の状況：提出
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian116.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第116号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市公園条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議案第116号
- 区分：市長提出議案
- 審議の状況：提出
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8gian116.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議案第116号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;

COMMIT;
