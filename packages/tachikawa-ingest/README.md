# @mirai-gikai/tachikawa-ingest

立川市議会の公開ページ（会期ごとの「議案一覧」）を読み取り、Supabase に投入するための SQL を生成します。
**AI は使いません**（HTML の表をそのまま読み取るだけなので、API 費用はかかりません）。

## 何をするか

1. 議案一覧ページの表（caption に「議案一覧」を含む表）から、番号・議案名・議案書PDF・付託委員会・議決結果を読み取る
2. 付託委員会と議決結果から審議状況を判定する
   - 可決・承認・同意・認定・採択 → `approved`／否決・不採択など → `rejected`
   - 議決前で委員会に付託 → `in_committee`／付託省略 → `plenary_session`／どちらも空欄 → `submitted`
3. 会期・委員会・会派（`src/masters.ts`）と議案をまとめた SQL を `supabase/seed-tachikawa/<会期>.sql` に書き出す

生成される SQL は何度流しても同じ結果になります。

- 議案は議案番号（例: `令和8年議案第95号`）で上書き更新するので、議決結果が出たら再生成して流し直せば反映される
- 解説（`bill_contents`）は、無い場合だけ「解説準備中」の仮コンテンツを入れる。書いた解説は上書きしない

## 使い方

```bash
# 公式ページから取得して SQL を生成（ネットに出られる環境で）
pnpm --filter @mirai-gikai/tachikawa-ingest build-sql -- --session r8-3-teireikai

# 保存した HTML から生成（テスト用・オフライン）
pnpm --filter @mirai-gikai/tachikawa-ingest build-sql -- --session r8-3-teireikai --html src/__fixtures__/r8-3-bill-list.html
```

生成した SQL は、Supabase のダッシュボード → **SQL Editor** に貼り付けて実行します（API キーをどこにも渡さずに済みます）。

## 会期を追加するとき

`src/masters.ts` の `SESSIONS` に会期を追加します（名称・スラッグ・会期の日付・議案番号に付ける年・議案一覧ページのURL）。
委員会・会派の構成が変わったときも、出典ページを確認して `masters.ts` を更新してください。

## テスト

```bash
pnpm --filter @mirai-gikai/tachikawa-ingest test
```

`src/__fixtures__/` に保存した実際のページの HTML を使ってテストしています。
