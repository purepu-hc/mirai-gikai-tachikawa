-- 令和8年第1回定例会 解説への会議録（提案理由の説明）からの追記
-- 何度流しても同じ結果になるよう、追記済みの行は対象外にしています
BEGIN;
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 補正の理由は、議案書には記載されていません（事項別明細書の説明欄の事業名から、主な内容を紹介しています）$c$, $c$- 補正の理由は議案書には記載されていませんが、本会議で市が説明しています（「市の説明（会議録より）」をご覧ください）$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

2月18日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 国の総合経済対策のほか、保育の**公定価格**（施設型給付費）の改正や、**マイナンバーカードの交付体制の強化**などに対応するための補正予算だとしています
- マイナンバーカード：交付窓口の混雑をやわらげるため、戸籍住民課の受付窓口を増やし、**コールセンター**を置くなどとしています
- 障害のある人の補装具・地域生活支援：利用が当初の想定を上回り、お金が足りなくなる見込みのため、としています
- 介護サービス事業者や保育施設などへの**物価高騰の支援**：国の交付金や都の補助金を使う、としています
- 保育士などの人件費：国の公定価格の引き上げに対応するため、としています
- 中小企業の融資の利子の補助：申請が想定を上回ったため、としています
- 八ヶ岳山荘：受水槽などに**漏水**などの不具合が出たため修繕する、としています
- 羽衣福祉作業所の改修を次の年度に回すのは、排水ますの不具合で追加工事が必要になったため、としています

出典：[立川市議会 会議録（令和8年第1回定例会 2月18日・第1号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第9号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 補正の理由は、議案書には記載されていません$c$, $c$- 補正の理由は議案書には記載されていません。本会議での市の説明は「市の説明（会議録より）」に記載しています$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

2月18日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 補正の趣旨：国の総合経済対策のほか、施設型給付費に係る公定価格の改正やマイナンバーカード交付体制の強化などに対応するもの
- 総務費 財政調整基金等運用管理：各基金の利子の増額分
- 総務費 基幹系システム構築・運用事業／マイナンバーカード関連事務：交付窓口の混雑緩和のため、戸籍住民課の受付窓口の増設、コールセンターの設置、住民基本台帳ネットワークシステムの統合端末機器の追加整備（繰越明許費を設定）
- 民生費 補装具等給付事業・地域生活支援事業：利用件数・利用者数が当初想定を上回り、所要額に不足が見込まれるため
- 民生費 介護サービス事業者物価高騰重点支援事業：国の物価高騰対応重点支援地方創生臨時交付金を活用
- 民生費 民間保育所運営・認証保育所運営・地域型保育給付事務、教育費 幼稚園教育振興事業（保育施設等物価高騰対策補助金）：都の補助金を活用して補助単価を引き上げ。民間保育所運営と幼稚園教育振興事業は国の臨時交付金の財源充当補正も実施
- 民生費 認証保育所運営費補助金：利用人数の増加や都の運営費単価の改正に対応
- 民生費 施設型給付事務：保育士等の人件費に係る国の公定価格の引上げに対応
- 商工費 中小企業融資支援事業：融資あっせんの申請件数が当初想定を上回り、利子補給金が不足する見込みのため
- 教育費 中学校維持管理：中学校の水道料金の不足見込み
- 教育費 八ヶ岳山荘管理運営：受水槽・高架水槽の漏水等の不具合の修繕（繰越明許費を設定）
- 繰入金：今回の補正の所要財源として充当
- 繰越明許費 羽衣福祉作業所中規模改修：排水ますの不具合により追加工事が必要となり、年度内の完了が困難となったため

出典：[立川市議会 会議録（令和8年第1回定例会 2月18日・第1号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第9号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 補正の理由は、議案書には記載されていません（事項別明細書の説明欄の事業名から、主な内容を紹介しています）$c$, $c$- 補正の理由は議案書には記載されていませんが、本会議で市が説明しています（「市の説明（会議録より）」をご覧ください）$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

2月18日の本会議で、副市長が提案理由を説明しました（市の説明）。

- **重勝式**（複数のレースの結果をまとめて当てる車券）の統一発売で、車券の売上げが増えたため、としています
- 売上げや分配金が増えた分と基金の利子は、競輪事業の基金に積み立てる、としています

出典：[立川市議会 会議録（令和8年第1回定例会 2月18日・第1号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第10号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

2月18日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 競輪事業収入（車券発売金額）：重勝式統一発売の車券発売額の増に伴うもの
- 財産収入（利子及び配当金）：競輪事業財政調整基金・競輪事業施設等整備基金の運用利子
- 諸収入（重勝式統一発売分配金）：分配金の増に伴うもの
- 総務費 競輪事業財政調整基金等運用管理：運用利子と分配金の増に伴う収益を、両基金へ積み立てるもの
- 事業費 重勝式統一発売事務：車券発売金額の増に伴うもの

出典：[立川市議会 会議録（令和8年第1回定例会 2月18日・第1号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第10号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 補正の理由は、議案書には記載されていません（事項別明細書の説明欄の事業名から、主な内容を紹介しています）$c$, $c$- 補正の理由は議案書には記載されていませんが、本会議で市が説明しています（「市の説明（会議録より）」をご覧ください）$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

2月18日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 介護サービスの**利用件数が増えて**、給付費が足りなくなる見込みのため、としています
- 一部の給付費（ケアプラン作成など）は使い残しが見込まれるため減らす、としています
- 保険料の収入も増える、としています

出典：[立川市議会 会議録（令和8年第1回定例会 2月18日・第1号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第12号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

2月18日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 保険給付費（居宅介護サービス給付費、施設介護サービス給付費、居宅介護住宅改修費、介護予防サービス給付費、介護予防福祉用具購入費、審査支払手数料、高額介護サービス費、高額医療合算介護サービス費）：利用件数の増加に伴い所要額に不足が見込まれるため
- 居宅介護サービス計画給付費・地域密着型介護予防サービス給付費：不用額が見込まれるため減額
- 基金積立金：利子の増額分
- 保険料：保険料収入の増額による
- 国庫支出金（調整交付金）：国からの交付決定に基づくもの

出典：[立川市議会 会議録（令和8年第1回定例会 2月18日・第1号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第12号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- この道路がどのようにできたか（開発などの経緯）は、議案書には記載されていません$c$, $c$- この道路ができた経緯は議案書には記載されていませんが、本会議で市が説明しています（「市の説明（会議録より）」をご覧ください）$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

2月18日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 宅地開発のときの市のルール（**立川市宅地開発等まちづくり指導要綱**）にもとづいてつくられ、市に**寄附**された道路で、市道にする条件を満たしたため認定する、としています

出典：[立川市議会 会議録（令和8年第1回定例会 2月18日・第1号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第14号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 認定の経緯（道路の帰属・寄付等）は、議案書には記載されていません$c$, $c$- 認定の経緯は議案書には記載されていません。本会議での市の説明は「市の説明（会議録より）」に記載しています$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

2月18日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 立川市宅地開発等まちづくり指導要綱に基づき整備が行われ、寄附を受けた路線について、認定要件を満たしているため市道として認定するもの

出典：[立川市議会 会議録（令和8年第1回定例会 2月18日・第1号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第14号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 改正で保険料の総額がどれだけ増えるかは、議案書には記載されていません$c$, $c$- 改正で保険料の総額がどれだけ増えるかは、議案書には記載されておらず、本会議の提案理由の説明でも触れられていません$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

3月2日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 国の政令の改正と、**立川市国民健康保険運営協議会の答申**にもとづく改正だ、としています

出典：[立川市議会 会議録（令和8年第1回定例会 3月2日・第5号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第29号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 料率改定の算定根拠（東京都への国民健康保険事業費納付金の額等）は、議案書には記載されていません$c$, $c$- 料率改定の算定根拠（東京都への国民健康保険事業費納付金の額等）は、議案書には記載されておらず、本会議の提案理由の説明でも触れられていません$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

3月2日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 国民健康保険法施行令の一部を改正する政令の公布と、立川市国民健康保険運営協議会の答申に基づくもの

出典：[立川市議会 会議録（令和8年第1回定例会 3月2日・第5号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第29号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- この特例で保険料が変わる人数や金額は、議案書には記載されていません$c$, $c$- この特例で保険料が変わる人数や金額は、議案書には記載されておらず、本会議の提案理由の説明でも触れられていません$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

3月2日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 令和7年度の税制改正で、令和8年度から**給与所得控除の最低保障額が10万円上がる**ため、所得が下がって保険料収入が足りなくなることがないようにする、としています
- 所得の金額が下がる場合でも、**令和7年度と同じ額の保険料**を集められるようにする、令和8年度だけの措置だ、としています

出典：[立川市議会 会議録（令和8年第1回定例会 3月2日・第5号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第31号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 特例の影響を受ける被保険者数・保険料への影響額は、議案書には記載されていません$c$, $c$- 特例の影響を受ける被保険者数・保険料への影響額は、議案書には記載されておらず、本会議の提案理由の説明でも触れられていません$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

3月2日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 介護保険法施行令の一部を改正する政令の公布に基づくもの
- 令和7年度税制改正の影響により、令和8年度から給与所得控除の最低保障額が10万円引き上がることに伴い、保険料収入の不足が発生しないよう、令和8年度のみの時限措置を設けるもの
- 合計所得金額が減少する場合でも、政令の規定に準じて、令和7年度と同額の保険料を徴収できるようにするもの

出典：[立川市議会 会議録（令和8年第1回定例会 3月2日・第5号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第31号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 申出の受付窓口や調査の体制、費用は、議案書には記載されていません$c$, $c$- 申出の受付窓口や調査の体制、費用は、議案書には記載されておらず、本会議の提案理由の説明でも触れられていません$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

3月2日の本会議で、副市長が提案理由を説明しました（市の説明）。

- これまで**学校や教育委員会事務局**が行ってきたいじめ防止対策に加えて、新しく**市長の部局**でもいじめ防止対策を始めるための改正だ、としています

出典：[立川市議会 会議録（令和8年第1回定例会 3月2日・第5号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第34号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

3月2日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 学校や教育委員会事務局が行っているいじめ防止対策に加え、新たに市長部局においていじめ防止対策を開始するため、必要な規定を加えるほか、条例の題名を改めるもの

出典：[立川市議会 会議録（令和8年第1回定例会 3月2日・第5号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第34号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 健康管理休暇の具体的な内容（取得できる場合や日数）は、議案書には記載されていません$c$, $c$- 健康管理休暇の具体的な内容（取得できる場合や日数）は、議案書には記載されておらず、本会議の提案理由の説明でも触れられていません$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

2月18日の本会議で、副市長が提案理由を説明しました（市の説明）。

- **東京都の休暇制度などの変更**に合わせて、生理休暇を健康管理休暇に変える、としています

出典：[立川市議会 会議録（令和8年第1回定例会 2月18日・第1号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第36号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 健康管理休暇の承認要件・期間は、議案書には記載されていません$c$, $c$- 健康管理休暇の承認要件・期間は、議案書には記載されておらず、本会議の提案理由の説明でも触れられていません$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

2月18日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 東京都の休暇制度等の変更に準じて、生理休暇を健康管理休暇に変更するほか、必要な文言の整理を行うもの

出典：[立川市議会 会議録（令和8年第1回定例会 2月18日・第1号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第36号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 見直しの理由や、人件費がどれだけ増えるかは、議案書には記載されていません$c$, $c$- 人件費がどれだけ増えるかは、議案書には記載されておらず、本会議の提案理由の説明でも触れられていません$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

3月2日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 地域手当を14%から16%に上げるほか、住居手当・通勤手当の基準と給料表を、**東京都の基準に合わせて**改める、としています

出典：[立川市議会 会議録（令和8年第1回定例会 3月2日・第5号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第44号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 改正の理由・影響額は、議案書には記載されていません$c$, $c$- 影響額は、議案書には記載されておらず、本会議の提案理由の説明でも触れられていません$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

3月2日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 地域手当を14%から16%に引き上げるほか、住居手当、通勤手当の支給基準及び給料表を東京都の基準に準拠して改めるもの

出典：[立川市議会 会議録（令和8年第1回定例会 3月2日・第5号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第44号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 小切手をなくす理由は、議案書には記載されていません$c$, $c$- 小切手をなくす理由は議案書には記載されていませんが、本会議で市が説明しています（「市の説明（会議録より）」をご覧ください）$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

2月18日の本会議で、副市長が提案理由を説明しました（市の説明）。

- **小切手の利用が廃止される**ことにともなう改正だ、としています

出典：[立川市議会 会議録（令和8年第1回定例会 2月18日・第1号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第45号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 改正の理由は、議案書には記載されていません$c$, $c$- 改正の理由は議案書には記載されていません。本会議での市の説明は「市の説明（会議録より）」に記載しています$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

2月18日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 小切手の利用廃止に伴い、所要の改正を行うもの

出典：[立川市議会 会議録（令和8年第1回定例会 2月18日・第1号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第45号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- これまでいじめ防止をどの部署が担当していたかは、議案書には記載されていません$c$, $c$- これまでの担当は議案書には記載されていませんが、議案第34号の説明で、学校や教育委員会事務局が行ってきたとしています（「市の説明（会議録より）」をご覧ください）$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

2月18日の本会議で、市長が提案理由を説明しました（市の説明）。

- 市長は、自身の公約に掲げた**いじめ対策を進めるための組織改正**を、令和8年4月から行うためだと説明しています
- 議案第34号の説明（3月2日）では、これまで**学校や教育委員会事務局**が行ってきたいじめ防止対策に加えて、市長の部局でも対策を始める、としています

出典：[立川市議会 会議録（令和8年第1回定例会 2月18日・第1号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第47号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

2月18日の本会議で、市長が提案理由を説明しました（市の説明）。

- 市長の公約に掲げたいじめ対策を進めるための組織改正を令和8年4月から行うため、条例の一部を改正するもの
- 危機管理対策室の担当業務に、子どものいじめ防止に関することを新たに追加するもの
- （参考）議案第34号の説明では、学校や教育委員会事務局が行っているいじめ防止対策に加え、新たに市長部局においていじめ防止対策を開始するとしている（[立川市議会 会議録（令和8年第1回定例会 3月2日・第5号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)）

出典：[立川市議会 会議録（令和8年第1回定例会 2月18日・第1号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第47号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 補正の理由は、議案書には記載されていません（事項別明細書の説明欄の事業名から、主な内容を紹介しています）$c$, $c$- 補正の理由は議案書には記載されていませんが、本会議で市が説明しています（「市の説明（会議録より）」をご覧ください）$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

3月24日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 国の総合経済対策への対応のほか、**年度末の補正**として、使い残し（契約差金など）を減らし、足りない分を増やすもの、としています
- **物価高騰の支援**：国の交付金を使い、医療機関、農業者、デジタル化に取り組む市内の中小企業などを支援し、商店街の装飾灯の電気料を全額補助する、としています
- **低所得世帯などのエアコン設置**の費用を、都の補助金を使って助成する、としています
- 退職する職員が予算で見込んだ人数より多いため、人件費を増やす、としています
- 法人市民税の更正の請求で、想定を上回る**市税の還付**が出たため、としています
- 学校・公共施設の修繕（第十小学校の防災備蓄倉庫の更新、西砂小学校の着替え用の間仕切りカーテン、柴崎会館のエレベーターなど）を行う、としています
- 公立保育園の**給食の食材の値上がり**で、材料費が足りなくなる見込みのため、としています
- 市の土地を売ったお金や交付金の増収分などは、**公共施設整備基金**に積み立てる、としています

出典：[立川市議会 会議録（令和8年第1回定例会 3月24日・第7号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=8)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第48号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 補正の理由は、議案書には記載されていません$c$, $c$- 補正の理由は議案書には記載されていません。本会議での市の説明は「市の説明（会議録より）」に記載しています$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

3月24日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 補正の趣旨：国の総合経済対策への対応のほか、年度末の補正として、歳出は契約差金などの不用見込額の減額や一部予算不足等への増額、歳入は各種交付金や歳出の増減に伴う国都支出金などを計上（契約差金等の減額は説明を省略）
- 総務費 人事管理：普通退職者数が当初予算計上人員を上回る見込み
- 総務費 公共施設整備基金積立金：交付金等の増収分、本補正で生じる不用額、未利用市有地の土地売払金を積立て
- 総務費 庁内情報基盤整備事業（減額）：住民情報システム標準化の検証作業の詳細が決まり、パソコン管理ソフトの追加調達やサーバ設定作業などが不要になったため
- 総務費 寄附金事務：ガバメントクラウドファンディングで受け入れた寄附金を、一部を実施経費に充てた上で対象団体に交付
- 総務費 公有財産有効活用事業：旧若葉小学校の利活用事業の優先交渉権者の決定を受け、建物登記の書類作成と境界の測量を行う
- 総務費 市税等収納事務：法人市民税の更正請求に伴い、想定を上回る市税還付が発生したため
- 総務費 市民税賦課事務、住民基本台帳事務・コンビニエンスストア証明書交付事業：eLTAXの更改・税制改正への対応、戸籍の附票への旧氏・旧氏の振り仮名記載に伴うシステム改修
- 民生費 低所得世帯等エアコン設置緊急支援事業：都の補助金を活用し、エアコン設置費用を助成
- 民生費 施設サービス事業（減額）：重症心身障害者等施設の開所が当初想定より遅れたため運営費補助金を減額
- 民生費 子どもショートステイ事業：利用件数の増加による不足
- 民生費 民間保育所運営（減額）：補助対象の保育施設の増改築工事の年度内着工が困難となったため
- 民生費 公立保育所運営（賄材料費）：給食食材の価格高騰による不足
- 衛生費 医療機関等物価高騰支援給付金支給事業、農林費 農業者物価高騰支援事業、商工費 デジタル技術活用支援事業：国の物価高騰対応重点支援地方創生臨時交付金を活用した支援
- 商工費 商工業共同施設事業：国の臨時交付金を活用し、商店街装飾灯の電気料の補助率を引き上げて全額補助
- 土木費 見影橋公園整備（減額）：国庫補助金の内示額が見込みを下回り、土地開発公社からの買戻しの一部を見送ったため
- 土木費 市営住宅管理運営（減額）：市営住宅共益費の代理徴収を希望する自治会が想定より少なく、開始時期も遅くなったため
- 消防費 防災備蓄倉庫の整備：老朽化で修繕が困難になった第十小学校防災備蓄倉庫を更新
- 教育費：西砂小学校の着替え用間仕切りカーテンの設置と防火扉の更新、第三中学校外壁の修繕、高松学習館の屋内消火栓用補給水槽の更新、錦町文化財収蔵庫の解体、柴崎会館のエレベーター更新、若葉図書館の隣接地の借受け など
- 教育費 第二小学校等複合施設整備事業（減額）：設計監理委託の入札の不調に伴う不用額
- 公債費（減額）：令和6年度の借入れに対する利子償還額が見込みを下回ったため
- 歳入 財産収入：未利用市有地の売払収入を計上し、公共施設整備基金に積立て
- 歳入 諸収入（有価物売払）：総合リサイクルセンターで回収した資源物の引取り単価が上昇したため
- 地方債補正：西砂学童保育所・くるプレルーム（仮称）建替工事の補正に対応

出典：[立川市議会 会議録（令和8年第1回定例会 3月24日・第7号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=8)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第48号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 補正の理由は、議案書には記載されていません（事項別明細書の説明欄の事業名から、主な内容を紹介しています）$c$, $c$- 補正の理由は議案書には記載されていませんが、本会議で市が説明しています（「市の説明（会議録より）」をご覧ください）$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

3月24日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 主に**インターネット投票**で車券の売上げが増えたため、としています
- 特別観覧席の利用や、売店の貸付料・ドラマや映画の撮影での貸付けは、想定を下回ったため減らす、としています
- 売上げが増えた分の収益などは、競輪の施設整備のための基金に積み立てる、としています

出典：[立川市議会 会議録（令和8年第1回定例会 3月24日・第7号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=8)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第49号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

3月24日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 競輪事業収入：特別観覧席料は利用が当初想定を下回ったため減額。車券発売金額は主にインターネット投票の売上げ増に伴い増額
- 財産収入（財産貸付収入）：施設改修工事（第2期）の工期延伸による売店貸付料の減と、ドラマ・映画撮影の貸付け件数が想定を下回ったため減額
- 繰入金：歳出の工事請負費等の補正に伴い減額
- 繰越金：令和6年度実質収支の剰余分
- 総務費：売上げ増に伴う収益と令和6年度実質収支の一部などを競輪事業施設等整備基金へ積立て
- 事業費：勝者投票払戻金、場外事務委託料（インターネット投票の売上げ増）、競技業務委託料・公益財団法人JKA交付金は売上げ増に伴い増額。そのほかは実績に基づき不用見込額を減額

出典：[立川市議会 会議録（令和8年第1回定例会 3月24日・第7号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=8)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第49号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 補正の理由は、議案書には記載されていません（事項別明細書の説明欄の事業名から、主な内容を紹介しています）$c$, $c$- 補正の理由は議案書には記載されていませんが、本会議で市が説明しています（「市の説明（会議録より）」をご覧ください）$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

3月24日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 前の年度の繰越金などを、駐車場事業の基金に積み立てる、としています
- 消費税の確定申告にともなう補正もある、としています
- 指定管理者の収益の見込みから、指定管理者からの納付金が増える、としています

出典：[立川市議会 会議録（令和8年第1回定例会 3月24日・第7号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=8)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第51号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 補正の理由は、議案書には記載されていません$c$, $c$- 補正の理由は議案書には記載されていません。本会議での市の説明は「市の説明（会議録より）」に記載しています$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

3月24日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 総務費 駐車場事業財政調整基金運用管理：前年度繰越金等の収支見込額を積立て
- 事業費 駐車場管理運営：消費税の確定申告に伴うもの
- 繰越金：令和6年度の実質収支
- 諸収入（預金利子）：普通預金利子の見込額
- 雑入（指定管理者納付金）：指定管理者の収益見込みにより増額

出典：[立川市議会 会議録（令和8年第1回定例会 3月24日・第7号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=8)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第51号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 補正の理由は、議案書には記載されていません（事項別明細書の説明欄の事業名から、主な内容を紹介しています）$c$, $c$- 補正の理由は議案書には記載されていませんが、本会議で市が説明しています（「市の説明（会議録より）」をご覧ください）$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

3月24日の本会議で、副市長が提案理由を説明しました（市の説明）。

- 流域下水道で処理する水の量が見込みより少なかったため、負担金を減らす、としています
- ポンプの稼働時間が見込みより短かったことなどから、電気料を減らす、としています
- 流域下水道の建設・改良の負担額が確定したため減らす、としています

出典：[立川市議会 会議録（令和8年第1回定例会 3月24日・第7号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=8)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第53号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

3月24日の本会議で、副市長が提案理由を説明しました（市の説明）。

- ポンプ場費（動力費・電気料）：ポンプの稼働時間が当初見込みを下回ったこと等から減額
- 流域下水道処理費負担金：処理水量が当初見込みを下回ったことから減額
- 流域下水道建設負担金・流域下水道改良負担金：事業負担額が確定したことから減額
- 雨水処理負担金、企業債（下水道事業債）、一般会計負担金、第4条の企業債の補正：上記の支出の補正に対応するもの

出典：[立川市議会 会議録（令和8年第1回定例会 3月24日・第7号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=8)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第53号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- それぞれの変更にいくらかかるかの内訳は、議案書には記載されていません$c$, $c$- それぞれの変更にいくらかかるかの内訳は、議案書には記載されておらず、本会議の提案理由の説明でも触れられていません$c$), $c$
## 参考
$c$, $c$
## 市の説明（会議録より）

3月24日の本会議で、副市長と市長公室長が提案理由を説明しました（市の説明）。

- 仮設校舎の設計などに変更が生じたため、契約金額を増やす、としています
- 土地の履歴調査を追加するのは、今の校舎の北側で**ガソリンの保管が確認された**ため、としています
- 仮の登校用の門は、仮設校舎を建てている間、**児童が安全に登下校できるように**するため、としています
- 仮設校舎の床面積は、学校との話し合いなどにより、事業の提案のときから**約5%**増やす、としています
- 体育館の改修は、仮設校舎の手続（計画通知）の中で、上部の開口部を防火仕様にする必要が出たため、としています

出典：[立川市議会 会議録（令和8年第1回定例会 3月24日・第7号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=8)

## 参考
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第54号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(replace(content, $c$- 変更項目ごとの金額内訳は、議案書には記載されていません$c$, $c$- 変更項目ごとの金額内訳は、議案書には記載されておらず、本会議の提案理由の説明でも触れられていません$c$), $c$
## 出典
$c$, $c$
## 市の説明（会議録より）

3月24日の本会議で、副市長と市長公室長が提案理由を説明しました（市の説明）。

- 変更内容は、仮設校舎の設計等に変更が生じたことから、契約金額を6,836万5,000円増額し、60億286万5,000円に変更するもの（副市長）
- 主な変更内容（市長公室長の補足説明）：(1) 既存校舎の北側にガソリンの保管が確認されたため、土地の履歴調査の追加調査を行う (2) 仮設校舎建設中に児童が安全に登下校できるよう、敷地東側に仮登校通用門を設置する (3) 仮設校舎棟について、学校との協議等により、事業提案時から延べ床面積を約5%増加する (4) 仮設校舎の計画通知の手続において、既存体育館上部の開口部を防火仕様に変更する必要が生じたため改修工事を行う

出典：[立川市議会 会議録（令和8年第1回定例会 3月24日・第7号）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=8)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第54号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 利用料の金額や、市内のどの施設で実施するかは、議案書には記載されていません$c$, $c$- 利用料の金額や、市内のどの施設で実施するかは、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第16号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 1月第3土曜日を休館日にする理由は、議案書には記載されていません$c$, $c$- 1月第3土曜日を休館日にする理由は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第18号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 1月第3土曜日を休館日とする理由は、議案書には記載されていません$c$, $c$- 1月第3土曜日を休館日とする理由は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第18号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 変更の理由は、議案書には記載されていません$c$, $c$- 変更の理由は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第19号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 改正の理由は、議案書には記載されていません$c$, $c$- 改正の理由は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第19号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 変更の理由は、議案書には記載されていません$c$, $c$- 変更の理由は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第20号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 改正の理由は、議案書には記載されていません$c$, $c$- 改正の理由は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第20号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 変更の理由は、議案書には記載されていません$c$, $c$- 変更の理由は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第21号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 改正の理由は、議案書には記載されていません$c$, $c$- 改正の理由は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第21号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 共益費の金額や対象となる費用の具体的な内容は、議案書には記載されていません$c$, $c$- 共益費の金額や対象となる費用の具体的な内容は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=2)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第25号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 引き上げの理由や、占用料の収入がどれだけ増えるかは、議案書には記載されていません$c$, $c$- 引き上げの理由や、占用料の収入がどれだけ増えるかは、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第27号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 改定の算定根拠・増収見込額は、議案書には記載されていません$c$, $c$- 改定の算定根拠・増収見込額は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第27号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 開設の理由や、建物の整備費用は、議案書には記載されていません$c$, $c$- 開設の理由や、建物の整備費用は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第33号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 設置の理由・整備費は、議案書には記載されていません$c$, $c$- 設置の理由・整備費は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第33号') AND content NOT LIKE '%議案書と会議録をもとに%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 立川市内で新しい区分の事業所を設ける予定があるかは、議案書には記載されていません$c$, $c$- 立川市内で新しい区分の事業所を設ける予定があるかは、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=8)）でも触れられていません$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第55号') AND content NOT LIKE '%議案書と会議録をもとに%';
COMMIT;

-- 確認用：追記できた件数（47件になるはず）。足りない場合は、DBの本文が記録SQLと違っている可能性があります
SELECT count(*) AS updated_rows
FROM bill_contents bc JOIN bills b ON b.id = bc.bill_id
WHERE b.bill_number LIKE '令和8年議案第%号' AND bc.content LIKE '%議案書と会議録をもとに%';
