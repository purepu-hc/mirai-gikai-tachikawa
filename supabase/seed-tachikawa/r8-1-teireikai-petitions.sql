-- 生成元: packages/tachikawa-ingest（AI不使用）
-- 出典: https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026381.html
-- 対象: 令和8年第1回定例会（議案 0 件、請願・陳情 2 件）
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
VALUES ('令和7年陳情第25号', 'petition', '日野自動車工場跡地に建設予定の高層データセンターに関する陳情', 'rejected', '令和8年3月24日、不採択', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/381/r7chinjou25.pdf', (SELECT id FROM committees WHERE name = '議会運営委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '日野自動車工場跡地に建設予定の高層データセンターに関する陳情', 'やさしい解説は準備中です。', '## この請願・陳情について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：令和7年陳情第25号
- 区分：陳情
- 審議の状況：令和8年3月24日、不採択
- 資料（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/381/r7chinjou25.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026381.html' FROM bills WHERE bill_number = '令和7年陳情第25号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '日野自動車工場跡地に建設予定の高層データセンターに関する陳情', 'やさしい解説は準備中です。', '## この請願・陳情について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：令和7年陳情第25号
- 区分：陳情
- 審議の状況：令和8年3月24日、不採択
- 資料（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/381/r7chinjou25.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026381.html' FROM bills WHERE bill_number = '令和7年陳情第25号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年陳情第1号', 'petition', 'R7年12月25日及びR8年1月21日の「立広聴第174号についてのご連絡」(広報プロモーション課宛)のメール対応に関する陳情', 'rejected', '令和8年3月24日、不採択', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/381/r8chinjou01.pdf', (SELECT id FROM committees WHERE name = '総務委員会' LIMIT 1), (SELECT id FROM council_sessions WHERE slug = 'r8-1-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', 'R7年12月25日及びR8年1月21日の「立広聴第174号についてのご連絡」(広報プロモーション課宛)のメール対応に関する陳情', 'やさしい解説は準備中です。', '## この請願・陳情について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：令和8年陳情第1号
- 区分：陳情
- 審議の状況：令和8年3月24日、不採択
- 資料（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/381/r8chinjou01.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026381.html' FROM bills WHERE bill_number = '令和8年陳情第1号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', 'R7年12月25日及びR8年1月21日の「立広聴第174号についてのご連絡」(広報プロモーション課宛)のメール対応に関する陳情', 'やさしい解説は準備中です。', '## この請願・陳情について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第1回定例会
- 番号：令和8年陳情第1号
- 区分：陳情
- 審議の状況：令和8年3月24日、不採択
- 資料（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/026/381/r8chinjou01.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026375/1026381.html' FROM bills WHERE bill_number = '令和8年陳情第1号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;

COMMIT;
