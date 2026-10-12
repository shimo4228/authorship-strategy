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

accepted — APPENDIX A の validate を済ませた。AAP の実装から着手できる（2026-10-12）。

**2026-10-12 validate**（著者と確認、AAP の現物と照合）:

- ReAct（arXiv:2210.03629）→ LLM Workflow Quadrant、MINJA（arXiv:2503.03704）→ ADR-0003 の境界: どちらも AAP の graph に `ExternalReference` として登録済み。結びつけ方は妥当
- Elish, *Moral Crumple Zones*（2019、doi:10.17351/ests2019.260）: concept `moral-crumple-zone` はあるが、論文そのものの参照 node が無い。足す
- SSRN の 2 本（6817598、6823878）: README は両方にリンクしているが、`.zenodo.json` と graph には 0 件。論文の Zenodo 記録と同じ論文の別の版として相互リンクを足す
- AKC 以降の repo は、RFC-0033（造語の整理）の各 repo の実装と同じ回にまとめる（触るファイルが同じ）

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

1. AAP: graph に Elish（2019）の `ExternalReference` と、`moral-crumple-zone` からの edge を足す。HF mirror を同期する
2. AAP: `.zenodo.json` の related_identifiers に SSRN の 2 本を足す（次の AAP の release で）
3. AKC 以降: RFC-0033 の実装の回に、各 repo の `docs/inspiration.md` から先行研究を引き、同じ形で足す
