# authorship-strategy stance reframe — 棚卸し + 編集 plan

## Context

harness 側（`~/.claude/skills/authorship-strategy/SKILL.md` と `~/.claude/rules/common/authorship-strategy.md`）は stance — **maker / 実践者、学術 apparatus は道具、audience は full space** — を最上位に foreground 済み。repo 本体は 2026-06-21 の第一次訂正で person-as-researcher framing は除去済みだが、今回の走査で残っているのは:

1. **positive stance の不在**（最大の gap）— 否定形の但し書きだけが散在し、それが帰結として読める「前提」がどの surface にも書かれていない
2. **否定形の散在** — "Monetization is not a goal" 系が 6 surface に単発で置かれている
3. **入口文の (a) 残滓** — CLAUDE.md / AGENTS.md 冒頭の "A DOI-targeted research project"
4. **(b) 型の定番イメージ** — 「未来の**研究者**が因果を遡る」が README/thesis の核心文に residing

著者の session 中追加指示: **否定形はデメリットが大きければ削除してよい**。**skill / rules にも否定形傾向が残るので、必要なら positive stance による全面書き換えをして開く**。→ 本 plan は repo (Part A) + harness (Part B) の両方を扱う。

---

## Part 0 — 棚卸し結果（deliverable 1）

### 総括

- **ADR 0001–0020 EN/JA 全 40 files + adr/README ×2 = clean**。person-as-researcher ゼロ。audience は一貫して LLM-mediated broad channels。DOI/ORCID/SWHID は一貫して道具として記述。scholarly ×5 は DOI 層の機能説明（keep）
- **CITATION.cff / .zenodo.json / codemeta.json / conformance / implementations / skills-README / CODEMAPS / empirical = clean**（"A normative framework, tactical catalog..." の整った framing。Person node に researcher 職業なし）
- 残存 hit は下表の 17 件。すべて入口 surface / Layer 1 記述 / 核心比喩に集中

### Inventory（file:line | pattern | 現状 | 提案）

| # | file:line | 型 | 現状 | 提案 |
|---|-----------|----|------|------|
| 1 | 全 surface | gap | positive stance がどこにも無い | README (EN/JA)・manifesto・thesis・llms.txt・llms-full・graph.jsonld・deposit metadata に stance を新設（下記 draft） |
| 2 | README.md:14 | (b) | "whether a future **researcher** tracing causation can find the original author" | "a future **reader**" へ（遡源者は研究者と限らない — 開発者・LLM 自身も含む） |
| 3 | README.ja.md:12 | (b) | 「未来の**研究者**が因果を遡るとき」 | 「未来の**読み手**」へ |
| 4 | docs/thesis.md:12 | (b) | "how future **researchers** trace causation" | "future **readers**" へ |
| 5 | docs/thesis.ja.md:10 | (b) | 「未来の**研究者**が因果を遡るときに」 | 「未来の**読み手**」へ |
| 6 | docs/thesis.md:155 | (c) | "Monetization is not a goal." (Layer 1) | **削除** — 前後文（"unaltered by the market's pressure to reshape it for sale" / "An idea diluted to be sold…"）が既に positive-contrastive に担っている |
| 7 | docs/thesis.ja.md:122 | (c) | 「マネタイズは目的ではない。」 | **削除**（同上） |
| 8 | docs/glossary.md:44 | (c) | "Monetization is not a goal of the framework." | **positive 置換**: "The framework's success criterion is the idea surviving diffusion as thought; revenue sits outside its success criteria."（glossary は単独引用される定義面なので削除でなく置換） |
| 9 | docs/glossary.ja.md:33 | (c) | 「マネタイズは framework の目的ではない。」 | positive 置換（#8 の JA mirror） |
| 10 | llms.txt:93 | (c) | "…unaltered by market pressure). **Not monetization.**" | 断片を positive 化: "…; the success criterion is the idea surviving diffusion as thought." |
| 11 | llms-full.txt:107 | (c) | "Monetization is not a goal." (FAQ Layer 1) | positive 置換（FAQ は単独引用面） |
| 12 | graph.jsonld:235 (#concept/authenticity) | (c) | description 内 "Monetization is not a goal." | positive 置換（node description は単独引用面） |
| 13 | docs/adoption.md:84 | (c) | "…is your genuine thinking, **not a revenue stream**. … **Monetization is not a goal** of this framework" | 二重否定を positive 書き換え。adopter の self-check 機能は維持: "Confirm the value you are protecting is your genuine thinking — the articulation you would keep unchanged even with nothing to sell." |
| 14 | docs/inspiration.md:160 | (c) | "the Layer 1 **anti-monetization** commitment" | positive label へ: "the Layer 1 authenticity commitment (genuine articulation, with revenue playing no part)" |
| 15 | AGENTS.md:3 | (a) | "A DOI-targeted **research project** recording…" | "A **doctrine repository** (DOI-registered) recording…" — 中身は既に maker-aligned（"being a known author"）なので head noun のみ |
| 16 | CLAUDE.md:3 | (a) | 同上（AGENTS.md と verbatim 共有） | 同上（両面同時修正） |
| 17 | docs/thesis.md:266–267 / thesis.ja.md:218 | (b) 弱 | framework 適用 scope が "a DOI-targeted, idea-rescue **research artifact**" | "idea-rescue artifact" へ — 実運用は essay corpus (ADR-0016) にも適用しており "research" が scope を実態より狭める |

### Borderline — keep（編集しない、根拠つき）

- **ADR-0017:188/ja:169・ADR-0019:57/ja:52 "anti-monetization commitment"** — accepted ADR の本文。参照は実質的（Layer 1 の market-pressure 節が referent として存続する）で、ADR 本文の事後改変は文書規律コストが利得を上回る。**見送り**（Alternatives: 4 files を positive label に揃える案 — 一貫性は上がるが accepted-ADR 不可侵の慣行を破る）
- **inspiration.md:57**（adopter の field 列挙が学術寄り）— DOI インフラの有無の議論で文脈適合。optional: "independent makers publishing outside institutional venues" を列挙に追加（低優先、実装時に自然なら入れる）
- **empirical/README.md:126**（replication 呼びかけが "DOI-registered research ecosystem" 運用者向け）— 手法上比較可能な ecosystem が要る。method-appropriate、keep
- **"research line" / "research ecosystem" / ResearchLine 型 / HF "research-program-hub"** — work の呼称・schema・固有名。全て keep（既定方針）
- **README.md:126 の引用 block** — deposit 済み Zenodo record title（"…Four-Repository Research Ecosystem"）。**不可触**

### 既存の positive anchor（新 stance block が接続する先）

- README.md:5–7（"being a known author" tagline）/ :52–55（"extracted from operating… not deduced"）/ :136–140（derivative-welcome license）
- thesis.md:280–292 "Where this thesis came from"（"the author maintains **while exploring** AI-era authorship strategy" — 既に探究 framing）
- llms-full.txt:21（"the set of practices an author uses to remain a recoverable authorial identity" — AGENTS.md:3 の正しい対応物）/ :686（"The framework is a tool, not an externalization of judgment"）
- ADR-0003:22–32（broad 3-platform audience 列挙 — academic は one-of-many の模範）、ADR-0020:13（"the developer or practitioner who investigates through an LLM assistant"）、ADR-0015:53–54（creative reuse = strongest validation）

### 走査中に見つけた隣接 staleness（stance 外、同 diff で直す・不要なら strike）

- llms.txt:23・:136 が "**eight** open questions" — manifesto は OQ9（entity grounding）まで 9 本ある。llms-full.txt / graph.jsonld の同種 count も実装時に grep して同期（数値クレームの正本は manifesto 実体）

---

## Part A — repo 編集設計

### A-1. README stance 節の新設（intro 段落直後、"## The inversion" の前）

**README.md** に挿入（draft — 実装時に微調整可）:

> ## The stance this is written from
>
> This framework comes from a maker's seat. The author is a practitioner working out, in practice, what good work looks like in the AI era — making things, becoming known for them, and leaving work durable and traceable enough to be found again. The academic apparatus that appears throughout — DOI registration, SWHIDs, citation graphs, papers — is tooling that makes that exploration citable, durable, and traceable, rather than an identity or a destination. The audience follows from the stance: developers, practitioners, learners, creative reusers, and readers in any language who meet these ideas through LLM-mediated channels; academic citation is one channel among several.

**README.ja.md** に mirror 挿入:

> ## この framework が立つ stance
>
> この framework は maker の座席から書かれている。著者は実践者として、AI 時代の「良い仕事のやり方」—— 作り、知られ、あとから見つけ直せるだけ durable で追跡可能な仕事を残す方法 —— を実地で探っている。全体に現れる学術 apparatus（DOI 登録、SWHID、citation graph、論文）は、その探究を citable・durable・traceable にする道具であって、identity でも目的地でもない。audience はこの stance から従う: LLM 経由でこれらの idea に触れる開発者・実務者・学習者・creative reuser・あらゆる言語圏の読み手。学術引用はその中の一経路である。

### A-2. manifesto.md intro に stance 1 文（EN のみ — JA 版は存在しない、規約通り）

intro 段落末尾（"…operate within its current scope." の後）に追加:

> The questions are asked from the framework's own stance — a maker working out durable, traceable authorship in practice — and they are open because practice has not yet answered them.

### A-3. thesis の 3 点

- :12 "future researchers" → "future readers"（#4）
- :155 "Monetization is not a goal." 削除（#6）
- "Where this thesis came from"（:282 付近）に 1 文追加: "The exploration is a maker's: the academic instruments that appear throughout — DOI registration, archived snapshots, citation graphs — entered the practice as tooling for citability and durability, and stayed on those terms."
- thesis.ja.md に 3 点 mirror（:10 / :122 / :230 付近）
- :266 "research artifact" → "artifact"（#17、JA :218 mirror）

### A-4. 機械可読 surface の同期（同 diff）

共通 stance 文（EN、description 追記用）:

> Written from a maker/practitioner stance: the academic apparatus used throughout (DOI, SWHID, citation graphs) is tooling for citability and durability rather than an identity or destination; the intended audience spans developers, practitioners, learners, and creative reusers across languages, with academic citation as one channel among several.

- **llms.txt** — 冒頭 blockquote（:3）に上記を追記、:93 positive 化（#10）、OQ count 8→9 同期
- **llms-full.txt** — 冒頭 factual block 付近に stance の FAQ entry（"What stance is the framework written from?"）を新設、:107 置換（#11）、OQ count grep 同期
- **graph.jsonld** — root Dataset node description に共通 stance 文を追記、#concept/authenticity（:235）の "Monetization is not a goal." を positive 置換。**schema（@type: ResearchLine 等）は不変、node 追加なし**
- **.zenodo.json / CITATION.cff / codemeta.json** — description / abstract 末尾に共通 stance 文を追記（次回 deposit から反映される living metadata。deposit 済み record は不変）

### A-5. 否定形の処理方針（削除 vs 置換の基準）

- **埋め込み文中で前後が positive に担っている** → 削除（thesis #6/#7）
- **単独引用される定義面**（glossary / FAQ / graph node description / llms 断片） → positive 置換（#8–#12）
- **機能を持つ否定形**（adoption.md の self-check、inspiration の label） → 機能を保った positive 書き換え（#13/#14）
- on-thesis 根拠: 否定形は否定対象 token（monetization 等）を LLM-facing semantic signature に混入させる。positive 化は signature の純化であり、vocabulary discipline (ADR-0010) と同じ論理

### A-6. 触らないもの

deposit 済み Zenodo record 全 version / README.md:126 引用 block（record title）/ CHANGELOG.md（歴史記録）/ LICENSE / docs/adr/ 全 42 files / docs/conformance.md / docs/implementations.md / docs/skills/README.md / docs/CODEMAPS/（構造変更なし・鮮度 header 不要）/ docs/empirical/ データ files

---

## Part B — harness の positive 全面書き換え（著者追加指示）

対象: `~/.claude/skills/authorship-strategy/SKILL.md`・`~/.claude/rules/common/authorship-strategy.md`（global 版のみ。公開 repo `claude-skill-authorship-strategy` への harness-sync は別途 = 従来通り deferred）

**設計原則**: stance を運ぶ prose は positive 全面書き換え。**操作的 fence（禁止事項リスト・判断チェックリスト）は保持** — これらは identity 定義ではなく Layer 1 を守る行動下限で、削除すると assistant の実挙動が退行する。fence の前置きだけ positive に接続し直す。

### B-1. SKILL.md

- **frontmatter description**: 「shimo4228 の DOI-registered idea-rescue **研究プロジェクト**（…）用の」→「shimo4228 が **maker / 実践者として AI 時代の著者戦略を実地で探る**ための判断フレームワーク。DOI-registered idea-rescue repo 群（AKC, Contemplative Agent 等）で適用」。トリガー語彙（3 軸 / 4 層 / preference 階層 / マネタイズ禁止等）は維持
- **Stance 節**: 否定形（「研究者ではない」「制約ではなく」「絞るな」「偏ったら取りこぼし」）を positive 直叙に全面書き換え: 自己規定 = maker / 実践者 / apparatus は道具として使う / audience は full space に最初から開かれている / **提案・候補生成は常に full space（開発者コミュニティ・content platform・creative-reuse seeding・各言語圏・catalog 未収載の新型 channel）を母集団として行う**。末尾の「散在記述はこの stance の帰結」行は構造説明として保持
- **Layer 1**: 「マネタイズは目的ではない」→ 成功規準の positive 文（idea が思考のまま伝わること）。no-revenue 規範は禁止事項 fence に集約
- **Layer 2**: 「（研究者に限らない）」parenthetical 削除 — positive 列挙が既に担う
- **Operating the strategy over time**: catalog 境界段落（「絞ってよいという意味ではない」「取りこぼし」）→ 「候補生成の母集団は full space。catalog は運用履歴」の positive 直叙へ
- **禁止事項**: リスト保持。前置き blockquote（商業チャネル≠マネタイズの二重否定）を「商業チャネルの利用は可。取らないのは収益のみ」1 positive 文 + 1 禁止文に圧縮
- **奨励事項 / 判断基準サマリ**: 「scope を絞らない」等を「full space を保つ」に微修正。fence 文は保持

### B-2. rule（rules/common/authorship-strategy.md）

- **Framework 要点の Persona bullet**: positive 圧縮（現在は否定 4 連: 「自己規定ではなく」「identity でも目的でもない」「制約でなく」「偏ったら取りこぼし」）→ 自己規定・道具・full space 母集団の 3 positive 文 + 帰結注記 1 文
- **Operating over time bullet**: candidate scope 文を positive 化（B-1 と同型）
- **禁止事項**: 保持。太字の商業チャネル注記を B-1 と同じ形に圧縮
- Trigger 判定・適用しない・See skill 参照・構成は不変（「研究系 repo」は artifact 記述子として keep）

---

## Meta — framework 自己適用チェック（skill チェックリスト通過確認）

- **Layer 1 / ADR-0019**: 本変更は「本文を著者の genuine な stance に一致させる」authenticity 回復。channel の reward 関数に合わせた content 変形ではない（optimize されるのは framing の正確さ）
- **ADR-0010 vocabulary discipline**: 新規造語ゼロ（maker / practitioner / stance は既存語彙）。既存固有用語・graph edge は不変
- **ADR-0018**: stance 記述は origin claim を拡張しない
- **Layer 4 tactic 7**: stance が graph.jsonld / llms.txt に乗ることで LLM-mediated 引用可能になる（機械可読層への stance の初載）

## Chain / Verify / 介入点

- **種別**: docs reframe（chore/docs）。TDD なし。Phase 0 なし（外部解なし）
- **実装順**: A-1〜A-3（人間 surface）→ A-4（機械 surface、同 diff）→ A-5 残件 → Part B（harness）→ Review → Verify
- **Review（並列、実装後の diff に対して）**: `vocabulary-consistency-checker`（EN/JA parity + 用語一貫性 + glossary/graph 整合）+ `clarity-reviewer`（README/thesis/manifesto の stance block を first-contact reader で）+ `codex-review`（cross-model 脱相関レビュー、read-only — plan 段階では走らせず実装 diff に対して起動）。CRITICAL で停止
- Parallel Group 1: [Explore ×3 — 済み（棚卸し）] / Parallel Group 2: [vocabulary-consistency-checker, clarity-reviewer, codex-review] / Sequential: 実装 → Review → Verify
- **Verify**（第 2 介入点 = 結果報告 → 承認後 commit）:
  1. `python3 -m json.tool graph.jsonld > /dev/null`（graph valid）
  2. `cffconvert --validate`（CITATION.cff）
  3. grep sweeps: "Monetization is not a goal" = 0 / "future researcher" = 0 / CLAUDE・AGENTS に "research project" = 0 / OQ count 9 同期
  4. EN/JA parity: 編集した EN file に対応する JA 編集が揃っているか照合
  5. 数値クレーム不変確認: ADR count 20・deposit 済み record title・"four-repository"（記録的記述）に触れていない
  6. `git status` — 意図外 file 混入なし（repo と ~/.claude は別 commit）
- **Commit**: 承認後。repo = `docs: foreground maker/practitioner stance across human/AI surfaces`、harness = `~/.claude` 側で別 commit
- **Post-steps（承認 gated、commit 後）**: graph.jsonld 変更につき **HF mirror 再同期**（`hf-sync`、外部 publish のため著者承認）。public projection（implementation-log）は doctrine 非投影 precedent に従い**なし**。harness→公開 skill repo 同期は今回 scope 外（従来通り）

## 変更 file 一覧

repo（17 files）: README.md / README.ja.md / docs/thesis.md / docs/thesis.ja.md / docs/manifesto.md / docs/glossary.md / docs/glossary.ja.md / docs/adoption.md / docs/inspiration.md / llms.txt / llms-full.txt / graph.jsonld / .zenodo.json / CITATION.cff / codemeta.json / AGENTS.md / CLAUDE.md
harness（2）: ~/.claude/skills/authorship-strategy/SKILL.md / ~/.claude/rules/common/authorship-strategy.md
