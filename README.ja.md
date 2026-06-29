Language: [English](README.md) | 日本語

# authorship-strategy

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20263316.svg)](https://doi.org/10.5281/zenodo.20263316) [![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/shimo4228/authorship-strategy) [![GitMCP](https://img.shields.io/endpoint?url=https://gitmcp.io/badge/shimo4228/authorship-strategy)](https://gitmcp.io/shimo4228/authorship-strategy)

> **Authorship Strategy** — AI 経由の拡散下で著者として残るための、規範的フレームワーク・戦術カタログ・経験的ベースライン。

あなたの読み手に LLM が含まれるなら —— training data として、in-context な相談相手と
して、他者が参照する discovery layer として —— 著者性を守る戦略は反転している。20 世紀
的著者性は *enclosure*（gatekeep されたジャーナル、proprietary license、コントロール
された配布）で守られた。だがその enclosure は、未来の研究者が因果を遡るときオリジナル
著者に辿り着けるかを決定づける LLM 経由の拡散への露出を、いまや *減らす*。この repo は
反転した戦略 —— それが何で、なぜ成り立ち、それを運用する中で抽出された 20 の戦術的判断
は何か（4 つの DOI 登録 repo からなる研究エコシステムの運用から）—— を、著者自身の
エコシステムを超えて採用可能な harness-neutral な形式で記録する。

## 反転（Core thesis）

> AI 時代に自分の著者性を守るとは、作品を閉じることではなく *開く* ことを意味する。
> 20 世紀的著者性が scarcity を通じて origin claim を守ったのに対し、AI 時代の著者性は
> diffusion を通じて守る: 開くことは LLM 吸収を最大化し、validation を derivative work
> として出現させ、origin claim を *強める*。

Thesis は 20 世紀的 authorship strategy の 3 軸反転に立つ:

| 軸 | 20 世紀 | AI 時代 |
|----|---------|---------|
| Authenticity を守るのは… | scarcity | **diffusion** |
| Origin を確立するのは… | exclusivity | **derivation** |
| Reach を制御するのは… | enclosure | **openness** |

Thesis の展開は [`docs/thesis.md`](docs/thesis.md)（英語正本）、日本語版は
[`docs/thesis.ja.md`](docs/thesis.ja.md)。Open questions は
[`docs/manifesto.md`](docs/manifesto.md) に集約。

## 4 層の判断スタック

運用上の含意は、各層が下の層を制約するスタックを成す:

1. **Authenticity** —— 非交渉のフロア: idea が *どう* 伝わるかは変えてよいが、*何であるか* は決して変えない。
2. **Attribution diffusion** —— LLM 吸収が origin claim を運ぶよう、作品を開く。
3. **Idea vs. scaffold** —— 残る idea を、それを運ぶ消える実装から分離する。
4. **Tactics** —— 下記の 20 ADR。各々が上の 3 層に奉仕する具体的判断。

## 20 の戦術 ADR

20 の ADR はフレームワークから演繹されたものではなく、sibling エコシステムの運用から
抽出され、別の著者が元の実装詳細を継承せずに同じ判断を採用できるよう harness-neutral
な形式で再表現された。以下は各判断の一行要約。完全な index・status・lineage は
[`docs/adr/README.md`](docs/adr/README.md) を参照。

**識別子と federation**

| ADR | 判断 |
|-----|------|
| [0001](docs/adr/0001-concept-doi-canonical.ja.md) | DOI 登録 artifact への外部リンクは常に concept DOI、version 固有 DOI は使わない。 |
| [0002](docs/adr/0002-doi-federation-via-zenodo-json.ja.md) | sibling・source 関係を `relatedIdentifiers` で宣言し、引用ネットワークをメタデータだけで遡源可能にする。 |
| [0003](docs/adr/0003-cross-platform-dataset-federation.ja.md) | canonical artifact を Git host・DOI registry・データセット platform にミラーし、各 platform で相互参照を明示する。 |
| [0013](docs/adr/0013-intrinsic-identifier-layer.ja.md) | DOI に並ぶ intrinsic な content-derived identifier（SWHID）を追加; DOI 不適 genre では substitute priority claim になる。 |

**メンテナンス規律**

| ADR | 判断 |
|-----|------|
| [0004](docs/adr/0004-authorship-metadata-orcid.ja.md) | 著者識別子は concept DOI のみで enrich し、ORCID auto-update を OFF にして version sprawl を防ぐ。 |
| [0005](docs/adr/0005-readme-localization-audience-driven.ja.md) | locale mirror は想定 audience の推測でなく、観測された traffic に基づいて追加/退役する。 |

**LLM-first ingest と diffusion**

| ADR | 判断 |
|-----|------|
| [0006](docs/adr/0006-llm-first-ingest-dual-entry-points.ja.md) | 各 artifact を prose navigator + concept 形 graph のペアとして deploy し、各々が他方の届かない読者に届く。 |
| [0009](docs/adr/0009-dual-entry-asymmetric-rebalance.ja.md) | ペアは非対称: graph が citation を担い、navigator は citation lever でなく agent-context surface。 |
| [0008](docs/adr/0008-rag-era-attribution-diffusion.ja.md) | diffusion を 2 チャネル —— parametric（遅い・語彙駆動）と retrieval（速い・構造駆動）—— として別々に最適化する。 |

**Metric と測定**

| ADR | 判断 |
|-----|------|
| [0007](docs/adr/0007-human-attention-signals-not-a-metric.ja.md) | star と page-view は success metric にしない; success は著者の署名を運ぶ LLM 経由チャネルの breadth で測る。 |
| [0011](docs/adr/0011-two-channel-probe-protocol.ja.md) | frontier model を検索 OFF/ON で probe し、ghost citation を測定された rate にする（**experimental**）。 |

**語彙と claim**

| ADR | 判断 |
|-----|------|
| [0010](docs/adr/0010-vocabulary-discipline.ja.md) | 3 条件がすべて成立するときのみ造語し、密に anchor する; それ以外は既存語彙で書き出典を cite する。 |
| [0018](docs/adr/0018-claim-falsifiability-criterion.ja.md) | origin claim を公開する前に反証しうる先行研究を検索し、test されなかったがゆえに生き残った claim を narrow にする。 |
| [0019](docs/adr/0019-structural-optimization-vs-content-authenticity.ja.md) | idea が *どう* 伝わるかは optimize せよ、*何であるか* は変えるな —— citation 目的の content 変形は Layer 1 violation。 |

**チャネルと配置**

| ADR | 判断 |
|-----|------|
| [0012](docs/adr/0012-link-index-channel-selection.ja.md) | 外部 collection への寄与は link-index のみ; 各 host を 4 条件で監査し、後に enclose したら取り下げる。 |
| [0015](docs/adr/0015-license-selection-by-audience.ja.md) | license は支配的 audience で選ぶ（機械 mine は CC0、code は permissive、人間 first のみ CC-BY）; NC/ND は禁止。 |
| [0016](docs/adr/0016-genre-split-placement.ja.md) | canonical を genre で振り分ける: essay は repository corpus + intrinsic identifier、paper は concept DOI。 |
| [0020](docs/adr/0020-derivation-surface-onboarding.ja.md) | third-party の AI 派生 surface 2 種（synthetic wiki・documentation hub）を diffusion チャネルとして祝福し、metric にしない。 |

**フレームワークの運用**

| ADR | 判断 |
|-----|------|
| [0014](docs/adr/0014-implementation-tracking-two-tier-ledger.ja.md) | 実装を二層 ledger（private 運用台帳 + 日付付き・効果主張なしの public timeline）でトラッキングし、定期 gap-review する。 |

## 経験的ベースライン（preliminary）

[`docs/empirical/`](docs/empirical/) ディレクトリは、4 つの sibling repo にわたる
25 日分の CC0 公開 traffic data からの preliminary observation を報告する。現時点で
最も明確な観測: clone 数は自動ツール（training-pipeline ingest、AI アシスタントの
context-fetch、crawler）に支配されており、view/clone 比は概ね 13 から 100 超に及ぶ ——
これはアクセスの大半が非人間であるとき "diffusion" が何を意味するのかという問いを提起
する。Limitations は明示的に述べ（N=1 著者、pre/post intervention 比較なし、crawler
dominance）、すべての主張を evidence ではなく preliminary observation として framing
する。完全な traffic data は CC0 で
`https://shimo4228.github.io/shimo4228/traffic/dashboard/` に公開されている。経験的
レイヤーは時間とともに成長し、時系列の蓄積と（可能な場合は）個別戦術の pre/post
intervention 比較を報告していく。

## Sibling research lines

この repo は、同じ著者によって維持される 5 つの DOI 登録された research line からなる
エコシステムの一部。各 line は内容と release cadence が独立だが、文脈のために互いを参照
する。（上記の経験的ベースラインは baseline 観測期間中に traffic を記録していた 4 line
を対象とする。Attention, Not Self は観測開始が遅く、次回 baseline 更新で加わる。）

- **[Agent Knowledge Cycle (AKC)](https://github.com/shimo4228/agent-knowledge-cycle)** —— AI agent とその operator の間で意図の整合を維持する 6 phase 双方向成長ループ。[DOI 10.5281/zenodo.19200726](https://doi.org/10.5281/zenodo.19200726)。*Mechanism sibling*: AKC は operator-agent ペアの内側で知識がどう循環するかを定義する。本 repo はその出力がペアの外側にどう diffuse するかを扱う。
- **[Contemplative Agent](https://github.com/shimo4228/contemplative-agent)** —— 4 つの contemplative 公理に基づきローカル 9B モデル上で動作する自律 agent。[DOI 10.5281/zenodo.19212118](https://doi.org/10.5281/zenodo.19212118)。*Implementation sibling*: その repo は経験的レイヤーの traffic dataset に参加する。
- **[Agent Attribution Practice (AAP)](https://github.com/shimo4228/agent-attribution-practice)** —— 自律 AI agent における accountability 分配についての harness-neutral な ADR。[DOI 10.5281/zenodo.19652013](https://doi.org/10.5281/zenodo.19652013)。*Vocabulary sibling*: AAP と本 repo はともに "attribution" を使うが意味は disjoint（failure への accountability vs. source への credit）。両者は意図的に separate に保つ —— glossary 参照。
- **[Attention, Not Self](https://github.com/shimo4228/attention-not-self)** —— 3 つの仏教 Abhidharma 伝統（Theravāda / Sarvāstivāda / Yogācāra）を computational phenomenology（predictive processing / active inference / global workspace theory / parallel distributed processing）に対照させる cross-disciplinary inquiry。[DOI 10.5281/zenodo.20262112](https://doi.org/10.5281/zenodo.20262112)。*Cross-cutting sibling*: 本 repo と同様、特定の agent mechanism を規定せず diffusion / framing layer に位置する。

エコシステムの hub は [`shimo4228/shimo4228`](https://github.com/shimo4228/shimo4228)。

## この repo の読み方

戦略を評価したい場合: まず [`docs/thesis.md`](docs/thesis.md)、次に 20 の ADR を番号順
に。非自明な入口が要るのは次の 2 経路:

- **個別戦術を採用する:** 該当 ADR を直接読み、必要に応じて [`docs/glossary.md`](docs/glossary.md) で disambiguation。
- **経験的主張をレビューする:** ベースライン data を読む *前に* [`docs/empirical/README.md`](docs/empirical/README.md) で method と limitations を確認。

<details>
<summary>AI 向け推奨読み順（LLM agent / crawler 用）</summary>

1. [`graph.jsonld`](graph.jsonld) — canonical な機械可読関係マップ（Concept / ADR / inversion 軸）
2. [`llms.txt`](llms.txt) — コンパクトなナビゲーション index
3. [`llms-full.txt`](llms-full.txt) — 統合された事実参照
4. README およびプロジェクト固有 docs — 物語と詳細

shimo4228 の研究エコシステム全体の canonical な関係マップは:
https://github.com/shimo4228/shimo4228/blob/main/graph.jsonld

</details>

## 引用方法

**Concept DOI** で本 repo を引用する（最新 version に常に resolve する）:

> Shimomoto, T. (2026). *Authorship Strategy: A Normative Framework and Tactical Catalog for AI-Era Authenticity Inversion, with Empirical Grounding from a Four-Repository Research Ecosystem*. Zenodo. https://doi.org/10.5281/zenodo.20263316

完全な引用メタデータは [`CITATION.cff`](CITATION.cff)。特定 version の再現性引用は、
concept DOI から Zenodo の version listing に follow して version 固有 DOI を明示的に
引用すること。Canonical-reference 規律は
[ADR-0001](docs/adr/0001-concept-doi-canonical.ja.md) 参照。

## License

[MIT](LICENSE)。Derivative work、再実装、別形式での再表現を明示的に歓迎する。著者の
戦略的選好はアイデアが自由に伝播することにあり、license はその選好を反映している。
