# authorship-strategy v1.0.0 — README 全面 rewrite + ecosystem 導線復旧（skills index de-stale + `authorship-strategy-rules` 新設）

## Context

v1.0.0 は「新 tactic 無し」の framing/consolidation リリース（CHANGELOG に起稿済み・未 commit / 未 tag）。ところが hub repo が簡素化され「inventory は graph.jsonld / concept-index に置く、README には置かない」方針になった結果、**ecosystem の skill / rule への導線が家を失った**。

この穴は 3 つの症状として表面化している:
1. **README** が operational surface（skills / rules / adoption / conformance）へ 1 本も link していない（thesis/adr/glossary/empirical/siblings/hub にしか繋がっていない）。
2. **`docs/skills/README.md` が stale**: component 4 本の URL が旧 `claude-skill-*`（実名は `authorship-strategy-skill` / `release-doi` / `llms-txt-writer` / `jsonld-knowledge-graph`）、line 63「the six ADRs」（実 20）、line 153「readme-writer not yet standalone」（実在）。
3. **authorship-strategy の rule** に skill と違い単独 install 経路が無い。

v1.0.0 を「hub 簡素化後、framework の operational surface（skills + rules）の自足的な入口」にするのがゴール。README は readme-writer 規律で全面 rewrite し導線を前方に出す。rule には skill と対の install 可能 repo を与える。ついでに、著者本人の global skill/rule が Skill Portability 規約違反（shimo4228-gated）である状態を、generalize で規約準拠に戻す。

## Locked decisions（grill 結果 — 再確認不要）

| # | 決定 | 根拠 |
|---|------|------|
| README 方針 | 全面 rewrite。4 軸: ①長さ/密度/図なし ②map・導線が後半すぎ ③冒頭 framing 過多 ④専門用語・voice。readme-writer フル pass + **LLM info-floor 維持** | 著者選択（推奨の targeted を override、4 軸すべて確定） |
| 命名 | rule repo = `authorship-strategy-rules`（**repo 層だけに suffix**）。local harness は bare のまま。harness-wide rename は scope 外 | `authorship-strategy` は harness 唯一の skill/rule 名衝突。local rename は 15 file + `/invocation` 破壊。`contemplative-agent-rules` 前例に一致 |
| DOI | rule repo は**自前 DOI 無し**、parent `authorship-strategy` DOI `10.5281/zenodo.20263316` を prose 参照 | Explore: distribution repo は skill/rule 問わず DOI 無し、parent DOI prose 参照が ecosystem 規約 |
| repo shape | **`akc-cycle` 軽量テンプレ**: `README.md`（英語）/ `LICENSE`(MIT) / `CHANGELOG.md` / `llms.txt` / `llms-full.txt` / `rules/common/authorship-strategy.md`（日本語）/ `scripts/sync-from-local.sh`（rule 変種）。**adapters なし** | akc-cycle が最近接前例。adapters は CA-rules の多 harness 装備で trigger rule には過剰 |
| skills index | **hub の「Authorship Strategy components and complements」表を忠実に再現**（9 repo + 新 `authorship-strategy-rules` = 10 行）。全 URL 修正（bare 化 / phantom `update-codemaps` 削除 / `readme-writer` standalone）、DOI 復元、doctrine の 4 component を明示 | 著者指示「hub が作ってた authorship-strategy エコシステム表の通りに」。source = archaeology commit `a288e01:README.md`（簡素化 `1720b01` の親） |
| sync モデル | **Model 1: global を in-place で generalize → whole-file byte-sync**。rule と skill 両方。gate を character 化（owner==shimo4228 → 「あなた自身が所有する DOI idea-rescue 研究 repo」）、AKC/CA は gate でなく**例**として残す、private memory-file 参照は抽象化、`origin: shimo4228` marker 保持。global==public、canonical 1 つ | 著者選択。`機械的同期` を素直に効かせ drift を出さない。akc-cycle と同モデル。著者の trigger 対象 repo 集合は不変＝挙動は実質同じ |
| release 範囲 | 3 点まとめて v1.0.0（rules repo 先行 → README rewrite → skills index → changelog 追記 → tag） | 著者選択。1.0 時点で導線完成 |

## Workstreams

### A. Global generalization（in-place, Model 1）— `~/.claude` を編集（可逆・要承認）

- **A1. rule**: `~/.claude/rules/common/authorship-strategy.md` を generalize。
  - Trigger 節の gate: 「作業中 repo の owner が shimo4228」→「あなた自身が所有する DOI-registered idea-rescue 研究 repo」。
  - 「適用しない」の具体例（ECC / claude-harness 等）→ 一般語（harness / scaffolding repo）に、意味は保持。
  - `<!-- origin: shimo4228 -->` marker 保持（sync script の `HARNESS_SYNC_ORIGIN` gate が要求）。
  - framework 要点・禁止事項は既に neutral → ほぼそのまま。
  - **軽い**（trigger 節中心）。
- **A2. skill**: `~/.claude/skills/authorship-strategy/SKILL.md`（+ `provenance-layer-prompt.md`）を同様に generalize。
  - gate の character 化、自分の repo 名（AKC / CA）は「例」として残す、private project-memory filename 参照は「your implementation ledger (project memory)」等へ抽象化。日本語のまま。
  - **重め**（大きい日本語 doc、具体アンカーが多い）→ sequencing は下記「確認事項」。
- 制約: 生成後に **behavior-preserving 検証**（著者の DOI 研究 repo では発火 / client・harness repo では非発火 / 他者所有 DOI repo では非発火 が保たれるか）。private local path（`/Users/...`）の混入ゼロを確認。

### B. `authorship-strategy-rules` repo 新設（新規・外部公開＝要承認）

- **B1.** `gh repo create shimo4228/authorship-strategy-rules`（public）+ local clone。
- **B2.** akc-cycle テンプレを移植・authoring:
  - `scripts/sync-from-local.sh` = akc-cycle の **rule 変種**を vendor（source `~/.claude/rules/common/authorship-strategy.md` → dest `rules/common/authorship-strategy.md`、secret scan、never commits、`--dry-run` 対応）。paths を authorship-strategy に合わせる。
  - `README.md`（英語）: 何の rule か / parent `authorship-strategy` DOI を prose link / install（`git clone` + `cp rules/common/authorship-strategy.md ~/.claude/rules/common/`）/ 対の `authorship-strategy-skill` への cross-ref。
  - `LICENSE`(MIT) / `CHANGELOG.md` / `llms.txt` / `llms-full.txt`。
- **B3.** A1 完了後、sync 実行 → `rules/common/authorship-strategy.md` を publish。push。

### C. `authorship-strategy-skill` repo 再 sync（既存・fast-follow 候補）

- **C1.** A2 完了後、既存 `authorship-strategy-skill/scripts/sync-from-local.sh` を再実行 → generalize 済み skill を publish。同 repo の `CHANGELOG.md` に generalization 行を追加。push。
- この repo は既に存在し README が既に skill を link するので、**v1.0.0 tag を gate しない**（→ 確認事項）。

### D. 本 repo v1.0.0（doctrine repo）

- **D1. `README.md` 全面 rewrite**（readme-writer skill を起動）。目標構造（~155 行 → ~90 行）:
  1. Title + badges + 1 行 pitch（tighten）
  2. **Lead 一本化**: 「何で・誰向けか・inversion」を冒頭 2–3 文で即答（現「stance」節と「inversion」冒頭を統合、抽象 framing の連続を解消）
  3. **Mermaid ①**: 3 軸 inversion or 4 層 stack を図示（prose 置換）
  4. 4 層 stack（簡潔）
  5. 20 ADR = 1 行 + adr/README link（seven-cluster 詳説は adr/README へ委譲）
  6. **NEW「Using / adopting the framework」節（導線）**: operational skills → `docs/skills/README.md` / always-on rule → `authorship-strategy-rules` / adopt a tactic → `docs/adoption.md` / check conformance → `docs/conformance.md`
  7. Empirical baseline（短縮 + `docs/empirical/README.md` link）
  8. Sibling lines（表 or compact に短縮）
  9. **Mermaid ②**: 5-line ecosystem 図（prose 置換）
  10. How to cite / License（簡潔）
  11. AI-facing reading order（`<details>` 保持）
  - **four/five 曖昧さ修正**: lead は「five-line ecosystem」で統一（現状の line 数）。empirical の「four lines（baseline window）」は別概念なので保持。
- **D2. `README.ja.md`** を D1 とミラー（English primary / JA mirror は load-bearing invariant）。
- **D3. `docs/skills/README.md` = hub の authorship-strategy エコシステム表を再現**（source: `git show a288e01:README.md` の「Authorship Strategy components and complements」節）。10 行を忠実に配線:
  1. `authorship-strategy-skill` — 4 層 judgment stack の loadable rule set 【**component**】
  2. `release-doi` — identifier-federation release workflow 【**component**】
  3. `llms-txt-writer` — AI-facing doc writer（llms.txt / FAQ / glossary）【**component**】
  4. `jsonld-knowledge-graph` — companion JSON-LD graph writer 【**component**】
  5. `authorship-strategy-rules` — 4 層 framework の always-loaded drop-in rule（**新規**、skill の deterministic 対応物）【rule】
  6. `readme-writer` — human-facing README writer 【adjacent】
  7. `wikidata-federation` — Wikidata federation（researcher/paper/repo/ORCID/DOI/graph）【adjacent】
  8. `doctrine-corpus` — bilingual judgment-eliciting Q&A corpus（DOI 10.5281/zenodo.20337008）【data sibling】
  9. `existence-proof` — pre-line complement（DOI 10.5281/zenodo.20558800）【complement】
  10. `einstein-arena` — Existence Proof Format の worked instance 【complement】
  - **修正必須（archaeology）**: 全 `claude-skill-*` → bare 実名（install の clone/cp path 含む）/ `writing-ecosystem`・`paper-ecosystem` は subagent 同梱で prefix 保持 / **phantom `claude-skill-update-codemaps` 削除**（404）/ `readme-writer`「not yet standalone」削除（実在）/ line 63「six ADRs」→ adr/README 参照。
  - **分類齟齬の解決**: hub は readme-writer / wikidata-federation を component 扱いだが、**doctrine の 4-component を正**として adjacent に置く（意図的 narrowing）。doctrine の component-criterion prose は保持・trim。
  - **scope 境界**: AKC-cycle skills・CA extensions・5 line 横断の全 inventory は authorship に**複製しない** → hub `graph.jsonld` / concept index への pointer で導線確保（hub の意図的簡素化 + single-source-of-truth を尊重）。
- **D4. `CHANGELOG.md` [1.0.0] 追記**: README 全面 rewrite（readme-writer pass）/ skills-index de-stale + rule companion 導線 / `authorship-strategy-rules` companion repo 新設 / global skill+rule の Portability 準拠 generalization を Added・Changed に。
- **D5. Doc-sync 確認**: `llms.txt`（AI navigator に rules repo を足すか）/ `CODEMAPS/architecture.md`（skills 節に rule companion 反映）/ `graph.jsonld`（**判断点**: component skill が graph node なら rule も node 化を検討、distribution mirror として scope 外に留める方に lean。決定を doc-sync 時に確定）。
- **D6. release**: `release-doi` skill の 5-phase（verify-counts.sh 含む Phase 4 → tag v1.0.0 → Zenodo 自動採番 → SWHID 記録）。graph 変更時のみ HF mirror 再 sync。

## Sequencing & critical path

```
A1(rule generalize) ─► B1/B2/B3(rules repo live, 一般化 rule publish)
                                    │
                                    ▼
D1/D2(README rewrite, rules/skills へ link) ─► D3(skills index) ─► D4(changelog) ─► D5(doc-sync) ─► Review(code/security/codex 並列) ─► D6(verify → tag v1.0.0)

並行・非 gate: A2(skill generalize) ─► C1(skill repo 再sync)   ← v1.0.0 tag を待たせない
```

- **critical path**: A1 → B（repo 存在＋一般化 rule）→ D1–D5 → D6。B1 は D1/D3 が link する前に存在必須。
- **fast-follow（非 gate）**: A2 / C1（skill）。他 repo に閉じ、本 repo の tag と orthogonal。

## Critical files

- Global（編集）: `~/.claude/rules/common/authorship-strategy.md`、`~/.claude/skills/authorship-strategy/SKILL.md`（+ `provenance-layer-prompt.md`）
- 新規 repo: `authorship-strategy-rules/`（akc-cycle テンプレ; sync script は akc-cycle rule 変種を vendor）
- 既存 repo（再sync）: `authorship-strategy-skill/`（`scripts/sync-from-local.sh` 再実行 + CHANGELOG）
- 本 repo: `README.md` / `README.ja.md` / `docs/skills/README.md` / `CHANGELOG.md` /（doc-sync）`llms.txt`・`docs/CODEMAPS/architecture.md`・`graph.jsonld`
- 参照（再利用）: `~/MyAI_Lab/authorship-strategy-skill/scripts/sync-from-local.sh`(skill 変種)、akc-cycle repo の `scripts/sync-from-local.sh`(rule 変種) をテンプレに

## Invariants to preserve

- README: concept-DOI canonical / disjoint-attribution note(vs AAP) / preliminary-observation tone / aggregate-count single-source（verify-counts.sh）/ English-primary + JA-mirror。
- 新規 prose で造語しない（ADR-0010 coin-sparingly）。
- generalization は **behavior-preserving**（著者の trigger 対象 repo 集合を変えない）。
- 公開物に private local path / secret を混入させない（sync script の secret scan + 目視）。

## Review / Cleanup（実装後・Verify 前 — 同一 diff に並列起動）

planning.md の Chain。実装が一段落したら **tag する前に**、集約 diff（generalization 編集 + vendored `sync-from-local.sh` + skills-index + README/CHANGELOG）に対して並列起動する。いずれかが `CRITICAL` を返したら chain を止めて報告（早期停止条件）。

- **code-reviewer** — non-Python コード（vendored shell の `sync-from-local.sh` の path 適合・secret-scan ロジック）と Markdown 変更。
- **security-reviewer** — sync script の挙動 + **公開物への private local path / secret 混入ゼロ**（generalization が private ref を確実に除去したか、published repo に `/Users/...` が残らないか）。
- **codex-review** — cross-model 脱相関レビュー（read-only）。同一 diff に code-reviewer / security-reviewer と**並列**。generalization の behavior-preserving 妥当性・sync script 正当性を別モデルで独立検証。**plan（設計）に対しては走らせない**（diff ベース。実装差分が出てから起動）。

## Verification（end-to-end）

1. `README.md` を Mermaid 込みで render 確認（GitHub 上で図が描画されるか）、~90 行台か、導線 4 link が解決するか。
2. `bash scripts/verify-counts.sh`（ADR 20 / open-q 9 が全 carrier で一致）。
3. rule/skill sync を `--dry-run` で diff 確認 → 実 sync → `git diff` を review gate に。
4. 生成 rule/skill の behavior-preserving チェック（発火/非発火 3 ケース）+ private path grep（`/Users/` 混入ゼロ）。
5. link check（README/skills-index の全 link 200）、secret scan。
6. `release-doi` Phase 4 verify 全 PASS でのみ tag。

## External / irreversible steps（human-gated — 実行前に個別承認）

- `gh repo create shimo4228/authorship-strategy-rules`（public 公開）
- 各 push（rules repo / skill repo / 本 repo）、`git tag v1.0.0` push
- Zenodo 採番連動、（graph 変更時）HF mirror 再 sync

## 確認事項（ExitPlanMode 後に 1 点だけ確定したい）

**skill generalization（A2/C1）の sequencing**: 推奨は **fast-follow（v1.0.0 tag を待たせない）** — skill repo は既存で README は既に link 済み、A2 は大きい日本語 rewrite なので tag を遅らせる価値が薄い。ただし「1.0 時点で rule と skill を完全一貫」させたいなら tag を A2/C1 完了まで hold する選択もある。plan 承認時に指定があれば従う（無指定なら fast-follow で進める）。
