---
state: done 2026-10-12
---

## Summary

Anthropic の plugin directory に掲載された akc-cycle と harness-scope について、掲載を記録し、Usage タブの CSV（90 日）を取得して empirical layer に基準値として置く。「考えの使用」と「足場（skill）の使用」を分けて記録する。

## Motivation

旧 ID: handoff R5 / ledger C24（2026-07-15 に掲載を申請）。

- akc-cycle と harness-scope の directory ページは公開されている（2026-10-11 確認）。旧 ledger の C24 はこの状態に更新されないまま残った
- directory の Usage は、この program が持つ唯一の一次の利用計測（2026-10-11 の調査）
- 区別は ADR-0024 の議論で出た: skill の install は足場の使用で、考えの使用と同じではない
- scheduled task `akc-plugin-catalog-watch` は掲載の検出時にこのエントリの更新を提案する

## Status

done — 基準値を記録し、月次の読みを自動化した（2026-10-12、著者の判断）。

- CSV はダウンロードせず、owner console の Usage タブを Claude in Chrome で読み取りだけで読んだ（期間 30 日、data through 2026-10-10）
- 基準値: akc-cycle はインストール 268（266 アカウント）、使っているアカウント 3、使用 3（ロードされたセッション 3,490）。harness-scope はインストール 209、使っているアカウント 0、使用 0（7,043 セッション）。skill ごとの行は、50 件未満の行を隠す仕様なので出ない
- 置き場所: [`docs/empirical/plugin-usage-readings.md`](../docs/empirical/plugin-usage-readings.md)（role: baseline data）。インストールは足場の使用として記録し、考えの使用（記録への到達）とは分ける
- 月次の読みは scheduled task `admission-readings-monthly` に足した（毎月 1 日、branch `act-log` に commit、push しない）

**2026-10-12 plan** — [docs/plans/rfcs-store-consolidation.html](../docs/plans/rfcs-store-consolidation.html)（private ledger からの移送）

## Next action

なし（終端）。読みは scheduled task が続ける。
