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
| [0008](0008-rag-era-attribution-diffusion.ja.md) | RAG-Era Attribution Diffusion — Two Channels, Two Time Constants | accepted |
| [0009](0009-dual-entry-asymmetric-rebalance.ja.md) | Dual Entry Points Are Asymmetric — Structured Graph for Citation, Prose Navigator for Agent Context | accepted |
| [0010](0010-vocabulary-discipline.ja.md) | Vocabulary Discipline —— 控えめに造語し、密に anchor する | accepted |
| [0011](0011-two-channel-probe-protocol.ja.md) | Two-Channel Probe Protocol —— 各チャネルを専用の測定器で測る | **experimental** |

ADR set は thesis の異なる層を tracking する cluster に分かれる:

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
するのは本 ADR のみである。ADR-0009 がこれを amend する: 2026 年の測定は 2 つの
entry point が co-equal でないことを示す —— structured graph が検索時 citation を
担う一方、prose navigator の citation 効果は noise であり、ゆえに pair は retain
しつつ *非対称* にし、navigator を AI-search citation lever ではなく
Business-to-Agent (B2A) context surface に rescope する。

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

ADR-0008 は **diffusion-mechanism decision** である: ADR-0006 と ADR-0007 が
whole のまま残した単一の「diffusion」を、*parametric* channel (アイデアが
訓練時にモデルの重みへ吸収される —— 遅い、クロスプラットフォームの語彙
共起が駆動) と *retrieval* channel (artifact がクエリ時に fetch される ——
速い、新鮮さと構造が駆動) に分割する。両者は時定数もレバーも正反対で、
retrieval だけを追う failure mode は ghost citation (出典は cite されるが
著者は名指しされない) であり、ゆえに framework は両者を平均せず別々に
最適化・測定する。各既存 ADR に channel を与え —— federation triplet と
ADR-0004 を parametric レバー、ADR-0006 を retrieval 表面として —— 
ADR-0007 が開いた測定層を鋭くする。

ADR-0010 は **vocabulary-discipline decision** である: ADR-0008 が
parametric channel のレバーとして名指ししながら未定義のまま残した規律を
定義する。造語の力は造語の数ではなく edge 密度から来る。ゆえにプログラムは
3 条件がすべて成立するときのみ造語し (join-novelty、definitional
anchoring、uncontested namespace)、採用したすべての造語を密に anchor する
—— 既存語彙での glossary 定義、上流 citation、knowledge-graph edge、
本文中での反復使用。それ以外はすべて既存語彙で書き、上流の出典を cite
する。Thesis の origin-claim scope discipline の語彙レベルでの執行である。

ADR-0011 は **measurement-instrument decision** である: ADR-0008 自身の
Consequences が要求したもの——retrieval-suppressed naming probe が存在する
まで parametric の成功は主張であって測定ではない——を構築する。protocol は
frontier model を決して混合されない 2 つの設定で probe し (parametric
channel には検索抑制、retrieval channel には検索有効——後者は ghost
citation を単一回答内で観測可能にする)、verdict はモデル判定ではなく
保持された raw response への決定論的文字列照合で検出し、true-positive
rate は negative-control probe の confabulation floor と対照して読む。
これにより cluster は loop を閉じる: ADR-0007 が成功の定義を fix し、
ADR-0008 が機構を分割し、ADR-0010 が parametric channel のレバーを定義し、
ADR-0011 がその 3 つを測定可能にする。

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
