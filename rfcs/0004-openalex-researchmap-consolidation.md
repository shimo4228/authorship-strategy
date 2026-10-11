---
state: blocked 2026-10-12
---

## Summary

OpenAlex で著者の ORCID に紐づく author ID が 1 つに統合されたら、graph.jsonld の sameAs と hub のリンクに反映する。researchmap に掲載されたら同じく反映する。どちらも外部のデータベースへの反映で、著者側の操作はない。

## Motivation

旧 ID: T11 / ledger M5・M9。

- 2026-08-19 の照合: OpenAlex で同じ ORCID を持つ author ID が 8 件以上並立しており、未統合
- researchmap 側の手続きの記録は private archive（`.notes/archive/diffusion-ledger-2026-06-to-10.md`、非公開）
- Wikidata 経由の follow-up は ADR-0021 で obsolete。OpenAlex の名寄せは self-sovereign なので継続する

## Status

blocked — 外部の反映待ち（2026-10-12）。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

```
再開条件: (a) OpenAlex で ORCID 0009-0002-6168-4162 の author ID が 1 つに統合される、または (b) researchmap に掲載される
照合先:   OpenAlex API（authors 検索）/ researchmap の著者ページ
成立時:   accepted（graph の sameAs と hub のリンクに反映する）
```
