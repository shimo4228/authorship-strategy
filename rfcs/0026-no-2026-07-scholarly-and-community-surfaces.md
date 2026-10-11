---
state: rejected 2026-08-12
---

## Summary

2026-07-01 の外部リサーチ（八巡目）で gate に落ちた surface と、2026-08-12 の著者トリアージで落とした PhilPapers / PhilSci-Archive には参加しない。

## Motivation

旧 ID: ledger 八巡目 DROP 群・八巡目 #2。

- DBLP: 自己申請の経路がない
- CORE・BASE: Zenodo 経由で既に収集されている
- ResearchGate: 所属のない個人の登録に摩擦がある
- Google Scholar profile: 機関メールの gate（OQ9 の実例）
- Custom GPT・Poe: GitMCP / DeepWiki と機能が重なる
- Gemini Gems: 公開の discovery 機構がない
- ChatGPT Plugins: 廃止
- HF Spaces: artifact の型が合わない
- Lobsters: robots.txt が `ai-train=no` を明示し、招待制で、表示は ranking で決まる
- Discord の各コミュニティ: ToS が scraping を禁じる、または非商業の原則に反する
- Lemmy・kbin、LessWrong・AI Alignment Forum: 表示が ranking・karma で決まり、この program の方針（ADR-0007）に合わない
- ai.txt・TDMRep: 仕様が乱立し主要 crawler が非対応。CC0 で既に全許可している
- WebSub・RSS（AI crawler への信号として）: 公式の記載がない
- Crossref・DataCite Event Data: 停止済み
- Altmetric・PlumX: Zenodo は 2020 年に Altmetric の badge を外した。PlumX は個人向けの無料経路がない
- Scite.ai: 無料枠は 7 日の trial だけで、継続して使える経路がない
- OpenCitations・COCI、Dimensions・Lens、Connected Papers・Inciteful: OpenAlex との重複、機関 gate、独自 corpus なし
- CORE を mention-tracker に使う: 区別したい ingest の信号そのものになり、目的に逆行する
- PhilPapers / PhilSci-Archive（2026-08-12 著者判断）: 人がキュレーションするアーカイブへ AI 支援の制作物を self-archive すると、この program 側が ADR-0021 の aggregate-pattern と同じリスクを負う

## Status

rejected — 再提案しない guard として残す（2026-10-12 plan で移送）。

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

なし。
