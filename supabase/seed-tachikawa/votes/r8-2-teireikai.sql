-- 生成元: packages/tachikawa-ingest（AI不使用）
-- 出典: たちかわ市議会便り 第343号（令和8年7月10日発行）8ページ「各議案等に対する賛否」
--       https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/892/343-8.pdf
-- 対象: r8-2-teireikai（賛否が分かれたもの 1 件、全員一致の議案 42 件、全員一致の請願・陳情 採択 1 件・不採択 4 件、表決なし 1 件）
BEGIN;

-- 会派（当時の会派。無ければ過去の会派として追加）
INSERT INTO factions (name, display_name, sort_order, is_active)
SELECT '公明党', '公明党', 101, false
WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = '公明党');
INSERT INTO factions (name, display_name, sort_order, is_active)
SELECT '日本共産党', '日本共産党', 102, false
WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = '日本共産党');
INSERT INTO factions (name, display_name, sort_order, is_active)
SELECT '立憲ネット緑たちかわ', '立憲ネット緑たちかわ', 103, false
WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = '立憲ネット緑たちかわ');
INSERT INTO factions (name, display_name, sort_order, is_active)
SELECT '自民党クラブ', '自民党クラブ', 104, false
WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = '自民党クラブ');
INSERT INTO factions (name, display_name, sort_order, is_active)
SELECT '国民民主党', '国民民主党', 105, false
WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = '国民民主党');
INSERT INTO factions (name, display_name, sort_order, is_active)
SELECT '安進会', '安進会', 106, false
WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = '安進会');
INSERT INTO factions (name, display_name, sort_order, is_active)
SELECT '自由民主党', '自由民主党', 107, false
WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = '自由民主党');
INSERT INTO factions (name, display_name, sort_order, is_active)
SELECT '立川の未来', '立川の未来', 108, false
WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = '立川の未来');
INSERT INTO factions (name, display_name, sort_order, is_active)
SELECT 'たちかわ自民党', 'たちかわ自民党', 109, false
WHERE NOT EXISTS (SELECT 1 FROM factions WHERE name = 'たちかわ自民党');

-- 件数の確認（合わなければエラーで止まり、何も変更されない）
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n FROM bills b WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_number IN ('令和8年陳情第6号');
  IF n <> 1 THEN RAISE EXCEPTION '件数が合いません（賛否が分かれたもの）: % 件 / 入力 1 件', n; END IF;
  SELECT count(*) INTO n FROM bills b WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_type <> 'petition' AND b.bill_number NOT IN ('令和8年陳情第6号', '令和8年陳情第8号');
  IF n <> 42 THEN RAISE EXCEPTION '件数が合いません（全員一致の議案）: % 件 / 入力 42 件', n; END IF;
  SELECT count(*) INTO n FROM bills b WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_type = 'petition' AND b.bill_number IN ('令和8年陳情第9号');
  IF n <> 1 THEN RAISE EXCEPTION '件数が合いません（全員一致で採択の請願・陳情）: % 件 / 入力 1 件', n; END IF;
  SELECT count(*) INTO n FROM bills b WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_type = 'petition' AND b.bill_number IN ('令和8年陳情第3号', '令和8年陳情第4号', '令和8年陳情第5号', '令和8年陳情第7号');
  IF n <> 4 THEN RAISE EXCEPTION '件数が合いません（全員一致で不採択の請願・陳情）: % 件 / 入力 4 件', n; END IF;
  SELECT count(*) INTO n FROM bills b WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_number IN ('令和8年陳情第8号');
  IF n <> 1 THEN RAISE EXCEPTION '件数が合いません（表決がなかったもの）: % 件 / 入力 1 件', n; END IF;
  SELECT count(*) INTO n FROM bills b WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_type = 'petition' AND b.bill_number NOT IN ('令和8年陳情第6号', '令和8年陳情第9号', '令和8年陳情第3号', '令和8年陳情第4号', '令和8年陳情第5号', '令和8年陳情第7号', '令和8年陳情第8号');
  IF n <> 0 THEN RAISE EXCEPTION '件数が合いません（入力にない請願・陳情）: % 件 / 入力 0 件', n; END IF;
  SELECT count(*) INTO n FROM factions WHERE name IN ('公明党', '日本共産党', '立憲ネット緑たちかわ', '自民党クラブ', '国民民主党', '安進会', '自由民主党', '立川の未来', 'たちかわ自民党');
  IF n <> 9 THEN RAISE EXCEPTION '件数が合いません（会派）: % 件 / 入力 9 件', n; END IF;
END $$;

-- 賛否が分かれたもの
INSERT INTO faction_stances (bill_id, faction_id, type, comment)
SELECT b.id, f.id, 'against', NULL FROM bills b, factions f WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_number = '令和8年陳情第6号' AND f.name = '公明党'
ON CONFLICT (bill_id, faction_id) DO UPDATE SET type = EXCLUDED.type, comment = EXCLUDED.comment, updated_at = now();
INSERT INTO faction_stances (bill_id, faction_id, type, comment)
SELECT b.id, f.id, 'against', '所属議員5人のうち1人は退席' FROM bills b, factions f WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_number = '令和8年陳情第6号' AND f.name = '日本共産党'
ON CONFLICT (bill_id, faction_id) DO UPDATE SET type = EXCLUDED.type, comment = EXCLUDED.comment, updated_at = now();
INSERT INTO faction_stances (bill_id, faction_id, type, comment)
SELECT b.id, f.id, 'against', NULL FROM bills b, factions f WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_number = '令和8年陳情第6号' AND f.name = '立憲ネット緑たちかわ'
ON CONFLICT (bill_id, faction_id) DO UPDATE SET type = EXCLUDED.type, comment = EXCLUDED.comment, updated_at = now();
INSERT INTO faction_stances (bill_id, faction_id, type, comment)
SELECT b.id, f.id, 'against', NULL FROM bills b, factions f WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_number = '令和8年陳情第6号' AND f.name = '自民党クラブ'
ON CONFLICT (bill_id, faction_id) DO UPDATE SET type = EXCLUDED.type, comment = EXCLUDED.comment, updated_at = now();
INSERT INTO faction_stances (bill_id, faction_id, type, comment)
SELECT b.id, f.id, 'against', NULL FROM bills b, factions f WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_number = '令和8年陳情第6号' AND f.name = '国民民主党'
ON CONFLICT (bill_id, faction_id) DO UPDATE SET type = EXCLUDED.type, comment = EXCLUDED.comment, updated_at = now();
INSERT INTO faction_stances (bill_id, faction_id, type, comment)
SELECT b.id, f.id, 'against', NULL FROM bills b, factions f WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_number = '令和8年陳情第6号' AND f.name = '安進会'
ON CONFLICT (bill_id, faction_id) DO UPDATE SET type = EXCLUDED.type, comment = EXCLUDED.comment, updated_at = now();
INSERT INTO faction_stances (bill_id, faction_id, type, comment)
SELECT b.id, f.id, 'against', NULL FROM bills b, factions f WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_number = '令和8年陳情第6号' AND f.name = '自由民主党'
ON CONFLICT (bill_id, faction_id) DO UPDATE SET type = EXCLUDED.type, comment = EXCLUDED.comment, updated_at = now();
INSERT INTO faction_stances (bill_id, faction_id, type, comment)
SELECT b.id, f.id, 'against', NULL FROM bills b, factions f WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_number = '令和8年陳情第6号' AND f.name = '立川の未来'
ON CONFLICT (bill_id, faction_id) DO UPDATE SET type = EXCLUDED.type, comment = EXCLUDED.comment, updated_at = now();
INSERT INTO faction_stances (bill_id, faction_id, type, comment)
SELECT b.id, f.id, 'against', NULL FROM bills b, factions f WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_number = '令和8年陳情第6号' AND f.name = 'たちかわ自民党'
ON CONFLICT (bill_id, faction_id) DO UPDATE SET type = EXCLUDED.type, comment = EXCLUDED.comment, updated_at = now();

-- 全員一致の議案（全会派 賛成）
INSERT INTO faction_stances (bill_id, faction_id, type, comment)
SELECT b.id, f.id, 'for', NULL FROM bills b CROSS JOIN factions f
WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_type <> 'petition' AND b.bill_number NOT IN ('令和8年陳情第6号', '令和8年陳情第8号') AND f.name IN ('公明党', '日本共産党', '立憲ネット緑たちかわ', '自民党クラブ', '国民民主党', '安進会', '自由民主党', '立川の未来', 'たちかわ自民党')
ON CONFLICT (bill_id, faction_id) DO UPDATE SET type = EXCLUDED.type, comment = EXCLUDED.comment, updated_at = now();

-- 全員一致で採択の請願・陳情（全会派 賛成）
INSERT INTO faction_stances (bill_id, faction_id, type, comment)
SELECT b.id, f.id, 'for', NULL FROM bills b CROSS JOIN factions f
WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_type = 'petition' AND b.bill_number IN ('令和8年陳情第9号') AND f.name IN ('公明党', '日本共産党', '立憲ネット緑たちかわ', '自民党クラブ', '国民民主党', '安進会', '自由民主党', '立川の未来', 'たちかわ自民党')
ON CONFLICT (bill_id, faction_id) DO UPDATE SET type = EXCLUDED.type, comment = EXCLUDED.comment, updated_at = now();

-- 全員一致で不採択の請願・陳情（全会派 反対＝採択に反対）
INSERT INTO faction_stances (bill_id, faction_id, type, comment)
SELECT b.id, f.id, 'against', NULL FROM bills b CROSS JOIN factions f
WHERE b.council_session_id = (SELECT id FROM council_sessions WHERE slug = 'r8-2-teireikai') AND b.bill_type = 'petition' AND b.bill_number IN ('令和8年陳情第3号', '令和8年陳情第4号', '令和8年陳情第5号', '令和8年陳情第7号') AND f.name IN ('公明党', '日本共産党', '立憲ネット緑たちかわ', '自民党クラブ', '国民民主党', '安進会', '自由民主党', '立川の未来', 'たちかわ自民党')
ON CONFLICT (bill_id, faction_id) DO UPDATE SET type = EXCLUDED.type, comment = EXCLUDED.comment, updated_at = now();

COMMIT;
