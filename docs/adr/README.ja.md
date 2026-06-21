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
| [0012](0012-link-index-channel-selection.ja.md) | 外部 collection への link-index 型 contribution | accepted |
| [0013](0013-intrinsic-identifier-layer.ja.md) | 補完的 priority-claim 層としての intrinsic content-derived identifier | accepted |
| [0014](0014-implementation-tracking-two-tier-ledger.ja.md) | 二層 ledger と定期 gap-review による実装トラッキング | accepted |
| [0015](0015-license-selection-by-audience.ja.md) | ライセンスは形式ではなく audience で選ぶ | accepted |

ADR set は thesis の異なる層を tracking する cluster に分かれる:

ADR 0001-0003 は **identifier-federation triplet** を形成する: ADR-0001 が canonical
reference の形 (version DOI ではなく concept DOI) を fix し、ADR-0002 が archive
deposit metadata (`relatedIdentifiers`) で artifact 間関係を宣言し、ADR-0003 が
federation を非 DOI platform (Git host、dataset platform) に拡張し、reader が
どの platform から入っても network が discoverable になるようにする。各 ADR は
独立に採用可能だが、規律の最強形は 3 つすべてを適用する。

ADR 0004-0005 は **maintenance-discipline ADR** である: ADR-0004 は著者の公開 record をどう *提示* するか
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

ADR-0012 は **channel-selection decision** である: thesis の enclosure 軸を、
外部の curated collection (community-curated link directory、skill
marketplace、dataset registry) へ artifact を掲載するという行為に適用する。
contribution は link-index 型のみ —— canonical artifact は著者の repository
に留まり、host はハイパーリンクと短い事実記述だけを持つ —— とし、掲載前に
すべての候補 host を 4 条件監査 (企業所有 / open license の欠如 /
content-vendoring 構造 / 有料製品への funnel) に通す。掲載後に host が
enclosure に転じた場合の取り下げルールも常設する。ADR-0006 が自分の ingest
surface 上での artifact の形を規定するのに対し、ADR-0012 はどの*外部*
surface に、どの形で artifact が現れてよいかを統治する: vendor された
copy は host の後の enclosure に捕獲される drift vector であり、link は
canonical source を host の支配の外に保つ。

ADR-0013 は **intrinsic-identifier decision** である: 0001-0003 triplet が
DOI を中心に構築した federation に、第二の content-derived identifier 層
—— SWHID (ISO/IEC 18670) —— を追加する。DOI は extrinsic である:
registry によって metadata record に束縛された opaque な名前であり、
カバーする content に対して検証できず、registry の存続に依存する。
intrinsic 層はその補完である —— artifact とその history から計算され、
いかなる registry もなしに検証可能で、1 行までの粒度を持つ —— ゆえに
各層は他方の failure mode をカバーする。以後すべての release は
content-addressed な公的 software archive への明示的な archival request
も trigger し、その snapshot identifier を DOI と並べて記録する。DOI
登録が impractical な artifact genre には intrinsic identifier を
substitute priority-claim mechanism として指定し、manifesto の open
question 4 を閉じる。同 archive への保存は、追加の執筆コストゼロで
第二の parametric-channel ingest surface (code 系 training corpora が
archive を source とする) も開く。

ADR-0014 は **implementation-tracking decision** である: framework が
deploy する tactic ではなく、framework を *運用* することについての唯一の
ADR である。program は既に empirical 層で日付付き intervention timeline を
公開しているが、その timeline の規約 (効果主張なし、ADR-0012 の host 抽象化、
normative/empirical 分離) は、それを planning 面として兼用することを禁じる。
そこでトラッキングを二層に分ける: private な implementation ledger が運用
status・ランク付き candidate intervention・作業詳細を持ち、public timeline は
その日付付き・効果主張なしの投影となる。定期 gap-review が deploy 済み tactic
を Layer 4 catalog と manifesto の open questions に突き合わせて次の提案を生む
—— empirical 層の役割と framework の自己再帰的適用についての open question に
関わる self-application である。review 手順は framework の operational skill に
置き、配線 (どの artifact が本 program の ledger と timeline か) だけが
project 固有である。

ADR-0015 は **license-selection decision** である: framework が名指し
しながら記録していなかった軸で、artifact がどの permissive instrument を
取るかを fix する。permissive licensing は public-domain dedication、
attribution 要求型 content license、permissive software license に跨る;
cross-repository 監査は最後の 1 つを除く全パターンの併存と、framework と
正面から矛盾する non-commercial 条項を見つけた。ルールは artifact の
*dominant audience* で選ぶ —— 形式ではない: attribution は license では
なく federated-identifier 層 (0001-0003 triplet と 0013) が担うため、
license は reuse 摩擦の最小化のために選ぶ。LLM-first program (ADR-0007)
では prose の essay も dataset も含めほぼすべての artifact が read されず
mine されるため、機械が mine する artifact は public-domain dedication を
取り、executable code のみ software license を取り (code を含む repo では
legibility のため whole-repo)、真に human-first な artifact のみ content
license を取る; non-commercial・no-derivatives 条項は、thesis が origin
claim を弱めると予測する enclosure として禁止する。これは vocabulary
discipline (ADR-0010) の license 層対応物である: 両者とも artifact の形を
absorption 最大化のために選びつつ、origin claim を執行ではなく identifier
層を通じて recoverable に保つ。ADR-0012 とは disjoint である —— あちらは
外部 host が extend せねばならない license を、こちらは著者が適用する
license を統治する。

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
