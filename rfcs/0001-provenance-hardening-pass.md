---
state: accepted 2026-10-12
---

## Summary

各 research line の graph.jsonld と deposit metadata に、先行研究への prior-art edge と SSRN の相互リンクを揃える。順は AAP → AKC → 他 repo。最初の step は著者が AAP の APPENDIX A の prior-art edge（ReAct / Elish / MINJA / SSRN anchors）を validate すること。

## Motivation

旧 ID: T7（`.notes/TASKS.md` から 2026-10-12 移送）。作業リストは `.notes/provenance-layer-candidates.md`（非公開）。

- 2026-08-19 の照合: AAP の graph.jsonld には ReAct（arXiv:2210.03629）と MINJA（arXiv:2503.03704）が `ExternalReference` として登録済み。Elish は concept `moral-crumple-zone` だけで reference node がない
- AAP の `.zenodo.json` に SSRN の DOI が 0 件（cross-link の欠落は未解消）
- 作業リストの「prior-art edge ゼロ」という前提は部分的に古い。validate のときに現 graph と突き合わせる

## Status

accepted — 著者の validate から着手できる（2026-10-12）。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

著者が APPENDIX A の prior-art edge を validate する。その後、現 graph との差分を AAP から順に埋める。
