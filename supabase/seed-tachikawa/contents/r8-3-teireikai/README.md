# 令和8年第3回定例会 解説SQL（記録）

Supabase の SQL Editor で流した順に並べています。書き方のルールは
`docs/20261002_1800_議案解説の書き方ルール.md` を参照してください。

| ファイル | 内容 |
|---|---|
| `../../r8-3-teireikai.sql` | 議案一覧の取り込み（議案22件・仮の解説） |
| `../../r8-3-teireikai-petitions.sql` | 請願・陳情一覧の取り込み（4件・仮の解説） |
| `01-bill-contents-107-116.sql` | 解説（試作）：議案第107号・第116号 |
| `02-bill-contents-20bills.sql` | 解説：議案第95〜106号、第108〜115号 |
| `03-giin-teishutsu-and-petition-contents.sql` | 議員提出議案第6〜8号の取り込みと解説、請願・陳情4件の解説 |

いずれも何度流しても同じ結果になります（`UPDATE` と `ON CONFLICT`）。
