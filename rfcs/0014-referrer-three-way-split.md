---
state: done 2026-10-12
---

## Summary

hub の `traffic/referrers/<repo>.jsonl`（2026-10-11 開始、14 日窓の日次スナップショット）を、AI エンジン・検索・人の面の 3 分類で集計する。ADR-0024 の proxy 段の観測として読む。

## Motivation

旧 ID: handoff R10。

- データは 2026-10-11 から溜まり始めた。clone は経路が分からないまま
- 集計は、分類の規則を先に決めてから行う

## Status

done — 分類の規則を決め、月次の自動集計に入れた（2026-10-12、著者の判断）。

- 3 分類でなく 4 分類にした: AI の回答（ドメインの一覧）/ 検索エンジン / `github.com` / その他。`github.com` は 14 日窓で全体の 8 割（317/395）を占め、著者の profile からの移動と GitHub 内の発見が混ざるので、人の面から分けた
- 日次のスナップショットは 14 日窓が重なるので、月次の読みで、読みの日以前の最新と、その 14 日以上前の最新の 2 窓だけを足す。`uniques` は repo と窓ごとに重複を除いた数なので足さない
- 規則と集計は hub の `scripts/referrer_split.py`（hub commit a51eb32、標準ライブラリだけのテストつき）。月次の行は scheduled task `admission-readings-monthly` が `docs/empirical/admission-readings.md` の表「Arrival proxies: referrers」に足す
- 基準値（2026-09-28〜10-11 の 1 窓）: AI の回答 2（chatgpt.com）、検索 34、`github.com` 317、その他 42、計 395

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

なし（終端）。集計は scheduled task が続ける。
