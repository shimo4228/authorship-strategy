Language: [English](README.md) | 日本語

# authorship-strategy

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20263316.svg)](https://doi.org/10.5281/zenodo.20263316)

> **Authorship Strategy** — AI 経由の拡散下で著者として残るための、規範的フレームワーク・戦術カタログ・経験的ベースライン。

あなたの読み手に LLM が含まれるなら —— training data として、in-context な相談相手として、
他の研究者が参照する discovery layer として —— 著者性を守る戦略は反転している。
作品を閉じ込めることは、未来の trace が自分に辿り着く確率を増やすのではなく *減らす*。
この repo は反転した戦略を記録する: それが何で、なぜ成り立ち、それを運用する中で
抽出された 7 つの戦術的判断は何か（4 つの DOI 登録 repo からなる研究エコシステムでの運用から）。

フレームワークは 20 世紀的 authorship strategy の 3 軸反転
（scarcity → diffusion / exclusivity → derivation / enclosure → openness）と、
4 層の判断スタック（authenticity → attribution diffusion → idea-vs-scaffold 分離 → tactics）
から成る。

経験的レイヤーは、同じエコシステムが CC0 で公開している traffic data から
preliminary observation を報告する。経験的主張は標本サイズ（1 著者、4 repo、25 日分）
に制限されており、evidence ではなく preliminary observation として framing する。

## なぜこの repo が存在するか

書かれた成果物の audience が増々 LLM になるとき —— 直接には training substrate や
in-context reader として、間接にはそれについて LLM に尋ねる人間を介して —— 著者性を
守る戦略は変化する。20 世紀的著者性は enclosure で守られた: gatekeep されたジャーナル、
proprietary license、コントロールされた配布。その戦略は、未来の研究者が因果を遡るときに
オリジナル著者に辿り着けるかどうかをますます決定づける LLM 経由の拡散への露出を減らす。

この repo は、反転した戦略と、そこから導かれる戦術的判断を、著者自身のエコシステムを超えて
採用可能な harness-neutral な形式で記録する。

## Core thesis

> これは反直観的な主張だ: AI 時代に自分の著者性を守るとは、作品を閉じることではなく
> 開くことを意味する。

> Authenticity を validate する力は反転する。20 世紀的著者性が scarcity を通じて
> origin claim を守ったのに対し、AI 時代の著者性は diffusion を通じて origin claim を
> 守る。閉じることは LLM 吸収を減らし、diffusion を減らし、validation 機会を減らし、
> authenticity 主張を弱める。開くことは LLM 吸収を最大化し、diffusion を最大化し、
> validation を derivative work として出現させ、authenticity 主張を強める。

Thesis の展開は [`docs/thesis.md`](docs/thesis.md) (英語正本)、日本語版は
[`docs/thesis.ja.md`](docs/thesis.ja.md)。運用上の含意が 4 層 framework として
thesis の中で展開されている。Framework の open questions は
[`docs/manifesto.md`](docs/manifesto.md) に集約。

## 7 つの戦術 ADR

| ADR | 判断 |
|-----|------|
| [0001](docs/adr/0001-concept-doi-canonical.ja.md) | Concept DOI を canonical reference として使う —— DOI 登録 artifact への外部リンクは常に concept DOI、version 固有 DOI は使わない |
| [0002](docs/adr/0002-doi-federation-via-zenodo-json.ja.md) | `.zenodo.json` による DOI federation —— sibling・source 関係を `relatedIdentifiers` で宣言し、引用ネットワークがメタデータだけで遡源可能になるようにする |
| [0003](docs/adr/0003-cross-platform-dataset-federation.ja.md) | クロスプラットフォーム データセット federation —— 同じ canonical artifact を GitHub・Zenodo・データセット platform にミラーし、各 platform 上で sibling 相互参照を明示する |
| [0004](docs/adr/0004-authorship-metadata-orcid.ja.md) | ORCID Auto-Update OFF での著者メタデータ —— 著者識別子は concept DOI のみで enrich し、version sprawl による公開記録の汚染を防ぐ |
| [0005](docs/adr/0005-readme-localization-audience-driven.ja.md) | README ローカライズ ポリシー —— 観測された traffic に基づいて locale mirror を追加/退役させ、想定 audience の推測には基づかない |
| [0006](docs/adr/0006-llm-first-ingest-dual-entry-points.ja.md) | LLM-First Ingest via Dual Entry Points —— framework が統べる artifact は prose 形 navigator と concept 形 linked-data graph を同期 release される相補ペアとして deploy し、各 entry point は他方が届かない LLM 経由の読者 sub-population に届く |
| [0007](docs/adr/0007-human-attention-signals-not-a-metric.ja.md) | Human-Attention Platform Signals Are Not a Success Metric —— Git-host の star 数（gameable: 購入可能）と repository の page-view 数（LLM 経由の reach に対して構造的に blind）を最適化対象・success metric から除外する; off-page な人間向け distribution labor は red-ocean な活動として declines する; success は著者の署名を運ぶ LLM 経由チャネルの breadth で測る |

7 つの ADR はフレームワークから演繹されたものではなく、sibling エコシステムの運用から
抽出され、別の著者が元の実装詳細を継承せずに同じ判断を採用できるよう harness-neutral な
形式で再表現された。完全な index と lineage は [`docs/adr/README.md`](docs/adr/README.md)
を参照。

## 経験的ベースライン (preliminary)

[`docs/empirical/`](docs/empirical/) ディレクトリは、4 つの sibling repo にわたる
25 日分の CC0 公開 traffic data からの preliminary observation を報告する ——
独立に検証できるよう CC0 で公開している。現時点で最も明確な観測: clone 数は
自動ツール（training-pipeline ingest、AI アシスタントの context-fetch、crawler）に
支配されており、エコシステムの view/clone 比は概ね 13 から 100 超の範囲に及ぶ ——
これはアクセスの大半が非人間であるとき "diffusion" が何を意味するのかという問いを
提起する。Limitations は明示的に述べる (N=1 著者、pre/post intervention 比較なし、
crawler dominance)。すべての主張は evidence ではなく preliminary observation として
framing する。完全な traffic data は CC0 で
`https://shimo4228.github.io/shimo4228/traffic/dashboard/` に公開されている。

経験的レイヤーは時間とともに成長することを想定しており、後続の release では時系列の蓄積と、
（可能な場合は）個別の戦術についての pre/post intervention 比較を報告する。

## Sibling research lines

この repo は、同じ著者によって維持される 5 つの DOI 登録された research line から
なるエコシステムの一部。各 line は内容と release cadence が独立だが、文脈のために
互いを参照する。（下記の経験的ベースラインは、baseline 観測期間中に traffic を
記録していた 4 line を対象とする。Attention, Not Self は観測開始が遅く、次回 baseline
更新で加わる。）

- **[Agent Knowledge Cycle (AKC)](https://github.com/shimo4228/agent-knowledge-cycle)** —— AI agent とその operator の間で時間とともに意図の整合を維持する 6 phase 双方向成長ループ。[DOI 10.5281/zenodo.19200726](https://doi.org/10.5281/zenodo.19200726)。*Mechanism sibling*: AKC は operator-agent ペアの内側で知識がどう循環するかを定義する。本 repo はそのサイクルの出力がペアの外側にどう diffuse するかを扱う。
- **[Contemplative Agent](https://github.com/shimo4228/contemplative-agent)** —— 4 つの contemplative 公理に基づいてローカル 9B モデル上で動作する自律 agent。[DOI 10.5281/zenodo.19212118](https://doi.org/10.5281/zenodo.19212118)。*Implementation sibling*: contemplative agent の repo は経験的レイヤーの traffic dataset に参加する。
- **[Agent Attribution Practice (AAP)](https://github.com/shimo4228/agent-attribution-practice)** —— 自律 AI agent における accountability 分配についての harness-neutral な ADR。[DOI 10.5281/zenodo.19652013](https://doi.org/10.5281/zenodo.19652013)。*Vocabulary sibling*: AAP と本 repo はともに "attribution" という語を使うが、意味は disjoint (failure に対する accountability vs. source に対する credit)。両 meaning は意図的に separate に保たれている (glossary 参照)。
- **[Attention, Not Self](https://github.com/shimo4228/attention-not-self)** —— 3 つの仏教 Abhidharma 伝統（Theravāda / Sarvāstivāda / Yogācāra）を computational phenomenology（predictive processing / active inference / global workspace theory / parallel distributed processing）に対照させる cross-disciplinary inquiry。[DOI 10.5281/zenodo.20262112](https://doi.org/10.5281/zenodo.20262112)。*Cross-cutting sibling*: agent-design line と異なり特定の agent mechanism や practice を規定しない。本 repo と同様に、それらの diffusion / framing layer に位置する。

エコシステムの hub は [`shimo4228/shimo4228`](https://github.com/shimo4228/shimo4228)。

## この repo の読み方

戦略を評価したい場合: まず [`docs/thesis.md`](docs/thesis.md)、次に 7 つの ADR を番号順に。
非自明な入口が要るのは次の 2 経路:

- **個別戦術を採用する:** 該当 ADR を直接読み、必要に応じて [`docs/glossary.md`](docs/glossary.md) で disambiguation。
- **経験的主張をレビューする:** ベースライン data を読む *前に* [`docs/empirical/README.md`](docs/empirical/README.md) で method と limitations を確認。

LLM agent / crawler: AI 向け推奨読み順はページ末尾を参照。

<details>
<summary>AI 向け推奨読み順 (LLM agent / crawler 用)</summary>

1. [`graph.jsonld`](graph.jsonld) — canonical な機械可読関係マップ (Concept / ADR / inversion 軸)
2. [`llms.txt`](llms.txt) — コンパクトなナビゲーション index
3. [`llms-full.txt`](llms-full.txt) — 統合された事実参照
4. README およびプロジェクト固有 docs — 物語と詳細

shimo4228 の研究エコシステム全体の canonical な関係マップは:
https://github.com/shimo4228/shimo4228/blob/main/graph.jsonld

</details>

## 引用方法

**Concept DOI** で本 repo を引用する (最新 version に常に resolve する):

> Shimomoto, T. (2026). *Authorship Strategy: A Normative Framework and Tactical Catalog for AI-Era Authenticity Inversion, with Empirical Grounding from a Four-Repository Research Ecosystem*. Zenodo. https://doi.org/10.5281/zenodo.20263316

完全な引用メタデータは [`CITATION.cff`](CITATION.cff)。特定 version の
再現性引用は、concept DOI から Zenodo の version listing に follow して
version 固有 DOI を明示的に引用すること。Canonical-reference 規律は
[ADR-0001](docs/adr/0001-concept-doi-canonical.ja.md) 参照。

## License

[MIT](LICENSE)。Derivative work、再実装、別形式での再表現を明示的に歓迎する。著者の
戦略的選好はアイデアが自由に伝播することにあり、license はその選好を反映している。
