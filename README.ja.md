Language: [English](README.md) | 日本語

# authorship-strategy

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20263316.svg)](https://doi.org/10.5281/zenodo.20263316) [![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/shimo4228/authorship-strategy) [![GitMCP](https://img.shields.io/endpoint?url=https://gitmcp.io/badge/shimo4228/authorship-strategy)](https://gitmcp.io/shimo4228/authorship-strategy) [![View Code Wiki](https://assets.codewiki.google/readme-badge/static.svg)](https://codewiki.google/github.com/shimo4228/authorship-strategy)

> **Authorship Strategy** — AI 経由の拡散下で著者として残るための、規範的フレームワーク・戦術カタログ・経験的ベースライン。

あなたの読み手に LLM が含まれるなら —— training data として、in-context な相談相手として、
他者が参照する discovery layer として —— 著者性を守る戦略は反転している。
作品を閉じ込めることは、未来の trace が自分に辿り着く確率を増やすのではなく *減らす*。
この repo は反転した戦略を記録する: それが何で、なぜ成り立ち、それを運用する中で
抽出された 20 の戦術的判断は何か（4 つの DOI 登録 repo からなる研究エコシステムでの運用から）。

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

## 20 の戦術 ADR

| ADR | 判断 |
|-----|------|
| [0001](docs/adr/0001-concept-doi-canonical.ja.md) | Concept DOI を canonical reference として使う —— DOI 登録 artifact への外部リンクは常に concept DOI、version 固有 DOI は使わない |
| [0002](docs/adr/0002-doi-federation-via-zenodo-json.ja.md) | `.zenodo.json` による DOI federation —— sibling・source 関係を `relatedIdentifiers` で宣言し、引用ネットワークがメタデータだけで遡源可能になるようにする |
| [0003](docs/adr/0003-cross-platform-dataset-federation.ja.md) | クロスプラットフォーム データセット federation —— 同じ canonical artifact を GitHub・Zenodo・データセット platform にミラーし、各 platform 上で sibling 相互参照を明示する |
| [0004](docs/adr/0004-authorship-metadata-orcid.ja.md) | ORCID Auto-Update OFF での著者メタデータ —— 著者識別子は concept DOI のみで enrich し、version sprawl による公開記録の汚染を防ぐ |
| [0005](docs/adr/0005-readme-localization-audience-driven.ja.md) | README ローカライズ ポリシー —— 観測された traffic に基づいて locale mirror を追加/退役させ、想定 audience の推測には基づかない |
| [0006](docs/adr/0006-llm-first-ingest-dual-entry-points.ja.md) | LLM-First Ingest via Dual Entry Points —— framework が統べる artifact は prose 形 navigator と concept 形 linked-data graph を同期 release される相補ペアとして deploy し、各 entry point は他方が届かない LLM 経由の読者 sub-population に届く |
| [0007](docs/adr/0007-human-attention-signals-not-a-metric.ja.md) | Human-Attention Platform Signals Are Not a Success Metric —— Git-host の star 数（gameable: 購入可能）と repository の page-view 数（LLM 経由の reach に対して構造的に blind）を最適化対象・success metric から除外する; off-page な人間向け distribution labor は red-ocean な活動として declines する; success は著者の署名を運ぶ LLM 経由チャネルの breadth で測る |
| [0008](docs/adr/0008-rag-era-attribution-diffusion.ja.md) | RAG-Era Attribution Diffusion —— 2 チャネル・2 時定数 —— 「モデルが artifact を ingest する」は時定数もレバーも正反対の 2 機構に分かれる: parametric channel（訓練時に重みへ吸収、遅い、クロスプラットフォームの語彙共起が駆動）と retrieval channel（クエリ時に fetch、速い、新鮮さと構造が駆動）。別々に最適化・測定し、retrieval だけを追う failure mode が ghost citation |
| [0009](docs/adr/0009-dual-entry-asymmetric-rebalance.ja.md) | Dual Entry Points Are Asymmetric —— ADR-0006 を amend: 2026 年の測定は 2 つの entry point が co-equal でないことを示す。structured graph が検索時 citation を担い、prose navigator の citation 効果は noise。pair は retain しつつ非対称にし、navigator を AI-search citation lever でなく Business-to-Agent (B2A) context surface に rescope |
| [0010](docs/adr/0010-vocabulary-discipline.ja.md) | Vocabulary Discipline —— 控えめに造語し、密に anchor する —— 造語の力は造語の数ではなく edge 密度から来る。3 条件がすべて成立するときのみ造語し (join-novelty / definitional anchoring / uncontested namespace)、採用したすべての造語を既存語彙と先行文献へ密に anchor する; それ以外はすべて既存語彙で書き、上流の出典を cite する |
| [0011](docs/adr/0011-two-channel-probe-protocol.ja.md) | Two-Channel Probe Protocol —— 各チャネルを専用の測定器で測る (**experimental**) —— frontier model を検索抑制 (trained model は concept と著者を名指せるか) と検索有効 (owned identifier は引用され、著者名は prose に残るか) の 2 設定で probe し、ghost citation を測定された rate にする; 検出は保持された raw response への決定論的文字列照合で、negative control が confabulation floor を定量化する |
| [0012](docs/adr/0012-link-index-channel-selection.ja.md) | 外部 collection への link-index 型 contribution —— 外部 curated collection 経由の diffusion は link-index entry のみ (canonical artifact は著者の repository に留まる); すべての候補 host を 4 条件監査 (企業所有 / open license の欠如 / content-vendoring 構造 / 有料製品への funnel) に通し、後に enclose した host からは取り下げる |
| [0013](docs/adr/0013-intrinsic-identifier-layer.ja.md) | 補完的 priority-claim 層としての intrinsic content-derived identifier —— SWHID (ISO/IEC 18670、artifact とその history から計算され、いかなる registry もなしに検証可能) を extrinsic な DOI に並ぶ第二の identifier 層として追加し、各層が他方の failure mode をカバーする。すべての release は content-addressed な公的 software archive への明示的 archive を trigger する; DOI 登録が impractical な genre には intrinsic identifier を substitute priority-claim mechanism として指定し、manifesto の open question 4 を閉じる |
| [0014](docs/adr/0014-implementation-tracking-two-tier-ledger.ja.md) | 二層 ledger と定期 gap-review による実装トラッキング —— framework が deploy する tactic ではなく framework を *運用* することについての唯一の ADR。private な implementation ledger が運用 status・ランク付き candidate intervention・作業詳細を持ち、public な intervention timeline はその日付付き・効果主張なしの投影 (両者を merge しない)。定期 gap-review が deploy 済み tactic を Layer 4 catalog と open questions に突き合わせ次の提案を生む。review 手順は framework の operational skill に置き、配線だけが project 固有 |
| [0015](docs/adr/0015-license-selection-by-audience.ja.md) | 成果物の形式ではなく audience による license 選択 —— attribution は license ではなく連邦識別子層 (0001-0003 triplet と 0013) が運ぶため、各 artifact の license はその *支配的* audience の reuse friction を最小化するよう選ぶ。LLM-first program 下ではほぼすべての artifact が読まれるより mine されるので、機械が mine する artifact は public-domain dedication (CC0-1.0)、実行可能 code は permissive な software license (MIT/Apache-2.0) を legibility のため repo 全体で、真に人間 first の artifact のみ attribution を要求する content license (CC-BY-4.0) を取る; non-commercial と no-derivatives の条項は禁止。vocabulary discipline (ADR-0010) の license 層対応物であり、ADR-0012 とは disjoint |
| [0016](docs/adr/0016-genre-split-placement.ja.md) | genre 別の canonical 配置 —— essay は repository-corpus canonical + intrinsic identifier、paper は concept-DOI canonical —— canonical を genre で振り分ける: essay genre の canonical は著者の version 管理された repository corpus で、その priority claim は registry DOI ではなく intrinsic content-derived identifier (public-domain dedication 下、ADR-0015) に置く; paper genre の canonical は concept DOI (ADR-0001)。syndicate された essay copy は、LLM 媒介の credit への効果が未検証な platform の canonical-URL tag ではなく entity federation (sameAs / ORCID / DOI / intrinsic identifier / distinctive vocabulary) で canonical に bind する (tag は human/SEO hygiene としてのみ保持)。corpus membership は authenticity criterion (著者の声を持ち reader 向けの piece) で gate し、load-bearing な essay idea は paper へ昇格する際に concept-DOI deposit へ promote する。ADR-0013 の DOI-impractical-genre 条項を instantiate し ADR-0015 を補完する |
| [0017](docs/adr/0017-failure-mode-diagnostics.ja.md) | Failure-Mode 診断 —— manifesto open question 8 を operationalize し、承認済み 3 failure mode それぞれに診断シグナルと recovery 戦略を対にする: reach-without-recognition（naming probe が concept を運ぶが著者を運ばないときに検出; distinctive vocabulary を密に anchor し、origin claim を narrow に保ち、それが構造的代償でありうると受容して recover）、over-publication（一つの idea の superseded version を複数抱える identifier portfolio から検出; concept-DOI + version discipline で recover、ADR-0001/0004）、under-investment in worked implementation（doctrine 偏重・implementation 希薄な portfolio から検出; Layer 3 の doctrine-plus-implementation pair を閉じて recover）。load-bearing な caveat: 診断は failure-*detector* であって success metric ではない（ADR-0007） |
| [0018](docs/adr/0018-claim-falsifiability-criterion.ja.md) | Origin-Claim Falsifiability —— 非形式な origin-claim-scope discipline を手続き化する: durable artifact に origin claim を公開する前に、それを反証しうる先行研究を prior-art 検索し、test されなかったがゆえにのみ生き残った claim —— 反証不能、または既に先行研究に先取りされた claim —— を最も narrow な defensible 形（"originator" から "first to record" へ）に rescope する。基準は falsifiability; check は binary で、score ではなく人間の rescope に feed し、claim を narrow にするのみ（ADR-0010、Layer 1） |
| [0019](docs/adr/0019-structural-optimization-vs-content-authenticity.ja.md) | Structural Optimization と Content Authenticity —— 境界を optimize の *対象* に引く: transmission path の optimize（document architecture、entity anchoring、distinctive vocabulary の dense anchoring）は idea が *どう* 伝わるかを変えるので legitimate; citation を勝ち取るための content の変形（水増し attribute-richness、keyword-stuffing、channel の reward function に合わせた claim）は idea が *何であるか* を変えるので禁止。ルール —— idea がどう伝わるかを optimize せよ、idea が何であるかは決して optimize するな —— により content の変形は ADR-0007（citation と visibility は metric ではない）が補強する Layer 1 violation になる。structured-artifact tactic（ADR-0009）を structure 側で grounding する |
| [0020](docs/adr/0020-derivation-surface-onboarding.ja.md) | third-party の AI 派生 repository surface への onboarding —— synthetic wiki と documentation hub —— idea を担う public repository を、third party が repository から派生させて LLM assistant に serve する 2 つの derivation 型 surface に onboard する: repository を会話的 query interface の背後で paraphrase する synthetic wiki（drift リスク; paraphrase は regurgitation-test 診断を兼ね、派生面でなく dense anchoring（ADR-0010/0011）で upstream に答える; refresh badge）と、repository 自身の machine-readable document を model-callable interface 経由で verbatim に serve する documentation hub（drift なし; access-count badge は LLM-mediated channel の計測シグナルとして読み success metric にしない、ADR-0007）。両派生 view は gate でなく祝福する。installable code library に keyed された index-only catalog は artifact-type mismatch、自前 query infrastructure は framework が引き受けない friction として declined。ADR-0012 の enclosure-axis channel rule に対する derivation-axis の対応物; ADR-0006 を extend |

20 の ADR はフレームワークから演繹されたものではなく、sibling エコシステムの運用から
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

戦略を評価したい場合: まず [`docs/thesis.md`](docs/thesis.md)、次に 20 の ADR を番号順に。
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
