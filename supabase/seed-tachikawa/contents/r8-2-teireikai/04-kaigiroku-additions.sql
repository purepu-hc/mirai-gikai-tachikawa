-- 令和8年第2回定例会 解説への会議録（提案理由の説明）からの追記
-- 何度流しても同じ結果になるよう、追記済みの行は対象外にしています
BEGIN;
UPDATE bill_contents SET content = replace(replace(content, $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

5月15日の本会議で、副市長が提案理由を説明しました（市の説明）。

- **マイナンバーカードセンターの新設**や、**生活保護費の追加給付**などに対応するための補正予算だ、としています
- 生活保護費・中国残留邦人支援給付金の追加給付：平成25年の生活扶助基準の改定についての**最高裁判決**をふまえた国の決定にもとづき、差額分を追加で支給する、としています
- マイナンバーカードセンター：施設の借上料や新設の工事費などを計上する、としています
- 使っていない市有地の**ブロック塀が傾いて隣の土地にはみ出している**ことがわかったため、撤去する、としています
- 玉川上水緑道の倒木事故（令和7年6月）の損害賠償の費用を計上する、としています
- 立川駅東地下道の壁の亀裂の補修で一部が消えた**壁面アート**を元に戻す、としています
- 曙福祉会館の空調の更新、粗大ごみ収集車を2台から3台に増やすためのシステム改修、立川第四中学校の生徒主体の**eスポーツ運動会**の支援（都の補助金）なども行う、としています
- 保育園などの副食費（おかず代）の公定価格が改定されたため、保護者負担の無償化を続けるよう補助単価を上げる、としています

出典：[立川市議会 会議録（令和8年第2回定例会 5月15日・第12号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第62号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 生活保護費の追加給付の理由は、議案書には記載されていません$c$, $c$- 生活保護費の追加給付の理由は議案書には記載されていません。本会議での市の説明は「市の説明（会議録より）」に記載しています$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

5月15日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 補正の趣旨：マイナンバーカードセンターの新設や生活保護費の追加給付などに対応するもの
- 総務費 市有不動産管理：未利用市有地のブロック塀に傾きが生じ、隣接地に越境していることが判明したため撤去
- 総務費 基幹系システム構築・運用事業：国民健康保険システムのガバメントクラウド移行への対応と、マイナンバーカードセンター新設に向けた住民情報システムの利用環境整備（債務負担行為を設定）
- 総務費 庁内情報基盤整備事業：マイナンバーカードセンター新設に向けた庁内ネットワークの利用環境整備
- 総務費 文化施設の整備事業：立川駅東地下道の壁面の亀裂補修により一部が消失した壁面アートの原状復帰
- 総務費 事故等賠償金：令和7年6月の玉川上水緑道倒木事故の損害賠償
- 総務費 マイナンバーカード関連事務：マイナンバーカードセンター新設に向けた施設借上料・新設工事費等（一部に債務負担行為を設定）
- 民生費 民生委員等関連事業：民生委員・児童委員活動費に係る都の負担基準の改定に対応
- 民生費 中国残留邦人支援事業、生活保護費・生活保護費の追加給付事業：平成25年生活扶助基準改定に関する最高裁判決を踏まえた国の決定に基づき、差額分を追加給付
- 民生費 福祉会館等管理運営：老朽化により不具合が生じている曙福祉会館の空調設備の更新
- 民生費 国民年金事務：令和8年10月1日施行の国民年金保険料の育児免除制度に対応するシステム改修
- 民生費 民間保育所運営・認証保育所運営・病児保育室運営・地域型保育給付事務、教育費 幼稚園教育振興事業：都の補助金を活用し、物価高に直面する保育施設等への支援を継続
- 民生費 施設型給付事務：保育園等副食費の公定価格の改定を受け、保護者負担の無償化を継続するため補助単価を引上げ
- 民生費 学童保育所民間運営事業：西砂学童保育所・くるプレルーム（仮称）建替工事の工期延長に伴う児童通学時の安全誘導の期間延長と、高松南学童保育所の運営事業者への放課後児童支援員等処遇改善臨時特例事業補助金
- 衛生費 粗大ごみ収集事業：収集車両を2台から3台へ増車することに伴う配車管理システムの改修
- 教育費 教育事業事務：都の補助金を活用し、立川第四中学校で生徒主体で実施するeスポーツ運動会の企画運営を支援

出典：[立川市議会 会議録（令和8年第2回定例会 5月15日・第12号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第62号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$改修の内容は、議案書には**記載されていません**。$c$, $c$議案書には記載されていませんが、本会議で市が説明しています（「市の説明（会議録より）」をご覧ください）。$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

5月15日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 令和8年8月から、介護保険施設などの**居住費・滞在費の負担限度額**が一部見直されるため、システムを改修する、としています
- 国から改修のための補助金が出る、としています

出典：[立川市議会 会議録（令和8年第2回定例会 5月15日・第12号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第63号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

5月15日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 総務費 一般事務：令和8年8月から介護保険施設等における居住費及び滞在費の負担限度額が一部見直されることに伴うシステム改修
- 国庫支出金：上記のシステム改修のために交付されるもの

出典：[立川市議会 会議録（令和8年第2回定例会 5月15日・第12号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第63号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$道路が整備された経緯は、議案書には**記載されていません**。$c$, $c$道路が整備された経緯は議案書には記載されていませんが、本会議で市が説明しています（「市の説明（会議録より）」をご覧ください）。$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

5月15日の本会議で、副市長が提案理由を説明しました（市の説明）。

- **村山工場跡地地区**の整備などの事業について、**武蔵村山市など**と協定を結んだため、立川市道として認定する、としています

出典：[立川市議会 会議録（令和8年第2回定例会 5月15日・第12号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第64号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 認定に至った経緯・道路の整備事業との関係は、議案書には記載されていません$c$, $c$- 認定に至った経緯は議案書には記載されていません。本会議での市の説明は「市の説明（会議録より）」に記載しています$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

5月15日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 村山工場跡地地区の整備等事業に関する協定を武蔵村山市等と締結したため、立川市道として認定するもの（議案第64号〜第67号を一括で説明）

出典：[立川市議会 会議録（令和8年第2回定例会 5月15日・第12号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第64号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$道路が整備された経緯は、議案書には**記載されていません**。$c$, $c$道路が整備された経緯は議案書には記載されていませんが、本会議で市が説明しています（「市の説明（会議録より）」をご覧ください）。$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

5月15日の本会議で、副市長が提案理由を説明しました（市の説明）。

- **村山工場跡地地区**の整備などの事業について、**武蔵村山市など**と協定を結んだため、立川市道として認定する、としています

出典：[立川市議会 会議録（令和8年第2回定例会 5月15日・第12号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第65号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 認定に至った経緯・道路の整備事業との関係は、議案書には記載されていません$c$, $c$- 認定に至った経緯は議案書には記載されていません。本会議での市の説明は「市の説明（会議録より）」に記載しています$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

5月15日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 村山工場跡地地区の整備等事業に関する協定を武蔵村山市等と締結したため、立川市道として認定するもの（議案第64号〜第67号を一括で説明）

出典：[立川市議会 会議録（令和8年第2回定例会 5月15日・第12号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第65号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$道路が整備された経緯は、議案書には**記載されていません**。$c$, $c$道路が整備された経緯は議案書には記載されていませんが、本会議で市が説明しています（「市の説明（会議録より）」をご覧ください）。$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

5月15日の本会議で、副市長が提案理由を説明しました（市の説明）。

- **村山工場跡地地区**の整備などの事業について、**武蔵村山市など**と協定を結んだため、立川市道として認定する、としています

出典：[立川市議会 会議録（令和8年第2回定例会 5月15日・第12号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第66号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 認定に至った経緯・道路の整備事業との関係は、議案書には記載されていません$c$, $c$- 認定に至った経緯は議案書には記載されていません。本会議での市の説明は「市の説明（会議録より）」に記載しています$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

5月15日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 村山工場跡地地区の整備等事業に関する協定を武蔵村山市等と締結したため、立川市道として認定するもの（議案第64号〜第67号を一括で説明）

出典：[立川市議会 会議録（令和8年第2回定例会 5月15日・第12号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第66号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$道路が整備された経緯は、議案書には**記載されていません**。$c$, $c$道路が整備された経緯は議案書には記載されていませんが、本会議で市が説明しています（「市の説明（会議録より）」をご覧ください）。$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

5月15日の本会議で、副市長が提案理由を説明しました（市の説明）。

- **村山工場跡地地区**の整備などの事業について、**武蔵村山市など**と協定を結んだため、立川市道として認定する、としています

出典：[立川市議会 会議録（令和8年第2回定例会 5月15日・第12号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第67号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 認定に至った経緯・道路の整備事業との関係は、議案書には記載されていません$c$, $c$- 認定に至った経緯は議案書には記載されていません。本会議での市の説明は「市の説明（会議録より）」に記載しています$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

5月15日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 村山工場跡地地区の整備等事業に関する協定を武蔵村山市等と締結したため、立川市道として認定するもの（議案第64号〜第67号を一括で説明）

出典：[立川市議会 会議録（令和8年第2回定例会 5月15日・第12号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第67号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$廃止する理由や、廃止したあとの土地の扱いは、議案書には**記載されていません**。$c$, $c$廃止する理由は議案書には記載されていませんが、本会議で市が説明しています（「市の説明（会議録より）」をご覧ください）。廃止したあとの土地の扱いは、議案書にも本会議の提案理由の説明にもありません。$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

5月15日の本会議で、副市長が提案理由を説明しました（市の説明）。

- **行き止まり**の道路で、一般の人の通行に使われておらず、道路としての役割を失っているため廃止する、としています

出典：[立川市議会 会議録（令和8年第2回定例会 5月15日・第12号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第68号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 廃止の理由・廃止後の土地の処分等は、議案書には記載されていません$c$, $c$- 廃止の理由は議案書には記載されていません。本会議での市の説明は「市の説明（会議録より）」に記載しています。廃止後の土地の処分等は、本会議の提案理由の説明でも触れられていません$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

5月15日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 行き止まり道路であり一般の通行に供せられておらず、道路としての機能を失っているため廃止するもの

出典：[立川市議会 会議録（令和8年第2回定例会 5月15日・第12号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第68号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$議案書には**記載されていません**。$c$, $c$議案書には**記載されておらず**、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)）でも触れられていません。$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

5月15日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 令和7年度に住民税が非課税だった人が、給与所得控除の最低保障額の引き上げ（令和7年度の税制改正）を受けて、令和8年度も非課税のままでいられるように**働く時間などを調整した**場合を対象にする、としています
- その場合を介護保険法の「特別の理由」にあたるとして、**令和8年度だけ**、住民税非課税の人の段階まで保険料を減らせるようにする、としています

出典：[立川市議会 会議録（令和8年第2回定例会 5月15日・第12号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第71号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 減免の額・対象者数は、議案書には記載されていません$c$, $c$- 減免の額・対象者数は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)）でも触れられていません$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

5月15日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 介護保険法第142条の規定に基づく改正
- 令和7年度の住民税非課税者が、令和7年度税制改正による給与所得控除の最低保障額引上げを受けて令和8年度も住民税非課税となるよう、控除の引上げ分の範囲で就労調整を行う場合を、同条の「特別の理由」に該当するとし、令和8年度のみ住民税非課税者の段階まで減免できるようにするもの

出典：[立川市議会 会議録（令和8年第2回定例会 5月15日・第12号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第71号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

5月28日の本会議で、副市長と子ども家庭部長が提案理由を説明しました（市の説明）。

- 契約がまとまらなかったことなどが原因で**工事が遅れた**ため、契約金額を変える、としています
- **機械設備の工事業者が決まるのが約3か月遅れた**ことなどで、段取りの組み直しや一部の工事のやり直しが必要になった、としています
- 施設全体の工期を、**令和8年7月末から11月末に延ばす**、としています

出典：[立川市議会 会議録（令和8年第2回定例会 5月28日・第13号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=7)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第74号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

5月28日の本会議で、副市長と子ども家庭部長が提案理由を説明しました（市の説明）。

- 変更内容は、契約不調等を起因とした工事の遅れが生じたことから、契約金額を2,314万4,000円増額し、2億6,514万4,000円に変更するもの（副市長）
- 令和7年7月に着工した建替工事で、機械設備工事業者の決定が約3か月遅延したことなどにより、段取りの再調整や一部工事の手戻りが生じたため、施設全体の工期限を本年7月末から11月末に延伸するとともに、契約金額を変更するもの（子ども家庭部長の補足説明）

出典：[立川市議会 会議録（令和8年第2回定例会 5月28日・第13号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=7)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第74号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$議案書には**記載されていません**。$c$, $c$議案書には**記載されておらず**、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=7)）でも触れられていません。$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

5月28日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 総合福祉センターでの**通所介護サービス（デイサービス）事業が終わる**ことにともなう改正と、休館日の規定の改正をする、としています

出典：[立川市議会 会議録（令和8年第2回定例会 5月28日・第13号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=7)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第75号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 休館日の変更の理由、利用者への影響は、議案書には記載されていません$c$, $c$- 休館日の変更の理由、利用者への影響は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=7)）でも触れられていません$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

5月28日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 総合福祉センターにおける通所介護サービス事業の終了に伴い必要な改正を行うとともに、休館日の規定を改正するもの

出典：[立川市議会 会議録（令和8年第2回定例会 5月28日・第13号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=7)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第75号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$議案書は条例を廃止することだけを定めていて、どの施設か、廃止する理由、施設のその後の扱いは**記載されていません**。$c$, $c$議案書は条例を廃止することだけを定めていて、どの施設か、廃止する理由、施設のその後の扱いは記載されていません。どの施設かとその後の扱いは、本会議で市が説明しています（「市の説明（会議録より）」をご覧ください）。廃止する理由は、本会議の提案理由の説明でも触れられていません。$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

5月28日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 対象は**立川市八ヶ岳山荘**で、**令和9年3月末**で廃止する、としています
- 同じ日の補正予算（議案第73号）の説明では、八ヶ岳山荘を廃止したあとの**財産の処分**に向けて、建物の不動産鑑定を行う、としています

出典：[立川市議会 会議録（令和8年第2回定例会 5月28日・第13号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=7)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第77号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 対象施設、廃止の理由、廃止後の施設の扱いは、議案書には記載されていません$c$, $c$- 対象施設、廃止の理由、廃止後の施設の扱いは、議案書には記載されていません。対象施設と廃止後の扱いは、本会議での市の説明を「市の説明（会議録より）」に記載しています。廃止の理由は、本会議の提案理由の説明でも触れられていません$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

5月28日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 令和9年3月末日をもって立川市八ヶ岳山荘を廃止するため提案するもの
- 議案第73号（一般会計補正予算（第2号））の説明では、総務費 公有財産有効活用事業として、八ヶ岳山荘廃止後の財産処分に向けて建物の不動産鑑定を行うとしている

出典：[立川市議会 会議録（令和8年第2回定例会 5月28日・第13号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=7)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第77号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

5月28日の本会議で、提出者の議員が提案理由を説明しました（提出者の説明）。

- 立川市議会で**初めての、議員の提案による政策条例**だ、としています
- きっかけは、前の年の第1回定例会で、がん条例の制定を求める**請願が全会一致で採択**されたことだ、としています
- 議員有志で**プロジェクトチーム**をつくり、**39回**の会議を経てまとめた、としています
- がん患者の団体、医師会・歯科医師会・薬剤師会、商工会議所から話を聞き、市や教育委員会、社会福祉協議会の意見も聞いたうえで、**パブリックコメント**も行った、としています
- **2月4日（ワールドキャンサーデー）を「立川市がんの日」**とする、としています

出典：[立川市議会 会議録（令和8年第2回定例会 5月28日・第13号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=7)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議員提出議案第1号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 条例の施行に伴う費用の見込みは、議案書には記載されていません$c$, $c$- 条例の施行に伴う費用の見込みは、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=7)）でも触れられていません$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

5月28日の本会議で、提出者の議員が提案理由を説明しました（提出者の説明）。

- 立川市議会初の議員提案による政策条例
- 策定の経過：令和7年第1回定例会で、がん条例の制定を求める請願が全会一致で採択され、市議会として策定することになった。議員有志でがん条例策定検討プロジェクトチームを立ち上げ、39回の会議を経て策定
- 立法事実の確認のため、がん患者団体、医師会、歯科医師会、薬剤師会、商工会議所からヒアリング。市長・両副市長・教育長、保健医療部、福祉部、教育委員会、社会福祉協議会の意見を聴取し、第二中学校・第二小学校のがん教育を視察。素案についてパブリックコメントを実施
- 条例は前文と21条。第17条でワールドキャンサーデーの2月4日を立川市がんの日とする

出典：[立川市議会 会議録（令和8年第2回定例会 5月28日・第13号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=7)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議員提出議案第1号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 個々の改正による税額への影響は、議案書には記載されていません$c$, $c$- 個々の改正による税額への影響は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第59号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 対象となる建物の数や税額への影響は、議案書には記載されていません$c$, $c$- 対象となる建物の数や税額への影響は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第60号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 個々の改正による税額への影響は、議案書には記載されていません$c$, $c$- 個々の改正による税額への影響は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第70号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 対象となる事業所数は、議案書には記載されていません$c$, $c$- 対象となる事業所数は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=6)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第72号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 市営葬儀を始める理由・見込み件数は、議案書には記載されていません$c$, $c$- 市営葬儀を始める理由・見込み件数は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=7)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第76号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 文書質問を新設する理由・経緯は、議案書には記載されていません$c$, $c$- 文書質問を新設する理由・経緯は、議案書には記載されていません。本会議では提案理由の説明が省略されました（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2804&schedule_id=7)）$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年委員会提出議案第2号') AND content NOT LIKE '%議案書と会議録をもとに%';
COMMIT;

-- 確認用：追記できた件数（30件になるはず）。足りない場合は、DBの本文が記録SQLと違っている可能性があります
SELECT count(*) AS updated_rows FROM bill_contents bc JOIN bills b ON b.id = bc.bill_id WHERE b.bill_number IN ('令和8年委員会提出議案第2号', '令和8年議員提出議案第1号', '令和8年議案第59号', '令和8年議案第60号', '令和8年議案第62号', '令和8年議案第63号', '令和8年議案第64号', '令和8年議案第65号', '令和8年議案第66号', '令和8年議案第67号', '令和8年議案第68号', '令和8年議案第70号', '令和8年議案第71号', '令和8年議案第72号', '令和8年議案第74号', '令和8年議案第75号', '令和8年議案第76号', '令和8年議案第77号') AND bc.content LIKE '%議案書と会議録をもとに%';
