---
state: blocked 2026-10-12
---

## Summary

manifesto OQ5 の recursion sweep（造語・四点セット・語彙の独立採用の検索）と、10 DOI の Wikipedia insource 検索を同じ手順で再測し、縦断の系列にする。前回は 2026-08-19（sweep の 2 回目）。

## Motivation

旧 ID: ledger 九巡目 #13・#15 の次回測定、TASKS D24。

- 2026-07-01 の初回: 独立採用ゼロ、insource は 10 DOI すべて 0 件（陰性 baseline）
- 測定の cadence は手動のまま。release-doi には入れない
- 手順と前回の記録は `.notes/oq5-recursion-sweep-2026-08-19.md`（非公開。外部の連絡先を含む）

## Status

blocked — 次の測定時期待ち（2026-10-12）。第 3 回を 2026-10-12 に測った。

**2026-10-12 triage** — 再開条件の「AS の次の release」が v1.2.0（起票の 25 分後）で文字どおり成立したので、
著者の判断で測った（前回からの間隔は 8 週で、第 1 回から第 2 回の 7 週とほぼ同じ）。手順は第 2 回と同じで、
read-only の Agent が実施し、外部への書き込みはない。記録は `.notes/oq5-recursion-sweep-2026-10-12.md`
（非公開。外部の連絡先を含みうる）。

| 測定 | 第 1 回 07-01 | 第 2 回 08-19 | 第 3 回 10-12 |
|---|---|---|---|
| Wikipedia insource、10 DOI（en / ja） | 0 / 0 | 0 / 0 | 0 / 0 |
| 対照の DOI（en / ja） | 陽性 | 20 / 8 | 20 / 8 |
| (a) 造語の独立採用（6 語。第 2 回から 7 語） | 0 | 0 | 0 |
| (a) ADR-0024 の新しい造語 3 語（今回が初回） | — | — | 0 |
| (b) 四点セットの独立採用 | 0 | 0 | 0 |
| (c) 出典つきの第三者の使用 | 0 | 0 | 0 |

- 同じ仕組みを別の名前で書く第三者のページは増えた（scaffold dissolution に当たるものを "harness distillation" などと呼ぶ）。どれもこの ecosystem を引いていない
- 第 2 回の記録の訂正: `scaffold dissolution` は第 2 回の時点で、この repo の metadata 3 ファイルに既にあった（第 2 回は repo 内 0 件と書いた）
- 次回は日付だけを条件にした。release の条件は、どの release を指すかが曖昧だったので外した

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

```
再開条件: 2027-01-12 を過ぎる（第 3 回から約 3 か月）
照合先:   日付
成立時:   accepted（同じ手順で再測し、前回と並べて記録する）
```
