---
state: done 2026-10-12
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

done — 最後の event run を回し、事前登録の規則どおり判定して公開した（2026-10-12、著者の判断で parametric はこれで終える）。

- 結果: [`docs/empirical/parametric-contrast-2026-10.md`](../docs/empirical/parametric-contrast-2026-10.md)。`claude-sonnet-5-5`（v11）の全 cell が 3 回中 2 回の規則で陰性。読みは「no transition observed」
- 規則の外の観察: `concept-akc` の 1 回で、検索なしに Agent Knowledge Cycle の 6 phase と作者を想起した
- 測る前の記録: hub `4e25009`（v11 と eligibility）、この repo `0bdc929`（Amendment）。どちらも run の前に push
- 計器の退役: ADR-0011 に注記。launchd の月次 currency check と月次の cloud web check を止める

**2026-10-12 eligibility 調査**（[docs/plans/research/2026-10-12-eligible-model-check.md](../docs/plans/research/2026-10-12-eligible-model-check.md)、API は呼ばず公式 doc で判定）:

- 確定した eligible は 0。最有力は `claude-sonnet-5-5`（2026-09-28 公開）: cutoff Jun 2026（条件 1 を満たす）、旧世代 `claude-sonnet-5` に zero baseline あり（条件 3 を満たす）。条件 2（claude.ai の Free の既定か）は第三者の報道 2 件だけで、Anthropic 自身の記述では未確認 → cannot tell
- OpenAI の GPT-6 系 4 つ、`gemini-3.8-flash`、`grok-4.7` は条件 1（cutoff が 2026-06-01 以降）で不適格。最も近い `gpt-6-luna` も May 18, 2026
- 2026-10-01 の currency check では Claude の列に接続できず、測れていない。著者が接続を直す（2026-10-12）
- 単一 family だけが eligible の場合、言えるのは R1 / R2 か「no transition observed」まで（Counts against の (b) は 2 family が要る）

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

なし（終端）。
