---
state: draft 2026-10-12
review-when: GitHub agent finder か HF Discover Tool の実稼働を一次資料で確認する
---

## Summary

Agentic Resource Discovery（Google と Linux Foundation の WG、2026-05 末発表）の `ai-catalog.json` を hub に置き、graph.jsonld・HF dataset・GitMCP endpoint を capability entry にする案。消費側が実稼働したら置く。

## Motivation

旧 ID: ledger 🔍 WATCH（2026-07-03）。

- 技術的にはすぐ置ける。ただし消費側（GitHub agent finder / HF Discover Tool）は構築中で、仕様は v0.9 draft（as-of 2026-07-03）
- 2026-06-18 の 39 サイト調査で配信はゼロ
- 「面が出た瞬間に先回りで置く」は Code Wiki badge（2026-06-28）で失敗した型。機構の実稼働を一次確認してから乗る

## Status

draft — 発火条件の観測待ち（2026-10-12）。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

発火条件が成立したら hub に deploy する（再 gate は不要、実装だけ）。
