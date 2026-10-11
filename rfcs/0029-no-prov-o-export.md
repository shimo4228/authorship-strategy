---
state: rejected 2026-08-25
review-when: 主要な research graph か LLM crawler が repo 内の PROV-O の取り込みを公式化する
---

## Summary

repo 内に PROV-O の provenance を書き出さない。

## Motivation

旧 ID: ledger 2026-08-25 標準規格横断評価。

- arbitrary repo の PROV-O を読む外部の消費者がいない（LLM crawler / OpenAIRE / DataCite のどれも読まない、as-of 2026-08-25）
- 既存の graph.jsonld と内容が全部重なる

## Status

rejected — 再提案しない guard として残す（2026-10-12 plan で移送）。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

なし。失効条件が成立したら新しいエントリで再評価する。
