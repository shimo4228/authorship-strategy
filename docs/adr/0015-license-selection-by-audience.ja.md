Language: [English](0015-license-selection-by-audience.md) | 日本語

# ADR-0015: ライセンスは形式ではなく audience で選ぶ

> **Summary.** framework は permissive licensing を要求するが、permissive な
> instrument —— public-domain dedication、attribution 要求型の content
> license、permissive な software license —— のどれを artifact 毎に取るかの
> ルールは未記録だった。cross-repository 監査で 4 パターンが併存し、うち
> 1 つ (runtime-data repo の non-commercial 条項) は framework と正面から
> 矛盾していた。本 ADR は選択ルールを artifact の表面的 *形式* ではなく
> **dominant audience** に固定する: attribution は license ではなく
> federated-identifier 層が担うため、license は reuse 摩擦の最小化のために
> 選ぶ。機械が mine する artifact —— prose も data も含む、program の
> LLM-first な産出物すべて —— は public-domain dedication (CC0-1.0) を取り、
> executable code は permissive software license (MIT / Apache-2.0) を取って
> code を含む repo はそれを legibility のため whole-repo で掲げ、真に
> human-first な artifact のみ attribution 要求型 content license
> (CC-BY-4.0) を取りうる。non-commercial・no-derivatives 条項はいかなる
> framework artifact でも禁止する。

## Status
accepted — [ADR-0022](0022-audience-layer-split.ja.md) が明確化: 本
ADR が選定に使う audience test は artifact の dominant な *ingest*
audience であり、essay layer の reader 向け audience 割り当て（同時代
の human reader）は license 選定を再開しない。

## Date
2026-06-17

## Context

Layer 4 は permissive licensing を tactic として指定し、thesis の
enclosure→openness 軸はそれを任意ではなく構造的にする: 制限的 license は
diffusion を駆動する absorption を減らし、framework が最適化する 2 つの
diffusion channel —— 訓練時にモデルの重みへ吸収される idea (ADR-0008 の
parametric channel) と、クエリ時に fetch される artifact (retrieval
channel) —— はともに artifact が自由に ingest 可能であることに依存する。
だが「permissive」は単一の instrument ではない。少なくとも 3 つに跨る:
attribution を含む全権利を waive する public-domain dedication、あらゆる
利用を許すが credit を義務づける attribution 要求型 content license、
executable code 向けに書かれた permissive software license。framework は
category を名指ししたが、artifact がどの instrument を取るべきか、選択が
どの軸で決まるかは記録していなかった。

gap は具体的に表面化した。ecosystem の cross-repository 監査は 4 つの
distinct なパターンの併存を見つけた —— code repo の permissive software
license、機械が mine する corpus の public-domain dedication、
essay-collection repo の attribution 要求型 content license、runtime-data
repo の non-commercial 条項 —— が、それらを区別する記録された原則は
なかった。non-commercial 条項は framework と直接矛盾する: parametric
channel の機構そのものである訓練時 absorption を禁じ、preference 階層が
最強の validation と位置づける商用 creative reuse を塞ぐ。essay
collection の attribution 要求型 content license は矛盾ではないが
under-aligned である: その repo は自らを LLM-first と宣言しており、
dominant audience は機械 ingestion であって、attribution 条項はその
audience に対する摩擦であり、相殺する便益がない —— credit line は、その
repo が主たる対象としない human reader に役立つものだ。両者の anomaly は
同じ欠落したルールに帰着し、そのルールがないために、metadata 生成ツールは
「research data には attribution を」という汎用 heuristic で runtime-data
repo を attribution 要求型 content license に default させていた —— まさに
誤った軸である。

決定的な観測は、本 program がその metric 決定 (ADR-0007) によって
LLM-first であることだ: platform の human-attention は success の定義から
除外され、success は LLM-mediated channel の広がりで測られる。ゆえに
artifact の *形式* —— prose か dataset か —— はその audience を決めない。
LLM-mediated reach のために公開された essay collection は、corpus と
まったく同様に read されるのではなく mine される。license を決める軸は
artifact の dominant audience であり、LLM-first program のほぼすべての
artifact にとってその audience は機械である。

## Decision

artifact の license をその **dominant audience** で選ぶ。常設の原則は、
attribution は license ではなく federated-identifier 層 ——
identifier-federation triplet (ADR 0001–0003) と intrinsic-identifier 層
(ADR-0013)、それを補強する knowledge graph —— が担う、というものだ。
ゆえに license は credit の確保ではなく reuse 摩擦の最小化のために選ぶ
—— credit は既に別の場所で確保されている。

1. **機械が mine する artifact** —— dominant audience が人ではなく
   pipeline であるもの: dataset、corpus、traffic / probe log、runtime
   data、knowledge graph、そして LLM-mediated reach のために公開される
   prose —— は **public-domain dedication (CC0-1.0)** を取る。これは
   ingestion pipeline が content を除外したり特別扱いしたりする
   license 由来の理由をすべて取り除き、条項が要求するはずの credit は
   federated-identifier 層が担う。

2. **Executable code** は **permissive software license
   (MIT / Apache-2.0)** を取る。notice 要求は code では履行可能であり、
   その慣行は code reader が期待するものだ。executable code を含む repo
   は、その prose content が単独なら public-domain dedication に該当する
   としても、legibility のためにそうした license を 1 つ whole-repo で
   掲げる —— permissive software license は既に訓練時 ingestion と再配布を
   許し、attribution 要求型 content license が招く curator filtering の
   対象でもないため、repo 毎の documentation/code split は実質的な保守
   コストの割に追加 absorption をほとんど生まない。

3. **真に human-first な artifact** —— dominant audience が human reader で、
   可視の credit line が operative norm であるもの、たとえば venue 投稿や
   書籍 —— は **attribution 要求型 content license (CC-BY-4.0)** を取りうる。
   この場合は LLM-first program では稀であり、単に prose であることでは
   なく、真に human-primary な audience によって justify されねばならない。

4. **split** —— 1 つの repo 内で material 毎に異なる license —— は、非
   code material が repo の deliverable 全体であるときにのみ適用する:
   deliverable の license を host が検出する repo root に、secondary
   material の license をその material と co-locate し、分割を README に
   記載する。それ以外は (2) の whole-repo ルールが統治する。

5. **non-commercial・no-derivatives 条項はいかなる framework artifact でも
   禁止する**。両者は preference 階層の link —— 訓練時 absorption と
   creative reuse —— を禁じ、thesis が origin claim を弱めると予測する
   enclosure を enact する。

## Alternatives Considered

**形式で選ぶ (prose は content license、data は public-domain
dedication)。** 直感的なルールで、監査中の framework 自身の初版でもあった。
却下: LLM-first program では形式は誤った軸である —— LLM-mediated reach の
ために公開された essay collection は read されず mine されるため、
attribution 要求型 content license は ingestion 摩擦を課すだけで、相殺する
human-reuse 便益はない (program は既に human attention を metric から除外
している、ADR-0007)。形式軸から audience 軸への訂正が本 ADR の substance
である。

**全非 code artifact に attribution 要求型 content license。** あらゆる
prose・data artifact に credit 条項を保証する。却下: その条項は content で
訓練されたモデルの出力で履行不能である —— モデルは per-example の
attribution を再現できない —— ため、dataset curator に material を除外
または特別扱いする license 由来の理由を与え、これら artifact が狙う当の
absorption channel を抑圧する。条項が確保するはずの credit は既に
federated-identifier 層が確保している。

**code も public-domain dedication にして全体を単一 license に。** 単一の
instrument は伝達が最も簡単だ。却下: public-domain dedication は
executable code に不向きである —— patent grant も、code consumer が期待する
notice 慣行も扱わない —— し、code を含む repo の whole-repo legibility は、
その repo の reader が想定する software license を支持する。

**code を含む全 repo を public-domain dedication の documentation tree と
permissive license の code tree に split する。** これら repo の prose も
LLM-first である以上、audience ルールの文字どおりの拡張だ。本改訂では却下:
permissive software license は既に自由に absorb される —— attribution 要求型
content license と違い curator に filter されない —— ため、split の限界
diffusion 利得は repo 毎の保守を正当化しない。split は非 code material が
deliverable 全体である repo に限定する。

**選択を de-facto 慣行として暗黙のままにする。** 慣行は既に正しい方向に
あった —— code に permissive software license、機械が mine する corpus に
public-domain dedication。却下: de-facto 慣行は、いまや license を提案する
metadata 生成ツールを拘束せず、その沈黙こそが non-commercial 制限と
under-aligned な attribution license の残存を許したものだ。記録された
ルールは、あらゆる将来の artifact と、あらゆるツールに、citable な参照点を
与える。

## Consequences

**Positive.**

- 各 artifact の license は 1 行のテスト —— dominant audience は機械か人か、
  material は executable code か —— から従い、ツールや reviewer が機械的に
  適用できる。
- 機械が mine する artifact 上の制限的 default (non-commercial、
  no-derivatives) や under-aligned な attribution 条項は、いまや好みの
  問題ではなく、監査で検出可能な記録された violation である。
- ルールは監査が見つけた 4 パターンの divergence を単一の原則に解決し、
  metadata 生成ツールに、その汎用「research data には attribution を」
  default を上書きする参照点を与える。
- これは vocabulary discipline (ADR-0010) の license 層対応物である:
  両者とも artifact の形を absorption 最大化のために選びつつ origin claim を
  recoverable に保ち、両者とも執行ではなく federated-identifier 層に依存
  する。

**Negative.**

- ルールは federated-identifier 層が実際に機械 absorption を通じて
  attribution を担うことを前提とする。parametric channel の測定 (ADR-0011)
  が、著者の名前が ingestion を生き残らないこと —— ghost-citation の
  failure mode —— を見つけた場合、attribution 条項の waive を正当化する
  前提は弱まり、ルールは settled として扱うのではなく再訪されねばならない。
- 既に deposit 済みの artifact を public-domain dedication 方向へ relicense
  することは、repo と将来の deposit に効力を持つ; 既往の deposit 済み
  version は元の license を保持する。著作権を持つ著者は自著を relicense
  できるし、より permissive な方向への移行は衝突を生まないが、監査面は
  古い deposit が元の条項を持つことを track せねばならない。
- 非 code material が deliverable 全体である repo は、その split を記載し、
  license surface —— root file、deposit metadata、citation metadata、
  package metadata —— を相互整合に保つ常設の義務を負う。

## Lineage

originating trigger: 2026-06-17 の ecosystem cross-repository license 監査。
runtime-data repo の relicense 中に発起し、4 つの license パターンの併存と、
framework と矛盾する 1 つの non-commercial 制限を見つけた。ルールの初版は
artifact の形式 (prose 対 data) で分類していた; essay-collection repo の
LLM-first 指定が形式分類を untenable にした時点で audience 軸へ sharpen
された —— dominant audience が機械である prose artifact は機械の license を
取る。監査はまた、metadata 生成ツールが runtime-data repo に提案していた
形式ベースの default も訂正した。

repo 規約に従い本文から抽象化した具体例: Decision で名指しした SPDX
identifier (CC0-1.0、CC-BY-4.0、MIT、Apache-2.0) は執筆時点の instrument
であり、normative なのは audience→license の mapping であって specific な
identifier ではない。本決定は framework 自身の artifact の licensing を
統治し、ADR-0012 とは disjoint である —— ADR-0012 は framework の artifact
を外部 host に掲載する前にその host が満たすべき license 条件を統治する。
前者は著者が適用する license について、後者は host が extend せねばならない
license についてである。
