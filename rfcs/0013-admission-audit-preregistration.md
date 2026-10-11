---
state: draft 2026-10-12
---

## Summary

汎用語だけで著者名を含まない固定のクエリ panel を作り、月次・3 反復で、回答に著者所有の URL が出るか・名前が出るか・fan-out を測る。測る前に `docs/empirical/` に事前登録する。2026-09 の probe 事前登録とは別の系列にする。

## Motivation

旧 ID: handoff R9 / 探索 2026-10-11。

- ADR-0024 の evidence 段の計器の候補。既存の probe（ADR-0011）は著者名か project 名を含む問いで、索引への入場そのものは測っていない
- RFC-0002（入場の操作）の前後で読める系列になる。ただし設計は介入の効果を主張しない形にする（ADR-0023）

## Status

draft — 採否と設計の判断待ち（2026-10-12）。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

著者が採るかを決める。採るなら panel と判定規則を事前登録の file に書く。
