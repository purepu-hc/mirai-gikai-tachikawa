-- 令和8年第3回定例会 最終日（2026-10-02）の議決結果を反映（審議の状況のみ更新）
-- 出典: 議案一覧 https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html
--       請願・陳情 https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028162.html
--       （いずれも 2026-10-14 更新。保存した表: supabase/seed-tachikawa/source/r8-3-*.html）
-- 状況の判定は packages/tachikawa-ingest（bill-status.ts）と同じ。議案名・PDFリンク・解説は変更しない
-- （議員提出議案第6号は市のPDFリンク誤りが続いているため、pdf_url は NULL のまま）
BEGIN;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n FROM bills WHERE bill_number IN ('令和8年議員提出議案第6号', '令和8年議員提出議案第7号', '令和8年議員提出議案第8号', '令和8年議案第95号', '令和8年議案第96号', '令和8年議案第97号', '令和8年議案第98号', '令和8年議案第99号', '令和8年議案第100号', '令和8年議案第101号', '令和8年議案第102号', '令和8年議案第103号', '令和8年議案第104号', '令和8年議案第105号', '令和8年議案第106号', '令和8年議案第107号', '令和8年議案第108号', '令和8年議案第109号', '令和8年議案第110号', '令和8年議案第111号', '令和8年議案第112号', '令和8年議案第113号', '令和8年議案第114号', '令和8年議案第115号', '令和8年議案第116号', '令和8年請願第1号', '令和8年陳情第11号', '令和8年陳情第12号', '令和8年陳情第13号');
  IF n <> 29 THEN RAISE EXCEPTION '対象の議案が % 件しかありません（29 件のはず）', n; END IF;
END $$;
UPDATE bills SET status = 'approved', status_note = '令和8年10月2日、可決' WHERE bill_number = '令和8年議員提出議案第6号';
UPDATE bills SET status = 'approved', status_note = '令和8年10月2日、可決' WHERE bill_number = '令和8年議員提出議案第7号';
UPDATE bills SET status = 'approved', status_note = '令和8年10月2日、可決' WHERE bill_number = '令和8年議員提出議案第8号';
UPDATE bills SET status = 'approved', status_note = '令和8年10月2日、認定' WHERE bill_number = '令和8年議案第95号';
UPDATE bills SET status = 'approved', status_note = '令和8年10月2日、認定' WHERE bill_number = '令和8年議案第96号';
UPDATE bills SET status = 'approved', status_note = '令和8年10月2日、認定' WHERE bill_number = '令和8年議案第97号';
UPDATE bills SET status = 'approved', status_note = '令和8年10月2日、認定' WHERE bill_number = '令和8年議案第98号';
UPDATE bills SET status = 'approved', status_note = '令和8年10月2日、認定' WHERE bill_number = '令和8年議案第99号';
UPDATE bills SET status = 'approved', status_note = '令和8年10月2日、認定' WHERE bill_number = '令和8年議案第100号';
UPDATE bills SET status = 'approved', status_note = '令和8年10月2日、認定' WHERE bill_number = '令和8年議案第101号';
UPDATE bills SET status = 'approved', status_note = '令和8年9月10日、可決' WHERE bill_number = '令和8年議案第102号';
UPDATE bills SET status = 'approved', status_note = '令和8年9月10日、可決' WHERE bill_number = '令和8年議案第103号';
UPDATE bills SET status = 'approved', status_note = '令和8年9月10日、可決' WHERE bill_number = '令和8年議案第104号';
UPDATE bills SET status = 'approved', status_note = '令和8年9月10日、可決' WHERE bill_number = '令和8年議案第105号';
UPDATE bills SET status = 'approved', status_note = '令和8年9月10日、可決' WHERE bill_number = '令和8年議案第106号';
UPDATE bills SET status = 'approved', status_note = '令和8年10月2日、可決' WHERE bill_number = '令和8年議案第107号';
UPDATE bills SET status = 'approved', status_note = '令和8年9月10日、可決' WHERE bill_number = '令和8年議案第108号';
UPDATE bills SET status = 'approved', status_note = '令和8年9月10日、可決' WHERE bill_number = '令和8年議案第109号';
UPDATE bills SET status = 'approved', status_note = '令和8年9月10日、可決' WHERE bill_number = '令和8年議案第110号';
UPDATE bills SET status = 'approved', status_note = '令和8年9月10日、可決' WHERE bill_number = '令和8年議案第111号';
UPDATE bills SET status = 'approved', status_note = '令和8年10月2日、可決' WHERE bill_number = '令和8年議案第112号';
UPDATE bills SET status = 'approved', status_note = '令和8年10月2日、可決' WHERE bill_number = '令和8年議案第113号';
UPDATE bills SET status = 'approved', status_note = '令和8年10月2日、可決' WHERE bill_number = '令和8年議案第114号';
UPDATE bills SET status = 'approved', status_note = '令和8年10月2日、可決' WHERE bill_number = '令和8年議案第115号';
UPDATE bills SET status = 'approved', status_note = '令和8年10月2日、可決' WHERE bill_number = '令和8年議案第116号';
UPDATE bills SET status = 'in_committee', status_note = '令和8年10月2日、継続審査（次の定例会以降も引き続き審査）' WHERE bill_number = '令和8年請願第1号';
UPDATE bills SET status = 'adopted', status_note = '令和8年10月2日、採択' WHERE bill_number = '令和8年陳情第11号';
UPDATE bills SET status = 'rejected', status_note = '令和8年10月2日、不採択' WHERE bill_number = '令和8年陳情第12号';
UPDATE bills SET status = 'adopted', status_note = '令和8年10月2日、採択' WHERE bill_number = '令和8年陳情第13号';
COMMIT;
