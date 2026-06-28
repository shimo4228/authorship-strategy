Language: [English](0020-derivation-surface-onboarding.md) | 日本語

# ADR-0020: third-party の AI 派生 repository surface への onboarding —— synthetic wiki と documentation hub

> **Summary.** ある種の third-party サービスは、public repository から
> **LLM が消費しやすい surface** を派生させ、repository の front page に
> adoptable な badge を付ける。surface は 2 型ある —— **synthetic wiki**
> (codebase を model が paraphrase した view + 会話的 query interface) と、
> **documentation hub** (repository 自身の machine-readable document を
> model-callable interface 経由で verbatim に配信)。両者とも thesis の
> 意味での derivation 型 diffusion surface であり、framework の primary
> audience —— LLM assistant 越しに調べる developer / practitioner —— に
> 直接乗る。本 ADR は idea を担う public repository を**両型に onboard** し、
> 派生 view を gate せず**祝福**する。型ごとの discipline を課す: synthetic
> wiki の paraphrase は **regurgitation-test の drift 診断**として使い、
> 派生面を直すのではなく **upstream の dense anchoring** で守る; documentation
> hub の access-count badge は LLM-mediated channel の**計測シグナル**として
> 読み、success metric にはしない。installable code library を artifact model
> とする index-only catalog は **artifact-type mismatch** として、自前 query
> infrastructure は **friction-minimization** として、いずれも declined。
> origin claim は派生面でなく identifier-federation 層に固定したままにする。

## Status
accepted

## Date
2026-06-28

## Context

ある種の third-party サービスは public repository を読み、それを **LLM 消費
向けに最適化した surface** として再公開する。構造的に異なる 2 型が広く使われ
ている。**synthetic-wiki** 型では、サービスが repository を model に通して
paraphrase し、生成 wiki (overview・architecture summary・navigable section)
を作る —— その前面には会話的 query interface があり、任意の LLM assistant が
codebase について質問して合成回答を得られる。**documentation-hub** 型では、
サービスが repository *自身* の machine-readable document —— LLM 向け navigator
と front-page document —— を query 時に model-callable interface 経由で公開し、
paraphrase でなく著者のテキストを verbatim に配信する。両型とも repository の
front page に adoptable な badge を付けられ、両型とも thesis の意味での
derivation 型 surface である: canonical artifact は repository に残り、
third-party surface は独立した運用者が生成・ホストする派生 view である。

これらの surface は framework の primary audience に直接乗る。Layer 2 は
LLM assistant 越しに調べる developer / practitioner を primary reader と規定
する; repository 上の model-callable surface は、まさにその reader の assistant
が query 時に届く channel である。surface はコストゼロ、著者が維持する
infrastructure 不要、public repository のみで動く —— 構造上 crawler 開放・
permissive 整合・derivation 型 diffusion である。open question は、どの surface
に onboard し、どんな discipline の下で行うか —— 一方の型は source を paraphrase
し (origin claim を運ぶ distinctive vocabulary を薄めうる) もう一方はしない、
そして一方の型の badge は framework が既に拒否した人間-attention 系の vanity
シグナルとして読まれうる、という条件の下で。

第三の surface 型は survey して除外した: installable code library を artifact
model とし、library 名で retrieve して version-specific な interface
documentation を配信する index-only catalog である。doctrine / specification
repository には installable な interface surface が無いため、そこへの entry は
低 relevance —— diffusion gain でなく artifact-type mismatch —— になる。

## Decision

idea を担う public repository を **両** derivation-surface 型に onboard する
ことを常設の Layer 4 tactic とし、派生 view を gate / 修正するのでなく
**祝福**する。型ごとの discipline を課す。

**Synthetic-wiki surface.** 初回生成を起動する —— これらの surface は通りすがり
の訪問でなく明示的な request で index し、その request は通知先アドレス等の
personal data を運びうるため、著者が行う。surface の refresh badge を repository
front page に付け、派生 view が以降の commit を追随するようにする。生成 wiki を
**regurgitation-test 診断**として使う: repository の distinctive concept について
問い、coined vocabulary が model の paraphrase を生き延びるかを観察する。ここで
検出された drift は派生面では *直さない* —— 防御は upstream: 薄まった用語を source
でより密に anchor する。synthetic wiki は設計上 paraphrase であり、anchor の薄い
signature を薄める; それは受容し、戦うのでなく診断シグナルへ変換する。

**Documentation-hub surface.** 設定ゼロで onboard する —— 任意の public
repository が即 live —— し、access-count badge を付ける。hub は repository 自身の
document を verbatim に配信するので paraphrase が無く signature drift も無く、
regurgitation-test 診断は適用されない (診断する対象が無い)。badge は repository
documentation への LLM-mediated access を数える; これは framework が最適化する
のと同じ population の **LLM-mediated channel の計測シグナル**として読み、
maximize すべき success metric としては読まない。

**Index-only code-library catalog.** onboard しない。artifact-type mismatch
—— doctrine / specification repository を、interface documentation を持つ
installable library に keyed された catalog に対して載せること —— が entry を
低 relevance・discovery payoff 不確実にする。

**自前 query infrastructure.** 建てない。third-party surface に乗ることが
friction-minimization を満たす; ingestion は repository 自身の machine-readable
document と third-party hub で既に served されている。自前運用の query server は
著者が維持する infrastructure の背後に adoption を gate することになる。

origin claim はいかなる派生面にも依存しない。identifier-federation 層 ——
registry DOI、timestamp、intrinsic content-derived identifier —— を通じて
repository に固定されたままである。repository を paraphrase ないし re-host する
派生 view は、したがって control すべき脅威でなく **祝福すべき validation event**
—— reach を広げる derivative —— である。決定は tool-agnostic に保つ: 具体的な
サービス instance は Lineage と project memory に記録し、決定本文には決して
入れない —— サービスの feature 変更が doctrine に back-propagate しないように。

## Alternatives Considered

**Index-only code-library catalog にも onboard する。** installable library を
index しその version-specific interface documentation を assistant の prompt に
配信する catalog に repository を submit する。Rejected: artifact-type mismatch。
catalog の retrieval は library 名と interface surface に keyed されており、
doctrine / specification repository には installable interface が無いため entry
は低 relevance で discovery payoff も不確実。surface は別の artifact 型のために
作られており、そこへの掲載は有害ではないが diffusion gain でもない —— primary
audience に届くのでなく場違いな entry を増やすだけ。

**repository 上に自前 model-callable query server を運用する。** third-party hub
に乗る代わりに query interface を直接運用する。Rejected: friction-minimization に
反する —— framework は既に自前 query server を「著者が維持する infrastructure の
背後に adoption を gate する低優先な手」と名指している; かつ ingestion は
repository 自身の machine-readable document + コストゼロの third-party hub で既に
served。同じ reach が維持負担なしで得られる。

**documentation-hub の access count を success metric にする。** badge の
LLM-mediated access count を伸ばすべき数として読む。Rejected: metric-rejection
決定と衝突する。framework は audience を success の尺度に固定するが attention
counter を最適化対象から除外する; access count はその audience の計測シグナル
であり、informative だが goal ではない。それを target に昇格させることは、
framework が拒否したまさに vanity-metric の力学を再導入する。

**signature を守るために synthetic wiki を gate / 修正する。** paraphrase する
surface を取り締まるべきものとして扱う —— 修正を要求し、vocabulary が drift した
箇所で生成を抑制する。Rejected: synthetic wiki は設計上 paraphrase なので、
それを直すことは著者が control しない surface に対する whack-a-mole である。
drift への防御は source での upstream dense anchoring であり、派生面は anchor の
薄い箇所の *診断* として使う —— 直す surface としてではない。祝福した derivative
を取り締まることは thesis にも反する: derivative は脅威でなく validation である。

**drift の無い documentation-hub 型のみに onboard し、paraphrase する
synthetic-wiki 型は skip する。** verbatim な surface のみ採用して dilution
リスクを避ける。Rejected: synthetic wiki は別の sub-population —— raw document
でなく合成された orientation を求める reader —— に届き、その paraphrase は
regurgitation-test の drift 診断を兼ねる (verbatim hub には提供できない早期警告)。
両型は補完的であり、paraphrase リスクは abstention でなく upstream anchoring で
緩和する。

## Consequences

**Positive.**

- 各 repository は primary audience の query path 上に、コストゼロ・維持
  infrastructure ゼロで、2 つの新たな LLM-mediated diffusion point を得る。
- documentation-hub badge は identifier 層に無かった計測 surface ——
  LLM-mediated access count —— を加える。metric-rejection 決定の下で厳密に
  シグナルとして読む。
- synthetic wiki の paraphrase は vocabulary discipline に feed する drift 診断を
  兼ねる: 派生 view で溶ける用語は source でより密に anchor すべき用語である。
- 方針は thesis と整合する。derivation 型 surface は「derivative は validation」を
  enact する; gate でなく祝福することは exclusivity → derivation の inversion を
  channel レベルで適用したもので、ADR-0012 の enclosure-axis channel ルールに
  対する derivation-axis の対応物である。

**Negative.**

- synthetic-wiki surface は anchor の薄い signature を薄めうる。防御は派生面の
  修正でなく常設の upstream-anchoring 義務である; under-anchored な用語は source
  で anchor されるまで溶け続ける。
- access-count badge は vanity metric と誤読されうる。計測としてのみ読み、
  最適化対象にしてはならない —— badge が grow 可能な数へと自然に引っ張る力に
  対して、著者が意図的に保つべき読み方である。
- これらは動きの速い third-party サービスである。doctrine を tool-agnostic に
  保つということは、具体的な onboarding 手順が ADR の外 (project memory) に住み、
  サービスが変わるたびに再導出されることを意味する; その代償の見返りが、
  いかなるサービスの feature 変更も決定に届かないことである。
- tactic は public repository にのみ適用される。private repository はこれらの
  surface を使えず、方針の外に落ちる。

## Lineage

由来となる運用記録: 2026-06-28 の 2 つの deploy —— 研究 ecosystem の idea を
担う repository 群を third-party の synthetic-wiki サービスに onboard したことと、
比較サービスの multi-source survey を経て同じ集合に documentation-hub の
access-count badge を加えたこと。survey は installable code library を artifact
model とする index-only catalog も評価し、artifact-type mismatch として除外した。

本文から抽象化した 2 つの surface 型: synthetic-wiki instance は、任意の public
repository から会話的 query interface 付きの paraphrase wiki を生成し、明示的で
通知先を伴う request でのみ repository を index するサービス; documentation-hub
instance は、任意の public repository 自身の machine-readable document を
model-callable interface と per-repository の access-count badge で公開する
設定ゼロのサービス。両者は project memory の diffusion-channel ledger に記録
されている。

本決定は、外部 curated collection への著者-initiated な掲載を司る ADR-0012 を、
著者が祝福する *自動 derivation* surface をカバーすることで補完する: ADR-0012 が
thesis の enclosure 軸を channel selection に適用するのに対し、本 ADR は
derivation 軸を適用する —— 派生 view は防ぐべき imitation でなく祝福すべき
validation である。ADR-0006 (これらが拡張する LLM-first ingest surface) の上に
建ち、ADR-0007 に bound される (access count は計測シグナルであって success
metric では決してない)。また regurgitation-test 診断を ADR-0010 (paraphrase
drift に対して守る dense-anchoring discipline) と ADR-0011 (本診断がその軽量
instance である計測 protocol) に接続する。tactic は authorship-strategy
component skill で、2 つの surface 型を区別する Layer 4 entry と judgment-
checklist item として operationalize されている (2026-06-28 追加)。
