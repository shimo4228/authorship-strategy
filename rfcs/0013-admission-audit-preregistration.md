---
state: blocked 2026-10-12
---

## Summary

汎用語だけで著者名を含まない固定のクエリ panel を作り、月次・3 反復で、回答に著者所有の URL が出るか・名前が出るか・fan-out を測る。測る前に `docs/empirical/` に事前登録する。2026-09 の probe 事前登録とは別の系列にする。

## Motivation

旧 ID: handoff R9 / 探索 2026-10-11。

- ADR-0024 の evidence 段の計器の候補。既存の probe（ADR-0011）は著者名か project 名を含む問いで、索引への入場そのものは測っていない
- RFC-0002（入場の操作）の前後で読める系列になる。ただし設計は介入の効果を主張しない形にする（ADR-0023）

## Status

blocked — 計器を作り、基準値を読んだ。次の月次の読み待ち（2026-10-12、著者の判断）。

- 設計を変えた: 汎用語の質問 panel を検索つきの AI に投げる案はやめた。2026-10-01 に retrieval の定期実行を「モデルの入れ替えで系列がすぐ途切れる」として止めており（probe 事前登録の Amendment）、同じ型を戻すことになるため。API の費用もかかる
- 代わりに、検索エンジン 2 つの console が自分で出す数字を月に 1 回読む: Google の索引数と sitemap の状態、Bing の索引数と sitemap の状態、Bing の AI Performance（Copilot などの AI 回答での hub の引用数と grounding query）。どれも無料で、一次の数字
- 置き場所: [`docs/empirical/admission-readings.md`](../docs/empirical/admission-readings.md)（role: baseline data）。2026-10-12 の基準値は Google 4 / 0、Bing 5、Bing の AI 引用 0（2026-07-12〜10-09）。同日の索引リクエスト（A-0031〜A-0033）の前に読んだ
- ADR-0023 に従い、リクエストの前後の差を効果として読まない

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

```
再開条件: 2026-11-01 を過ぎる（月初の currency check と同じ時期）
照合先:   日付
成立時:   accepted（console を読み取りだけで読み、表に 1 行足す。次の月初に日付を進めて blocked に戻す）
```
