---
state: in_progress 2026-10-12
---

## Summary

hub（GitHub Pages）の concept ページを検索索引に入れる。Google Search Console で URL 検査を 1 日約 10 件ずつ送り、Bing Webmaster Tools に GSC から site を取り込み、Brave の submit-url に送る。console の操作は著者だけが行える。

## Motivation

旧 ID: handoff R2（2026-10-11 セッションの残り）。

- 2026-10-01 の監査: Google の既知 URL は 27 件中 1 件、sitemap は「取得できませんでした」。`/concepts/` は「URL が Google に認識されていません」
- ADR-0024 では、到達の前に索引への入場（admission）が要る。Claude の web 検索は Brave の索引を使う（2026-10-11 の調査）
- 被 follow リンクが少ないことが主因の候補（2026-10-01 の実測、preliminary observation）

## Status

in_progress — Google の URL 検査を 3 日に分けて送っている（2026-10-12 開始）。Brave は 2026-10-12 に送った（hub のトップと `/concepts/`、A-0032）。Bing は 2026-10-12 に 27 URL を送った（A-0033）。

**2026-10-12 診断**（Search Console を著者のブラウザで読み取り、サイト側を curl で照合）:

- 索引に入っているのは 27 URL 中 4 件: hub のトップ（最後のクロール 2026-07-02）、`/concepts/`、`/vocab`、`concepts/value-layer-harness-engineering.html`（後の 3 件は 2026-10-01 にクロールされて登録。同日の URL 検査のリクエストと時期が合う）。「未登録」は 0 件で、理由の欄もない
- 残りの concept ページは Google に知られてもいない。`attribution-diffusion.html` の検査は「URL が Google に認識されていません」で、参照元の sitemap もページも「検出されませんでした」。`/concepts/` からは素のリンク（nofollow なし）があり、そのページは 2026-10-01 にクロールされている
- sitemap は正しい URL（`/shimo4228/sitemap.xml`）で登録されているが、2026-10-01 の読み込みで「サイトマップを読み込めませんでした」のまま。サイト側は正常（HTTP 200、`application/xml`、27 URL、全ページ 200・`noindex` なし・canonical は自分自身）。GitHub Pages で Google だけが sitemap を読めない事例が他にも報告されている（[1](https://dev.to/hexisteme/google-cant-fetch-your-github-pages-sitemap-but-bing-can-a-diagnosis-and-workaround-playbook-512k)、[2](https://discourse.gohugo.io/t/unable-to-submit-sitemap-xml-feed-xml-to-google-search-console-for-my-hugo-generated-site-couldn-t-fetch/56346)）。こちらからは直せないので、sitemap の再送信はやめた
- Bing（2026-10-12 に読み取り）: site は以前から登録済み。sitemap は 2026-07-04 に読み込みが成功し 26 URL を検出、索引は 5 件。トップの推奨は「質の高いドメインからの被リンクが足りない」。AI Performance（Copilot などでの引用）は 2026-07-12〜10-09 で 0 件。URL 送信（1 日 100 件まで）で 27 URL をまとめて送った
- 効いている経路は URL 検査のリクエスト。2026-10-12 に 10 件を送った（著者の承認のもとで Claude が操作。implementation log A-0031）: hub のトップと concept 9 件（agent-knowledge-cycle、contemplative-agent、agent-attribution-practice、authorship-strategy、attention-not-self、attribution-diffusion、three-axis-inversion、scaffold-dissolution、idea-versus-scaffold-separation）

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

1. 2026-10-13: URL 検査で 10 件 — harness-alignment、attention-ceiling、four-contemplative-axioms、four-business-ai-quadrants、attribution-gap、two-channel-attribution-diffusion、retrieval-suppressed-naming-probe、vocabulary-discipline、identifier-federation-triplet、security-by-absence
2. 2026-10-14: 残り 4 件 — existence-proof-format、gatekeeper-inversion、oracle-debiasing、`traffic/dashboard/`
3. 結果は 2026-11-01 の月次の読み（`docs/empirical/admission-readings.md`、scheduled task `admission-readings-monthly`）で確かめ、ここに書く。行為は implementation log に 1 行ずつ記録する
