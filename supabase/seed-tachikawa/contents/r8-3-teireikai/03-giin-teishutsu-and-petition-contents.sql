-- 生成元: packages/tachikawa-ingest（AI不使用）
-- 出典: https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html
-- 対象: 令和8年第3回定例会（議案 3 件、請願・陳情 0 件）
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
VALUES ('令和8年議員提出議案第6号', 'bill', '「防災庁」発足を見据えた地方自治体との連携強化および防災体制の抜本的強化を求める意見書', 'submitted', '提出', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8giingian08.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '「防災庁」発足を見据えた地方自治体との連携強化および防災体制の抜本的強化を求める意見書', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議員提出議案第6号
- 区分：議員提出議案
- 審議の状況：提出
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8giingian08.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議員提出議案第6号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '「防災庁」発足を見据えた地方自治体との連携強化および防災体制の抜本的強化を求める意見書', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議員提出議案第6号
- 区分：議員提出議案
- 審議の状況：提出
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8giingian08.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議員提出議案第6号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議員提出議案第7号', 'bill', '化学物質過敏症に関する対策強化を求める意見書', 'submitted', '提出', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8giingian07.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '化学物質過敏症に関する対策強化を求める意見書', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議員提出議案第7号
- 区分：議員提出議案
- 審議の状況：提出
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8giingian07.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議員提出議案第7号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '化学物質過敏症に関する対策強化を求める意見書', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議員提出議案第7号
- 区分：議員提出議案
- 審議の状況：提出
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8giingian07.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議員提出議案第7号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bills (bill_number, bill_type, name, status, status_note, pdf_url, committee_id, council_session_id, publish_status)
VALUES ('令和8年議員提出議案第8号', 'bill', '地方財政の充実・強化に関する意見書', 'submitted', '提出', 'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8giingian08.pdf', NULL, (SELECT id FROM council_sessions WHERE slug = 'r8-3-teireikai'), 'published')
ON CONFLICT (bill_number) WHERE bill_number != '' DO UPDATE SET bill_type = EXCLUDED.bill_type, name = EXCLUDED.name, status = EXCLUDED.status, status_note = EXCLUDED.status_note, pdf_url = EXCLUDED.pdf_url, committee_id = EXCLUDED.committee_id, council_session_id = EXCLUDED.council_session_id;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'normal', '地方財政の充実・強化に関する意見書', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議員提出議案第8号
- 区分：議員提出議案
- 審議の状況：提出
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8giingian08.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議員提出議案第8号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;
INSERT INTO bill_contents (bill_id, difficulty_level, title, summary, content)
SELECT id, 'hard', '地方財政の充実・強化に関する意見書', 'やさしい解説は準備中です。', '## この議案について

やさしい解説は準備中です。まずは公式の情報をご覧ください。

- 会期：令和8年第3回定例会
- 番号：議員提出議案第8号
- 区分：議員提出議案
- 審議の状況：提出
- 議案書（PDF）：https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8giingian08.pdf
- 出典：https://www.city.tachikawa.lg.jp/shigikai/katsudo/1007184/1026374/1026377/1028161.html' FROM bills WHERE bill_number = '令和8年議員提出議案第8号'
ON CONFLICT (bill_id, difficulty_level) DO NOTHING;

COMMIT;
-- 解説（第3弾）：請願・陳情4件、議員提出議案（意見書）3件
BEGIN;
UPDATE bills SET pdf_url = NULL WHERE bill_number = '令和8年議員提出議案第6号';
UPDATE bill_contents SET title='重い障害のある人が働くときの介助を支援する事業を、立川市でも始めてほしいという請願', summary='通勤や職場で介助が必要な重い障害のある人が働き続けられるよう、「重度障害者等就労支援特別事業」を立川市でも実施してほしいという請願です。', content='## ひとことで

重い障害のある人が**働くときの介助（通勤や職場での介助）を支援する事業**を、立川市でも実施してほしいという請願です。

## 求めていること

1. 「重度障害者等就労支援特別事業」を速やかに実施すること
2. 支援の時間・対象・利用の条件を、利用する人の実情に合わせて柔軟に運用し、定期的に見直すこと
3. 当事者・家族・支援事業者・関係団体の意見を反映して制度を運営すること

## 請願の理由（請願書より）

- 重い身体障害や難病などで常に介助が必要な人は、働いている間の支援が十分でないため、働く機会が大きく限られているとしています
- この事業は、通勤や職場での介助を支えることで、働き続けることや社会参加を支える制度で、東京都内では令和7年度までに17区3市で実施されているとしています
- ヘルパー事業所の人材を職場で活用できれば、受け入れる企業の負担も軽くなり、障害のある人を雇うハードルが下がるとしています

## 請願・陳情ってなに？

市民や団体が、市議会に「こうしてほしい」とお願いする仕組みです。議員の紹介を受けて出すものを「請願」、紹介なしで出すものを「陳情」といいます。委員会で審査したあと、本会議で「採択」（願いを受け入れる）か「不採択」かを決めます。

## 参考

- [請願書（PDF）](https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8seigan01-2.pdf)
- 審議の状況は、このページの「審議のステータス」をご覧ください

---

この解説は、請願書をもとにAIで下書きし、運営者が確認したものです。正確な内容は請願書（PDF）をご確認ください。' WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年請願第1号');
UPDATE bill_contents SET title='重度障害者等就労支援特別事業の実施を求める請願', summary='重度障害者等就労支援特別事業（通勤や職場等における介助支援）の速やかな実施、利用者の実情に応じた柔軟な運用と定期的な検証・改善、当事者等の意見を反映した制度運営を求める請願。', content='## 概要

| 項目 | 内容 |
|---|---|
| 番号 | 請願第1号 |
| 受理 | 令和8年第3回定例会 |
| 提出 | 市内在住者ほか（議員の紹介あり） |

## 請願の項目（記）

1. 重度障害者等就労支援特別事業を速やかに実施すること
2. 支援時間、対象範囲および利用要件について、利用者の実情に応じて柔軟に運用し、定期的に課題を検証し、必要な改善措置を講じること
3. 当事者、家族、支援事業者および関係団体の意見を反映した制度運営を行うこと

## 請願の要旨・理由（要約）

- 障害のある人が地域で自立して働くことは、障害者基本法および障害者権利条約の理念にも合致する重要な権利であるとしている
- 重度の身体障害や難病等により常時介助を必要とする人は、就労中の支援が十分に確保されないため、就労機会が著しく制限されているとしている
- 同事業は通勤や職場等における介助支援を行う制度で、東京都内では令和7年度までに17区3市で実施されているとしている
- ヘルパー事業所の人材を職場で活用することで、企業側が独自に介助体制を整える必要がなくなり、障害者雇用のハードルが下がるとしている

## 補足

- 請願者・紹介議員の氏名は、この解説では記載していません（請願書PDFに記載があります）
- 立川市の現在の実施状況や、実施した場合の費用の見込みは、請願書には記載されていません

## 参考

- [請願書（PDF）](https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8seigan01-2.pdf)
- 審議の状況は、このページの「審議のステータス」をご覧ください

---

この解説は、請願書をもとにAIで下書きし、運営者が確認したものです。正確な内容は請願書（PDF）をご確認ください。' WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年請願第1号');
UPDATE bill_contents SET title='市の施設の点字ブロックを、見えやすい黄色にしてほしいという陳情', summary='市の公共施設の中にある点字ブロックがシルバーや灰色で見えにくいため、黄色にするか、周りの床との色の差（コントラスト）をはっきりさせてほしいという陳情です。', content='## ひとことで

市の公共施設の中の**点字ブロックを黄色にしてほしい**（または、床との色の差をはっきりさせてほしい）という陳情です。

## 求めていること

- 市の公共施設の中の点字ブロックを、**黄色に変えること**
- または、まわりの床との**コントラスト（色の差）をはっきりさせること**

## 陳情の理由（陳情書より）

- 市内の公共施設の多くで、点字ブロックがシルバーや灰色になっていて、目の見えにくい人にとって見えにくいとしています
- 新しくできた施設でもシルバーの点字ブロックが使われていた一方、改修で黄色になった施設は使いやすくなったとして、施設ごとにばらつきがあるとしています
- 陳情者が市内の施設を独自に調べた、点字ブロックの色と見えやすさの一覧が添えられています
- 電話で確認したところ、館内に点字ブロックがない施設（幸学習館、西砂学習館、上砂会館）があるとして、設置もお願いしています

## 請願・陳情ってなに？

市民や団体が、市議会に「こうしてほしい」とお願いする仕組みです。議員の紹介を受けて出すものを「請願」、紹介なしで出すものを「陳情」といいます。委員会で審査したあと、本会議で「採択」（願いを受け入れる）か「不採択」かを決めます。

## 参考

- [陳情書（PDF）](https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8chinjou11.pdf)
- 審議の状況は、このページの「審議のステータス」をご覧ください

---

この解説は、陳情書をもとにAIで下書きし、運営者が確認したものです。正確な内容は陳情書（PDF）をご確認ください。' WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年陳情第11号');
UPDATE bill_contents SET title='市内公共施設内の点字ブロックをシルバーや灰色から黄色に変更していただきたい。またはコントラストをはっきりしていただきたい。に関する陳情', summary='市内公共施設内の点字ブロックを黄色に変更すること、またはコントラストを明確にすることを求める陳情。施設ごとの色の違いに関する陳情者の独自調査を添付。', content='## 概要

| 項目 | 内容 |
|---|---|
| 番号 | 陳情第11号 |
| 受理 | 令和8年第3回定例会 |
| 提出 | 市内在住者 |

## 陳情の要旨

市内公共施設内の点字ブロックを黄色に変更していただきたい。

## 陳情の理由（要約）

- 市内のほとんどの公共施設内の点字ブロックが、黄色ではなくシルバーや灰色になっており（点字ブロックがない施設もある）、視覚障害当事者には見えにくいとしている
- 令和8年第2回定例会にも同趣旨の陳情を提出し、その際の厚生委員会での市側の答弁で「東京都の条例に基づき公共施設の点字ブロックは基本的に黄色を採用するが、明度（コントラスト）を明らかにするためにそれ以外の色を採用する場合もある」との説明があったとしている。これに対し、その判断が具体的なデータに基づくものか疑問を示している
- 改修で黄色の点字ブロックになった施設もあるとして、建物ごとに対応のばらつきがあると指摘している
- 陳情者が独自に調べた、市内の施設ごとの点字ブロックの色と見えやすさの一覧を添付している
- 電話で確認したところ館内に点字ブロックを設置していないとの回答があった施設（幸学習館、西砂学習館、上砂会館）について、設置を求めている
- 近隣市の例や、素材による足裏での認識しやすさについての意見も添えている

## 補足

- 陳情者の氏名は、この解説では記載していません（陳情書PDFに記載があります）
- 施設ごとの色や見えやすさは、陳情者による調査結果として記載されているものです

## 参考

- [陳情書（PDF）](https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8chinjou11.pdf)
- 審議の状況は、このページの「審議のステータス」をご覧ください

---

この解説は、陳情書をもとにAIで下書きし、運営者が確認したものです。正確な内容は陳情書（PDF）をご確認ください。' WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年陳情第11号');
UPDATE bill_contents SET title='11月から市役所などの受付時間が16時までになったあとも、電話だけは16時半か17時まで受けてほしいという陳情', summary='令和8年11月11日から市役所などの窓口が電話も含めて16時までになることについて、電話の対応だけでも17時か16時半まで続けてほしいという陳情です。', content='## ひとことで

市役所などの**電話の受付を、16時以降も（16時半か17時まで）続けてほしい**という陳情です。

## 求めていること

令和8年11月11日以降も、立川市役所などで、**電話の対応だけでも17時、または16時半まで**受け付けてほしい。

## 陳情の理由（陳情書より）

- 陳情書では、令和8年11月11日から、市役所などの窓口が電話の対応も含めて9時から16時までになるとしています
- 仕事などで16時ごろまで手がはなせず、16時以降に電話で市に連絡して解決できたことが何度もあったとしています（市の施設の利用時間中のトラブルや、公園・歩道橋に置かれたごみの回収など）
- 市の施設には17時まで使えるところもあり、16時から17時の間にトラブルが起きたとき、その場で市に連絡できなくなると困るとしています

## 請願・陳情ってなに？

市民や団体が、市議会に「こうしてほしい」とお願いする仕組みです。議員の紹介を受けて出すものを「請願」、紹介なしで出すものを「陳情」といいます。委員会で審査したあと、本会議で「採択」（願いを受け入れる）か「不採択」かを決めます。

## 参考

- [陳情書（PDF）](https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8chinjou12.pdf)
- 審議の状況は、このページの「審議のステータス」をご覧ください

---

この解説は、陳情書をもとにAIで下書きし、運営者が確認したものです。正確な内容は陳情書（PDF）をご確認ください。' WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年陳情第12号');
UPDATE bill_contents SET title='11月11日以降も立川市役所などで、電話応対だけでも17時もしくは16時半まで対応していただきたいに関する陳情', summary='令和8年11月11日から市役所等の窓口が電話応対も含め9時〜16時となることに関し、電話応対だけでも17時または16時半まで対応することを求める陳情。', content='## 概要

| 項目 | 内容 |
|---|---|
| 番号 | 陳情第12号 |
| 受理 | 令和8年第3回定例会 |
| 提出 | 市内在住者 |

## 陳情の要旨と理由（要約）

- 令和8年11月11日から、立川市役所等の窓口が電話応対も含めて9時から16時になるとしている
- 陳情者は16時ごろまで仕事等に従事しているため、電話応対だけでも17時または16時半まで対応してほしいとしている
- これまで16時以降に関係部署へ電話して解決した具体例として、立川公園陸上競技場の利用時間内の運用に関する事項や、公園・歩道橋付近に放置されたごみ袋の回収などを挙げている
- 立川公園陸上競技場は17時まで利用できるため、16時から17時の間に管理側と利用者側でトラブルが起きた場合に、その場で解決できなくなるとしている

## 補足

- 陳情者の氏名は、この解説では記載していません（陳情書PDFに記載があります）
- 窓口時間の変更の内容・理由についての市の説明は、陳情書には記載されていません
- 陳情書中の個別の事例（施設の管理人の対応など）は、陳情者の経験として記載されているものです

## 参考

- [陳情書（PDF）](https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8chinjou12.pdf)
- 審議の状況は、このページの「審議のステータス」をご覧ください

---

この解説は、陳情書をもとにAIで下書きし、運営者が確認したものです。正確な内容は陳情書（PDF）をご確認ください。' WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年陳情第12号');
UPDATE bill_contents SET title='流産・死産を経験した人も、市の産後ケア事業を使えるようにしてほしいという陳情', summary='流産や死産を経験した人も立川市の産後ケア事業の対象であることをはっきりさせ、心と体のケアや相談（グリーフケア）の体制を整えること、また、妊娠が続いている前提の案内が届かないよう、市の部署どうしの情報共有を整えることを求める陳情です。', content='## ひとことで

**流産・死産を経験した人**への支援（グリーフケア）を、市の**産後ケア事業**でしっかり受けられるようにしてほしいという陳情です。

## 求めていること

1. 立川市の産後ケア事業で、流産・死産などを経験した人も**支援の対象であることを明確にし**、相談・心と体のケア・情報提供・関係機関との連携などの体制を整えること
2. 流産・死産などを経験した人に、**妊娠が続いている前提の案内が届いてしまわないよう**、市の部署どうしで必要な情報を共有する仕組みを整えること

## 陳情の理由（陳情書より）

- 国（厚生労働省）は、流産・死産を経験した人も、産後ケア事業などの母子保健の支援の対象になることを自治体に示しているとしています
- 一方、今の立川市の産後ケア事業では、流産・死産などを経験した人が対象に含まれていないとしています
- 死産届を出したあとに、妊娠が続いている前提の案内が届いた例があり、当事者の悲しみをさらに深めるおそれがあるとしています
- 多摩地域26市のうち9市では、流産・死産を経験した人が産後ケア事業の対象であることを明記しているとしています

## 請願・陳情ってなに？

市民や団体が、市議会に「こうしてほしい」とお願いする仕組みです。議員の紹介を受けて出すものを「請願」、紹介なしで出すものを「陳情」といいます。委員会で審査したあと、本会議で「採択」（願いを受け入れる）か「不採択」かを決めます。

## 参考

- [陳情書（PDF）](https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8chinjou13.pdf)
- 審議の状況は、このページの「審議のステータス」をご覧ください

---

この解説は、陳情書をもとにAIで下書きし、運営者が確認したものです。正確な内容は陳情書（PDF）をご確認ください。' WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年陳情第13号');
UPDATE bill_contents SET title='立川市産後ケア事業における流産・死産等（グリーフケア）支援の拡充に関する陳情', summary='立川市産後ケア事業の支援対象に流産・死産等を経験した方を明確に含め、グリーフケアに関する支援体制を整備すること、並びに妊娠の継続を前提とした案内による精神的苦痛を防ぐための関係部署間の情報共有体制の整備を求める陳情。', content='## 概要

| 項目 | 内容 |
|---|---|
| 番号 | 陳情第13号 |
| 受理 | 令和8年第3回定例会 |
| 提出 | 市内在住者（個人） |

## 陳情の項目（記）

1. 立川市の産後ケア事業において、流産・死産等を経験された方も支援対象となることを明確にし、グリーフケアに関する相談、心身のケア、情報提供、関係機関との連携など、必要な支援体制を整備すること
2. 流産・死産等を経験された方への情報提供を充実するとともに、妊娠の継続を前提とした案内等による当事者の精神的苦痛を防ぐため、関係部署間における必要な情報共有を整備すること

## 陳情の理由（要約）

- 厚生労働省の通知「流産や死産を経験した女性等への心理社会的支援等について」（令和3年5月31日付）で、母子保健法上の「出産」には流産及び死産も含まれ、産婦健康診査事業や産後ケア事業等の支援対象となることが示されているとしている
- 令和4年4月8日付の厚生労働省の事務連絡で、流産・死産を含む子どもを亡くした家族への情報共有や精神的負担の軽減への配慮が重要とされているとしている
- 現在の立川市の産後ケア事業では、流産・死産等を経験した方が対象に含まれていないとしている
- 死産届の提出後に、妊娠の継続を前提とした案内やアンケートが届く事例があるとしている
- 多摩地域26市のうち9市で、産後ケア事業の対象に流産・死産を経験した方が含まれることが明記されているとしている
- 立川市は今年度から産後ケア事業を拡充（ユニバーサル化）しており、その対象にグリーフケアを明確に含めることを求めるとしている

## 補足

- 陳情者の氏名は、この解説では記載していません（陳情書PDFに記載があります）
- 各通知の内容や他市の状況は、陳情書の記載に基づくものです

## 参考

- [陳情書（PDF）](https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/162/r8chinjou13.pdf)
- 審議の状況は、このページの「審議のステータス」をご覧ください

---

この解説は、陳情書をもとにAIで下書きし、運営者が確認したものです。正確な内容は陳情書（PDF）をご確認ください。' WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年陳情第13号');
UPDATE bill_contents SET title='化学物質過敏症への対策を強めるよう、国に求める意見書', summary='身の回りの微量の化学物質で体調をくずす「化学物質過敏症」について、実態調査、診断基準や専門医療の整備、学校や公共施設での対策、相談体制づくりなどを国に求める意見書の案です。', content='## ひとことで

**化学物質過敏症**への対策を強めるよう、市議会から**国に意見を出す**ための議案です。

## 化学物質過敏症とは（意見書案より）

家庭用品、建築材料、農薬、化粧品、柔軟剤などに含まれるごく少量の化学物質に反応して、頭痛やだるさ、呼吸が苦しくなるなど、さまざまな症状が出る病気とされています。人工的な香料などによる、いわゆる「香害」がきっかけになる例もあるとしています。

## 国に求めること

- 全国的な**患者数や原因、生活への影響の調査**
- **診断の基準**づくりと、**専門の医療**の体制づくり
- 学校や公共施設などでの**室内の空気環境の対策**と、「香害」についての周知
- 職場や学校での**合理的配慮**（在宅勤務やオンライン授業など）が行われるようにすること
- 保健所や福祉の窓口での**相談体制**づくり
- 原因の解明や治療法の研究への支援

## 出した人

立川市議会議員7人が、令和8年9月30日に提出しました。

## 意見書ってなに？

市議会が、国などに対して「こうしてほしい」という意見をまとめて出すものです（地方自治法第99条）。議員が案を出し、本会議で可決されると、市議会の名前で国などに送られます。

## 参考

- [意見書案（PDF）](https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8giingian07.pdf)
- 審議の状況は、このページの「審議のステータス」をご覧ください

---

この解説は、意見書案をもとにAIで下書きし、運営者が確認したものです。正確な内容は意見書案（PDF）をご確認ください。' WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議員提出議案第7号');
UPDATE bill_contents SET title='化学物質過敏症に関する対策強化を求める意見書', summary='地方自治法第99条に基づき、化学物質過敏症（MCS）について、疫学・実態調査、客観的診断基準と専門医療体制の整備、公共施設・学校等の環境対策と「香害」啓発、合理的配慮の徹底、相談支援体制の構築、研究支援の拡充を政府に求める意見書案。', content='## 概要

| 項目 | 内容 |
|---|---|
| 議案番号 | 議員提出議案第7号 |
| 提出日 | 令和8年9月30日 |
| 提出者 | 立川市議会議員 7人 |
| 提出根拠 | 立川市議会会議規則第13条第1項 |
| 意見書の根拠 | 地方自治法第99条 |
| 宛先 | 政府 |

## 意見書案の趣旨（要約）

- 化学物質過敏症（MCS）は、家庭用品・建築材料・農薬・化粧品・柔軟剤等に含まれる微量の化学物質に反応し、多様な身体症状が生じる疾患としている
- 厚生労働省の傷病名コードに登録されているものの、発症メカニズムに未解明な部分が多く、客観的な診断基準や専門的治療を行える医療機関が極めて少ないとしている
- 人工的な香料等による「香害」をきっかけとした発症・重症化の事例が相次いでいるとしている
- 令和6年4月施行の改正障害者差別解消法の趣旨も踏まえた措置を求めている

## 求める措置（記）

1. 全国的な疫学調査・実態調査の実施
2. 客観的診断基準の確立と専門医療体制の整備
3. 公共施設や学校等における環境対策と「香害」啓発の推進（7省庁連携による周知・普及啓発）
4. 就労・就学現場における「合理的配慮」の提供徹底と環境整備
5. 総合的な相談支援体制の構築と社会的理解の促進
6. 発症メカニズム解明および治療法確立への研究支援強化

## 補足

- 提出議員の氏名は、この解説では記載していません（意見書案PDFに記載があります）

## 参考

- [意見書案（PDF）](https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8giingian07.pdf)
- 審議の状況は、このページの「審議のステータス」をご覧ください

---

この解説は、意見書案をもとにAIで下書きし、運営者が確認したものです。正確な内容は意見書案（PDF）をご確認ください。' WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議員提出議案第7号');
UPDATE bill_contents SET title='市など地方のお金（地方財政）をしっかり確保するよう、国に求める意見書', summary='物価や人件費が上がる中、市などの地方自治体が仕事を続けられるよう、国に対して地方の財源の確保・充実や、社会保障・システム標準化・地域公共交通・地域医療などへの財政支援を求める意見書の案です。', content='## ひとことで

市などの**地方自治体のお金（地方財政）を十分に確保する**よう、市議会から**国に意見を出す**ための議案です。

## 背景（意見書案より）

子育て、少子高齢化への対応、DX、脱炭素、物価高騰対策、災害対応など、自治体の仕事が増えている一方で、人手が足りず、物価や人件費の上昇で行政のコストも増えているとしています。

## 国に求めること（主なもの）

- 増えている自治体の仕事に見合う、**地方の財源の確保・充実**
- 子育て・地域医療・介護・生活困窮者支援などの**社会保障の経費の拡充**と、それを支える人材確保への支援
- 国が**減税**を考えるときは、地方の財政が損なわれないよう配慮し、影響があれば穴埋めすること
- 自治体の**業務システムの標準化**で増えた経費や、マイナンバーカードと保険証の一体化などに伴う負担への支援
- **地域公共交通**の施策の充実
- **地域の医療機関**への財政支援
- 自治体職員の給与改定や、会計年度任用職員の処遇改善への財政支援

## 出した人

立川市議会議員7人が、令和8年9月30日に提出しました。

## 意見書ってなに？

市議会が、国などに対して「こうしてほしい」という意見をまとめて出すものです（地方自治法第99条）。議員が案を出し、本会議で可決されると、市議会の名前で国などに送られます。

## 参考

- [意見書案（PDF）](https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8giingian08.pdf)
- 審議の状況は、このページの「審議のステータス」をご覧ください

---

この解説は、意見書案をもとにAIで下書きし、運営者が確認したものです。正確な内容は意見書案（PDF）をご確認ください。' WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議員提出議案第8号');
UPDATE bill_contents SET title='地方財政の充実・強化に関する意見書', summary='地方自治法第99条に基づき、2027年度政府予算及び地方財政の検討にあたり、物価高騰や賃金上昇に伴う行政コストの増大を反映した一般財源総額の確保・充実など7項目を求める意見書案。', content='## 概要

| 項目 | 内容 |
|---|---|
| 議案番号 | 議員提出議案第8号 |
| 提出日 | 令和8年9月30日 |
| 提出者 | 立川市議会議員 7人 |
| 提出根拠 | 立川市議会会議規則第13条第1項 |
| 意見書の根拠 | 地方自治法第99条 |

## 意見書案の趣旨（要約）

- 地方公共団体には、少子・高齢化に伴う社会保障、子育て施策、地域活性化、DX、脱炭素化、物価高騰対策、大規模災害への対応など多岐にわたる役割が求められる一方、人員が不足しているとしている
- 2026年度地方財政計画は物価高や人件費の増大に対応する内容としつつ、2027年度政府予算及び地方財政の検討にあたっても、行政コストの増大を反映し、一般財源総額のさらなる充実を求めている

## 求める事項（記）

1. 増大する財政需要を的確に把握し、人件費を重視しつつ、現行水準にとどまらない地方財源の確保・充実
2. 地方単独事業分を含めた社会保障経費の拡充と、関連分野の人材確保への財政措置
3. 減税政策を検討する際の地方財政への配慮（「国と地方の協議の場」の活用等）と、影響がある場合の確実な補填
4. 自治体業務システムの標準化・共通化で増額した経費の補填、自治体DXに伴うシステム改修等への財政支援
5. 地域公共交通の施策充実
6. 物価高騰等を踏まえた地域の医療機関への財政支援
7. 労務費の適切な価格転嫁への財政支援、2027年度の職員給与改定および会計年度任用職員の処遇改善への財政支援

## 補足

- 提出議員の氏名は、この解説では記載していません（意見書案PDFに記載があります）

## 参考

- [意見書案（PDF）](https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/028/161/r8giingian08.pdf)
- 審議の状況は、このページの「審議のステータス」をご覧ください

---

この解説は、意見書案をもとにAIで下書きし、運営者が確認したものです。正確な内容は意見書案（PDF）をご確認ください。' WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議員提出議案第8号');
UPDATE bill_contents SET title='「防災庁」の発足を見据えて、防災体制を強めるよう国に求める意見書', summary='「防災庁」の発足を見据えた、国と地方自治体との連携強化と防災体制の抜本的な強化を求める意見書の案です。意見書案の本文は、まだ確認できていません。', content='## ひとことで

「防災庁」の発足を見据えて、**国と地方自治体の連携や防災体制を強める**よう、市議会から**国に意見を出す**ための議案です。

## 本文について

市議会のホームページでは、この議案のリンク先が別の議案（議員提出議案第8号）の文書になっていて、**意見書案の本文を確認できていません**。確認でき次第、解説を追加します。

## 意見書ってなに？

市議会が、国などに対して「こうしてほしい」という意見をまとめて出すものです（地方自治法第99条）。議員が案を出し、本会議で可決されると、市議会の名前で国などに送られます。

## 参考

- 審議の状況は、このページの「審議のステータス」をご覧ください

---

この解説は、意見書案をもとにAIで下書きし、運営者が確認したものです。正確な内容は意見書案（PDF）をご確認ください。' WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議員提出議案第6号');
UPDATE bill_contents SET title='「防災庁」発足を見据えた地方自治体との連携強化および防災体制の抜本的強化を求める意見書', summary='「防災庁」発足を見据えた地方自治体との連携強化および防災体制の抜本的強化を求める意見書案。意見書案の本文は未確認。', content='## 概要

| 項目 | 内容 |
|---|---|
| 議案番号 | 議員提出議案第6号 |
| 意見書の根拠 | 地方自治法第99条 |

## 本文について

2026年10月2日時点で、立川市議会ホームページの本議案のリンクは議員提出議案第8号の文書（r8giingian08.pdf）を指しており、本議案の意見書案の本文を確認できていません。確認でき次第、内容を追記します。

## 参考

- 審議の状況は、このページの「審議のステータス」をご覧ください

---

この解説は、意見書案をもとにAIで下書きし、運営者が確認したものです。正確な内容は意見書案（PDF）をご確認ください。' WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議員提出議案第6号');
COMMIT;
