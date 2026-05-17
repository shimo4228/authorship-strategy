# authorship-strategy

A DOI-targeted research project recording **the strategy of being a known author under AI-mediated diffusion** — a three-axis inversion (scarcity → diffusion / exclusivity → derivation / enclosure → openness), a four-layer judgment framework (authenticity → attribution diffusion → idea-vs-scaffold separation → tactics), and five tactical ADRs extracted from operating a four-repository research ecosystem. An empirical layer reports preliminary observations from the ecosystem's own CC0-published traffic data.

> Project name: **authorship-strategy** (2026-05-18 確定)。repo directory・GitHub URL ともに `authorship-strategy` で統一。skill 名 (`~/.claude/skills/authorship-strategy/`) と rule 名 (`~/.claude/rules/common/authorship-strategy.md`) と完全一致。

## Sibling projects (context を失わない)

この repo は単独の artifact ではなく、4 つの sibling との関係で意味を持つ。

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

### `shimo4228` (hub repo) — federation parent

- https://github.com/shimo4228/shimo4228
- 4 line ecosystem の集約 hub。本 repo は hub の `graph.jsonld` で `ResearchLine` node として登録される
- Hub 側の編集 trigger は CLAUDE.md 参照 (volatile state 禁止、concept DOI のみ)

## Core thesis

> 「LLM 時代において、authenticity の根拠は scarcity から diffusion に反転する。**囲い込むほど origin claim が弱まり、開放するほど強まる**」

詳細は [`docs/thesis.md`](docs/thesis.md)。

## Writing conventions

### Harness / vendor / framework neutrality

ADR は project / harness 固有の識別子、特定 vendor 製品名、特定 framework / 標準名のいずれも含めない (AAP と同方針):

- ❌ harness: `Claude Code の slash command`, `~/.claude/`, `claude-harness`
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

`docs/empirical/` は shimo4228 の 4 sibling repo (本 repo + AKC + Contemplative Agent + AAP) と hub repo の traffic data (CC0 publish) を baseline とする。

- Data source: hub repo の `traffic/data/*.jsonl` (GitHub Insights API daily snapshot)
- Time range (v0.1.0 baseline): 2026-04-21 以降の蓄積 (約 25 日分)
- Metrics: clones / unique cloners / views / unique viewers / referrers / co-traffic correlation (Spearman)
- Limitations (必ず明示):
  - N=1 author の case study、generalization 困難
  - graph.jsonld 導入後リアルタイムデータのみ、pre/post 比較不可
  - bot/crawler dominance (clones:views = 30:1 以上) で human signal 分離が難しい
  - 3 LLM (ChatGPT/Qwen/Gemini) 単発検証、re-run なし

これらの limitations は ADR-001 (Empirical Method) に formal に記録する (将来 ADR、v0.1 では README + empirical/README.md のみ)。

## HF Datasets mirror

`graph.jsonld` は Hugging Face Datasets の mirror として publish される (LLM training pipeline / knowledge-graph crawler の primary ingest source、Auto-converted to Parquet で `pandas` / `Polars` から直接 load 可能)。graph 更新時の同期手順は `~/.claude/skills/jsonld-knowledge-graph/SKILL.md` の "Mirror Sync to Hugging Face Datasets" section 参照。

Repo mapping:

| GitHub | HF dataset |
|---|---|
| `shimo4228/authorship-strategy` ← **this repo** | [`Shimo4228/authorship-strategy`](https://huggingface.co/datasets/Shimo4228/authorship-strategy) (作成予定) |
| `shimo4228/agent-knowledge-cycle` | [`Shimo4228/agent-knowledge-cycle`](https://huggingface.co/datasets/Shimo4228/agent-knowledge-cycle) |
| `shimo4228/contemplative-agent` | [`Shimo4228/contemplative-agent`](https://huggingface.co/datasets/Shimo4228/contemplative-agent) |
| `shimo4228/agent-attribution-practice` | [`Shimo4228/agent-attribution-practice`](https://huggingface.co/datasets/Shimo4228/agent-attribution-practice) |
| `shimo4228/shimo4228` (hub) | [`Shimo4228/research-program-hub`](https://huggingface.co/datasets/Shimo4228/research-program-hub) |

HF 側の `README.md` (dataset card) は HF 用に customize されている。Graph 更新では同期しない。Dataset card を edit したい場合は手動で `hf upload Shimo4228/authorship-strategy README.md --repo-type dataset`。

## Component skills (external)

本 repo は **doctrine repository** であり、operational form は別 repo に外出ししている:

| Component skill repo | Role |
|---|---|
| `claude-skill-authorship-strategy` (予定) | 4 層判断 checklist / 禁止事項 / 奨励事項を LLM-based agent の rule set として load 可能な形式に |
| `claude-skill-release-doi` (予定) | identifier-federation triplet ADRs を release-time workflow として instantiate |

各 component skill は独自の repository で canonical maintain する。本 repo の `docs/skills/README.md` は reference index であって、skill body の copy は含めない。

**Why**: framework の tool-agnostic 原則 (Layer 4) に従い、doctrine と implementation を分離。copy は drift vector であり、single source of truth を各 skill repo に置く。Adopter は framework 全体を subscribe しなくても individual skill を install できる。

## ディレクトリ

repo の構造と各 doc の役割は [`docs/CODEMAPS/architecture.md`](docs/CODEMAPS/architecture.md) を参照 (canonical)。

[`graph.jsonld`](graph.jsonld) と [`docs/CODEMAPS/architecture.md`](docs/CODEMAPS/architecture.md) は同じ project を **異なる abstraction 層** で扱う:

- **CODEMAPS = file-level**: 「どのファイル / モジュールに X が住んでいるか」を prose で記述
- **graph.jsonld = concept-level**: 「X とは何か、X と Y はどう関係するか」を JSON-LD triples で encode

両者は重複せず相補的。新規 ADR / Concept 追加時は **両面で更新** する。役割境界の正本定義は `~/.claude/skills/jsonld-knowledge-graph/SKILL.md` の "CODEMAPS との関係" section 参照。

## Hub への back-propagation

新規 ADR / Concept 追加 / 大規模 thesis 改訂時は、必要に応じて hub repo の `graph.jsonld` および README にも反映する。Hub 側の design rules は `/Users/shimomoto_tatsuya/MyAI_Lab/shimo4228/CLAUDE.md` 参照 (volatile state 禁止、concept DOI のみ、3 line cardinality の sync 必須)。
