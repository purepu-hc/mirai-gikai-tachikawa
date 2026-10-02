-- bills に種別（bill_type）を追加する
-- 立川市版: 請願・陳情を議案と同じ bills テーブルで扱い、一覧では区別するため
-- 値は他の地方議会版（足立区版など）と揃える
--   bill: 議案（既定） / petition: 請願・陳情
--   opinion: 意見書案 / resolution: 決議案 / member_bill: 議員提出議案（将来用）

ALTER TABLE bills
  ADD COLUMN IF NOT EXISTS bill_type text NOT NULL DEFAULT 'bill';

ALTER TABLE bills
  DROP CONSTRAINT IF EXISTS bills_bill_type_check;

ALTER TABLE bills
  ADD CONSTRAINT bills_bill_type_check
  CHECK (bill_type IN ('bill', 'petition', 'opinion', 'resolution', 'member_bill'));

CREATE INDEX IF NOT EXISTS idx_bills_bill_type ON bills (bill_type);

-- すでに登録済みの請願・陳情（番号に「請願第」「陳情第」を含むもの）を petition にする
UPDATE bills
  SET bill_type = 'petition'
  WHERE bill_type = 'bill'
    AND (bill_number LIKE '%請願第%' OR bill_number LIKE '%陳情第%');
