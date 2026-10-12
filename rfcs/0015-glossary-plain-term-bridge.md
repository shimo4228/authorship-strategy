---
state: withdrawn 2026-10-12
---

## Summary

hub の concept ページと glossary で、造語の隣に、問う人が実際に使う汎用語を 1 文添える。ADR-0010（語彙規律）の延長として扱う。

## Motivation

旧 ID: handoff R11 / 探索 2026-10-11。

- 根拠の字面一致の研究（arXiv:2609.35077）は vendor 著者のもので、根拠としては弱い
- 造語は記録への pointer として働く（ADR-0024）。汎用語は、問う側の言葉から造語へ届く経路を足す

## Status

withdrawn — 汎用語を足すのでなく、不要な造語を減らす方向に切り替えた（2026-10-12、著者の判断）。

- concept ページには既存の語彙で書いた定義と gloss が既にある（ADR-0010 の anchoring obligation）。足りないのは問う側の言い回しだけだが、根拠の研究は vendor 著者のもので弱い（RFC-0016）
- 著者の指示: 問う側との橋を足すより、造語そのものを整理する。ADR-0010 の 3 条件と本文での反復で 1 語ずつ判定する棚卸しを、`docs/plans/research/2026-10-12-coinage-audit.md` で行う。整理の作業は、その結果をもとに新しい RFC として起票する
- 実際に問われる言葉は、Bing の AI Performance の grounding query に出れば一次データとして分かる（`docs/empirical/admission-readings.md`）

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

なし（終端）。
