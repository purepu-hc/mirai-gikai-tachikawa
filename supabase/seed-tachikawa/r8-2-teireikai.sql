-- 生成元: packages/tachikawa-ingest（AI不使用）
-- 出典: https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html
-- 対象: 令和8年第2回定例会（議案 42 件、請願・陳情 0 件）
BEGIN;

-- 会期
INSERT INTO council_sessions (name, slug, start_date, end_date, council_url, is_active)
VALUES ('令和8年第2回定例会', 'r8-2-teireikai', '2026-05-07', '2026-05-28', 'https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html', false)
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
VALUES ('令和8年委員会提出議案第1号', 'bill', '外交による中東情勢の平和的解決と国民生活の安定を求める意見書', 'approved', '令和8年5月28日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8iinkaigian01-2.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '外交による中東情勢の平和的解決と国民生活の安定を求める意見書', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：委員会提出議案第1号
- 区分：委員会提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8iinkaigian01-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年委員会提出議案第1号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '外交による中東情勢の平和的解決と国民生活の安定を求める意見書', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：委員会提出議案第1号
- 区分：委員会提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8iinkaigian01-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年委員会提出議案第1号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年委員会提出議案第2号', 'bill', '立川市議会会議規則の一部を改正する規則', 'approved', '令和8年5月28日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8iinkaigian02-2.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市議会会議規則の一部を改正する規則', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：委員会提出議案第2号
- 区分：委員会提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8iinkaigian02-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年委員会提出議案第2号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市議会会議規則の一部を改正する規則', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：委員会提出議案第2号
- 区分：委員会提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8iinkaigian02-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年委員会提出議案第2号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議員提出議案第1号', 'bill', '立川市がん条例', 'approved', '令和8年5月28日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8giingian01-2.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市がん条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議員提出議案第1号
- 区分：議員提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8giingian01-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議員提出議案第1号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市がん条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議員提出議案第1号
- 区分：議員提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8giingian01-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議員提出議案第1号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議員提出議案第2号', 'bill', 'すべてのケアラーに対する包括的な支援と法的枠組みの整備を求める意見書', 'approved', '令和8年5月28日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8giingian02-2.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', 'すべてのケアラーに対する包括的な支援と法的枠組みの整備を求める意見書', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議員提出議案第2号
- 区分：議員提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8giingian02-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議員提出議案第2号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', 'すべてのケアラーに対する包括的な支援と法的枠組みの整備を求める意見書', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議員提出議案第2号
- 区分：議員提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8giingian02-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議員提出議案第2号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議員提出議案第3号', 'bill', '住まいの安定と居住支援の抜本的強化を求める意見書', 'approved', '令和8年5月28日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8giingian03-2.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '住まいの安定と居住支援の抜本的強化を求める意見書', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議員提出議案第3号
- 区分：議員提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8giingian03-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議員提出議案第3号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '住まいの安定と居住支援の抜本的強化を求める意見書', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議員提出議案第3号
- 区分：議員提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8giingian03-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議員提出議案第3号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議員提出議案第4号', 'bill', 'ドナーミルクの利用拡大を求める意見書', 'approved', '令和8年5月28日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8giingian04-2.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', 'ドナーミルクの利用拡大を求める意見書', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議員提出議案第4号
- 区分：議員提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8giingian04-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議員提出議案第4号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', 'ドナーミルクの利用拡大を求める意見書', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議員提出議案第4号
- 区分：議員提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8giingian04-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議員提出議案第4号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議員提出議案第5号', 'bill', '冤罪などを生まないための検察不祥事の徹底検証を求める意見書', 'approved', '令和8年5月28日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8giingian05-2.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '冤罪などを生まないための検察不祥事の徹底検証を求める意見書', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議員提出議案第5号
- 区分：議員提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8giingian05-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議員提出議案第5号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '冤罪などを生まないための検察不祥事の徹底検証を求める意見書', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議員提出議案第5号
- 区分：議員提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8giingian05-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議員提出議案第5号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第59号', 'bill', '専決処分について(立川市市税賦課徴収条例等の一部を改正する条例)', 'approved', '令和8年5月15日、承認', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian59.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '専決処分について(立川市市税賦課徴収条例等の一部を改正する条例)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第59号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、承認
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian59.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第59号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '専決処分について(立川市市税賦課徴収条例等の一部を改正する条例)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第59号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、承認
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian59.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第59号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第60号', 'bill', '専決処分について(立川市都市計画税条例の一部を改正する条例)', 'approved', '令和8年5月15日、承認', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian60.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '専決処分について(立川市都市計画税条例の一部を改正する条例)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第60号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、承認
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian60.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第60号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '専決処分について(立川市都市計画税条例の一部を改正する条例)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第60号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、承認
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian60.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第60号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第61号', 'bill', '専決処分について(立川市アメリカ合衆国軍隊の構成員等の所有する軽自動車等に対する軽自動車税の種別割の特例に関する条例の一部を改正する条例)', 'approved', '令和8年5月15日、承認', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian61.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '専決処分について(立川市アメリカ合衆国軍隊の構成員等の所有する軽自動車等に対する軽自動車税の種別割の特例に関する条例の一部を改正する条例)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第61号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、承認
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian61.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第61号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '専決処分について(立川市アメリカ合衆国軍隊の構成員等の所有する軽自動車等に対する軽自動車税の種別割の特例に関する条例の一部を改正する条例)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第61号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、承認
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian61.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第61号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第62号', 'bill', '令和8年度立川市一般会計補正予算(第1号)', 'approved', '令和8年5月15日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian62.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和8年度立川市一般会計補正予算(第1号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第62号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian62.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第62号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和8年度立川市一般会計補正予算(第1号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第62号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian62.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第62号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第63号', 'bill', '令和8年度立川市特別会計介護保険事業補正予算(第1号)', 'approved', '令和8年5月15日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian63.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和8年度立川市特別会計介護保険事業補正予算(第1号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第63号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian63.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第63号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和8年度立川市特別会計介護保険事業補正予算(第1号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第63号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian63.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第63号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第64号', 'bill', '立川市道2級27号線の認定について', 'approved', '令和8年5月28日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian64-67.pdf', (SELECT id FROM committees WHERE name = '環境まちづくり委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市道2級27号線の認定について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第64号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian64-67.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第64号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市道2級27号線の認定について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第64号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian64-67.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第64号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第65号', 'bill', '立川市道2級28号線の認定について', 'approved', '令和8年5月28日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian64-67.pdf', (SELECT id FROM committees WHERE name = '環境まちづくり委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市道2級28号線の認定について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第65号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian64-67.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第65号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市道2級28号線の認定について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第65号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian64-67.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第65号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第66号', 'bill', '立川市道2級29号線の認定について', 'approved', '令和8年5月28日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian64-67.pdf', (SELECT id FROM committees WHERE name = '環境まちづくり委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市道2級29号線の認定について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第66号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian64-67.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第66号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市道2級29号線の認定について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第66号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian64-67.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第66号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第67号', 'bill', '立川市道2級30号線の認定について', 'approved', '令和8年5月28日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian64-67.pdf', (SELECT id FROM committees WHERE name = '環境まちづくり委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市道2級30号線の認定について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第67号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian64-67.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第67号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市道2級30号線の認定について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第67号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian64-67.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第67号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第68号', 'bill', '立川市道南212号線の廃止について', 'approved', '令和8年5月28日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian68.pdf', (SELECT id FROM committees WHERE name = '環境まちづくり委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市道南212号線の廃止について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第68号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian68.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第68号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市道南212号線の廃止について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第68号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian68.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第68号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第69号', 'bill', '損害賠償の和解について', 'approved', '令和8年5月15日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian69.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '損害賠償の和解について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第69号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian69.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第69号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '損害賠償の和解について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第69号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian69.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第69号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第70号', 'bill', '立川市市税賦課徴収条例の一部を改正する条例', 'approved', '令和8年5月15日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian70-2.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市市税賦課徴収条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第70号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian70-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第70号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市市税賦課徴収条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第70号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian70-2.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第70号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第71号', 'bill', '立川市介護保険条例の一部を改正する条例', 'approved', '令和8年5月15日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian71.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市介護保険条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第71号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian71.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第71号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市介護保険条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第71号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian71.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第71号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第72号', 'bill', '立川市家庭的保育事業等の設備及び運営に関する基準を定める条例等の一部を改正する条例', 'approved', '令和8年5月15日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian72.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市家庭的保育事業等の設備及び運営に関する基準を定める条例等の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第72号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian72.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第72号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市家庭的保育事業等の設備及び運営に関する基準を定める条例等の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第72号
- 区分：市長提出議案
- 審議の状況：令和8年5月15日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian72.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第72号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第73号', 'bill', '令和8年度立川市一般会計補正予算(第2号)', 'approved', '令和8年5月28日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian73.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '令和8年度立川市一般会計補正予算(第2号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第73号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian73.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第73号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '令和8年度立川市一般会計補正予算(第2号)', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第73号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian73.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第73号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第74号', 'bill', '立川市西砂学童保育所・西砂小くるプレルーム(仮称)建替工事(建築)請負変更契約', 'approved', '令和8年5月28日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian74.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市西砂学童保育所・西砂小くるプレルーム(仮称)建替工事(建築)請負変更契約', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第74号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian74.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第74号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市西砂学童保育所・西砂小くるプレルーム(仮称)建替工事(建築)請負変更契約', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第74号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian74.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第74号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第75号', 'bill', '立川市総合福祉センター条例の一部を改正する条例', 'approved', '令和8年5月28日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian75.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市総合福祉センター条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第75号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian75.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第75号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市総合福祉センター条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第75号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian75.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第75号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第76号', 'bill', '立川市斎場条例の一部を改正する条例', 'approved', '令和8年5月28日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian76.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市斎場条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第76号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian76.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第76号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市斎場条例の一部を改正する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第76号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian76.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第76号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第77号', 'bill', '立川市林間施設条例を廃止する条例', 'approved', '令和8年5月28日、可決', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian77.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市林間施設条例を廃止する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第77号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian77.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第77号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市林間施設条例を廃止する条例', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第77号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、可決
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/155/r8gian77.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第77号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第78号', 'bill', '立川市農業委員会委員の任命について', 'approved', '令和8年5月28日、同意', NULL, NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第78号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第78号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第78号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第78号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第79号', 'bill', '立川市農業委員会委員の任命について', 'approved', '令和8年5月28日、同意', NULL, NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第79号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第79号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第79号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第79号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第80号', 'bill', '立川市農業委員会委員の任命について', 'approved', '令和8年5月28日、同意', NULL, NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第80号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第80号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第80号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第80号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第81号', 'bill', '立川市農業委員会委員の任命について', 'approved', '令和8年5月28日、同意', NULL, NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第81号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第81号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第81号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第81号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第82号', 'bill', '立川市農業委員会委員の任命について', 'approved', '令和8年5月28日、同意', NULL, NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第82号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第82号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第82号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第82号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第83号', 'bill', '立川市農業委員会委員の任命について', 'approved', '令和8年5月28日、同意', NULL, NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第83号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第83号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第83号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第83号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第84号', 'bill', '立川市農業委員会委員の任命について', 'approved', '令和8年5月28日、同意', NULL, NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第84号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第84号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第84号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第84号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第85号', 'bill', '立川市農業委員会委員の任命について', 'approved', '令和8年5月28日、同意', NULL, NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第85号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第85号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第85号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第85号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第86号', 'bill', '立川市農業委員会委員の任命について', 'approved', '令和8年5月28日、同意', NULL, NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第86号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第86号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第86号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第86号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第87号', 'bill', '立川市農業委員会委員の任命について', 'approved', '令和8年5月28日、同意', NULL, NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第87号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第87号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第87号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第87号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第88号', 'bill', '立川市農業委員会委員の任命について', 'approved', '令和8年5月28日、同意', NULL, NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第88号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第88号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第88号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第88号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第89号', 'bill', '立川市農業委員会委員の任命について', 'approved', '令和8年5月28日、同意', NULL, NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第89号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第89号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第89号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第89号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第90号', 'bill', '立川市農業委員会委員の任命について', 'approved', '令和8年5月28日、同意', NULL, NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第90号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第90号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第90号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第90号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第91号', 'bill', '立川市農業委員会委員の任命について', 'approved', '令和8年5月28日、同意', NULL, NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第91号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第91号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '立川市農業委員会委員の任命について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第91号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第91号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第92号', 'bill', '人権擁護委員候補者の推薦について', 'approved', '令和8年5月28日、同意', NULL, NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '人権擁護委員候補者の推薦について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第92号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第92号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '人権擁護委員候補者の推薦について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第92号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第92号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議案第93号', 'bill', '人権擁護委員候補者の推薦について', 'approved', '令和8年5月28日、同意', NULL, NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '人権擁護委員候補者の推薦について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第93号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第93号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '人権擁護委員候補者の推薦について', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第2回定例会
- 番号：議案第93号
- 区分：市長提出議案
- 審議の状況：令和8年5月28日、同意
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026376/1027155.html' FROM bills WHERE bill_number = '令和8年議案第93号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;

COMMIT;
