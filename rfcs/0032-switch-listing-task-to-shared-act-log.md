---
state: accepted 2026-10-12
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

accepted — PB 側の準備が済んだ（2026-10-12）。PB の listing queue に「ログ ID」の列ができ、scorecard の行為ログ節は Acts 節へのリンクと切り替えまでの受け皿の表になった。queue の done 23 行（2026-10-05〜10-11 の掲載）の結果 URL と実行日は、今のところその行為の唯一の記録なので、切り替えのときに Acts 節へ移す。

**2026-10-12 plan** — [docs/plans/shared-act-log-convention.html](../docs/plans/shared-act-log-convention.html)

## Next action

1. queue の done 23 行と受け皿の表の行を Acts 節へ移し、ID を振る（By = PB）
2. PB の session に ID の一覧を渡す。PB は queue の結果・実行日の列を空け、ID を入れ、受け皿の表を消す
3. AS 側の act-log branch と worktree を用意し、`listing-pr-daily` を書き換える
