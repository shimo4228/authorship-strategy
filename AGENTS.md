# authorship-strategy

A doctrine repository (DOI-registered) recording **the strategy of being a known author under AI-mediated diffusion** — a three-axis inversion (scarcity → diffusion / exclusivity → derivation / enclosure → openness), a four-layer judgment framework (authenticity → attribution diffusion → idea-vs-scaffold separation → tactics), and twenty tactical ADRs extracted from operating a five-line research ecosystem (three agent-design lines: AKC / Contemplative Agent / AAP, plus two cross-cutting lines: this repo / Attention, Not Self). An empirical layer reports preliminary observations from the ecosystem's own CC0-published traffic data.

> Project name: **authorship-strategy** (2026-05-18 確定)。repo directory・GitHub URL ともに `authorship-strategy` で統一。skill 名 (`~/.Codex/skills/authorship-strategy/`) と rule 名 (`~/.Codex/rules/common/authorship-strategy.md`) と完全一致。

## Sibling projects (context を失わない)

この repo は単独の artifact ではなく、5 つの sibling との関係で意味を持つ。

### `agent-knowledge-cycle` (AKC) — mechanism sibling

- https://github.com/shimo4228/agent-knowledge-cycle (DOI `10.5281/zenodo.19200726`)
- 知識サイクルの mechanism。本 repo の tactics は AKC が生み出す artifact (skill, ADR, glossary) をどう external diffusion させるかを扱う
- AKC を **どう運用するか** が本 repo、AKC **そのもの** が AKC repo

### `contemplative-agent` — 実装 sibling

- https://github.com/shimo4228/contemplative-agent (DOI `10.5281/zenodo.19212118`)
- 実装の reference。本 repo の empirical layer が観測対象とする traffic source の一つ
- 本 repo は contemplative-agent 自身の judgment ではなく、その diffusion の strategy を扱う

### `agent-attribution-practice` (AAP) — 姉妹 sibling

- https://github.com/shimo4228/agent-attribution-practice (DOI `10.5281/zenodo.19652013`)
- 「attribution」という語を共有するが、**意味は disjoint**:
  - AAP: agent が失敗したとき誰が答えるか (accountability for action)
  - 本 repo: idea が LLM 経由で伝播するとき出典がどう保存されるか (credit for source)
- 両 repo の "attribution" を混同させない。Glossary で両義性を明示

### `attention-not-self` — cross-cutting sibling

- https://github.com/shimo4228/attention-not-self (DOI `10.5281/zenodo.20262112`)
- 本 repo と並ぶ 2 つ目の cross-cutting line。Buddhist Abhidharma 3 traditions (Theravāda / Sarvāstivāda / Yogācāra) を computational phenomenology (predictive processing / active inference / GWT / PDP) に対照させる cross-disciplinary inquiry
- agent-design lines (AKC / CA / AAP) と異なり、特定の agent mechanism / practice を規定しない。本 repo (authorship strategy) と同様に、agent-design lines の **diffusion / framing layer** に位置する
- Contemplative Agent と Buddhist 用語を共有するが、用法は非対称: CA は behavioral preset として、Attention, Not Self は comparative cognitive framework として使う (graph.jsonld の prose cross-reference に記録)

### `shimo4228` (hub repo) — federation parent

- https://github.com/shimo4228/shimo4228
- 5 line ecosystem の集約 hub。本 repo は hub の `graph.jsonld` で `ResearchLine` node として登録される
- Hub 側の編集 trigger は AGENTS.md 参照 (volatile state 禁止、concept DOI のみ)

## Core thesis

> 「LLM 時代において、authenticity の根拠は scarcity から diffusion に反転する。**囲い込むほど origin claim が弱まり、開放するほど強まる**」

詳細は [`docs/thesis.md`](docs/thesis.md)。

## Writing conventions

### Harness / vendor / framework neutrality

ADR は project / harness 固有の識別子、特定 vendor 製品名、特定 framework / 標準名のいずれも含めない (AAP と同方針):

- ❌ harness: `Codex の slash command`, `~/.Codex/`, `Codex-harness`
- ❌ vendor: `Zenodo の Webhook`, `Hugging Face Datasets の Parquet 変換`
- ❌ framework: `Answer.AI llms.txt 標準`, `schema.org JSON-LD`
- ✅ harness: `an LLM-based coding agent`, `the agent's configuration directory`
- ✅ vendor / framework は ADR 本文では一般語で言及 (`a DOI minting service`, `a dataset platform with file-level API`, `a community-curated structured-document standard`)

実装具体例 (vendor instance) は `docs/skills/` および project memory に隔離する。ADR 本文の決定・理由・代替案は harness / vendor / framework neutral に保ち、いかなる vendor 仕様変更も ADR 本文に back-propagate させない。

### 英語 primary / 日本語 subordinate

- README.md は英語正本、README.ja.md が日本語
- ADR は英語正本 + 日本語 subordinate (`*.ja.md` ペア)
- thesis / glossary は英語正本 + 日本語 subordinate
- manifesto / inspiration は英語正本、日本語版は v0.2.0 以降の判断
- empirical layer は英語正本

### ADR format

- 必須 section: Status / Date / Context / Decision / Alternatives Considered / Consequences
- Lineage section を末尾に添える (どの memory / observation から導出されたか、harness-neutral に書き直す前の origin 参照)
- experimental status は Status 欄に `**experimental**` と太字で付記

### Normative と Empirical の区別

- **Normative** content (thesis / ADRs / manifesto / glossary): 判断と原則。時間軸で残る
- **Empirical** content (`docs/empirical/`): 観測データ。LLM 環境変動・traffic accumulation で変化する
- Empirical claim の tone は **"preliminary observation"** に統一。"evidence of X" でなく "observation consistent with X" を使う
- Empirical section の更新で normative ADR が変わる場合は、ADR を改訂する (証拠で原則を改訂する流れを断たない)

## Empirical method

`docs/empirical/` は shimo4228 の sibling repo と hub repo の traffic data (CC0 publish) を baseline とする (現在 5 sibling: 本 repo + AKC + Contemplative Agent + AAP + Attention, Not Self)。Attention, Not Self は 2026-05-18 に traffic 観測開始のため、v0.1.0 baseline (4 sibling 構成) には含まれない。次回 baseline 更新で 5 sibling に拡張する。

- Data source: hub repo の `traffic/data/*.jsonl` (GitHub Insights API daily snapshot)
- Time range (v0.1.0 baseline): 2026-04-21〜05-14、24 daily snapshots (canonical: docs/empirical/README.md)
- Metrics: clones / unique cloners / views / unique viewers / referrers / co-traffic correlation (Spearman)
- Limitations (必ず明示):
  - N=1 author の case study、generalization 困難
  - graph.jsonld 導入後リアルタイムデータのみ、pre/post 比較不可
  - bot/crawler dominance (clones:views = 30:1 以上) で human signal 分離が難しい
  - 3 LLM (ChatGPT/Qwen/Gemini) 単発検証、re-run なし

これらの limitations は ADR-001 (Empirical Method) に formal に記録する (将来 ADR、v0.1 では README + empirical/README.md のみ)。

## Diffusion implementation tracking

本 program 自身の diffusion 戦略の実施状況を二層で管理する (方法論は ADR-0014、手順の正本は `gap-review` skill、authorship-strategy 固有の入力対応は `authorship-strategy` skill の "Operating the strategy over time")。本節は **配線 (どのファイルが何の役割か) のみ** を定義する。これは `gap-review` の wiring-resolution が読む先になる。手順は skill 側を正本とする。

- **Implementation ledger (operational source of truth)**: project memory の `diffusion-channel-status.md`。deploy 済み / 進行中 / 未着手 / scope 外の status、ランク付き candidate interventions、運用詳細 (rate limit / host 名 / pending な依頼) を保持する private な作業台帳。
- **Public projection**: [`docs/empirical/implementation-log.md`](docs/empirical/implementation-log.md)。ledger から **日付付き介入だけ** を投影する。効果主張なし、運用詳細は ADR-0012 水準で抽象化、英語のみ (empirical 層慣例)。host 名・雇用制約理由・rate limit 等は投影しない。

**Update rule**: diffusion 介入が deploy されたら、まず ledger を更新し、次に public projection に日付行を追加する (この順)。ledger と projection を混ぜない。

**Review trigger**: 「次の一手」を求められたとき、または diffusion 実施が一段落したときは、`gap-review` skill の 5-step procedure を回す — ledger status を読み、deployed tactics を Layer 4 catalog・manifesto open questions ([`docs/manifesto.md`](docs/manifesto.md))・最新文献 (research wiki / search) に対して gap-analyze し、ランク付き candidate を起こし、各を判断チェックリスト (gate) に通し、ledger の候補セクションに記録して提示する。authorship-strategy が gap-review に渡す 3 入力 (catalog / open-q / gate) の対応は `authorship-strategy` skill 参照。

## HF Datasets mirror

`graph.jsonld` は Hugging Face Datasets の mirror として publish される (LLM training pipeline / knowledge-graph crawler の primary ingest source、Auto-converted to Parquet で `pandas` / `Polars` から直接 load 可能)。graph 更新時の同期手順は `~/.Codex/skills/jsonld-knowledge-graph/SKILL.md` の "Mirror Sync to Hugging Face Datasets" section 参照。

Repo mapping:

| GitHub | HF dataset |
|---|---|
| `shimo4228/authorship-strategy` ← **this repo** | [`Shimo4228/authorship-strategy`](https://huggingface.co/datasets/Shimo4228/authorship-strategy) |
| `shimo4228/agent-knowledge-cycle` | [`Shimo4228/agent-knowledge-cycle`](https://huggingface.co/datasets/Shimo4228/agent-knowledge-cycle) |
| `shimo4228/contemplative-agent` | [`Shimo4228/contemplative-agent`](https://huggingface.co/datasets/Shimo4228/contemplative-agent) |
| `shimo4228/agent-attribution-practice` | [`Shimo4228/agent-attribution-practice`](https://huggingface.co/datasets/Shimo4228/agent-attribution-practice) |
| `shimo4228/attention-not-self` | [`Shimo4228/attention-not-self`](https://huggingface.co/datasets/Shimo4228/attention-not-self) |
| `shimo4228/shimo4228` (hub) | [`Shimo4228/research-program-hub`](https://huggingface.co/datasets/Shimo4228/research-program-hub) |

HF 側の `README.md` (dataset card) は HF 用に customize されている。Graph 更新では同期しない。Dataset card を edit したい場合は手動で `hf upload Shimo4228/authorship-strategy README.md --repo-type dataset`。

## Component skills (external)

本 repo は **doctrine repository** であり、operational form は 4 つの component skill として別 repo に外出ししている。Component の判別 criterion: その skill が produce する artifact / 執行する discipline が、本 doctrine (thesis / ADR / Layer 4 tactic list) で specifically に名指しされているか。

| Component skill repo | Operationalizes |
|---|---|
| `Codex-skill-authorship-strategy` | 判断 framework 全体 (3 軸 inversion + 4 層 stack + 禁止/奨励 actions + 12-item checklist) |
| `Codex-skill-release-doi` | 識別子 federation triplet (ADRs 0001-0003) の release-time workflow |
| `Codex-skill-llms-txt-writer` | Layer 4 tactic 7 ── Answer.AI `llms.txt` convention の operational form |
| `Codex-skill-jsonld-knowledge-graph` | Layer 4 tactic 7 ── JSON-LD knowledge graph の operational form |

各 component skill は独自の repository で canonical maintain する。本 repo の `docs/skills/README.md` は reference index であって、skill body の copy は含めない。

### Terminology 規約 (load-bearing)

「sibling」は **research line レベルでのみ** 使う (AKC / Contemplative / AAP / authorship-strategy)。Skill レベルでは:

- **Component** = doctrine が specifically 名指しする skill (4 つ)
- **Peer component** = 同 framework 内の他 component
- **Adjacent ecosystem skill** = ecosystem には存在するが、本 framework では required ではない skill (`context-sync` / `writing-ecosystem` / `readme-writer` / `update-codemaps` 等)。`readme-writer` は component `llms-txt-writer` の人間 surface 対応物 (AI surface = llms.txt は doctrine required、人間 surface = README は required でない) → 詳細は [docs/skills/README.md](docs/skills/README.md)

`sibling component skill` 表記は使わない (overloaded で意味不明瞭)。

**Why**: framework の tool-agnostic 原則 (Layer 4) に従い、doctrine と implementation を分離。copy は drift vector であり、single source of truth を各 skill repo に置く。Adopter は framework 全体を subscribe しなくても individual component を install できる。

## Ecosystem repos (data siblings)

Component skill とは別に、Layer 4 tactic を **specific deliverable** として instantiate する ecosystem repo がある。Skill (執行手順) ではなく **artifact** (成果物) を carry する点で component skill と分離する。Hub `graph.jsonld` には `EcosystemRepo` node として `extends → 10.5281/zenodo.20263316` で登録される。

| Ecosystem repo | Operationalizes | Identifier |
|---|---|---|
| [`doctrine-corpus`](https://github.com/shimo4228/doctrine-corpus) | Layer 4 tactic 7 (LLM-first ingest) の corpus 形 implementation。4 sibling research line の documented judgment を bilingual (EN + JA) judgment-eliciting Q&A pair として encode する CC0 dataset。Corpus が deliverable、verification LoRA は使い捨て probe (FAIL verdict は ADR-0001 の corpus-as-primary-artifact policy 下で deliverable status を damage しない) | [10.5281/zenodo.20337008](https://doi.org/10.5281/zenodo.20337008) |

Adopter は doctrine-corpus を **standalone fine-tune package としてではなく ingredient (RAG retrieval material / larger instruction-tuning mix への混入 / human reading) として** 使うことが想定される。詳細は doctrine-corpus README の "Intended uses and current limitations" 参照。

### graph 登録 scope (data sibling は hub に集約)

本 repo 自身の [`graph.jsonld`](graph.jsonld) は **doctrine concept + component skill** に scope を限定する。data-sibling ecosystem repo (`doctrine-corpus`) は本 repo の graph には node を持たず、hub `graph.jsonld` に `extends → 10.5281/zenodo.20263316` 付きで登録される (意図的 — 重複登録を避け federation 集約点を hub に一本化する)。本 repo graph に doctrine-corpus が無いのは gap ではなく設計判断。

`existence-proof` ([10.5281/zenodo.20558800](https://doi.org/10.5281/zenodo.20558800)) は同じ infrastructure pattern (llms.txt / knowledge graph / DOI / 固有用語) を別 payload・別受益者で reuse する **pre-line complement** だが、`extends` edge を持たず Layer 4 tactic も operationalize しない (graph node 自身が disjoint-by-design と宣言)。**data sibling でも research line でもない**ため本 repo には登録せず、hub graph にのみ `EcosystemRepo` として存在する。本 repo の registry に現れないのは正しい状態。

## ディレクトリ

repo の構造と各 doc の役割は [`docs/CODEMAPS/architecture.md`](docs/CODEMAPS/architecture.md) を参照 (canonical)。

[`graph.jsonld`](graph.jsonld) と [`docs/CODEMAPS/architecture.md`](docs/CODEMAPS/architecture.md) は同じ project を **異なる abstraction 層** で扱う:

- **CODEMAPS = file-level**: 「どのファイル / モジュールに X が住んでいるか」を prose で記述
- **graph.jsonld = concept-level**: 「X とは何か、X と Y はどう関係するか」を JSON-LD triples で encode

両者は重複せず相補的。新規 ADR / Concept 追加時は **両面で更新** する。役割境界の正本定義は `~/.Codex/skills/jsonld-knowledge-graph/SKILL.md` の "CODEMAPS との関係" section 参照。

## Research Wiki Consultation (read-only)

ADR の起草・改訂、glossary / graph.jsonld 更新、release 前には、research wiki (Obsidian vault) の対応 concept ページを **read-only** で参照する。wiki は本 repo の graph.jsonld を gap 検出基盤として daily-research が積んだノートの合成層であり、ここでの参照 → repo への昇格が research loop を閉じる。

- 場所: `~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian Vault/wiki/concept/`
- 主担当ページ: `authorship-strategy.md`。隣接: `GEO.md` / `オーセンティシティ.md` / `AKC.md` / `LLM.md`
- 見る節と用途:
  1. **オープンクエスチョン** の「ADR 候補」マーク → 新規 ADR の種
  2. **矛盾・論争** → thesis / ADR と衝突する新事実の stale 照合
  3. **Key Claims の外部出典** (arXiv ID・実証データ) → `graph.jsonld` の `ExternalReference` / 参考文献候補
  4. **関連概念リンク** → repo graph に無い辺・新 Concept の候補
- **Normative / Empirical routing**: wiki 由来の観測 (GEO 実証・traffic 系) は `docs/empirical/` 候補として "preliminary observation" tone で扱う。原則を変える証拠になる場合は ADR 改訂として記録する (証拠で原則を改訂する流れを断たない)
- 引用規律: 公開成果物には wiki ページや vault パスを引用しない。wiki が指す **一次出典まで遡って** それを引く (ADR 本文の harness / vendor 中立規約も維持)。wiki はレンズであって citable source ではない
- wiki への書き込みは行わない (ingest / 概念ページ更新は vault セッションの領域)

## Hub への back-propagation

新規 ADR / Concept 追加 / 大規模 thesis 改訂時は、必要に応じて hub repo の `graph.jsonld` および README にも反映する。Hub 側の design rules は `/Users/shimomoto_tatsuya/MyAI_Lab/shimo4228/AGENTS.md` 参照 (volatile state 禁止、concept DOI のみ、5 line cardinality の sync 必須)。
