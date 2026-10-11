---
state: draft 2026-10-12
---

## Summary

Citation Monoculture（arXiv:2608.19230、本文照合済み）を inspiration.md の「Measurement and channel-fidelity」節と graph に入れ、ADR-0011 に「provider 族は独立な標本ではない」という注記を付ける。判定規則は変えない。

## Motivation

旧 ID: handoff R7 / 探索 2026-10-11。

- 論文の観測: ベンダー間の相関 0.63–0.70 はベンダー内の 0.77–0.83 より低い。title と abstract は回答側から見えている
- ADR-0011 の probe は複数 provider を並べる。provider 族の相関は、結果の読み方（独立な反復とみなせるか）に効く

## Status

draft — 取り込むかの判断待ち（2026-10-12）。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

著者が取り込みを決める。決まれば inspiration・graph・ADR-0011 注記を 1 つの commit で入れる。
