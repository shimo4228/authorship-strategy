Language: [English](README.md) | 日本語

# Architecture Decision Records

各 ADR は AI 経由の拡散下における著者戦略についての戦術的判断を記録する。DOI
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
| [0007](0007-human-attention-signals-not-a-metric.ja.md) | Human-Attention Platform Signals Are Not a Success Metric | accepted (0022 が scope を amend) |
| [0008](0008-rag-era-attribution-diffusion.ja.md) | RAG-Era Attribution Diffusion — Two Channels, Two Time Constants | accepted |
| [0009](0009-dual-entry-asymmetric-rebalance.ja.md) | Dual Entry Points Are Asymmetric — Structured Graph for Citation, Prose Navigator for Agent Context | accepted |
| [0010](0010-vocabulary-discipline.ja.md) | Vocabulary Discipline —— 控えめに造語し、密に anchor する | accepted |
| [0011](0011-two-channel-probe-protocol.ja.md) | Two-Channel Probe Protocol —— 各チャネルを専用の測定器で測る (Annex A、2026-08: 校正の読みルール) | **experimental** |
| [0012](0012-link-index-channel-selection.ja.md) | 外部 collection への link-index 型 contribution | accepted |
| [0013](0013-intrinsic-identifier-layer.ja.md) | 補完的 priority-claim 層としての intrinsic content-derived identifier | accepted |
| [0014](0014-implementation-tracking-two-tier-ledger.ja.md) | 二層 ledger と定期 gap-review による実装トラッキング | accepted |
| [0015](0015-license-selection-by-audience.ja.md) | ライセンスは形式ではなく audience で選ぶ | accepted |
| [0016](0016-genre-split-placement.ja.md) | genre 別の canonical 配置 —— essay は repository-corpus canonical + intrinsic identifier、paper は concept-DOI canonical | accepted |
| [0017](0017-failure-mode-diagnostics.ja.md) | Failure-Mode 診断 —— 承認済み 3 failure mode それぞれの detector と recovery 戦略 | accepted |
| [0018](0018-claim-falsifiability-criterion.ja.md) | Origin-Claim Falsifiability —— durable artifact に公開する前に priority claim を prior art に対して test する | accepted |
| [0019](0019-structural-optimization-vs-content-authenticity.ja.md) | Structural Optimization と Content Authenticity —— transmission path を optimize し content は決して optimize しない | accepted |
| [0020](0020-derivation-surface-onboarding.ja.md) | third-party の AI 派生 repository surface への onboarding —— synthetic wiki と documentation hub | accepted |
| [0021](0021-self-sovereign-entity-grounding.ja.md) | self-sovereign な entity grounding —— community 統治の authority record は foundation でなく revocable な layer である | accepted |
| [0022](0022-audience-layer-split.ja.md) | audience-layer split —— 同時代の human reader を essay genre の primary audience とし、metrics を layer scope で認める | accepted |
| [0023](0023-empirical-layer-role.ja.md) | empirical layer の role —— reference baseline を primary role とし、case-study narrative を限定し、validation evidence は明示的設計によってのみ | accepted |

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
—— empirical 層の役割 (ADR-0023 で決着) と framework の自己再帰的適用に
ついての open question に関わる self-application である。review 手順は framework の operational skill に
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

ADR-0016 は **genre-split-placement decision** である: どの genre がどの
canonical を取るかを記録する —— identifier ADR 群が open に残した routing
だ。ADR-0001 が concept DOI を canonical に fix し、ADR-0013 が
DOI-impractical genre 向けに intrinsic な content-derived identifier を
substitute claim として追加したが、どちらもどの genre がどちらかを述べ
なかった。ADR-0016 は genre で振り分ける: essay genre の canonical は著者の
version 管理された repository corpus で、その priority claim は registry DOI
ではなく intrinsic identifier (public-domain dedication 下、ADR-0015) に
置く; paper genre の canonical は concept DOI である。syndicate された essay
copy は、LLM 媒介の credit への効果が未検証な platform の canonical-URL tag
ではなく entity federation (sameAs / ORCID / DOI / intrinsic-identifier /
distinctive-vocabulary 層、ADR-0009, ADR-0010) で canonical に bind する;
tag は human-reader と search-engine の hygiene としてのみ保持する。corpus
membership は authenticity criterion (Layer 1: 著者の声を持ち reader 向けの
piece) で gate し、essay 中の load-bearing な idea は paper へ昇格する際に
concept-DOI deposit へ promote する (Layer 3)。ADR-0013 の
DOI-impractical-genre 条項を具体的に instantiate し、ADR-0015 の
license-by-audience rule を補完して、両者の間の placement gap を close する。

ADR 0017-0019 は **doctrine-hardening cluster** である: 新しい tactic surface を
足さず、framework 自身が defer した宿題と、その宿題を答え可能にした 2026 年の
literature に対して、既存の commitment を締める 3 つの decision。ADR-0017 は
manifesto の 8 番目の open question を回収する —— 承認済み 3 failure mode
(reach without recognition / over-publication / under-investment in worked
implementation) それぞれに診断シグナルと recovery 戦略を記録し、診断は
failure-*detector* であって success metric では決してない、という load-bearing な
caveat の下に置くので ADR-0007 の metric-rejection と衝突しえない。ADR-0018 は
非形式な origin-claim-scope discipline (ADR-0010 の scope 側) を手続きにする:
origin claim は公開前に prior art に対して test され、最も narrow な defensible
形に rescope される —— 基準は falsifiability で、claim を narrow にするのみの
humility instrument だ。ADR-0019 は 2026 年の structured-data efficacy
literature が強いる境界を引く: *transmission path* の optimize (structure、
entity anchoring、distinctive vocabulary の dense anchoring、ADR-0009,
ADR-0010) は legitimate で、citation を勝ち取るための *content* の変形は
ADR-0007 が補強する Layer 1 violation である。3 つは ingest 面や identifier 面を
extend するのではなく Layer 1 (authenticity) と metric-rejection decision の下に
座る —— diffusion tactic が stack 全体の守る authenticity を corrode するのを
防ぐ。

ADR-0020 は **derivation-surface-onboarding decision** である: ADR-0012 の
enclosure-axis channel rule に対する derivation-axis の対応物だ。ADR-0012 が
外部 curated collection への著者-initiated な掲載を統治するのに対し、ADR-0020 は
third party が repository から派生させて LLM assistant に serve する、著者が
祝福する *自動* surface を統治する —— repository を会話的 query interface の背後で
paraphrase する synthetic wiki と、repository 自身の machine-readable document を
model-callable interface 経由で verbatim に serve する documentation hub。両者は
gate でなく onboard し祝福する。型ごとの discipline: paraphrase する wiki の drift は
regurgitation-test 診断として使い、派生面で直すのでなく dense-anchoring discipline
(ADR-0010, ADR-0011) で upstream に答える; verbatim hub の access-count badge は
LLM-mediated channel の計測シグナルとして読み、success metric にはしない (ADR-0007)。
installable code library に keyed された index-only catalog は artifact-type
mismatch として、自前 query infrastructure は framework が引き受けない friction
として、いずれも declined。ADR-0006 の LLM-first ingest surface を extend し、
thesis の exclusivity → derivation 反転を channel レベルで enact する: 派生 view は
防ぐべき imitation でなく祝福すべき validation である。

ADR-0021 は **self-sovereign-grounding decision** である: tactic の deploy では
なく **revocation** から抽出された最初の ADR だ。entity-grounding tactic ——
著者・artifact・引用文献・それらを結ぶ citation 辺の entry を community 統治の
authority record に self-create する —— は、host の governance によりアカウント
水準で promotional と判定されて revoke され、全 entry が一括削除された。個別の
編集は名指しされていない。decision は self-created な authority-record federation
を恒久に retire し、grounding surface を **revocation control** で分類する:
origin claim の load-bearing を許すのは self-sovereign な層 (repository とその
knowledge graph、著者 account 下の registry deposit、author-identifier record、
そして構造上唯一 revoke 不可能な ADR-0013 の intrinsic identifier 層) のみで、
third-party 統治の grounding は頼まれずに earned された場合に限り認める ——
self-manufacture も solicited な作成も不可。revoke された machine-readable 辺は
速やかに purge し、日付付き歴史は書き換えず、回避は全面禁止、将来のすべての
third-party deploy には aggregate-pattern test を課す —— アカウントの累積
footprint が host の governance にどう読まれるかは、行為単位の準拠では答えられ
ない。ADR-0012 が著者の**掲載する**場所を監査し ADR-0020 が third party の
**派生する**ものを祝福するのに対し、ADR-0021 は著者が**書き込む**場所を bound
する: manifesto の 9 番目の open question の観測された中で最も鋭い instance ——
first-mover がまだ持てない authority は自作もできない —— を記録し、その問いを
開いたまま残す。

ADR-0022 は **audience-layer-split decision** である: ADR-0014 と並ぶ、
framework を**運用する**ことについての 2 本の ADR の一方であり、diffusion
tactic からではなく program の動機の会計から抽出された最初の ADR だ。
2026-08 の review は、audience の降格 —— doctrine repository の直接
browse 層について書かれたが最大の広さで読まれてきた —— が ADR-0007 の
legibility-cost 受容を反証不能な慰めに変えていたこと (停滞するあらゆる
human signal が純化の証として読み替え可能)、その間、同時代の human
reader に向けて出荷され per-article の metrics instrument を持つ essay
corpus が strategy の帳簿に一度も載っていなかったことを診断した。
decision は会計を、genre で routing される 2 つの audience layer に分割
する (ADR-0016 の拡張): doctrine layer は LLM-mediated channel を
primary audience に保ち ADR-0007 の metric 拒否は無傷のまま、essay
layer は同時代の human reader を primary audience とし、日〜週の時定数
の下で reception signal を観測することも操舵に使うことも正当とする。
boundary 条項が層を隔てる —— essay の signal は doctrine の判断を操舵
しない (ADR-0017)、内容の変形は両層で禁止のまま (ADR-0019)、essay
platform は安全ガードと aggregate-pattern test の下で non-load-bearing
な third-party-governed surface のまま (ADR-0021)、license と canonical
の routing は不変 (ADR-0015/0016)。ADR-0007 の scope を clause 単位で
amend し、manifesto の 11 番目の open question —— 二層の動機 portfolio
は層間汚染に耐えるか —— を開く。

ADR-0023 は **empirical-layer-role decision** である: manifesto の
7 番目の open question —— empirical layer は validation evidence /
reference baseline / case study のどれとして機能するか —— を、意図的
hybrid をどれか 1 つに潰すのではなく構造化することで閉じる。3 つの
候補 role の違いは内容よりも layer が主張することになる claim の強さ
にあり、記録されていた曖昧さの実害は、どの artifact も自分がどれほど
強い claim を立てているかを宣言していなかったことにある。reference
baseline が primary role かつ全 artifact の最低要件になる (再現可能な
data または日付付き record、文書化された method、明示された
limitations)。case-study narrative は限定された secondary role ——
特定 artifact に付随し、解釈と明示され、効果主張には決して昇格しない。
validation evidence は、事前に実験として設計され公開時に validation
evidence と明示的に指定された artifact が現れない限り layer が主張
しない role である —— 無言では起きない role 昇格であり、ADR-0011 の
visible series break を model とする。各 artifact の role は empirical
layer の index で宣言され、intervention timeline は baseline の
methods companion として、external-literature note は引用文献自身が
主張する強さのままの他者の evidence として位置づけられる。validation
role の辞退は「証拠が原則を改訂しうる」flow に触れない: preliminary
observation —— ADR-0017 の diagnostics が走る強さ —— は normative な
改訂を trigger するのに引き続き十分であり、framework を validate する
には実験として設計された artifact による evidence を要するが、layer は
それを持つと主張しない。

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
