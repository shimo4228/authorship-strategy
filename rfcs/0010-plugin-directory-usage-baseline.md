---
state: draft 2026-10-12
---

## Summary

Anthropic の plugin directory に掲載された akc-cycle と harness-scope について、掲載を記録し、Usage タブの CSV（90 日）を取得して empirical layer に基準値として置く。「考えの使用」と「足場（skill）の使用」を分けて記録する。

## Motivation

旧 ID: handoff R5 / ledger C24（2026-07-15 に掲載を申請）。

- 2026-10-11 の時点で akc-cycle と harness-scope は掲載済み。旧 ledger の C24 は「LISTED」に更新されないまま残った
- directory の Usage は、この program が持つ唯一の一次の利用計測（2026-10-11 の調査）
- 区別は ADR-0024 の議論で出た: skill の install は足場の使用で、考えの使用と同じではない
- scheduled task `akc-plugin-catalog-watch` は掲載の検出時にこのエントリの更新を提案する

## Status

draft — CSV の取得と記録の形を決める段階（2026-10-12）。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

著者が claude.ai の directory 管理画面から Usage CSV を取得する。記録の置き場所（empirical の新 file か既存 file か）を決める。
