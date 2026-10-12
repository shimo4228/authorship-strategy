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

blocked — researchmap の掲載待ち（2026-10-12）。OpenAlex の側は反映済み。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

**2026-10-12 triage** — 条件 (a) が成立した。OpenAlex の authors API で ORCID と名前の両方から引くと、
author ID は `A5130593171` の 1 件だけ（ORCID 付き、12 works）。hub の Person の sameAs に入れた
（`graph.jsonld`、`index.html` の JSON-LD、dashboard の graph mirror。hub commit d6a156f）。
line 側の graph は hub と sameAs が既にずれており、Person の正本は hub なので触らない。
残りは条件 (b) だけなので blocked に戻した。

## Next action

```
再開条件: researchmap に著者ページが掲載される
照合先:   researchmap の著者ページ
成立時:   accepted（hub の Person の sameAs に反映する）
```
