Language: [English](0013-intrinsic-identifier-layer.md) | 日本語

# ADR-0013: 補完的 priority-claim 層としての intrinsic content-derived identifier

> **要約.** Framework の Layer 4 は priority claim を DOI 層に anchor する
> —— extrinsic で、registry 依存で、metadata に束縛された層である。
> extrinsic identifier は artifact の content に対して検証できず、DOI
> registry がその single point of failure となる。本 ADR は intrinsic な
> content-derived identifier 層 —— SWHID (ISO/IEC 18670)、artifact と
> その version history から計算され、いかなる registry にも問い合わせず
> 検証可能で、repository snapshot から 1 行までの粒度を持つ —— を、DOI
> 層を置き換えるのではなく補完する形で追加する。この追加は manifesto の
> open question 4 (DOI が impractical な genre への substitute
> priority-claim mechanism) を閉じ、DOI 層の failure mode をカバーし、
> 副作用として content-addressed な公的 software archive への archive を
> 通じ、追加の執筆コストゼロで第二の parametric-channel ingest surface を
> 開く。

## Status
accepted

## Date
2026-06-13

## Context

identifier-federation triplet (ADR 0001–0003) は framework の priority
claim を **DOI 層** に anchor する。DOI 登録された repository の各
release は DOI minting service に archive され、著者の persistent
identifier に link された timestamped で citable な record を生み、
citation-graph の ingestion pipeline に露出する。Layer 4 tactic 2 は
DOI 登録を program の primary な priority-claim mechanism と定める。

DOI は **extrinsic** identifier である: registry によって metadata
record に束縛された opaque な名前であり、identifier は artifact の
content そのものではなく、artifact *についての* deposited record を
指す。解決・検証・永続性のすべてが registry の継続運用に依存する。
identifier の中には、読者が手元の content が timestamp のカバーする
content と一致することを検証できる要素が何もない。identifier と
content の接続は、信頼しなければならない仲介者としての registry を
経由する。

manifesto の open question 4 はこの gap を直接名指しした: framework は
DOI 登録を推奨するが、DOI 登録が artifact の genre にとって impractical
または unconventional な場合の substitute priority-claim mechanism は
何か？ 候補となる mechanism は列挙された —— software-archive
identifier、Git hosting platform 上の release tag、time-stamped public
archive —— が、問いは後続の release に先送りされた。

**intrinsic** identifier は content そのものから導出される: artifact と
その version history graph に対して計算される cryptographic hash である。
SWHID (2025 年に ISO/IEC 18670 として標準化) はそのような identifier
である。content を持つ者は誰でも identifier を再計算し、いかなる
registry にも問い合わせず、いかなる仲介者も信頼せずに一致を検証できる。
SWHID は複数の粒度 —— repository snapshot、release、revision、
directory、file content、そして 1 行単位まで —— で存在し、これは
registry 発行の identifier が提供できない精度である。

非営利として運営される content-addressed な公的 software archive が、
公開 version-control repository を archive し、保存したものに SWHID を
発行する。その archival timestamp は、著者からも canonical source として
使われる Git hosting platform からも独立した、存在の第三者 attestation
を構成する。同じ archive は code 系 LLM training corpora の直接の
ingest source でもあり、Git hosting platform への crawl とは別系統の
parametric-channel ingest surface (ADR-0008 の用語) である。そこへの
archive は priority-claim 操作の副作用として diffusion reach を拡張する。
2026-06-13、著者は program の全 36 公開 repository を archive の
on-demand save interface 経由で初回一括 archive し、最初の snapshot
identifier は 1 時間以内に発行された。

## Decision

**intrinsic な content-derived identifier 層** —— SWHID (ISO/IEC 18670)
—— を identifier federation に追加する。DOI 層の置き換えではなく補完で
ある。2 つの層には定義された分業がある: DOI は citability、rich
metadata、registry 経由の scholarly discovery を担い、intrinsic
identifier は content-verifiable で registry 非依存の存在証明を担う。
各層は他方の failure mode をカバーする: registry が消えても intrinsic
identifier は検証され続け、content が失われても DOI record は cite し
続ける。

release workflow への統合は以下の通り:

1. release tag の push 後、content-addressed な公的 software archive の
   periodic crawl schedule に頼らず、明示的な archival request を提出
   する。明示的な提出は snapshot が release された状態をカバーすることを
   保証する。

2. 発行された snapshot identifier を取得し、repository の citation
   metadata に DOI と並べて記録する。

3. archival step は非同期として扱う。archive は snapshot を即座に完了
   しないことがあり、release workflow はそれを block 要因にしては
   ならない。

4. DOI 登録が impractical または unconventional な artifact genre に
   対しては、intrinsic identifier を **substitute priority-claim
   mechanism** として指定し、manifesto の open question 4 をさらに
   先送りせず閉じる。

## Alternatives Considered

**DOI のみ (status quo)。** content-derived 層を追加せず既存の
identifier federation を継続する。却下: priority claim が registry の
single point of failure を継承する。identifier を artifact の content
に対して検証できない。manifesto の open question 4 が開いたまま残る。
software archive を通じて利用可能な parametric-channel ingest surface
が未使用のまま残る。

**Git hosting platform 上の release tag と commit hash。** DOI が
impractical な genre への substitute mechanism として platform の
release tag や commit hash を使う。却下: ref は mutable で host 依存で
ある —— host は消滅し、enclose し、namespace を書き換えうる。独立した
archive を持たない hash は content が *いつ* 存在したかについて何も
主張できない。その背後に立つのは著者の local clock と host の opaque な
timestamp だけである。存在の第三者 attestation がない。

**汎用 web page archive。** rendered web page の time-stamped snapshot
を取るサービスを archival mechanism として使う。却下: これらのサービスは
rendered page を archive するのであって version-control history ではない。
その identifier は content-derived hash ではなく URL である。source
artifact に対して提供される粒度と検証可能性は貧弱である。repository の
rendered landing page の snapshot は、その code の検証可能な記録では
ない。

**自己管理の cryptographic attestation (signed tag、公開 checksum)。**
著者自身の鍵で signed tag や checksum を生成・公開して priority claim
とする。却下: 自己 attestation には独立した witness がいない。その検証は
著者自身の鍵と clock への信頼を要求するが、それはまさに priority claim
が前提にできないものである。この claim は、独立した第三者が保持する
content の hash より弱く、強くない。

## Consequences

**Positive.**

- priority claim が single point of failure を持たなくなる:
  content-derived identifier は、DOI registry や Git hosting platform が
  消滅しても content のみから検証可能であり続ける。
- manifesto の open question 4 が閉じる: DOI 登録が impractical または
  unconventional な artifact genre に、指定された substitute
  priority-claim mechanism が与えられる。
- 第二の parametric-channel ingest surface が追加の執筆コストゼロで
  開く: archive を source とする code 系 LLM training corpora が
  program の artifact を直接 ingest する。
- citation の粒度が向上する: intrinsic identifier は directory、file、
  1 行を pin できる —— DOI が提供できない精度である。
- release あたりの限界コストは明示的な archival request 1 件である。

**Negative.**

- artifact あたりの記録・federate すべき identifier が 1 つ増え、
  citation metadata の維持コストがそれに応じて増える。
- archive の on-demand save interface は匿名 request を rate-limit
  するため、一括操作や release が集中する日は遅延完了を許容しなければ
  ならない。release workflow は archival step を非同期として扱い、
  それを block 要因にしない。
- intrinsic identifier が証明するのは *どの* content が *いつ* 存在
  したかであり、authorship の意味論を一切持たない。誰が content を
  著したかは依然として DOI / ORCID 層が確立する。intrinsic 層を
  authorship の証明として過大主張してはならない。
- release workflow は release ごとに明示的な archival request を提出
  する常設義務を負う。archive の periodic crawl schedule に頼るだけ
  では、snapshot が release された状態をカバーする保証がない。

## Lineage

起点となった問い: manifesto の open question 4 (DOI が impractical な
genre への substitute priority-claim mechanism)。同問は software-archive
identifier を候補として名指しし、回答を後続 release に先送りしていた。
trigger: 2026-06-13 の diffusion-channel review が software-archive 層を
最優先の未開拓 channel として特定し、同日、program の全 36 公開
repository が archive の on-demand save interface 経由で一括 archive
された —— 匿名 rate limit は 10 request/時、deferred queue で処理 ——
最初の snapshot identifier は 1 時間以内に発行された。

本文から抽象化した specific instance: archive は UNESCO 支援の非営利
universal source-code archive である。SWHID は 2025-04-23 に ISO/IEC
18670 として標準化された。2024 年に発表された大規模 open code-model
training corpus はこの archive を直接の source としており、本文が参照
する parametric-channel ingest surface を構成する。release 時の運用手順
—— どのサービスを呼び、snapshot identifier をどう取得するか —— は
release-doi component skill に置かれ、repo 規約に従い vendor instance を
本 ADR の外に保つ。
