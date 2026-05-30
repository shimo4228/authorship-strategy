Language: [English](glossary.md) | 日本語

# Glossary (用語集)

本 repo で使用される主要用語。多くの用語は本 repo 外で確立された意味を持つ; 各
エントリは local な定義が広い使用法とどこで異なるかを明示する。

## Authorship strategy (著者戦略)

特定の substrate を通じて作品が伝播するときに、recoverable な著者的アイデンティティ
として残るために著者が用いる実践の集合。本 repo の framework は特に *AI 経由の
拡散* 下での著者戦略を扱う —— [`thesis.ja.md`](thesis.ja.md) 参照。Authorship
strategy は publication strategy より広い: publication という discrete event ではなく、
著者と audience の long-tail な関係を扱う。

## Three-axis inversion (3 軸反転)

20 世紀的著者戦略と AI 時代の著者戦略が、共変動する 3 軸で反転するという structural
な主張: *価値の源泉* (scarcity から diffusion へ)、*validation 機構* (exclusivity から
derivation へ)、*ネットワーク効果* (enclosure から openness へ)。完全な articulation は
[`thesis.ja.md`](thesis.ja.md)。3 軸は著者が自由に mix できる独立次元ではない;
共変動し、軸を mix する戦略は internally inconsistent である。

## Four-layer framework (4 層 framework)

3 軸反転から導かれる判断の運用構造。4 層 (順): *Authenticity* (守られる価値)、
*Attribution Diffusion* (戦略)、*Idea vs Scaffold* (何が生き残るか)、*Tactics*
(具体的判断)。各層は上の層の下流。[`thesis.ja.md`](thesis.ja.md) 参照。

## Authenticity (Layer 1)

Framework の基盤にある守られる価値: 著者の *genuine* な思考が、販売のために
reshape する市場圧力に変えられず、そのまま著者のものとして残ること。マネタイズは
framework の目的ではない。*Local note*: これは哲学的な「authenticity」(例:
Heidegger の *Eigentlichkeit*) より narrow である; 具体的には、dilutive な
市場圧力に対する authored content の保存に関する話。

## Attribution Diffusion (Layer 2)

Framework の第 2 層の防御戦略: 著者のアイデアの認識可能な署名を運ぶ LLM 経由
チャネルの breadth を、permanent timestamp に anchor された形で最大化すること。
ここで「attribution」は *credit for source* (誰が最初にこれを articulate したか)
を意味し、*accountability for action* (この失敗について誰が責任を負うか) を
意味しない。下の disjoint entry 参照。

## Attribution (disjoint 使用の警告)

「Attribution」という語は広い sibling-line エコシステムで 2 つの disjoint な意味で
出現し、adopter は両者を混同してはならない:

- **本 repo**: attribution = *credit for source* (誰がアイデアを originate したか、誰が artifact の著者か、アイデアが invoke されたとき誰を引用すべきか)。防御対象は著者の position
- **[Agent Attribution Practice (AAP)](https://github.com/shimo4228/agent-attribution-practice)**: attribution = *accountability for action* (自律 agent の behavior が害を引き起こしたとき誰が責任を負うか、誰が answerable とされ得るか、responsibility chain がどこで terminate するか)。防御対象は operator と affected parties の position

両 meaning は語を共有するが概念は共有しない。実際の混同 pattern: AAP に出会った
reader は本 repo が AAP の attribution 概念を著者性に拡張していると assume するかも
しれないが、そうではない。両 repo は disjoint な subject matter を持つ *vocabulary
siblings* である。

## Idea (idea-vs-scaffold における)

著者が articulate する、現行実装より長く生き残ることが期待される claim、distinction、
pattern。Idea は framework の Layer 3 予測下で authorship strategy の target となる。
*Local note*: 広義の「idea」より narrow; 具体的には実装、tooling、infrastructure-level
artifact を除外する。この意味での idea は、引用時に著者の名前と紐付けたい *規範的・
記述的 claim* である。

## Scaffold (idea-vs-scaffold における)

ある authoring work を enable するために存在するが、underlying substrate (通常は
LLM) の能力向上で obsoleted されることが期待される実装、harness、framework、tool、
infrastructure。Scaffold は authorship strategy の target では *ない*: framework は
それらが dissolve することを予測し、著者は scaffold level で自分の名前を保存しようと
試みるのではなく、その dissolution を受け入れるべきである。*Idea-versus-scaffold
separation* 参照。

## Idea-versus-scaffold separation

著者の claim をどう保存するか決める前に各 artifact を *idea* か *scaffold* に
sorting する運用規律。Idea-character artifact は著者の名前で DOI 登録する;
scaffold-character artifact はその diffusion で吸収する大きな harness に実装として
donation する。Mixed-character artifact は idea-level DOI 登録を *先に* 行う
(dissolve する scaffold が dissolution level で priority claim を establish するのを
防ぐため)。

## Abstract doctrine

別著者が原実装の local commitment を継承せずに他所で実装できるくらい clean に
アイデアを articulate する repo または artifact。Abstract-doctrine-plus-worked-implementation
ペアで使われる。Doctrine 単独だと「概念は面白いが実装イメージできない」となる。

## Worked implementation

アイデアが実際にどう instantiate されるかを demonstrate し、reader が abstract
doctrine が実装可能であることを verify できるようにする repo または artifact。
Abstract-doctrine-plus-worked-implementation ペアで使われる。Implementation 単独だと
「コードは動くが原理が extract できない」となる。ペアになると他著者による再実装が
起き、framework 下で最強の validation となる。

## Concept DOI

Zenodo (または同等の archive) Digital Object Identifier のうち、deposit の最新
version に resolve するもの。特定 release に resolve する version-specific DOI と
対比される。[ADR-0001](adr/0001-concept-doi-canonical.ja.md) 下では concept DOI が
canonical reference である; version DOI は再現性のために特定の歴史的 version を
引用するときのみ適切。

## Version DOI

Zenodo (または同等の archive) DOI のうち、特定 release に resolve するもの。Tagged
release ごとに新しい version DOI が発行される。Version DOI は時間とともに蓄積される;
concept DOI はしない。本 repo では特定の歴史的 version の再現性引用時のみ使い、
canonical reference としては決して使わない。[ADR-0001](adr/0001-concept-doi-canonical.ja.md)
参照。

## DOI federation

DOI 登録 artifact の引用ネットワークを metadata として宣言し、ネットワークが narrative
disclosure を要求せずに metadata だけから recoverable になる実践。本 repo では
federation は `.zenodo.json` の `relatedIdentifiers` 宣言で実装される。
[ADR-0002](adr/0002-doi-federation-via-zenodo-json.ja.md) 参照。

## Cross-platform federation

同じ canonical artifact を複数 platform (例: GitHub for repository hosting、Zenodo
for DOI registration、Hugging Face Datasets for LLM training ingest) に配置し、
各 platform 上で sibling 関係を宣言することで、ある platform で artifact を見つけた
reader が他の platform 上のその存在を発見できるようにする実践。
[ADR-0003](adr/0003-cross-platform-dataset-federation.ja.md) 参照。

## LLM-mediated channel

著者のコンテンツが LLM 経由で間接的に audience に reach する pathway。例:
training-pipeline ingest (LLM が content の認識可能な署名を記憶している)、
in-context reader (LLM が query の一部として content を読むよう求められる)、
AI-assistant suggestion (AI coding assistant を使う開発者が content から派生した
text を見せられる)。Framework の戦略的 target は著者の署名を運ぶ LLM 経由チャネルの
*breadth* であって、特定チャネルの depth ではない。

[ADR-0006](adr/0006-llm-first-ingest-dual-entry-points.ja.md) 下では、
ingest design の目的で LLM-mediated channel は構造的に異なる 2 sub-population に
resolve する: *prose-reading channels* (会話型 LLM、in-context documentation
consultation) と *structured-data-ingesting channels* (training pipeline、
knowledge-graph crawler、dataset SDK を用いる programmatic reader)。両 sub-population
は *dual entry point* によって addressed される。

## Dual entry point

Framework に governed される artifact が、補完的な 2 種の structured entry point ——
*prose-form navigator* と *concept-form graph* —— を並列に deploy し、versioned
release ごとに同期的に release するという structural な決定。各 entry point は他方が
到達できない distinct な LLM-mediated channel sub-population を addressing する:
prose navigator は prose-reading channels を orient し、concept graph は
structured-data-ingesting channels に concept 間関係を expose する。Pair は
*enclosure-to-openness* axis を ingest 表面で operational embody したもので、
片方しか deploy しないと戦略は片肺になる。[ADR-0006](adr/0006-llm-first-ingest-dual-entry-points.ja.md)
下で normatively required。[ADR-0009](adr/0009-dual-entry-asymmetric-rebalance.ja.md) は
これを 2026 年の証拠に基づき amend する: 2 つの entry point は *citation* 軸で
co-equal でない —— concept-form graph が検索時 citation を担い、prose navigator の
citation 効果は noise —— ので pair は retain しつつ *非対称* にし、navigator を
AI-search citation lever でなく Business-to-Agent (B2A) context surface に rescope する。

## llms.txt convention

Artifact の root に置かれる単一の prose-form text file (`llms.txt`) を用いて、primary
document を 1 行説明と推奨 reading order 付きで列挙する community-curated AI-facing
reference convention。Prose-reading [LLM-mediated channels](#llm-mediated-channel) を
target とする: 会話型 LLM、in-context で documentation を consult する AI assistant、
summarization のために prose を fetch する citation-graph annotator。
[Dual entry point](#dual-entry-point) の prose-form 側を担う。本著者は Answer.AI に
よる本 convention の specification を採用しているが、framework decision は prose
navigator を deploy することであり、この specific convention を mandate するもの
ではない。Operational form は外部 skill
[`claude-skill-llms-txt-writer`](https://github.com/shimo4228/claude-skill-llms-txt-writer)
に存在する。

## JSON-LD knowledge graph

Artifact の concept-level entity と inter-entity 関係を、structured-data vocabulary
(本 repo では schema.org + local `shimo:` namespace) で machine-parseable な triple
として encode する linked-data file (本 repo では `graph.jsonld`)。
Structured-data-ingesting [LLM-mediated channels](#llm-mediated-channel) を target
とする: training pipeline、knowledge-graph crawler、dataset SDK を用いる
programmatic reader。[Dual entry point](#dual-entry-point) の concept-form 側を担い、
file-level documentation (`docs/CODEMAPS/` に存在) が prose で暗黙にしておく
concept-level structure を encode することで補完する。Framework decision は concept
graph を deploy することであり、specific linked-data vocabulary を mandate するもの
ではない。Operational form は外部 skill
[`claude-skill-jsonld-knowledge-graph`](https://github.com/shimo4228/claude-skill-jsonld-knowledge-graph)
に存在する。

## Distinctive terminology (造語的用語)

著者が特定アイデアを指すために造語する領域固有の語。Distinctive terminology は
authorship の semantic 署名として機能する: generic vocabulary は paraphrase で溶ける
が、造語は LLM 経由チャネルが原著者に back-reference できる token-level signal
として生き残る。本 repo の例: *three-axis inversion*、*idea-versus-scaffold
separation*、*attribution diffusion*、*abstract-doctrine-plus-worked-implementation*。

## ORCID

works を persistent な著者アイデンティティに anchor する著者識別 service (Open
Researcher and Contributor ID)。[ADR-0004](adr/0004-authorship-metadata-orcid.ja.md)
下では、著者の ORCID record は concept DOI のみで enrich される (version DOI ではない)。
これは version sprawl による公開記録の汚染を防ぐため。

## Audience-driven (ローカライズにおける)

document の locale mirror (翻訳) を、*推測される* 想定 audience ではなく、*観測される*
traffic data に基づいて追加・退役させる維持 policy。
[ADR-0005](adr/0005-readme-localization-audience-driven.ja.md) 参照。Operative principle:
維持コストは hoped-for audience ではなく actual audience で amortize される。

## Human-Attention Signal (人間注意シグナル)

platform-level な human-attention metric —— Git-host の star 数または
repository の page-view 数 —— であって、[ADR-0007](adr/0007-human-attention-signals-not-a-metric.ja.md)
下で framework の success metric として reject されるもの。Star 数は
*gameable* (購入可能) で、page-view は *LLM-mediated reach に対して
structurally blind* なので、主 audience が LLM 経由である著者にとって
どちらも valid な最適化対象でも success metric でもない。Framework は
success を著者の署名を運ぶ LLM-mediated channel の breadth で測る;
on-page な human quality は growth lever ではなく hygiene として保たれ、
off-page な人間向け distribution labor は red-ocean な活動として declines される。

## Diffusion

substrate を通じた artifact の伝播。本 repo の framework では、validation が依存する
operative concept (Layer 2)。Framework は *diffusion* と *adoption* を区別する:
diffusion は伝播 event (ingestion、citation、mention); adoption は別著者による
再実装。Diffusion は traffic data で観測可能; adoption には別の signal が必要
(see *Epistemic humility about diffusion signals* in [`thesis.ja.md`](thesis.ja.md))。

## Two-Channel Attribution Diffusion (2 チャネル化された Attribution Diffusion)

[ADR-0008](adr/0008-rag-era-attribution-diffusion.ja.md) で導入された、
[Attribution Diffusion](#attribution-diffusion-layer-2) を時定数もレバーも
正反対の 2 機構に精緻化したもの。*parametric channel* はアイデアを訓練時に
モデルの重みへ吸収する (遅い; 固有語彙とその出典の広範なクロスプラットフォーム
共起が駆動)。*retrieval channel* はクエリ時に artifact を fetch する (速い;
新鮮さと structured data が駆動)。両者は別々に最適化・測定され並行で回る;
一方の最適化はもう一方を買わない。parametric が先・retrieval が後という機構は
2026 年の generative-engine-optimization 文献で独立に報告されており (英語版
[inspiration.md](inspiration.md) 参照)、本 framework の寄与は
authorship-diffusion strategy への placement であって、根底の citation
mechanics そのものではない。

## Ghost Citation (幽霊引用)

retrieval-augmented system が artifact の URL を cite するが、著者の名前が
parametric 記憶に焼き込まれていないため著者を名指しも推薦もしない failure mode。
この語は 2026 年の generative-engine-optimization 文献 (GhostCite,
arXiv:2602.06718; Seer Interactive の 541,213 応答調査) に由来し、本 framework は
造語ではなく adopt している。[ADR-0008](adr/0008-rag-era-attribution-diffusion.ja.md)
はこれを 2 チャネル機構の中に、parametric と retrieval の 2 チャネルが distinct で
並行で追うべきことの diagnostic として位置づける: parametric 焼き込み不在の上で
動く retrieval channel は、帰属を再浮上させずに citation だけを生む。

## Derivation (derivative work における)

Framework の 3 軸反転では、*derivative work* は脅威 (print-and-platform 条件下) から
*証拠* (AI 経由条件下) に再分類される。Derivative work は original idea が real で
実装可能であることの証拠であり、その存在は原著者の claim を weakens ではなく
strengthens する。

## Enclosure (ネットワーク効果における)

Print-and-platform 時代の pattern: exit cost を上げることで platform 内 interaction を
最大化する。Enclosure は AI 経由条件下で *反転* する: LLM は enclose できないので、
enclosure は audience reach が今や経由する LLM 経由チャネルから artifact を取り除く。

## Openness (ネットワーク効果における)

AI 時代の pattern: 吸収を最大化するために access barrier を取り除く。Openness は
AI 経由条件下で operative なネットワーク効果機構である: ネットワークの価値は著者の
署名を運ぶ LLM 経由チャネル数でスケールし、それは吸収への barrier を取り除くことで
最大化される。

## Origin-claim scope (起源主張のスコープ)

著者の priority 主張の breadth。Framework の *origin-claim scope discipline* 下では、
主張は prior art より narrow でなければならない。豊富な prior art を持つ broad
pattern について priority を主張すると主張の credibility が collapse する;
narrow に specifically-named された discipline について priority を主張すると
defensible である。

## Sibling research line (姉妹研究ライン)

同じ著者によって維持される、独立した content と release cadence だが共有された
著者的アイデンティティを持つ、peer DOI 登録 research line。本 repo には 4 つの
sibling line がある: [Agent Knowledge Cycle](https://github.com/shimo4228/agent-knowledge-cycle)、
[Contemplative Agent](https://github.com/shimo4228/contemplative-agent)、
[Agent Attribution Practice](https://github.com/shimo4228/agent-attribution-practice)、
[Attention, Not Self](https://github.com/shimo4228/attention-not-self)。
関係性は [`CLAUDE.md`](../CLAUDE.md) 参照。

## Hub (repository federation における)

research-program federation の中心にある metadata-only repo。役割は line 固有 content
を自分自身に含まずに sibling line への cross-reference を集約すること。本エコシステムでは
[`shimo4228/shimo4228`](https://github.com/shimo4228/shimo4228) が federation hub。
hub は research line では *ない*; それを research line として扱うと content と
metadata の区別が collapse する。

## Preliminary observation (経験的主張における)

経験的レイヤーの主張がなされる際の意図的な framing。*Evidence* (経験的レイヤーが
現在生成するように設計されていないもの) と区別される (区別と動機となる limitations は
[`empirical/README.md`](empirical/README.md) 参照)。本 repo の経験的主張は、明示的に
*evidence* と marking されていない限り、preliminary observation として読まれるべきである。

## Substrate (framework 退役における)

Layer 4 戦術が依存する技術的・制度的 infrastructure。Substrate が変化する (LLM
能力向上、dataset platform の新機能追加、DOI infrastructure の evolve) とき、戦術の
継続的有効性は再評価されなければならない。Framework は substrate shift 時の Layer 4
戦術退役を明示的に anticipate する。

## Harness-neutral

ADR その他の再利用可能 artifact が、特定実装・vendor・framework にコミットせずに
書かれる writing convention。Sibling line [Agent Attribution Practice](https://github.com/shimo4228/agent-attribution-practice)
から採用された。この convention の local 適用は [`CLAUDE.md`](../CLAUDE.md) 参照。
