---
state: accepted 2026-10-12
---

## Summary

hub（GitHub Pages）の concept ページを検索索引に入れる。Google Search Console で URL 検査を 1 日約 10 件ずつ送り、Bing Webmaster Tools に GSC から site を取り込み、Brave の submit-url に送る。console の操作は著者だけが行える。

## Motivation

旧 ID: handoff R2（2026-10-11 セッションの残り）。

- 2026-10-01 の監査: Google の既知 URL は 27 件中 1 件、sitemap は「取得できませんでした」。`/concepts/` は「URL が Google に認識されていません」
- ADR-0024 では、到達の前に索引への入場（admission）が要る。Claude の web 検索は Brave の索引を使う（2026-10-11 の調査）
- 被 follow リンクが少ないことが主因の候補（2026-10-01 の実測、preliminary observation）

## Status

accepted — 著者の console 操作待ち（2026-10-12）。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

著者が GSC で hub → concepts の順に URL 検査を送る。Bing Webmaster Tools への取り込みと Brave submit-url も行う。結果の日付は implementation-log に 1 行で記録する。
