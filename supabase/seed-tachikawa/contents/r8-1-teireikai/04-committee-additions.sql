-- 令和8年第1回定例会 解説への委員会の会議録からの追記（03-kaigiroku-additions.sql の後に流す）
-- 03 で書き換えた補足の行を前提にしています。追記済みの行は対象外なので、何度流しても同じ結果になります
BEGIN;
UPDATE bill_contents SET content = replace(replace(content, $c$- 利用料の金額や、市内のどの施設で実施するかは、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)）でも触れられていません$c$, $c$- 利用料は議案書には記載されていませんが、委員会で市が答弁しています（「委員会での市の説明（会議録より）」をご覧ください）。市内のどの施設で実施するかは、議案書にも本会議・委員会の会議録にも見当たりません$c$), $c$
## 参考
$c$, $c$
## 委員会での市の説明（会議録より）

3月13日の予算特別委員会で、保育課長が答弁しました。委員の質問に対する市の答弁です（質問した委員の名前は記載していません）。

- 国の制度と都の制度を組み合わせて、**一本化した市の制度**として実施する、としています
- 利用料は、国が決めた上限の範囲で各施設が決めるしくみですが、都の制度で国の制度の分も含めて無償になるため、立川市では保育園と同じように**基本的な利用料は無料**になる、としています。施設によっては実費が別にかかる場合もある、としています

出典：[立川市議会 会議録（令和8年 予算特別委員会 3月13日）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2783&schedule_id=2)

## 参考
$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第16号') AND content NOT LIKE '%## 委員会での市の説明（会議録より）%';
UPDATE bill_contents SET content = replace(replace(content, $c$
## 出典
$c$, $c$
## 委員会での市の説明（会議録より）

3月13日の予算特別委員会で、保育課長が答弁しました。委員の質問に対する市の答弁です（質問した委員の名前は記載していません）。

- 国制度の実施を必須とした上で、その上乗せとして都制度（多様な他者との関わりの機会の創出事業）を併用できる整理になっており、本市ではこれらを組み合わせて一本化した市の制度を設計している
- 利用料は国の制度の上限額の範囲で各施設が定めるスキームだが、都の制度では国制度の部分も含めて無償化されているため、本市で実施する場合は保育園と同様に基本的な利用料は無償。施設によっては実費等が別にかかる場合もある

出典：[立川市議会 会議録（令和8年 予算特別委員会 3月13日）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2783&schedule_id=2)

## 出典
$c$), $c$この解説は、議案書をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）をご確認ください。$c$, $c$この解説は、議案書と会議録をもとにAIで下書きし、運営者が確認したものです。正確な内容は議案書（PDF）と会議録をご確認ください。$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第16号') AND content NOT LIKE '%## 委員会での市の説明（会議録より）%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 引き上げの理由や、占用料の収入がどれだけ増えるかは、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)）でも触れられていません$c$, $c$- 引き上げの理由や収入の見込みは議案書には記載されていませんが、委員会で市が答弁しています（「委員会での市の説明（会議録より）」をご覧ください）$c$), $c$
## 参考
$c$, $c$
## 委員会での市の説明（会議録より）

3月12日の予算特別委員会で、道路課長が答弁しました。委員の質問に対する市の答弁です（質問した委員の名前は記載していません）。

- 国が占用料の改定の方法（改定のポイント）を示したので、それをもとに改定を整理できた、としています
- 最終的には収入が今の**2倍を超える**見込みですが、急に上がりすぎないよう、国の通知にしたがって**1年に1.2倍まで**の範囲で段階的に上げていく、としています。令和8年度は、おおむね**20%以内**の増加になる、としています
- 令和6年度決算の数量で試算すると、おおむね1億4,000万円で、**毎年2,400万円ぐらいずつ**収入が増えていく見込みだ、としています（申請の増減で変わる、としています）

出典：[立川市議会 会議録（令和8年 予算特別委員会 3月12日）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2783&schedule_id=1)

## 参考
$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第27号') AND content NOT LIKE '%## 委員会での市の説明（会議録より）%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 改定の算定根拠・増収見込額は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)）でも触れられていません$c$, $c$- 改定の算定根拠・増収見込額は議案書には記載されていません。委員会での市の答弁は「委員会での市の説明（会議録より）」に記載しています$c$), $c$
## 出典
$c$, $c$
## 委員会での市の説明（会議録より）

3月12日の予算特別委員会で、道路課長が答弁しました。委員の質問に対する市の答弁です（質問した委員の名前は記載していません）。

- 改定の経緯：国が占用料改定のポイントとして改定に当たっての方法を示したことから、これらを基に今回の改正として整理した
- 歳入の増額は最終的に2倍を超える見込み。ただし国が激変緩和を求める通知を出していることから、国の通知する1.2倍を限度として、毎年、規定の占用料額になるまで緩和措置を取る。令和8年度はおおむね20%以内で収まる額で徴収する見込み
- 令和6年度決算値の数量で試算した場合、おおむね1億4,000万で、毎年2,400万ぐらいずつ収入が増えていく見込み（申請の増減によって変動する）

出典：[立川市議会 会議録（令和8年 予算特別委員会 3月12日）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2783&schedule_id=1)

## 出典
$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第27号') AND content NOT LIKE '%## 委員会での市の説明（会議録より）%';
UPDATE bill_contents SET content = replace(replace(content, $c$- この特例で保険料が変わる人数や金額は、議案書には記載されておらず、本会議の提案理由の説明でも触れられていません$c$, $c$- この特例の影響を受ける人数や金額は議案書には記載されていませんが、委員会で市が答弁しています（「委員会での市の説明（会議録より）」をご覧ください）$c$), $c$
## 参考
$c$, $c$
## 委員会での市の説明（会議録より）

3月18日の予算特別委員会で、介護保険課長が答弁しました。委員の質問に対する市の答弁です（質問した委員の名前は記載していません）。

- 令和7年度の税制改正で、給与所得控除の最低保障額が**55万円から65万円**に上がり、一部の人の保険料の段階が変わって、今の介護保険事業計画の期間（令和6〜8年度）の保険料収入が減るおそれが出たため、国が政令を改正した。この条例改正はそれをふまえたもの、としています
- 影響を受けるのは、粗い試算で**約600人**、金額は**約1,600万円**、としています

出典：[立川市議会 会議録（令和8年 予算特別委員会 3月18日）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2783&schedule_id=5)

## 参考
$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第31号') AND content NOT LIKE '%## 委員会での市の説明（会議録より）%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 特例の影響を受ける被保険者数・保険料への影響額は、議案書には記載されておらず、本会議の提案理由の説明でも触れられていません$c$, $c$- 特例の影響を受ける被保険者数・影響額は議案書には記載されていません。委員会での市の答弁は「委員会での市の説明（会議録より）」に記載しています$c$), $c$
## 出典
$c$, $c$
## 委員会での市の説明（会議録より）

3月18日の予算特別委員会で、介護保険課長が答弁しました。委員の質問に対する市の答弁です（質問した委員の名前は記載していません）。

- 令和7年度税制改正で、物価上昇への対応とともに就業調整にも対応するとの観点から、給与所得控除の最低保障額を55万円から65万円に10万円引き上げる見直しが行われた
- 第1号被保険者の保険料は市民税課税の有無や合計所得金額等を段階の基準としているため、一部の被保険者の段階に異動が生じ、第9期介護保険事業計画（令和6〜8年度）中の保険料収入が減少する可能性が生じた。保険者の責めに帰さない収入不足を防ぐため、国が介護保険法施行令を改正し、本改正はこれを踏まえたもの
- 影響を受ける人数はおよそ600人、金額は約1,600万円（市による粗い試算）

出典：[立川市議会 会議録（令和8年 予算特別委員会 3月18日）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2783&schedule_id=5)

## 出典
$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第31号') AND content NOT LIKE '%## 委員会での市の説明（会議録より）%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 開設の理由や、建物の整備費用は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)）でも触れられていません$c$, $c$- 開設の理由は議案書には記載されていませんが、委員会で市が答弁しています（「委員会での市の説明（会議録より）」をご覧ください）。建物の整備費用は、議案書にも本会議の提案理由の説明にもありません$c$), $c$
## 参考
$c$, $c$
## 委員会での市の説明（会議録より）

3月13日と16日の予算特別委員会で、子ども育成課長が答弁しました。委員の質問に対する市の答弁です（質問した委員の名前は記載していません）。

- **曙地域**の学童保育所の**待機児童**への対策として、**旧健康会館**の施設に開く、としています
- 令和8年の夏ごろの開所予定で、定員が**30人**増える、としています

出典：[立川市議会 会議録（令和8年 予算特別委員会 3月13日）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2783&schedule_id=2)、[立川市議会 会議録（令和8年 予算特別委員会 3月16日）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2783&schedule_id=3)

## 参考
$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第33号') AND content NOT LIKE '%## 委員会での市の説明（会議録より）%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 設置の理由・整備費は、議案書には記載されておらず、本会議の提案理由の説明（[会議録](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2785&schedule_id=6)）でも触れられていません$c$, $c$- 設置の理由は議案書には記載されていません。委員会での市の答弁は「委員会での市の説明（会議録より）」に記載しています。整備費は、本会議の提案理由の説明でも触れられていません$c$), $c$
## 出典
$c$, $c$
## 委員会での市の説明（会議録より）

3月13日と16日の予算特別委員会で、子ども育成課長が答弁しました。委員の質問に対する市の答弁です（質問した委員の名前は記載していません）。

- 曙地域の学童保育の待機児童への対応策として、高松南学童保育所を旧健康会館の施設に開くこととしており、令和8年の夏頃までに開所できるよう準備している（3月13日）
- 高松南学童保育所は令和8年度の夏頃に開所予定で、30名の増となる（3月16日）

出典：[立川市議会 会議録（令和8年 予算特別委員会 3月13日）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2783&schedule_id=2)、[立川市議会 会議録（令和8年 予算特別委員会 3月16日）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2783&schedule_id=3)

## 出典
$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第33号') AND content NOT LIKE '%## 委員会での市の説明（会議録より）%';
UPDATE bill_contents SET content = replace(replace(content, $c$- 申出の受付窓口や調査の体制、費用は、議案書には記載されておらず、本会議の提案理由の説明でも触れられていません$c$, $c$- 受付窓口や体制は議案書には記載されていませんが、委員会で市が説明しています（「委員会での市の説明（会議録より）」をご覧ください）。費用は、議案書にも会議録にも見当たりません$c$), $c$
## 参考
$c$, $c$
## 委員会での市の説明（会議録より）

3月4日の総務委員会で、コンプライアンス推進課長が「市長部局によるいじめ防止対策の実施について」報告し、市長も答弁しました。

- これまで学校や教育委員会が行ってきたいじめ対策に、市長の部局も加わる。大阪府**寝屋川市**の取り組みを参考にした、としています
- **危機管理対策室**に**いじめ監察課**を置き（令和8年4月）、市立学校の児童生徒を対象に**いじめの相談窓口**を設けて、今起きているいじめを**やめさせることを第一**に対応する、としています
- 全校での相談の受付は、**令和8年7月中旬ごろ**から始める予定、としています
- 子どもが**タブレット**や**料金受取人払いのはがき付きチラシ**でいじめを申し出られる「協力校」を、小学校3校・中学校2校程度から始め（令和8年10月ごろ）、**令和10年度から全校**に広げたい、としています
- 被害者側を支えるため、いじめ解決のための補助金や法的な助言ができるようにし、学校などに見守りや学級替えなどを勧告できるようにする、としています
- 教育委員会や学校のこれまでの取り組みは続けたうえで、連携して進める、としています

出典：[立川市議会 会議録（令和8年 総務委員会 3月4日）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2788&schedule_id=1)

## 参考
$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第34号') AND content NOT LIKE '%## 委員会での市の説明（会議録より）%';
UPDATE bill_contents SET content = replace(content, $c$
## 出典
$c$, $c$
## 委員会での市の説明（会議録より）

3月4日の総務委員会で、コンプライアンス推進課長が「市長部局によるいじめ防止対策の実施について」報告し、市長も答弁しました。

- 学校でのいじめ対策はこれまで学校や教育委員会が行ってきた固有の事務だったが、全国の幾つかの自治体では市長部局が関わる取組が行われている。大阪府寝屋川市の取組（市長部局に監察課を配置）を参考にしつつ、本市の状況を踏まえて検討した
- 期待する効果：いじめへの早期対応による児童生徒の尊厳及び人権の確保、教員の働き方改革
- 危機管理対策室内にいじめ監察課を設置（令和8年4月）。対象は本市の市立学校に在籍する児童生徒。周知活動といじめの相談窓口を設け、現に起きているいじめをやめさせることを第一に対応する。全校での相談業務の開始は令和8年7月中旬頃の予定
- タブレットパソコンや料金受取人払いのはがきつきチラシにより児童生徒がいじめの申出をできるようにする協力校を、小学校3校程度・中学校2校程度位置づけ（令和8年10月頃から）、令和10年度から全校で進められるようにしたい
- 条例改正により、被害者側のサポートとして、いじめ解決を図るための補助金の支出や法的助言ができるようにするほか、市長部局から学校等に対し、当該児童等の見守り、いじめ防止の環境整備、学級替えなどの勧告ができるようにする
- 教育委員会や学校が行っているいじめの取組は継続することを前提に、連携を十分に図って進める
- 市長の答弁：子どもたちが相談しやすい環境を設けることが第一義。いじめ監察課はコンプライアンス推進課の隣に設置するが、大きな看板を出すことは考えていない。来庁のほか担当職員が訪問することもあり、子どもや保護者の希望に寄り添って状況を把握する

出典：[立川市議会 会議録（令和8年 総務委員会 3月4日）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2788&schedule_id=1)

## 出典
$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第34号') AND content NOT LIKE '%## 委員会での市の説明（会議録より）%';
UPDATE bill_contents SET content = replace(content, $c$
## 参考
$c$, $c$
## 委員会での市の説明（会議録より）

3月4日の総務委員会で、企画政策課長が組織改正（案）について報告しました。

- 市長の公約であるいじめ対策を進めるため、**いじめ監察課**と**いじめ監察係**を新しく設ける、としています
- いじめ監察課の取り組みの内容は、議案第34号（子どものいじめ防止条例の改正）の解説をご覧ください

出典：[立川市議会 会議録（令和8年 総務委員会 3月4日）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2788&schedule_id=1)

## 参考
$c$) WHERE difficulty_level='normal' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第47号') AND content NOT LIKE '%## 委員会での市の説明（会議録より）%';
UPDATE bill_contents SET content = replace(content, $c$
## 出典
$c$, $c$
## 委員会での市の説明（会議録より）

3月4日の総務委員会で、企画政策課長が組織改正（案）について報告しました。

- 令和8年度の組織改正（案）：市長公約であるいじめ対策を進めるため、いじめ監察課及びいじめ監察係を新設する
- 同日の総務委員会では、コンプライアンス推進課長が「市長部局によるいじめ防止対策の実施について」報告している（内容は議案第34号の解説に記載）

出典：[立川市議会 会議録（令和8年 総務委員会 3月4日）](https://ssp.kaigiroku.net/tenant/tachikawa/MinuteView.html?council_id=2788&schedule_id=1)

## 出典
$c$) WHERE difficulty_level='hard' AND bill_id=(SELECT id FROM bills WHERE bill_number='令和8年議案第47号') AND content NOT LIKE '%## 委員会での市の説明（会議録より）%';
COMMIT;

-- 確認用：追記できた件数（12件になるはず）
SELECT count(*) AS updated_rows FROM bill_contents bc JOIN bills b ON b.id = bc.bill_id WHERE b.bill_number IN ('令和8年議案第16号', '令和8年議案第27号', '令和8年議案第31号', '令和8年議案第33号', '令和8年議案第34号', '令和8年議案第47号') AND bc.content LIKE '%## 委員会での市の説明（会議録より）%';
