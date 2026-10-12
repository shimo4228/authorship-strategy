---
state: done 2026-10-12
---

## Summary

graph.jsonld の Person node に別名アカウントを sameAs として残すかを決める。外部 profile の各欄を揃えるかも決める（GitHub の Website 欄を hub に、ORCID に hub、Scholar の所属表記）。

## Motivation

旧 ID: ledger 2026-10-01 監査（著者判断待ち 3 件のうち 2 件。残り 1 件は RFC-0008）。

- 対象のアカウントと欄の詳細は private archive（`.notes/archive/diffusion-ledger-2026-06-to-10.md`、非公開）
- 2026-10-01 の監査で、外部 surface のどれも hub root に follow リンクを張っていないことを観測した（preliminary observation）

## Status

done — 判断が出て、変更は 1 件（2026-10-12、著者の判断）。

- 別名アカウント 2 件は hub の Person の sameAs に残す（変更なし）。2026-10-12 の照合で 2 件とも存在している
- GitHub profile の Website 欄を `x.com/shimo4228` から hub（`https://shimo4228.github.io/shimo4228/`）に変えた（implementation log A-0030）。Social accounts 欄は上限の 4 件が埋まっているので、X は profile から外れたままにした
- ORCID と Google Scholar の欄は変えない

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

なし（終端）。
