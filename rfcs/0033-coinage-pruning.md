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

## Decisions

著者が決めた判定（日付は決めた日）。実装は各 repo の作業で、済んだら行に commit を書く。

| 語 | 持ち主 | 判定 | 置き換えた言い方 | 決めた日 |
|---|---|---|---|---|
| attention ceiling | AKC | 畳む（平易な言い方へ） | operator の注意の予算（AKC ADR-0010 の題に揃える） | 2026-10-12 |
| two-channel attribution diffusion | AS | attribution diffusion へ統合 | attribution diffusion の 2 経路（parametric / retrieval） | 2026-10-12 |
| identifier-federation triplet | hub | 畳む（平易な言い方へ） | DOI federation（ADR-0001〜0003） | 2026-10-12 |
| retrieval-suppressed naming probe | AS | 畳む（平易な言い方へ） | naming probe（検索なし）と citation probe（検索あり） | 2026-10-12 |
| scaffold dissolution | AKC | 残す。AKC の graph に scaffolding（Wood・Bruner・Ross 1976）への上流 edge を足す | — （語は変えない。棚卸しの「scaffold fading へ置き換え」は誤りだった。報告 §3.2 の訂正注記） | 2026-10-12 |
| attribution gap | AAP | 残す。日本語名を 1 つに揃える（hub「寄与の事後分離不能ギャップ」と AAP graph「帰責ギャップ」） | — （AAP の glossary が Matthias 2004 の responsibility gap の狭い形と明記しており、置き換えると狭めた意味が消える） | 2026-10-12 |
| gatekeeper inversion | EP | algorithmic gatekeeping へ置き換え。hub の造語一覧から外す | 制度による選別が LLM の prior に移るという仮説（algorithmic gatekeeping の文献に連なる）。EP の glossary は origin claim なしと明記 | 2026-10-12 |
| oracle debiasing | EP | 畳む（平易な言い方へ） | 存在証明の供給（feasibility を答える面への）。debiasing の確立した意味と衝突する | 2026-10-12 |
| value-layer harness engineering | hub | 畳む（著者の判断「ちょっとやりすぎ」）。hub の自己紹介（index.html と Person の説明）も平易な言い方へ。ORCID の bio は著者の操作 | 価値規範を harness の rules 層に置き、ほかの層と同じ人間の承認で扱う | 2026-10-12 |

畳む 7 語の hub の解説ページ（`concepts/<語>.html`）は**消す**（転送ページは置かない。著者の判断、2026-10-12）。sitemap、hub の graph と `vocab.jsonld` からも外す。line 側の graph が同じ vocab ID を参照しているので、各 repo の実装と同じ回に揃える。

## Status

in_progress — hub の候補 9 語をすべて決めた（畳む・置き換え 7、残す 2）。残す側の 2 語の付随作業（AKC の scaffolding への上流 edge は agent-knowledge-cycle 0f58e37）。補足語 77 語の判定と、畳む 7 語の各 repo の実装はこれから（2026-10-12）。

## Next action

1. 補足語 77 語を line ごとに決める。棚卸しの判定は誤りを含んだ（§3.2 の訂正）ので、語ごとに一次資料で確かめてから聞く
2. 畳む 7 語を各 repo で実装する: AS（two-channel attribution diffusion、retrieval-suppressed naming probe）、AKC（attention ceiling）、EP（gatekeeper inversion、oracle debiasing）、hub（identifier-federation triplet、value-layer harness engineering と自己紹介の文、7 ページの削除、sitemap、vocab）。glossary・graph・本文を揃え、deposit metadata の keywords は各 line の次の release で
3. AAP: attribution gap の日本語名を 1 つに揃える
