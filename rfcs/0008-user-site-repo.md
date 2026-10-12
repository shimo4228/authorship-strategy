---
state: withdrawn 2026-10-12
---

## Summary

GitHub の user-site repo `shimo4228.github.io` を作るかを決める。作ると、host root に robots.txt の `Sitemap:` 行を置ける。OpenAttribution の `.well-known` claim（RFC-0007）の前提にもなる。GSC の詰まりが host 側か site 側かの切り分けにも使える。

## Motivation

旧 ID: handoff R3 / ledger 2026-10-01 監査（著者判断待ち）。

- 2026-10-01 から判断待ち
- 現在の hub は project site（`/shimo4228/`）で、host root の資源を持てない

## Status

withdrawn — 作らない（2026-10-12、著者の判断）。

- 2026-10-12 の照合: `https://shimo4228.github.io/` と `/robots.txt`、`/.well-known/` は 404。hub は project site（`/shimo4228/`）として公開されている
- 目的（hub の concept ページを索引に入れる）は project site で足りる。登録の申請（GSC の URL 検査、Bing、Brave）は今の URL のままできる（RFC-0002）
- host root にしか置けないものは、どれも今は効き目が小さい。robots.txt の `Sitemap:` 行は console からの手動送信で代わりになる。`.well-known` の OpenAttribution claim は送る側の AI 製品がまだない（RFC-0007）。GSC の root property は管理が少し楽になる程度
- RFC-0007 の再開条件（主要 AI 製品の送信の表明）が成立したら、そのときに作る。費用は repo 1 つと数ファイルで、消せば戻る

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

なし（終端）。RFC-0007 が (a) で採用されたら、そこで作る。
