Language: [English](0016-genre-split-placement.md) | 日本語

# ADR-0016: genre 別の canonical 配置 —— essay は repository-corpus canonical + intrinsic identifier、paper は concept-DOI canonical

> **Summary.** identifier 層は concept DOI を canonical な priority claim に
> 固定し (ADR-0001)、DOI 登録が非現実的な genre 向けに intrinsic な
> content-derived identifier を substitute claim として追加した (ADR-0013)
> が、どの genre がどの canonical を取るかは記録されていなかった。program
> の産出物は方向の異なる 2 genre に割れる: 慣習的に DOI 登録され concept-DOI
> citability の恩恵を受ける paper と、manifesto の open question 4 が
> 「registry の general-upload type 経由でしか DOI 登録できず、その慣行は
> genre として稀」と名指しした essay である。本 ADR は canonical を genre で
> 振り分ける: essay genre の canonical は著者の version 管理された repository
> corpus であり、その priority claim は registry DOI ではなく intrinsic な
> content-derived identifier に置き、public-domain dedication を取る; paper
> genre の canonical は concept DOI である。syndicate された essay copy は
> platform の canonical-URL tag ではなく entity federation (sameAs / ORCID /
> DOI / intrinsic identifier / distinctive vocabulary) で canonical に
> bind する。corpus membership は authenticity criterion —— 著者の声を持ち
> reader 向けに公開された piece のみ —— で gate し、essay 中の load-bearing
> な idea は paper に昇格する際に concept-DOI deposit へ promote する。

## Status
accepted

## Date
2026-06-25

## Context

framework の identifier 層は **concept DOI** を canonical な priority claim に
固定し (ADR-0001)、DOI 登録が非現実的・非慣習的な artifact genre 向けに
**intrinsic な content-derived identifier** を substitute claim として追加した
(ADR-0013、manifesto の open question 4 を close)。どちらの ADR も記録して
いないのは *どの genre がどの canonical を取るか* である。program の産出物は、
方向の異なる 2 genre に割れる:

- **paper** は慣習的に DOI 登録され、concept DOI が citability・rich metadata・
  registry 媒介の scholarly discovery を与える。その canonical は争いがない。
- **essay** は open question 4 が直接名指しした case である: registry の
  general-upload type 経由でしか DOI 登録できず、その慣行は genre として稀。
  essay には既に home がある —— public で version 管理された markdown corpus
  が複数の publishing platform に syndicate されている —— が、その corpus は
  *publishing pipeline* であって governed artifact ではなかった。ecosystem の
  他が備える 3 つの governance 要素を欠いていた: intrinsic-identifier の
  priority claim、整合した license (機械が mine する audience の rule
  (ADR-0015) に反して attribution 要求型 content license を宣言していた)、
  ecosystem への entity federation である。記録されたルールがないため、
  syndicate された essay copy は canonical への記録された binding を持たず、
  essay corpus は priority claim を一切持たなかった。

第二の圧力が binding を load-bearing にする。LLM 媒介での到達のために公開された
essay は read されず mine され (ADR-0007, ADR-0015)、設計上 syndication platform
に跨って広がる —— thesis の enclosure→openness 軸は単一 platform への集約より
連邦的な再公開を favor する。syndicate された copy から origin へ LLM 媒介の
credit を route する機構は、ゆえに canonical 自体と同程度に重要だ。候補は 2 つ
ある: **platform の canonical-URL tag** (再公開 platform が original URL を
search engine に指し示すために emit する syndication metadata) と、**entity
federation** (ADR-0009 と program の structured 層が既に保つ sameAs・ORCID・
DOI・intrinsic-identifier・distinctive-vocabulary の edge) である。framework
自身の doctrine は後者を grounding し、それを測定できる (ADR-0011); 前者は
human reader と search engine の慣行であって、LLM 媒介の credit への効果を
framework は検証していない。

## Decision

canonical を **genre** で振り分け、syndicate された copy を **entity
federation** で bind し、corpus membership を **authenticity criterion** で
gate し、essay 中の load-bearing な idea がconcept DOI に値するとき **paper
genre** へ promote する。

1. **genre 別 routing.**
   - **essay genre** の canonical は著者の version 管理された repository corpus
     である。その priority claim は registry DOI ではなく **intrinsic な
     content-derived identifier** —— content-addressed な public archive 内の
     corpus snapshot (ADR-0013) —— に置く。corpus は **public-domain
     dedication (CC0-1.0)** を取る。dominant audience が機械の取り込みである
     ため (ADR-0015)。
   - **paper genre** の canonical は **concept DOI** (ADR-0001) であり、
     intrinsic identifier をその complementary 層とする (ADR-0013)。

2. **syndication の binding は canonical-URL tag ではなく entity federation で。**
   syndicate された essay copy は、federated-identifier 層 —— sameAs・ORCID・
   DOI・intrinsic identifier・paraphrase を生き残る distinctive vocabulary
   (ADR-0010) —— で canonical に bind する。これは framework の他のあらゆる箇所
   で attribution を運ぶのと同じ層だ。platform の canonical-URL tag は、platform
   が emit する箇所では human-reader と search-engine の hygiene として
   *保持* するが、LLM 媒介の credit を route するために *依拠* はしない。
   framework は LLM 媒介 channel が canonical-URL tag を無視すると主張しない
   —— それは未検証である —— ただ、その recognition 機構が、効果を観測できない
   tag ではなく、自らが制御し測定できる federation 層であると述べるだけだ。

3. **corpus membership は authenticity criterion (Layer 1) で。** governed
   corpus は **著者の声を持ち reader 向けの** piece を admit する: 著者自身の
   声で書かれ、reader 向けに公開されたもの。著者の声を持たない study / learning
   draft は除外する。これは何が属するかを述べる membership *criterion* であって、
   ファイルを並べ替えて執行する churn rule ではない。

4. **essay→paper promotion.** essay 中の load-bearing な idea が concept-DOI
   deposit に値するとき、それを **paper genre** へ promote し concept-DOI
   canonical へ移す —— idea-character の artifact が登録された deposit へ生き残り、
   vehicle としての essay は corpus surface に残る (Layer 3、idea-versus-scaffold
   separation)。promotion までは、idea は essay genre の intrinsic-identifier
   claim に置く。

## Alternatives Considered

**registry の general-upload type で全 essay を DOI 登録する。** 各 essay に
registry DOI と両 genre 共通の canonical を与える。却下: その慣行は genre として
稀であり (open question 4)、intrinsic identifier は既に、concept-DOI discipline
が防ぐ version sprawl (ADR-0001, ADR-0004) なしに、artifact 毎の
content-verifiable な priority claim を供給する。essay 毎の DOI は、genre が
ほとんど使わない citability を、intrinsic 層が回避する registry maintenance の
コストで買う。

**LLM 媒介の credit を platform の canonical-URL tag で route する。** 再公開
platform の canonical metadata を copy→origin の binding として扱う。却下: tag の
LLM 媒介 credit への効果は未検証である一方、entity federation は doctrine に
grounding され (ADR-0009, open question 9)、測定可能だ (ADR-0011)。framework は、
制御できる federation 層を持つ間、未検証の platform 慣行を credit-routing 機構へ
昇格させない; tag は human-reader と search-engine の hygiene としてのみ保持する。

**essay を単一 platform に集約して 1 つの canonical surface を呈示する。**
syndication を無くすことで syndication-binding 問題を無くす。却下: diffusion
thesis (enclosure→openness) は連邦的再公開を favor し、それが LLM 媒介の到達を
広げる; 集約はその到達を、federation 層が集約なしに既に供給する tidiness と
引き換えにする。散らばった copy への正しい答えは、散らばりを止めることではなく
bind することだ。

**essay corpus に priority claim を与えず、essay を ephemeral として扱う。**
essay は paper より低 stakes で timestamp 不要、と受け入れる。却下: load-bearing
な idea を運ぶ artifact はすべて timestamp された priority claim を必要とし、
intrinsic identifier はまさに ADR-0013 が DOI-impractical genre に designate した
低コストの claim だ。corpus を unclaimed のままにすれば、後に paper へ promote
されうる idea の priority を放棄することになる。

## Consequences

**Positive.**

- 各 genre が記録された canonical と記録された priority-claim 機構を持つので、
  「この artifact はどこに住み、何がその priority を stamp するか」が case 毎で
  なく genre で答えられる。
- essay corpus が publishing pipeline から governed artifact へ昇格する:
  intrinsic-identifier の priority claim、機械が mine する audience の rule
  (ADR-0015) に整合した license、ecosystem hub・著者 identifier・sibling DOI への
  repository surface での entity federation を得る。
- syndicate された copy の recognition routing が、効果を観測できない platform
  慣行ではなく、framework が制御し測定する federation 層に置かれる —— credit
  機構を system の instrument 化された部分の内側に保つ。
- genre split は ADR-0013 の DOI-impractical-genre 条項を具体的に instantiate し、
  ADR-0015 の license-by-audience rule を補完する —— 2 つの抽象的な条項を、
  adopter が follow できる配置へ変える。

**Negative.**

- essay genre の intrinsic-identifier claim は、federated-identifier 層が機械
  absorption を通じて attribution を運ぶという ADR-0013 の前提を継承する。
  parametric channel の測定 (ADR-0011) が authorship の ghost-citation failure
  mode (open question 8) を見出せば、essay genre の intrinsic claim + federation
  への依存も program の他と共に弱まる。
- promotion trigger は判断を要する —— この idea は concept DOI に値するほど
  load-bearing か? —— 機械的 test を持たない。誤判断は、load-bearing な idea を
  より弱い intrinsic claim に留めるか、concept-DOI discipline が防ぐべき version
  sprawl へ over-promote するかのいずれかを招く。
- corpus の intrinsic-identifier currency の維持は常設の義務だ: 実質的に新しい
  corpus state は、記録された snapshot が priority claim の主張対象を cover し
  続けるよう、再 archive すべきである。

## Lineage

originating trigger: crystallize された essay と paper が LLM 媒介の diffusion の
ためにどこに住むべきかを問う 2026-06-25 の review。review は、essay には既に
public で version 管理された markdown corpus が複数の publishing platform に
syndicate された形で存在するが、その corpus が publishing pipeline であって、
ecosystem の他が備える 3 つの governance 要素 —— intrinsic-identifier の
priority claim、整合した license (ADR-0015 の機械が mine する audience の rule に
反して attribution 要求型 content license を宣言していた)、entity federation
—— を欠いていることを見出した。決定は genre split —— essay を
intrinsic-identifier canonical に、paper を concept-DOI canonical に —— を適用し、
本 ADR が plan でなく記録する implementation として、essay corpus は
public-domain dedication へ relicense され、archive snapshot identifier を運ぶ
citation record を与えられ、ecosystem hub・著者 identifier・sibling DOI へ
repository surface で federate された; paper は concept DOI 上で既に canonical
であり preprint mirror が DOI へ back-route していることが確認された。

repo 慣例により本文から抽象化した specific instance: essay corpus は public な
articles repository で、日本語の technical-publishing platform と英語の
developer-publishing platform に newsletter mirror 付きで syndicate されている;
content-addressed な public archive は ADR-0013 が名指す UNESCO 後援の source-code
archive と同一で、snapshot identifier は SWHID (ISO/IEC 18670) である; paper
genre の concept DOI は program の他と同じ DOI service が採番し、preprint mirror は
そのページが DOI へ back-route する scholarly preprint server に置かれる。genre
routing と federation-over-tag の binding が normative な内容であり、specific な
platform は current な instance である。本決定は ADR-0015 (license by audience) を
補完し ADR-0013 の DOI-impractical-genre 条項を instantiate し、ADR-0001
(concept-DOI canonical)、ADR-0005 (bilingual corpus の audience-driven
localization)、ADR-0009 (federation binding が依拠する登録 surface としての
structured graph —— 2026-08-19 改訂後は検討対象集合への到達とエンティティ解決)、ADR-0010 (paraphrase を生き残る binding edge としての
distinctive vocabulary)、Layer 3 (promotion を司る idea-versus-scaffold
separation)、manifesto の open question 4 (substitute priority-claim 機構) と
8 (federation binding が抑えようとする reach-without-recognition failure mode)
に anchor する。
