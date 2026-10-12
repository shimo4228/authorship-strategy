---
state: withdrawn 2026-10-12
---

## Summary

Google Code Wiki に request した Tier-1 の 10 repo のうち、ページが生成された repo にだけ README の badge を個別に戻す。生成も更新も popularity-gated で著者には動かせないので、生成を待つ。

## Motivation

旧 ID: T1 / ledger 七巡目（2026-06-28）。

- 2026-06-28 に badge を全 29 repo に先に入れ、同日に revert した。未生成の repo はハード 404 で、badge から生成を起動できない
- Tier-1 の 10 repo は 2026-06-28 に request 済み
- Code Wiki の site は SPA で、全 path に HTTP 200 と空シェルを返す。curl の status では生成を判定できない（2026-07-06 に 200 を根拠に誤判定した）

## Status

withdrawn — Code Wiki は終わりにする（2026-10-12、著者の判断）。

- 2026-10-12 にブラウザで、Code Wiki 上の 10 repo すべてのページを開いた。どれも "404 This page doesn't exist"（authorship-strategy、agent-knowledge-cycle、contemplative-agent、agent-attribution-practice、attention-not-self、shimo4228、doctrine-corpus、existence-proof、einstein-arena、zenn-content）
- request（2026-06-28）から 3 か月半、1 件も生成されていない。生成も更新も popularity-gated で、著者側から動かせない（manifesto OQ9 の一例）
- 著者の判断: 今回生成されていなければ終わりにする。badge は戻さない

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

なし（終端）。
