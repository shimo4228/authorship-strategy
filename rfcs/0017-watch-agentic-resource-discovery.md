---
state: withdrawn 2026-10-12
---

## Summary

Agentic Resource Discovery（Google と Linux Foundation の WG、2026-05 末発表）の `ai-catalog.json` を hub に置き、graph.jsonld・HF dataset・GitMCP endpoint を capability entry にする案。消費側が実稼働したら置く。

## Motivation

旧 ID: ledger 🔍 WATCH（2026-07-03）。

- 技術的にはすぐ置ける。ただし消費側（GitHub agent finder / HF Discover Tool）は構築中で、仕様は v0.9 draft（as-of 2026-07-03）
- 2026-06-18 の 39 サイト調査で配信はゼロ
- 「面が出た瞬間に先回りで置く」は Code Wiki badge（2026-06-28）で失敗した型。機構の実稼働を一次確認してから乗る

## Status

withdrawn — WATCH を閉じる（2026-10-12、著者の判断）。`ai-catalog.json` は host root の `.well-known` に置くので、RFC-0008 で作らないと決めた user site が前提になる。消費側（GitHub agent finder / HF Discover Tool）が実稼働したら、user site と一緒に新しい RFC として起票し直す。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

なし（終端）。
