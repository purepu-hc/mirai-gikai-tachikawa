# みらい議会＠立川市

立川市議会で今どんな議案が検討されているかを、わかりやすく伝えることを目指す非公式プロジェクトです。

- サイト: https://mirai-gikai-tachikawa-web.vercel.app

## 注意事項
- **これは政党チームみらいが運営しているものではありません。**
- **立川市・立川市議会の公式サービスではありません。** 市民有志による非公式プロジェクトです。
- 運営: ぷれ（[@miraigikai_tckw](https://x.com/miraigikai_tckw)）
- 不具合や気になる点は、党公式や市ではなく、みらい議会＠立川市の X（[@miraigikai_tckw](https://x.com/miraigikai_tckw)）までお寄せください。
- 本家「みらい議会」: https://gikai.team-mir.ai/

## 出典とライセンス
- 本リポジトリは [bakumon1107/mirai-gikai-fukuoka-city](https://github.com/bakumon1107/mirai-gikai-fukuoka-city) の `kawasaki/develop` ブランチ（川崎市版、2026-04-08 時点）をもとにしています。
  - 系統: [team-mirai/mirai-gikai](https://github.com/team-mirai/mirai-gikai)（本家）→ 川崎市版（GondoTakashi）→ 福岡市版（bakumon1107）→ 本リポジトリ
- ライセンスは本家と同じ [AGPL-3.0](./LICENSE) です。改変後のソースコードも同ライセンスで公開します。
- 本家の [Fork ガイドライン](https://github.com/team-mirai/mirai-gikai/blob/develop/FORK_GUIDELINES.md) に従います。

## 改変履歴
- 2026-10-01: 立川市版として作業開始。サイト設定を立川市向けに変更、AIチャット・AIインタビューを無効化、フッターに免責表示・本家リンク・ソースコードリンクを追加、デスクトップメニューの党への寄附リンクを非表示化

## AI機能について
- API費用を発生させない方針のため、`web/src/config/site.config.ts` の `features.aiChat` / `features.aiInterview` は `false` にしています。
- `AI_GATEWAY_API_KEY` は設定しない運用です。

## 他地方議会向けForkガイド（川崎市版より）
- [fork手順](docs/kawasaki/20260304_1000_別地域向けfork手順.md)

---

# みらい議会

[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/team-mirai-volunteer/mirai-gikai)
[![codecov](https://codecov.io/gh/team-mirai/mirai-gikai/branch/develop/graph/badge.svg)](https://codecov.io/gh/team-mirai/mirai-gikai)

## セットアップ

```bash
# Supabaseの起動
npx supabase start

# 環境変数の設定（必要に応じて.envの内容を変更してください）
cp .env.example .env

# パッケージインストール
pnpm install

# SupabaseのDB初期化, 開発用シードデータのセットアップ
pnpm db:reset

# サーバー起動
pnpm dev
```

## マイグレーション

```bash
# マイグレーションファイル生成
npx supabase migration new マイグレーション名

# マイグレーション実行 & 型ファイル更新
pnpm db:migrate
```

## Adminユーザーの作成

1. Supabase Studio上で Authentication > Add User からユーザーを作成
2. Supabase Studio上で以下のSQLを実行

```sql
UPDATE auth.users
SET raw_app_meta_data = raw_app_meta_data || '{"roles": ["admin"]}'::jsonb
WHERE email = '<1で作成したユーザーのemail>';
```

> [!NOTE]
> 開発環境では、seedデータによって、`email: admin@example.com, password: admin123456` のAdminユーザーが作成されます。
