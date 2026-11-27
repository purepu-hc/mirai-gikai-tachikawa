-- 立川市議会 議員マスター（packages/tachikawa-ingest の build-members-sql で生成。手で編集しない）
BEGIN;

-- 使う会派が factions に1件ずつあるか確認（なければ止める）
DO $check$
DECLARE n integer;
BEGIN
  SELECT count(*) INTO n FROM factions WHERE name = '日本共産党';
  IF n <> 1 THEN RAISE EXCEPTION '会派 % が % 件あります（1件のはず）', '日本共産党', n; END IF;
  SELECT count(*) INTO n FROM factions WHERE name = '立憲ネット緑たちかわ';
  IF n <> 1 THEN RAISE EXCEPTION '会派 % が % 件あります（1件のはず）', '立憲ネット緑たちかわ', n; END IF;
  SELECT count(*) INTO n FROM factions WHERE name = '立川の未来';
  IF n <> 1 THEN RAISE EXCEPTION '会派 % が % 件あります（1件のはず）', '立川の未来', n; END IF;
  SELECT count(*) INTO n FROM factions WHERE name = 'たちかわ自由民主党 参政党';
  IF n <> 1 THEN RAISE EXCEPTION '会派 % が % 件あります（1件のはず）', 'たちかわ自由民主党 参政党', n; END IF;
  SELECT count(*) INTO n FROM factions WHERE name = '公明党';
  IF n <> 1 THEN RAISE EXCEPTION '会派 % が % 件あります（1件のはず）', '公明党', n; END IF;
  SELECT count(*) INTO n FROM factions WHERE name = '自民党安進会・維新の会';
  IF n <> 1 THEN RAISE EXCEPTION '会派 % が % 件あります（1件のはず）', '自民党安進会・維新の会', n; END IF;
  SELECT count(*) INTO n FROM factions WHERE name = '立川けやき会';
  IF n <> 1 THEN RAISE EXCEPTION '会派 % が % 件あります（1件のはず）', '立川けやき会', n; END IF;
  SELECT count(*) INTO n FROM factions WHERE name = '日本保守党';
  IF n <> 1 THEN RAISE EXCEPTION '会派 % が % 件あります（1件のはず）', '日本保守党', n; END IF;
  SELECT count(*) INTO n FROM factions WHERE name = '国民民主党';
  IF n <> 1 THEN RAISE EXCEPTION '会派 % が % 件あります（1件のはず）', '国民民主党', n; END IF;
  SELECT count(*) INTO n FROM factions WHERE name = '自由民主党';
  IF n <> 1 THEN RAISE EXCEPTION '会派 % が % 件あります（1件のはず）', '自由民主党', n; END IF;
  SELECT count(*) INTO n FROM factions WHERE name = 'たちかわ自民党';
  IF n <> 1 THEN RAISE EXCEPTION '会派 % が % 件あります（1件のはず）', 'たちかわ自民党', n; END IF;
  SELECT count(*) INTO n FROM factions WHERE name = '安進会';
  IF n <> 1 THEN RAISE EXCEPTION '会派 % が % 件あります（1件のはず）', '安進会', n; END IF;
  SELECT count(*) INTO n FROM factions WHERE name = '自民党クラブ';
  IF n <> 1 THEN RAISE EXCEPTION '会派 % が % 件あります（1件のはず）', '自民党クラブ', n; END IF;
  SELECT count(*) INTO n FROM factions WHERE name = '都民ファーストの会立川市議会';
  IF n <> 1 THEN RAISE EXCEPTION '会派 % が % 件あります（1件のはず）', '都民ファーストの会立川市議会', n; END IF;
END
$check$;

-- 議員
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('asakawa-shuichi', '浅川　修一', 'あさかわ　しゅういち', 1, 'http://senkyo.jcp-tokyo.net/asakawa/', 'https://x.com/asakawasyuuitij', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('abe-misa', 'あべ　みさ', 'あべ　みさ', 2, 'https://abemisa.seikatsusha.me/', 'https://x.com/misa946', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('ishitobi-kaori', 'いしとび　かおり', 'いしとび　かおり', 3, 'https://ishitobi.tokyo/', 'https://x.com/kaori_ishitobi', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('ichinose-yoko', 'いちのせ　陽子', 'いちのせ　ようこ', 4, 'https://ichinoseyoko.jp/', 'https://x.com/youko_ichinose', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('ito-yukihide', '伊藤　幸秀', 'いとう　ゆきひで', 5, 'http://www.komei.or.jp/km/ito-yukihide/', NULL, '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('inahashi-yumiko', '稲橋　ゆみ子', 'いなはし　ゆみこ', 6, 'https://inahashiyumiko.jp/', 'https://x.com/YumikoInahashi', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('uebayashi-takaya', '上林　たかや', 'うえばやし　たかや', 7, NULL, NULL, '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('eguchi-genki', '江口　元気', 'えぐち　げんき', 8, 'https://eguchi-genki.studio.site/', 'https://x.com/genkieguchi1', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('ooishi-fumio', '大石　ふみお', 'おおいし　ふみお', 9, NULL, NULL, '2026-11-26'::date, false)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('oosawa-junichi', '大沢　純一', 'おおさわ　じゅんいち', 10, 'http://j-osawa.com/', 'https://x.com/jun1osawa', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('kadokura-masako', '門倉　正子', 'かどくら　まさこ', 11, 'http://www.komei.or.jp/km/tachikawa-kadokura-masako/', 'https://x.com/masako_kadokura', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('kamijo-shoichi', '上條　彰一', 'かみじょう　しょういち', 12, NULL, NULL, '2026-11-26'::date, false)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('kihara-hiroshi', '木原　宏', 'きはら　ひろし', 13, 'https://kihara-hiroshi.jp/', 'https://x.com/kihara_hirosh', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('kumekawa-toshio', '粂川　敏男', 'くめかわ　としお', 14, NULL, NULL, '2026-11-26'::date, false)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('gondo-yoshitsugu', '権藤　よしつぐ', 'ごんどう　よしつぐ', 15, 'https://gondou.net/', 'https://x.com/gondoyoshitsugu', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('sasaki-takamasa', '佐々木　たかまさ', 'ささき　たかまさ', 16, 'https://sasataka.com/', 'https://x.com/sasaki_takamasa', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('se-nobuhiro', '瀬　順弘', 'せ　のぶひろ', 17, 'http://www.komei.or.jp/km/tachikawa-se-nobuhiro/', 'https://x.com/se_nobu', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('takaguchi-yasuhiko', '高口　靖彦', 'たかぐち　やすひこ', 18, NULL, NULL, '2026-11-26'::date, false)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('takahata-nami', '髙畠　奈美', 'たかはた　なみ', 19, 'https://takahata-nami.net/', 'https://x.com/takahatanami', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('toyama-taro', '頭山　太郎', 'とうやま　たろう', 20, NULL, NULL, '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('tomita-itaru', '冨田　いたる', 'とみた　いたる', 21, 'https://www.itaru-tomita.com/', 'https://x.com/itaru1964', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('nakai-akiko', '中井　あきこ', 'なかい　あきこ', 22, 'https://lit.link/nakai-akiko', 'https://x.com/nakai_akikomei', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('nakamachi-satoshi', '中町　聡', 'なかまち　さとし', 23, 'https://jcp-tachikawa.jp/hp/giin#profile_nakamachi', 'https://x.com/Sts_Nakamachi', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('nagamoto-kyoko', '永元　香子', 'ながもと　きょうこ', 24, 'https://jcp-tachikawa.jp/hp/', 'https://x.com/kyoko8129', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('nakayama-hitomi', '中山　ひと美', 'なかやま　ひとみ', 25, 'http://www.nakayama-hitomi.jp/', 'https://x.com/nakayamahitomi', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('hara-yuki', '原　ゆき', 'はら　ゆき', 26, 'https://harayuki.com/', 'https://x.com/yukiharappa', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('hiyama-shogo', 'ひやま　昇吾', 'ひやま　しょうご', 27, 'https://s-hiyama.com/', 'https://x.com/shtachikawa06', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('fukushima-masami', '福島　正美', 'ふくしま　まさみ', 28, 'https://www.komei.or.jp/km/tachikawa-fukushima-masami/', 'https://x.com/mamfunks1960', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('yata-kazuhisa', 'やた　一久', 'やた　かずひさ', 29, 'https://1link.jp/kazuhisayata', 'https://x.com/kazuhisayata', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('yamamoto-michiyo', '山本　みちよ', 'やまもと　みちよ', 30, NULL, NULL, '2026-11-26'::date, false)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('yamamoto-yosuke', '山本　洋輔', 'やまもと　ようすけ', 31, 'http://yamamoto-yosuke.com/', 'https://x.com/Y_Yamamoto1106', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('wakaki-sanae', '若木　早苗', 'わかき　さなえ', 32, 'https://jcp-tachikawa.jp/hp/', 'https://x.com/wakakisanae', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;
INSERT INTO council_members (slug, name, name_kana, sort_order, homepage_url, x_url, links_checked_at, is_current)
VALUES ('watanabe-chuji', 'わたなべ　忠司', 'わたなべ　ちゅうじ', 33, 'http://watanabe.chu.jp/', 'https://x.com/watanabe_chuji', '2026-11-26'::date, true)
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, name_kana = EXCLUDED.name_kana, sort_order = EXCLUDED.sort_order, homepage_url = EXCLUDED.homepage_url, x_url = EXCLUDED.x_url, links_checked_at = EXCLUDED.links_checked_at, is_current = EXCLUDED.is_current;

-- 任期と議席
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'asakawa-shuichi'), '2026-07-14'::date, NULL, 20, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'abe-misa'), '2026-07-14'::date, NULL, 17, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'ishitobi-kaori'), '2026-07-14'::date, NULL, 2, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'ichinose-yoko'), '2026-07-14'::date, NULL, 9, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'ito-yukihide'), '2026-07-14'::date, NULL, 26, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'inahashi-yumiko'), '2026-07-14'::date, NULL, 22, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'uebayashi-takaya'), '2026-07-14'::date, NULL, 8, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'eguchi-genki'), '2026-07-14'::date, NULL, 11, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'oosawa-junichi'), '2026-07-14'::date, NULL, 14, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'kadokura-masako'), '2026-07-14'::date, NULL, 24, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'kihara-hiroshi'), '2026-07-14'::date, NULL, 28, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'gondo-yoshitsugu'), '2026-07-14'::date, NULL, 7, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'sasaki-takamasa'), '2026-07-14'::date, NULL, 4, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'se-nobuhiro'), '2026-07-14'::date, NULL, 13, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'takahata-nami'), '2026-07-14'::date, NULL, 12, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'toyama-taro'), '2026-07-14'::date, NULL, 27, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'tomita-itaru'), '2026-07-14'::date, NULL, 1, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'nakai-akiko'), '2026-07-14'::date, NULL, 6, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'nakamachi-satoshi'), '2026-07-14'::date, NULL, 19, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'nagamoto-kyoko'), '2026-07-14'::date, NULL, 18, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'nakayama-hitomi'), '2026-07-14'::date, NULL, 10, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'hara-yuki'), '2026-07-14'::date, NULL, 15, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'hiyama-shogo'), '2026-07-14'::date, NULL, 3, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'fukushima-masami'), '2026-07-14'::date, NULL, 25, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'yata-kazuhisa'), '2026-07-14'::date, NULL, 5, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'yamamoto-yosuke'), '2026-07-14'::date, NULL, 16, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'wakaki-sanae'), '2026-07-14'::date, NULL, 21, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'watanabe-chuji'), '2026-07-14'::date, NULL, 23, NULL)
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'asakawa-shuichi'), '2022-07-14'::date, '2026-07-13'::date, 18, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'abe-misa'), '2022-07-14'::date, '2026-07-13'::date, 2, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'ishitobi-kaori'), '2022-07-14'::date, '2026-07-13'::date, 5, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'ito-yukihide'), '2022-07-14'::date, '2026-07-13'::date, 26, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'inahashi-yumiko'), '2022-07-14'::date, '2026-07-13'::date, 21, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'eguchi-genki'), '2022-07-14'::date, '2026-07-13'::date, 10, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'ooishi-fumio'), '2022-07-14'::date, '2026-07-13'::date, 15, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'oosawa-junichi'), '2022-07-14'::date, '2026-07-13'::date, 13, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'kadokura-masako'), '2022-07-14'::date, '2026-07-13'::date, 14, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'kamijo-shoichi'), '2022-07-14'::date, '2026-07-13'::date, 20, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'kumekawa-toshio'), '2022-07-14'::date, '2026-07-13'::date, 8, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'se-nobuhiro'), '2022-07-14'::date, '2026-07-13'::date, 12, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'takaguchi-yasuhiko'), '2022-07-14'::date, '2026-07-13'::date, 23, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'takahata-nami'), '2022-07-14'::date, '2026-07-13'::date, 7, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'toyama-taro'), '2022-07-14'::date, '2026-07-13'::date, 11, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'nakamachi-satoshi'), '2022-07-14'::date, '2026-07-13'::date, 19, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'nagamoto-kyoko'), '2022-07-14'::date, '2026-07-13'::date, 1, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'nakayama-hitomi'), '2022-07-14'::date, '2026-07-13'::date, 22, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'hara-yuki'), '2022-07-14'::date, '2026-07-13'::date, 3, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'fukushima-masami'), '2022-07-14'::date, '2026-07-13'::date, 25, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'yamamoto-michiyo'), '2022-07-14'::date, '2026-07-13'::date, 24, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'yamamoto-yosuke'), '2022-07-14'::date, '2026-07-13'::date, 4, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'wakaki-sanae'), '2022-07-14'::date, '2026-07-13'::date, 17, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;
INSERT INTO council_member_terms (member_id, term_start, term_end, seat_number, end_reason)
VALUES ((SELECT id FROM council_members WHERE slug = 'watanabe-chuji'), '2022-07-14'::date, '2026-07-13'::date, 16, '任期満了')
ON CONFLICT (member_id, term_start) DO UPDATE SET term_end = EXCLUDED.term_end, seat_number = EXCLUDED.seat_number, end_reason = EXCLUDED.end_reason;

-- 会派の所属（出典で確認できた期間）
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'asakawa-shuichi'), (SELECT id FROM factions WHERE name = '日本共産党'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'abe-misa'), (SELECT id FROM factions WHERE name = '立憲ネット緑たちかわ'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'ishitobi-kaori'), (SELECT id FROM factions WHERE name = '立川の未来'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'ichinose-yoko'), (SELECT id FROM factions WHERE name = 'たちかわ自由民主党 参政党'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'ito-yukihide'), (SELECT id FROM factions WHERE name = '公明党'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'inahashi-yumiko'), (SELECT id FROM factions WHERE name = '立憲ネット緑たちかわ'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'uebayashi-takaya'), (SELECT id FROM factions WHERE name = 'たちかわ自由民主党 参政党'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'eguchi-genki'), (SELECT id FROM factions WHERE name = '自民党安進会・維新の会'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'oosawa-junichi'), (SELECT id FROM factions WHERE name = '公明党'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'kadokura-masako'), (SELECT id FROM factions WHERE name = '公明党'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'kihara-hiroshi'), (SELECT id FROM factions WHERE name = '自民党安進会・維新の会'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'gondo-yoshitsugu'), (SELECT id FROM factions WHERE name = '自民党安進会・維新の会'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'sasaki-takamasa'), (SELECT id FROM factions WHERE name = '立川けやき会'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'se-nobuhiro'), (SELECT id FROM factions WHERE name = '公明党'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'takahata-nami'), (SELECT id FROM factions WHERE name = '自民党安進会・維新の会'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'toyama-taro'), (SELECT id FROM factions WHERE name = '自民党安進会・維新の会'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'tomita-itaru'), (SELECT id FROM factions WHERE name = '日本保守党'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'nakai-akiko'), (SELECT id FROM factions WHERE name = '公明党'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'nakamachi-satoshi'), (SELECT id FROM factions WHERE name = '日本共産党'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'nagamoto-kyoko'), (SELECT id FROM factions WHERE name = '日本共産党'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'nakayama-hitomi'), (SELECT id FROM factions WHERE name = 'たちかわ自由民主党 参政党'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'hara-yuki'), (SELECT id FROM factions WHERE name = '立憲ネット緑たちかわ'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'hiyama-shogo'), (SELECT id FROM factions WHERE name = '立川けやき会'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'fukushima-masami'), (SELECT id FROM factions WHERE name = '公明党'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'yata-kazuhisa'), (SELECT id FROM factions WHERE name = '立川けやき会'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'yamamoto-yosuke'), (SELECT id FROM factions WHERE name = '立憲ネット緑たちかわ'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'wakaki-sanae'), (SELECT id FROM factions WHERE name = '日本共産党'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'watanabe-chuji'), (SELECT id FROM factions WHERE name = '立憲ネット緑たちかわ'), '2026-07-14'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/shokai/1021861.html')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'asakawa-shuichi'), (SELECT id FROM factions WHERE name = '日本共産党'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'abe-misa'), (SELECT id FROM factions WHERE name = '立憲ネット緑たちかわ'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'ito-yukihide'), (SELECT id FROM factions WHERE name = '公明党'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'inahashi-yumiko'), (SELECT id FROM factions WHERE name = '立憲ネット緑たちかわ'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'ooishi-fumio'), (SELECT id FROM factions WHERE name = '国民民主党'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'oosawa-junichi'), (SELECT id FROM factions WHERE name = '公明党'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'kadokura-masako'), (SELECT id FROM factions WHERE name = '公明党'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'kamijo-shoichi'), (SELECT id FROM factions WHERE name = '日本共産党'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'kumekawa-toshio'), (SELECT id FROM factions WHERE name = '自由民主党'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'se-nobuhiro'), (SELECT id FROM factions WHERE name = '公明党'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'takaguchi-yasuhiko'), (SELECT id FROM factions WHERE name = '公明党'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'takahata-nami'), (SELECT id FROM factions WHERE name = 'たちかわ自民党'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'toyama-taro'), (SELECT id FROM factions WHERE name = '安進会'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'nakamachi-satoshi'), (SELECT id FROM factions WHERE name = '日本共産党'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'nagamoto-kyoko'), (SELECT id FROM factions WHERE name = '日本共産党'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'nakayama-hitomi'), (SELECT id FROM factions WHERE name = '自民党クラブ'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'hara-yuki'), (SELECT id FROM factions WHERE name = '立憲ネット緑たちかわ'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'fukushima-masami'), (SELECT id FROM factions WHERE name = '公明党'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'yamamoto-michiyo'), (SELECT id FROM factions WHERE name = '公明党'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'yamamoto-yosuke'), (SELECT id FROM factions WHERE name = '立憲ネット緑たちかわ'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'wakaki-sanae'), (SELECT id FROM factions WHERE name = '日本共産党'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'watanabe-chuji'), (SELECT id FROM factions WHERE name = '立憲ネット緑たちかわ'), '2026-02-18'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'ishitobi-kaori'), (SELECT id FROM factions WHERE name = '都民ファーストの会立川市議会'), '2026-02-18'::date, '2026-03-24'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/149/342-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_factions (member_id, faction_id, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'ishitobi-kaori'), (SELECT id FROM factions WHERE name = '立川の未来'), '2026-05-07'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/027/892/343-8.pdf')
ON CONFLICT (member_id, faction_id, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;

-- 議長・副議長
INSERT INTO council_member_roles (member_id, role, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'toyama-taro'), '議長', '2023-09-25'::date, '2024-06-26'::date, 'https://www.city.tachikawa.lg.jp/shigikai/gicho-fukugicho/1007606.html')
ON CONFLICT (member_id, role, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_roles (member_id, role, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'fukushima-masami'), '議長', '2024-06-26'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/shigikai/gicho-fukugicho/1007606.html')
ON CONFLICT (member_id, role, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_roles (member_id, role, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'kihara-hiroshi'), '議長', '2026-07-21'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/gicho-fukugicho/1007606.html')
ON CONFLICT (member_id, role, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_roles (member_id, role, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'takaguchi-yasuhiko'), '副議長', '2022-07-21'::date, '2024-06-26'::date, 'https://www.city.tachikawa.lg.jp/shigikai/gicho-fukugicho/1007608.html')
ON CONFLICT (member_id, role, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_roles (member_id, role, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'ooishi-fumio'), '副議長', '2024-06-26'::date, '2026-07-13'::date, 'https://www.city.tachikawa.lg.jp/shigikai/gicho-fukugicho/1007608.html')
ON CONFLICT (member_id, role, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;
INSERT INTO council_member_roles (member_id, role, start_date, end_date, source_url)
VALUES ((SELECT id FROM council_members WHERE slug = 'oosawa-junichi'), '副議長', '2026-07-21'::date, NULL, 'https://www.city.tachikawa.lg.jp/shigikai/gicho-fukugicho/1007608.html')
ON CONFLICT (member_id, role, start_date) DO UPDATE SET end_date = EXCLUDED.end_date, source_url = EXCLUDED.source_url;

COMMIT;

-- 確認用
SELECT
  (SELECT count(*) FROM council_members) AS members,
  (SELECT count(*) FROM council_members WHERE is_current) AS current_members,
  (SELECT count(*) FROM council_member_terms) AS terms,
  (SELECT count(*) FROM council_member_factions) AS factions,
  (SELECT count(*) FROM council_member_roles) AS roles;
