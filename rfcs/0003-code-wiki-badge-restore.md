---
state: blocked 2026-10-12
---

## Summary

Google Code Wiki に request した Tier-1 の 10 repo のうち、ページが生成された repo にだけ README の badge を個別に戻す。生成も更新も popularity-gated で著者には動かせないので、生成を待つ。

## Motivation

旧 ID: T1 / ledger 七巡目（2026-06-28）。

- 2026-06-28 に badge を全 29 repo に先に入れ、同日に revert した。未生成の repo はハード 404 で、badge から生成を起動できない
- Tier-1 の 10 repo は 2026-06-28 に request 済み
- Code Wiki の site は SPA で、全 path に HTTP 200 と空シェルを返す。curl の status では生成を判定できない（2026-07-06 に 200 を根拠に誤判定した）

## Status

blocked — 生成済みページの有無をブラウザで確かめる段階。2026-08-19 の棚卸しでは確かめていない。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

```
再開条件: Code Wiki 上に対象 repo の生成済みページが実在する（ブラウザで実体を確認する）
照合先:   codewiki.google の各 repo の URL（ブラウザ）
成立時:   accepted（生成された repo にだけ badge を戻す）
```
