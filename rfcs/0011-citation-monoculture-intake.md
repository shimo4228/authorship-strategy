---
state: done 2026-10-12
---

## Summary

Citation Monoculture（arXiv:2608.19230、本文照合済み）を inspiration.md の「Measurement and channel-fidelity」節と graph に入れ、ADR-0011 に「provider 族は独立な標本ではない」という注記を付ける。判定規則は変えない。

## Motivation

旧 ID: handoff R7 / 探索 2026-10-11。

- 論文の観測: ベンダー間の相関 0.63–0.70 はベンダー内の 0.77–0.83 より低い。title と abstract は回答側から見えている
- ADR-0011 の probe は複数 provider を並べる。provider 族の相関は、結果の読み方（独立な反復とみなせるか）に効く

## Status

done — 取り込んだ（2026-10-12、著者の判断）。

- 本文で数字を再照合した（§3.2、Pearson）: ベンダー内 0.77 / 0.79 / 0.83（GPT / Gemini / Claude）、ベンダー間 0.70 / 0.70 / 0.63。abstract は「ベンダー間の一致はベンダー内にほぼ並ぶ」と書く
- 入れた先: `docs/inspiration.md` の Measurement 節（数字はここだけ）、`graph.jsonld` の ExternalReference と retrieval-suppressed naming probe の `groundedIn`、ADR-0011 Annex A.1 の日付つき注記と Grounding の列挙（英語版と日本語版）、事前登録 `docs/empirical/probe-preregistration-2026-09.md` の Amendment（2026-10-12）
- adr-reviewer の指摘で直した: 注意は「相関した観測である」と断定せず「独立な追試とはみなさない」に弱めた。family を数える事前登録の規則（Counts against の (b)）は書かれたとおりに適用し、注意は結果の横に報告するだけにした
- 課題は内容を見たうえでの選択で、重みからの recall ではない。だから読みの注意として入れ、較正の数値には使わない。判定規則は変えていない

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

なし（終端）。
