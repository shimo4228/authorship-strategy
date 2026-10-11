---
state: draft 2026-10-12
review-when: 主要 AI 製品の 1 つが OpenAttribution での送信を表明する
---

## Summary

OpenAttribution（SPUR Content Telemetry v1.0、2026-09-02 final）に参加するかを決める。(a) user-site repo を作り（RFC-0008）、`.well-known` で domain claim する。(b) 送る側の主要 AI 製品の採用表明まで待つ。

## Motivation

旧 ID: T3 / handoff R4 / ledger 四巡目（再 gate 2026-08-02、2026-10-11）。

- 2026-10-11 の一次照合: 個人でも domain claim は無料。owner は lifecycle event（retrieve / ground / cite / display / engage）と bot 訪問の dashboard を得る
- 主要 AI vendor の送信実装は確認できなかった（採用表明なし、as-of 2026-10-11）
- claim は `.well-known` を host root に置く前提で、github.io の project site では scope が未確認。user-site repo の新設が前提になる
- ADR-0024 との関係: cite event は evidence 段、bot 訪問は proxy 段に入りうる。送る側がゼロでも、bot 訪問の dashboard は GitHub Pages に無い観測面になる

## Status

draft — 再開条件は成立済み。採否は著者の判断待ち（2026-10-12）。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

著者が (a) か (b) を選ぶ。(a) なら RFC-0008 を先に決める。
