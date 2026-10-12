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

blocked — eligible model の panel 入り待ち（2026-10-12）。候補が 1 つあり、Claude の列の接続の復旧と著者の確認待ち。

**2026-10-12 eligibility 調査**（[docs/plans/research/2026-10-12-eligible-model-check.md](../docs/plans/research/2026-10-12-eligible-model-check.md)、API は呼ばず公式 doc で判定）:

- 確定した eligible は 0。最有力は `claude-sonnet-5-5`（2026-09-28 公開）: cutoff Jun 2026（条件 1 を満たす）、旧世代 `claude-sonnet-5` に zero baseline あり（条件 3 を満たす）。条件 2（claude.ai の Free の既定か）は第三者の報道 2 件だけで、Anthropic 自身の記述では未確認 → cannot tell
- OpenAI の GPT-6 系 4 つ、`gemini-3.8-flash`、`grok-4.7` は条件 1（cutoff が 2026-06-01 以降）で不適格。最も近い `gpt-6-luna` も May 18, 2026
- 2026-10-01 の currency check では Claude の列に接続できず、測れていない。著者が接続を直す（2026-10-12）
- 単一 family だけが eligible の場合、言えるのは R1 / R2 か「no transition observed」まで（Counts against の (b) は 2 family が要る）

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

```
再開条件: eligible model が panel に入り、event run が走る（直近の道筋: Claude の列の接続の復旧 → `claude-sonnet-5-5` が事前登録の条件 2（default-tier）を満たすかを確かめる → probes-v11 に入れ、eligibility を run record に先に書く → event run）
照合先:   hub `probes/data/model-catalog.jsonl` と provider の model docs（cutoff）。run 後は `probes/data/parametric.jsonl`
成立時:   accepted（規則どおり判定して公開する）。2026-11-30 までに eligible がなければ「窓は空」と dated note に記録して持ち越す。規則は緩めない
```
