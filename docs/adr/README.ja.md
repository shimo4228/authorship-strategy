Language: [English](README.md) | 日本語

# Architecture Decision Records

各 ADR は AI 経由の拡散下における著者戦略についての戦術的判断を記録する。4 つの DOI
登録された research repo からなるエコシステムの運用から発見されたものであり、
top-down に prescribe されたものではない。

## Index

| ADR | Title | Status |
|-----|-------|--------|
| [0001](0001-concept-doi-canonical.ja.md) | Concept DOI を canonical reference として使う | accepted |
| [0002](0002-doi-federation-via-zenodo-json.ja.md) | `.zenodo.json` による DOI federation | accepted |
| [0003](0003-cross-platform-dataset-federation.ja.md) | クロスプラットフォーム データセット federation | accepted |
| [0004](0004-authorship-metadata-orcid.ja.md) | ORCID Auto-Update OFF での著者メタデータ | accepted |
| [0005](0005-readme-localization-audience-driven.ja.md) | README ローカライズ ポリシー —— Audience-Driven な維持 | accepted |
| [0006](0006-llm-first-ingest-dual-entry-points.ja.md) | LLM-First Ingest via Dual Entry Points | accepted |
| [0007](0007-human-attention-signals-not-a-metric.ja.md) | Human-Attention Platform Signals Are Not a Success Metric | accepted |

ADR set は thesis の異なる層を tracking する 4 つの cluster に分かれる:

ADR 0001-0003 は **identifier-federation triplet** を形成する: ADR-0001 が canonical
reference の形 (version DOI ではなく concept DOI) を fix し、ADR-0002 が archive
deposit metadata (`relatedIdentifiers`) で artifact 間関係を宣言し、ADR-0003 が
federation を非 DOI platform (Git host、dataset platform) に拡張し、reader が
どの platform から入っても network が discoverable になるようにする。各 ADR は
独立に採用可能だが、規律の最強形は 3 つすべてを適用する。

ADR 0004-0005 は **maintenance-discipline ADR** である: ADR-0004 は著者が誰 *である* か
(ORCID enrichment policy)、ADR-0005 は著者が誰 *のために* 書くか (locale-mirror
retirement policy) について。両方とも同じ基底の動きをする —— 維持コストは推測される
将来状態ではなく実際の evidence で amortize される。

ADR-0006 は **LLM-first ingest decision** である: artifact は prose-form navigator と
concept-form graph を補完的な pair として deploy し、各々が他方では到達できない
distinct な LLM-mediated reader sub-population に serve する。Federation triplet が
artifact を複数 platform に *reach* させ、maintenance pair が edit を跨いで *coherent*
に保つのに対し、ADR-0006 は各 platform で artifact が取らなければならない *form* を
規定し、そこで operating する LLM-mediated channel が absorb できるようにする。
Thesis の Axis 1 反転 (enclosure → openness) を ingest 表面で直接 operationalize
するのは本 ADR のみである。

ADR-0007 は **metric-rejection decision** である: framework が何を optimize
*しない* かを fix する。Platform の human-attention signal —— Git-host の star
(gameable: 購入可能) と page-view (LLM-mediated reach に盲目) —— を success metric
から除外し、off-page の human-distribution 労働を、human 到達がほぼ空の funnel
(実測 clone:view ≈ 16:1) の上で動く red-ocean 活動として却下する。ADR-0006 が
LLM-mediated audience に向けて artifact が取る *form* を規定するのに対し、ADR-0007
はその audience —— platform の human-attention ではなく —— が *success の尺度* で
あると宣言し、program の従来型 engagement 数値がほぼ 0 であることを、直すべき欠陥
ではなく受容された consequence として grounding する。Thesis の scarcity →
diffusion 反転の metric 側の対応物である。

## Format

各 ADR は以下に従う: Status / Date / Context / Decision / Alternatives Considered
/ Consequences / Lineage。意図は、*decision* (何をするか、なぜか) が thesis が
予測する substrate 変化を生き残るようにすることである。

ADR は *harness-neutral* に書かれる: 特定の実装、vendor、framework 名は ADR 本文に
出現しない。特定の vendor や framework が原 decision を shape した場合、lineage は
*Lineage* section に、reader が著者の特定実装にアクセスできなくても follow できる
形で記録される。

基底の thesis (3 軸反転 + 4 層 framework) は [`../thesis.ja.md`](../thesis.ja.md)、
用語は [`../glossary.ja.md`](../glossary.ja.md)、本 ADR 群が答えない open question
は [`../manifesto.md`](../manifesto.md) を参照。
