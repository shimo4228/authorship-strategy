# Plan: manifesto OQ 起点の 5 件を deploy（2026-09-07）

## Context

著者「Authorship-strategy を進める何かいいアイデア」→ inquiry-first で manifesto の
open question から 5 案を出し「全部やっといて」。commit は項目ごとに main 直（push しない）。
OQ5 held-out テストは実施、対象 repo はこちらで選定。

前提訂正（探索結果）: `.claude/verify.sh` は無く、機械ゲートは `scripts/verify-counts.sh`
のみ。`docs/maintenance.md` は HEAD `7132d9b` で既に commit 済み。未コミット差分は
`docs/empirical/implementation-log.md` の Practitioner case sharing 1 行（+6）だけ。

## 実行順（各項目 = 1 commit）

### 0. 既存差分を単独 commit
`docs/empirical/implementation-log.md` の +6 行をそのまま commit
（`docs(empirical): project the 2026-09-05 practitioner case-sharing entry`）。

### 1. OQ11 — 層境界 lint（discipline → mechanism）
- 新規 `scripts/verify-layer-boundary.sh`。`scripts/verify-counts.sh` の house style を踏襲
  （冒頭 why コメント、`set -euo pipefail`、`git ls-files` 由来の対象リスト、`DRIFT` 行、
  `fail` 累積、exit 0/1）。
- 対象 = doctrine 層: `docs/thesis*.md`, `docs/manifesto.md`, `docs/glossary*.md`,
  `docs/adr/*.md`, `README*.md`, `llms*.txt`, `CITATION.cff`。
- 検出パターン（essay 層の勘定源・反応数を doctrine 判断に持ち込む語）:
  `metrics/snapshots`, `snapshots.jsonl`, `schedule.json`, `zenn-content`, 
  `\b(likes?|view counts?|page[- ]?views?|reactions?|reads count)\b`（設計時に false positive を
  実測して絞る）。
- 許可リスト（境界を定義・却下する側の文書は正当に語を含む）: `docs/adr/0007-*`,
  `0011-*`, `0014-*`, `0017-*`, `0022-*`（EN/JA）, `docs/glossary*.md`。各除外に理由コメント。
- 配線: `docs/maintenance.md` の ADR 編集節に `bash scripts/verify-layer-boundary.sh` 1 行、
  `docs/CODEMAPS/architecture.md` の invariant 段落に 1 項追加、`docs/adr/0022-*.md`（EN+JA）
  Decision 5 boundary clause の末尾に 2026-09-07 dated 注記（執行器の所在）。
- 初回実行で green を確認してから commit。

### 2. OQ3 — Layer 4 戦術の寿命表
- 新規 `docs/empirical/tactic-lifecycle.md`（*role: baseline data*）。1 戦術 1 行:
  戦術 / 導入日 / 退役日 / 退役契機（substrate 変化・host governance・測定結果）/ 記録先 ADR。
  素材は `implementation-log.md` の各 timeline 表（Wikidata 2026-07-16 撤退・doc-hub badge
  2026-08-19 撤回・Code Wiki revert 2026-06-28 等）と ADR-0020/0021。
  文言は preliminary observation、寿命の推定値は書かない（行数が少ない）。
- `docs/empirical/README.md` 「What the layer contains」に bullet 追加。
- `docs/manifesto.md` OQ3 末尾に blockquote
  `> **Status (2026-09-07): first observations recorded in [tactic-lifecycle.md]...`
  （answered ではなく observed。問いは残す）。
- `bash scripts/verify-counts.sh` で carrier 数不変を確認。

### 3. OQ6 — 三軸反転の失効条件チェック
- WebSearch / WebFetch（一次ソース）で 2026-09-07 時点を照合: (a) frontier LLM の
  native 出典表示（per-token / RAG 出典）の標準化状況、(b) closed-corpus / licensed
  training の進展、(c) 著者→LLM corpus 直接投入の仕組み。knowledge-staleness rule どおり
  記憶で断言しない。
- `docs/manifesto.md` OQ6 末尾に blockquote `> **Status (2026-09-07): expiry check, not an
  answer.**` — 3 条件それぞれ「発火 / 未発火 / 部分」と根拠、次回照合の目安。
  出典の詳細は `docs/inspiration.md` に as-of 付きで置く（manifesto は要約のみ）。

### 4. OQ5 — held-out 適用テスト
- 対象選定（WebSearch / GitHub）: 個人著者・README にアイデア記述あり・DOI / CITATION.cff
  なし・著者と無関係・星数小。選定理由を記録、repo 名は note に書くが著者名は出さない。
  接触・PR・issue なし。
- `docs/adoption.md` の 5 ステップを机上で当て、各ステップの「成立 / 前提が shimo4228
  固有 / 手順不足」を記録 → 新規 `docs/empirical/adoption-dry-run-2026-09.md`
  （*role: interpretive note*、case-study と明記）。README index に bullet 追加。
- dry-run で露出した既知ギャップ = adoption.md Step 4 表が ADR-0014 で止まっている
  （0015–0023 の adopter action 行なし）。**この行を補う**（各 ADR の Decision から 1 行ずつ）。
- manifesto OQ5 末尾に dated blockquote（held-out 結果の要約、問いは残す）。

### 5. 9 月 pre-registration（probe 秋窓）
- 新規 `docs/empirical/probe-preregistration-2026-09.md`（*role: baseline data*、
  「designed contrast, validation-evidence designation deferred until results」と明記 —
  ADR-0023 Decision 3 の両条件のうち前半だけ満たす形）。内容:
  - 検証する normative claim（thesis の diffusion→recognition 経路のどれか 1 つに限定）
  - contrast: cutoff ≥ 2026-06 の eligible model が panel 入りしたときの parametric 遷移。
    既存 pre-registered expectation（`probe-baseline-2026-06.md` §Observation 1: 部分遷移が先、
    `project_named` without `author_named`）を判定規則へ落とす
  - 反証条件、series break の扱い、Annex A の family 層別・confabulation floor 先行測定・
    cued recall 明記
  - データ: hub `probes/data/*.jsonl`（retrieval 2026-06-12→09-06、weekly 窓 09-01→11-30）、
    2026-08-23 anthropic 欠損は恒久と記す
  - 判定時期: 秋窓終了 2026-11-30 後
- README index に bullet、`.notes/TASKS.md` に row 追加（blocked: 再開条件 = eligible model の
  panel 入り / 照合先 = probes model-catalog / 成立時 = parametric event run + 判定）。
- memory `probe-measurement-system.md` の「9月 pre-registration」を完了・所在に更新。

## Verification
- 各 commit 前: `bash scripts/verify-counts.sh` と `bash scripts/verify-layer-boundary.sh`
  が OK、`git status` が当該ファイルのみ。
- 項目 1: 意図的に doctrine 文書へ `metrics/snapshots` を書いた一時ファイルで DRIFT が
  出ることを確認してから削除（回帰の手動確認、コミットしない）。
- 項目 2/4/5: `docs/empirical/README.md` の index と実ファイルが 1:1。
- 項目 3/4/5 の manifesto 注記は既存 Status blockquote と同じ整形（`>` 折返し）。
- 全 5 commit を `git log --oneline -6` で確認、push はしない。
