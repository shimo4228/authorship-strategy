Language: [English](0006-llm-first-ingest-dual-entry-points.md) | 日本語

# ADR-0006: LLM-First Ingest via Dual Entry Points

> **Summary.** LLM 経由拡散を前提に著された DOI-targeted artifact は、2 種の
> structured entry point を並列に deploy する: prose-form navigator は
> prose-reading LLM-mediated channel を orient し、linked-data convention で
> encode された concept-form graph は structured-data-ingesting channel に
> concept 間関係を expose する。2 つの format は redundant ではなく、
> 互いに到達できない distinct な LLM-mediated reader 集団をそれぞれ扱う。
> この pair は thesis の Axis 1 反転 (enclosure → openness) の operational
> embodiment であり、artifact の戦略的立場を machine-legible にするものである。

> **[ADR-0009](0009-dual-entry-asymmetric-rebalance.ja.md) により amend
> された。** 以下の「co-equal pair」framing は *coverage* 軸では成り立つ
> (各 entry point は他方が到達できない sub-population に reach する) が、
> *citation* 軸では成り立たない: 2026 年の測定は structured graph が検索時
> citation を担い、prose navigator の citation 効果は noise であることを
>示す。ADR-0009 は両 surface を retain しつつ役割を非対称にする —— 現在の
> weighting はそちらを参照。

## Status
accepted

## Date
2026-05-19

## Context

Thesis は framework の戦略的 target を *著者の signature を carry する LLM-mediated
channel の breadth* として定義する。[*LLM-mediated channel* の glossary 項目](../glossary.ja.md)
はこの population を単一カテゴリとして扱うが、ingest design の目的では当該カテゴリは
構造的に異なる 2 つの sub-population に resolve する:

- **Prose-reading channels.** 会話型 LLM、in-context で documentation を consult する
  AI assistant、summarization のために prose を fetch する citation-graph annotator。
  これらの channel は artifact を natural-language text として消費し、明示的な
  navigation hint (どの document が canonical か、各 document が何のためのものか、
  推奨される reading order は何か) から benefit を得る。
- **Structured-data-ingesting channels.** Training pipeline、knowledge-graph crawler、
  dataset platform SDK を用いる programmatic reader。これらの channel は
  structured data を直接消費し、parse-stable な format で encode された明示的な
  concept 間関係から benefit を得る。Prose から relationship triple を信頼性高く
  抽出することはしない。

直接 browser する人間 reader 向けに書かれた README は、いずれの sub-population に対しても
良く serve しない。Prose-reading sub-population は README を parse できるが、authoritative
な document と supplementary な document を区別する明示的 navigation を与えられない;
structured-data-ingesting sub-population は人間 narrative prose から relationship-level な
signal を抽出することができない。Thesis の Layer 2 戦略
([Attribution Diffusion](../thesis.ja.md)) は *両* sub-population を defend することを
要請する。なぜなら各々が著者の identity を future query で surface しうる independent な
channel を representing しているからである。

[ADR-0003](0003-cross-platform-dataset-federation.ja.md) の cross-platform federation
規律は artifact が Git host と dataset platform の両方に *reach* することを保証する;
本 ADR はそれら platform 上で operating する LLM-mediated channel に absorb されるために
artifact が取らなければならない *form* を扱う。2 つの ADR は compose する: ADR-0003 が
platform を set up し、ADR-0006 が各 platform 上の ingest 表面を set up する。

## Decision

Framework に governed される artifact は **2 種の structured entry point を並列に
deploy** する。各々は canonical-maintained され、両者は versioned release ごとに
同期的に release される:

| Entry point | Form | Reader population | Role |
|---|---|---|---|
| **Prose-form navigator** | Community-curated な AI-facing reference convention に従う AI-readable な prose 文書 | Prose-reading LLM-mediated channels | Artifact の primary document を 1 行説明と推奨 reading order 付きで列挙する; 各 topic で canonical な document を宣言する |
| **Concept-form graph** | Structured-data vocabulary で entity と inter-entity 関係を encode する linked-data file | Structured-data-ingesting LLM-mediated channels | Artifact の concept レベル構造 (thesis layer、ADR set、glossary term、sibling-artifact 関係) を machine-parseable な triple として encode する |

2 つの entry point は **重複せず相補的** である: navigator は *ここに何があるか* に
答え、graph は *これらがどう関係するか* に答える。File-level な構造 (どの file が
どの content を保持するか) は navigator の concern であり、concept-level な構造
(どの idea がどの idea に connect するか) は graph の concern である。Framework が
in-repo documentation に対して採用している 2 層分割 (file-level architecture document と
concept-level knowledge graph) と同じ 2 層分割を、LLM ingest 側でも mirror する。

この decision は **harness-neutral** である: 採用者がどの prose convention やどの
linked-data vocabulary を使わなければならないかを規定しない。既存の community
convention が use case を cover している場合 (本著者が採用している convention は
*Lineage* 参照)、bespoke format より community convention を prefer すべきである。
なぜなら community convention は ingest 側 tooling を単一 target に concentrate
させるからである。Use case を cover する community convention が存在しない場合、
採用者は structured-data-ingesting channel が parse の configuration を行えるだけの
documentation 付きで chosen format を publish しなければならない。

### 同期規律

両 entry point は version tag ごとに regenerate されて re-release される。Framework は
両 entry point 間の drift (一方には存在し他方には存在しない concept、または一方で
assert され他方で contradict される関係) を release-blocking defect として扱う。
同期は artifact の release workflow の責務であり、その workflow の operational form は
本 ADR ではなく外部の component skill の concern である。

## Alternatives Considered

**Prose-form navigator だけを deploy する。** Rejected: structured-data-ingesting
sub-population が未対応のまま残る。Training pipeline と knowledge-graph crawler は
prose から concept-level な関係を抽出することを要求されるが、それは unreliable に
しか行わないか、行わない。戦略的損失は partial ではなく、2 sub-population の一方が
artifact の reach から complete に absence するという形を取る。

**Concept-form graph だけを deploy する。** Rejected: prose-reading sub-population が
navigation hint なしで残される。Artifact に encounter する会話型 LLM は生の triple を
prose context として消費することを要求されるが、それは inefficiently にしか行えない;
より重要なのは reader が各 topic の canonical source がどの document かについての
guidance を持たず、non-authoritative な content を surface しうる点である。Graph は
concept を encode するが、それら concept を citable にする prose discipline を
encode しない。

**Human-primary な README に structured metadata を embed する (例: front-matter や
in-line JSON-LD block)。** Rejected: 単一 document に 3 つの audience (direct-browser な
人間 reader、prose-reading LLM、structured-data-ingesting channel) を 3 つの異なる
optimal form で serve させることを問うことになる。結果は各 audience 個別にとって
worse experience となる。Framework は audience 分離を primary な design discipline
として扱う; audience を単一 artifact に collapse させ直すのはその discipline と
矛盾する。

**Demand の evidence が emerge するまで structured-data form を defer する。**
Rejected: structured-data form は存在するまで silently invisible である。Structured-data
form なしに artifact を crawl 済みの training pipeline は、platform の update signal が
re-ingestion を trigger しない限り form の導入で re-crawl しない; Artifact の *初回*
training-cycle pass の absorption window は失われる。Locale-mirror policy
([ADR-0005](0005-readme-localization-audience-driven.ja.md)) と異なり、ここでは
commitment に先立って audience の evidence を計測することができない。なぜなら
structured-data ingestion signal は artifact 側からは measurable でないからである。
Conservative move は初回 release 時点で form を deploy することである。

## Consequences

**Positive.**

- 両方の LLM-mediated sub-population が format に適した ingest 表面で addressed され、
  artifact の signature を carry しうる channel の breadth を最大化する (Layer 2
  戦略を直接 serve する)。
- Release artifact は 2 つの異なる abstraction level で self-describing になる: 
  orientation のための prose-form navigation、関係 level な reasoning のための
  concept-form graph。Future の reader (人間または機械) は query が match する level
  から入ることができる。
- 2 つの ingest format は独立した component skill に externalized され、framework
  本体は tool-agnostic に保たれる (Layer 4 tactic 5)。採用者は use case に応じて
  いずれかの format を独立に install できる。
- Decision は artifact の戦略的立場 —— LLM-mediated channel が primary audience で
  あること —— を thesis の中だけでなく *artifact の表面で visible* にする。両 entry
  point のいずれも見つけない ingest channel は artifact が自分向けに optimized されて
  いないと告げられている; 両者を見つけた ingest channel は自分が intended audience
  であると告げられている。

**Negative.**

- すべての versioned release は両 entry point を regenerate し同期を verify しなければ
  ならない。Drift は release-blocking defect であり、framework が eliminate しない
  recurring な maintenance cost を impose する。
- 2 format は downstream の ingester にとって 2 つの parse target 表面を意味する。
  Community convention 外の novel format を使う採用者は ingest 側に追加の
  documentation 負担を負う。
- どの prose convention とどの linked-data vocabulary を使うかの選定は採用者に
  ゆだねられ、採用時点での ingest 側 ecosystem に shape される。Framework はこれら
  convention が自身 evolve する (そして supersede されうる) ことを認識し、
  format-selection layer を framework decision とは独立に obsolete しうる substrate
  decision として扱う。

## Lineage

Originating observation: 著者の 5 line research ecosystem (federation hub と 4 つの
sibling research line) を通じて、各 artifact が operational maturity に達したのは
prose-form navigator と concept-form graph の両者が存在し同期されたまさにその時点で
あった。Navigator しかない artifact は会話型 LLM では retrievable だが
knowledge-graph crawl には surface しなかった; graph しかない artifact は
structured-data ingestion には現れるが、会話型 LLM の応答で authoritative document
として cite されることはなかった。Pair を共に deploy することで両 retrieval mode が
得られた。

本著者が採用している convention は Answer.AI の `llms.txt` convention (prose-form
navigator) と schema.org ベースの JSON-LD knowledge graph (concept-form graph) で
ある。両者は著者の research ecosystem で独立した component skill
(`llms-txt-writer` と `jsonld-knowledge-graph`) として
externalized されており、本 repository の外で canonical-maintained され、各 sibling
line に独立に採用される。Component-skill の externalization は本 ADR の tool-agnostic
stance の operational form である: framework decision は「両 format を deploy する」
であって、format の選定や operational な discipline は framework concern ではない。

Decision は retroactively articulated された: 2 つの skill は 2026-05-18 (commit
`c9e927f`) に framework documentation 上で *component* status に promote されたが、
その時点でその promotion を justify する normative ADR が absence であることが
visible になった。本 ADR はそのギャップを埋める。
