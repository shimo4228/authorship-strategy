---
state: resolved 2026-10-12
---

## Summary

Ahrefs の 2026-05-11 の JSON-LD 研究（差分の差分）は、既に AI 回答で 100 回以上引用されたページだけを対象にしている。「未引用のページ側は未検証」を ADR-0009 の Decision 側か manifesto OQ9 に明記するかを決める。

## Motivation

旧 ID: handoff R8。

- ADR-0009 の Lineage（`docs/adr/0009-dual-entry-asymmetric-rebalance.md` の Ahrefs の項）は母集団の限定を書いている
- Decision 側に同じ限定があるかは未確認
- この repo の成果物の多くは未引用側に属する

## Status

resolved — 限定は ADR-0009 に既にあり、書き足さない（2026-10-12、著者の判断）。

- Summary（`docs/adr/0009-dual-entry-asymmetric-rebalance.md:13-17`）: matched-control の研究は consideration set に既に入ったページが対象で、その前の層は測れない
- Context（同 `:97-104`）: 研究の著者自身が、AI に見られていないページの crawl・索引への効果は言えないと述べている
- Lineage（同 `:302-303`）: 母集団は処置前に AI Overview で 100 回以上引用されたページ
- Decision 1 は graph の役割を引用の前の層（入場と entity 解決）に限り、引用への効果を主張しない。限定はこの設計の前提として効いているので、Decision に繰り返す隙間はない

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

なし（終端）。
