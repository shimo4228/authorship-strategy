---
state: withdrawn 2026-10-12
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

withdrawn — 参加しない（2026-10-12、著者の判断）。

2026-10-12 の一次照合（[contenttelemetry.org](https://contenttelemetry.org)、[openattribution.org](https://openattribution.org)、[Digiday 2026-10-02](https://digiday.com/media/spur-publishes-ai-content-tracking-standard-pitches-openai-and-google-to-join-advisory-board/)）:

- 規格（Content Telemetry v1.0、2026-09-02 付）は報道機関の連合 SPUR が管理し、OpenAttribution はその実装と無料の受け口を運営する別の非営利団体
- 送る側の AI 製品は 0。SPUR が招待した 5 社（OpenAI・Anthropic・Google・Meta・Microsoft）はどれも承諾していない。OpenAttribution の画面の ChatGPT や Claude はデモ表示で、実データは "No telemetry events yet"
- **前提の訂正**: Motivation の「送る側がゼロでも bot 訪問の dashboard は GitHub Pages に無い観測面になる」は誤り。bot 訪問の報告はサイト側の仕組みで、自分で管理する CDN edge（Cloudflare Worker）か origin のコードが要る。GitHub Pages ではどちらも置けない。`.well-known/content-telemetry.json` は受け口を宣言するだけで、データは生まない
- したがって今参加しても得るものがない。(a) の前提だった user site も作らない（RFC-0008 withdrawn）

主要な AI 製品の送信の開始は報道になり、daily-research で拾える。拾ったときに、user site と一緒に新しい RFC として起票する。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

なし（終端）。
