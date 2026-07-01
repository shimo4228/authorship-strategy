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
な形式で再表現された。関心ごとに 7 つのクラスタに分かれる:

- **識別子と federation**（0001–0003, 0013）—— concept-DOI canonical reference、メタデータ層 federation、クロスプラットフォーム ミラー、intrinsic な content-derived identifier（SWHID）。
- **メンテナンス規律**（0004–0005）—— 維持コストを想定状態でなく観測された証拠に対して amortize する。
- **LLM-first ingest と diffusion**（0006, 0008, 0009）—— prose navigator + concept graph の entry ペア（非対称: citation を担うのは graph）、diffusion を parametric と retrieval の 2 チャネルに分割。
- **Metric と測定**（0007, 0011）—— human-attention の vanity metric を拒否し、ghost citation を two-channel probe で測定する。
- **語彙と claim**（0010, 0018, 0019）—— 控えめに造語して密に anchor、origin claim を先行研究で test、transmission は optimize し content は変えない。
- **チャネルと配置**（0012, 0015, 0016, 0020）—— 外部寄与は link-index、license は audience 駆動、canonical は genre で振り分け、AI 派生 surface を祝福。
- **フレームワークの運用**（0014）—— 二層 ledger + 定期 gap-review。

各 ADR のタイトル・status、完全な index と lineage は
[`docs/adr/README.md`](docs/adr/README.md) を参照。

## 経験的ベースライン（preliminary）

[`docs/empirical/`](docs/empirical/) 層は 2 つの instrument からの preliminary
observation を報告する。どちらもエコシステム hub
[`shimo4228/shimo4228`](https://github.com/shimo4228/shimo4228) で運用され、CC0
で公開されている:

- **Traffic** —— sibling repo 群にわたる日次の clone/view スナップショット（[raw data](https://github.com/shimo4228/shimo4228/tree/main/traffic)、[dashboard](https://shimo4228.github.io/shimo4228/traffic/dashboard/)）。現時点で最も明確な観測: clone 数は自動ツール（training-pipeline ingest、AI アシスタントの context-fetch、crawler）に支配されており、view/clone 比は概ね 13 から 100 超に及ぶ —— これはアクセスの大半が非人間であるとき "diffusion" が何を意味するのかという問いを提起する。
- **Naming probe** —— [ADR-0011](docs/adr/0011-two-channel-probe-protocol.ja.md) の two-channel probe protocol。frontier model を検索抑制と検索有効の両設定で probe し、ghost citation を測定された rate にする（[raw probe logs](https://github.com/shimo4228/shimo4228/tree/main/probes)）。

Limitations は load-bearing で明示的に述べる（N=1 著者、pre/post intervention 比較
なし、crawler dominance、single-run probe）。すべての主張を evidence ではなく
preliminary observation として framing する。経験的レイヤーは時間とともに成長し、
時系列の蓄積と（可能な場合は）個別戦術の pre/post 比較を報告していく。

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

完全な引用メタデータは [`CITATION.cff`](CITATION.cff)。schema.org ベースの
[`codemeta.json`](codemeta.json)（Software Heritage の metadata indexer が読む形式）
としても併置している。特定 version の再現性引用は、
concept DOI から Zenodo の version listing に follow して version 固有 DOI を明示的に
引用すること。Canonical-reference 規律は
[ADR-0001](docs/adr/0001-concept-doi-canonical.ja.md) 参照。

## License

[MIT](LICENSE)。Derivative work、再実装、別形式での再表現を明示的に歓迎する。著者の
戦略的選好はアイデアが自由に伝播することにあり、license はその選好を反映している。
