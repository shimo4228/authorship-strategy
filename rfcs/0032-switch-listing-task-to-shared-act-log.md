---
state: done 2026-10-12
---

## Summary

scheduled task `listing-pr-daily` の書き先を、PB の行為ログから共有の行為ログ（implementation log の Acts 節）へ切り替える。行を先に書き、その ID で PB の queue の項目を閉じ、行の無い行為と閉じていない行を照合で報告する形にする（ADR-0026 Decision 4・8）。

## Motivation

- ADR-0026 で、著者の戦略の行為は公開の行為ログ 1 本に、実施した戦略（By）を添えて記録することにした
- 今の task は PB の行為ログにだけ書き、queue に結果 URL と実行日を持つ。同じ実施事実が 2 か所にある
- 今の手順は queue を done にしてから行為ログを書くので、途中で止まると記録が欠ける（gpt-6-astra のレビュー指摘）

## Reference-level explanation

- 書き先: AS の act-log 用 branch（専用の worktree）の `docs/empirical/implementation-log.md`。commit はその branch にだけ行い、main への取り込みと push は AS の session が diff を読み、`scripts/verify-public-detail.sh --llm` を通してから行う
- 同時実行を lock で防ぐ。同じ URL の行が既にあれば書かない
- 行の形: `| A-NNNN | YYYY-MM-DD | PB | <行為> | <場所と URL> | <経路> |`

## Status

done（2026-10-12）。queue の done 23 行を Acts 節の A-0001〜A-0023 に移し（AS 4e3b7f9）、PB は queue にログ ID を入れて結果と実行日を空けた（PB 85753eb）。`listing-pr-daily` は AS の act-log branch の worktree（`.claude/worktrees/act-log`）にログの行を先に書いて commit し、その ID で queue を閉じ、最後に照合を報告する形になった（~/.claude の commit）。取り込みは AS の session が行う（`docs/maintenance.md`）。

**2026-10-12 plan** — [docs/plans/shared-act-log-convention.html](../docs/plans/shared-act-log-convention.html)

## Next action

なし。
