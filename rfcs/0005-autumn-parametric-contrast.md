---
state: blocked 2026-10-12
review-when: 2026-12-31 を過ぎる
---

## Summary

`docs/empirical/probe-preregistration-2026-09.md` の事前登録に従い、eligible model が panel に入って event run が走ったら、R1 / R2 / against / neither を規則どおり判定し、結果を役割宣言つきの新しい empirical file として公開する。期限は 2026-12-31。

## Motivation

旧 ID: T29。

- 事前登録は 2026-09-07 の commit がタイムスタンプ。以後は Amendments 節への日付つき追記だけ
- 2026-10-01: retrieval の定期実行を終え、panel を 4 family にした（Amendment 記録済み、hub config v10）
- eligible の条件: provider 公表の cutoff が 2026-06-01 以降、default-tier、同 family の旧世代が zero baseline を持つ
- 2026-10-01 の currency check で候補の新モデルを検出した。採用は default-tier の web check を経て決める

## Status

blocked — eligible model の panel 入り待ち（2026-10-12）。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

```
再開条件: eligible model が panel に入り、event run が走る
照合先:   hub `probes/data/model-catalog.jsonl` と provider の model docs（cutoff）。run 後は `probes/data/parametric.jsonl`
成立時:   accepted（規則どおり判定して公開する）。2026-11-30 までに eligible がなければ「窓は空」と dated note に記録して持ち越す。規則は緩めない
```
