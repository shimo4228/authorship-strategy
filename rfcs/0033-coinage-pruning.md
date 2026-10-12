---
state: in_progress 2026-10-12
review-when: 次の OQ5 sweep（2027-01、RFC-0006）か、scaffold dissolution・ghost citation と同じ機構を指す第三者の語が定着したと分かったとき（棚卸しの外部照合が古くなる）
---
## Summary

program 全体の造語を ADR-0010 の 3 条件（既存語が覆わない・既存語彙で 1 文定義できる・確立した用法と衝突しない）と本文での反復で 1 語ずつ判定し、残すもの以外を平易な言い方・確立語・他の造語へ畳む。対象は hub の concept 一覧の 17 語と各 line の glossary の補足語 77 語、計 94 語。

## Motivation

- 2026-10-12、著者の指示: 問う側の言葉を造語の隣に足す（RFC-0015）より、不要な造語を整理する
- ADR-0010 は「造語の費用は語の数に比例し、便益は語ごとの edge の密度と採用で決まる」とし、本文で繰り返されない語は平易な言い方に戻すと定めている
- 2026-10-12 の OQ5 sweep（RFC-0006）: 測った造語 10 語すべて、第三者の独立した使用は 0。同じ機構を別の名前で書く第三者のページは増えている

## Reference-level explanation

- 棚卸しの報告: [`docs/plans/research/2026-10-12-coinage-audit.md`](../docs/plans/research/2026-10-12-coinage-audit.md)（as-of 2026-10-12、外部照合つき）
- 判定の内訳: 残す 39、平易な言い方へ 43、確立語へ置き換え 8、他の造語へ統合 4。hub の 17 語では、残す 8、平易 5、置き換え 3、統合 1
- 語ごとの carrier（glossary EN/JA、graph、hub の `concepts_data.json` と concept ページ、`vocab.jsonld`、`llms.txt`、deposit metadata の keywords）は報告の §5。deposit metadata の変更は各 line の次の release を待つ
- hub の concept ページの扱い: 索引に入っているか、今日リクエストを出したページがある（`value-layer-harness-engineering.html` は Google の索引にある 4 件の 1 つ。RFC-0002）。消すか、新しい言い方のページや line の glossary へ転送するかは、語ごとの実装のときに決める
- 作業は 6 repo にまたがる（authorship-strategy、agent-knowledge-cycle、agent-attribution-practice、contemplative-agent、existence-proof、hub）。判定はこの RFC で著者が決め、各 repo の変更はその repo の作業として行う

## Status

in_progress — 棚卸しが終わり、hub の 17 語のうち変える候補 9 語の判定を著者と決めている（2026-10-12）。

## Next action

1. hub の候補 9 語を決める: 根拠の強い 5 語（attention ceiling、two-channel attribution diffusion、identifier-federation triplet、value-layer harness engineering、retrieval-suppressed naming probe）をまとめて、不確実な置き換え（scaffold dissolution、attribution gap、gatekeeper inversion）と oracle debiasing を 1 語ずつ
2. 決めた語の判定をこのファイルに表で残す
3. 補足語 77 語を line ごとに決める
4. 各 repo で実装する（glossary・graph・concept ページ・本文。deposit metadata は次の release で）
