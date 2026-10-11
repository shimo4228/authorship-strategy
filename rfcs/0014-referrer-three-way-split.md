---
state: draft 2026-10-12
---

## Summary

hub の `traffic/referrers/<repo>.jsonl`（2026-10-11 開始、14 日窓の日次スナップショット）を、AI エンジン・検索・人の面の 3 分類で集計する。ADR-0024 の proxy 段の観測として読む。

## Motivation

旧 ID: handoff R10。

- データは 2026-10-11 から溜まり始めた。clone は経路が分からないまま
- 集計は、分類の規則を先に決めてから行う

## Status

draft — データの蓄積待ち、分類規則が未定（2026-10-12）。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

分類規則（どの referrer をどの類に入れるか）を決める。集計の開始時期を決める。
