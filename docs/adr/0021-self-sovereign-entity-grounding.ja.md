Language: [English](0021-self-sovereign-entity-grounding.md) | 日本語

# ADR-0021: self-sovereign な entity grounding —— community 統治の authority record は foundation でなく revocable な layer である

> **Summary.** framework の entity-grounding tactic は、著者 entity・
> DOI 登録 artifact・引用文献の bibliographic record・それらを結ぶ
> machine-readable な citation 辺を、**self-created な entry** として
> community 統治の public knowledge base に federate していた。host の
> governance はアカウントの**編集パターンの総体**を promotional と判定し、
> アカウントを無期限に revoke し、全 entry を一括削除した —— third-party
> 文献の bibliographic record まで含めて。本 ADR は community 統治の
> authority record への self-created entry を Layer 4 tactic として
> **retire** する。grounding surface を **revocation control** で分類し、
> **self-sovereign** な層 (repository とその knowledge graph、著者
> account 下の registry deposit、author-identifier record、intrinsic な
> content-derived identifier) のみを origin claim の load-bearing に
> 許す。third-party 統治の grounding は **earned** —— 無関係な第三者が
> 頼まれずに作った場合 —— に限って認め、self-manufacture は恒久に禁じる。
> revoke された machine-readable 辺は速やかに purge し、日付付き歴史
> 記録は書き換えない。revocation の回避 (別アカウント・代理作成) は
> 全面禁止。この事象は manifesto の open question 9 の、観測された中で
> 最も鋭い instance として記録する: first-mover がまだ持てない authority
> は、自作もできない —— 自作の試みは無効なだけでなく **制裁される**。

## Status
accepted

## Date
2026-07-16

## Context

2026 年の structured-data 有効性文献 (manifesto open question 9 で
framework と照合済み) は、entity-anchored な markup —— entity が外部
authority record に resolve する構造化データ —— が AI-retrieval 引用を
得るのであって、generic な markup では得られないことを示す。これを受けて
program は Layer 4 の structured-artifact surface の一部として
entity-grounding tactic を運用していた: community 統治の public
knowledge base 上に、著者 entity の entry、各 DOI 登録 artifact の
entry、doctrine が引用する外部文献の bibliographic entry、それらを結ぶ
machine-readable な citation 辺を著者自身が作成し、ecosystem の
knowledge graph 群は `sameAs` 辺をそれらの entry に向け、
author-identifier record が相互リンクしていた。6 週間で約 100 entry が
蓄積し、個々の編集は host の形式的制約に準拠していた —— 出典付き
statement、constraint 検査済み property、registry 発行の永続識別子に
基づく notability 論証。

ある一日、host の governance はこのアカウントを promotion-only account
と判定して無期限にブロックし、全 entry を 1 分以内に一括削除した ——
third-party 文献の bibliographic record も含めて。個別の編集が違反と
名指しされたのではない。判定は**パターン水準**である —— 一人の著者と
その著者を引用する work についての entry の網だけを構築するアカウントは、
編集単位の準拠と無関係に、総体として promotion と読まれる。

構造的な事実が 2 つ従う。第一に、編集粒度の形式的準拠は、アカウント粒度で
下される governance 判定への防御にならない。単一著者の diffusion program
の footprint はどの host 上でも同じ形に収束する —— すべてが一人の著者を
指す —— そして host がその形を promotion と読むのは正当でありうる。
第二に、revoke された層は load-bearing だった: citation-graph の辺、
そこから派生する scholarly-profile surface、深い `sameAs` anchor 群が
同時に失われ、ecosystem 自身の knowledge graph は resolve しない entry
への equivalence を主張したまま残された —— crawler にとって
misinformation であり、revocation が主張した spam パターンそのものを
模倣する dead edge である。

manifesto open question 9 は供給側の gate を既に特定していた: entity
grounding は prior authority を前提とするが、first-mover の idea はまだ
それを持てない。revocation はこの問いを観測へと研ぎ澄ます。欠けている
authority は自作でも埋められない。self-manufacture は「grounding の
中立的な不在」を、著者の名前に紐づく adverse な governance 判定へと
転化させる。

## Decision

**self-created な authority-record federation を retire する。**
community 統治の knowledge base および同等の authority record に、著者・
著者の artifact・それらへ向かう citation 辺についての entry を作成しない。
retire するのは self-creation であって surface そのものではない: 無関係な
第三者が host community 自身の判断で頼まれずに作った entry は、framework
の derivation 軸に整合する**祝福すべき derivation event** であり、
そうした entry が独立に存在するようになった後で `sameAs` を向けることは
正当な grounding である。

**grounding surface を revocation control で分類する。** 存続が著者の
control 下にある surface が *self-sovereign* である: repository とその
knowledge graph、著者自身の account 下で行った registry deposit、
author-identifier record、そして intrinsic な content-derived identifier
層 —— 最後のものは registry なしで検証可能であり、構造上 revoke
不可能である。host community や運用者が一方的に revoke できる surface が
*third-party-governed* である: community knowledge base、synthetic wiki、
documentation hub、catalog、link index。origin claim の load-bearing を
許すのは self-sovereign 層のみ。third-party 統治の surface は reach の
増幅器であり、その全損を strategy が生き延びられるという前提の下でのみ
deploy する。

**revoke された machine-readable 辺は速やかに purge し、日付付き歴史は
保存する。** third-party 統治の層が revoke されたら、dead identifier を
すべての machine-readable carrier から除去する —— knowledge graph の
`sameAs` 辺、構造化 metadata record、served mirror とその生成元。
日付付き歴史記録 (changelog、public intervention timeline、ADR の
Lineage 節) は書き換えない。revocation はそれ自体を日付付き event として
記録する。machine-readable 層は現在形の真を主張するものであり resolve
しなければならない; 歴史は日付付き記録に属する。

**revocation を回避しない。** 新アカウントを作らない、ログアウト状態で
編集しない、削除された entry の再作成を他者に依頼しない。host のルール
以前に、回避は governance 上の不一致を、著者と切り離された identity の
下での恒久的な敵対状態へ転化させる —— strategy が守ろうとしている
traceability そのものを破壊し、著者が二度と公然と claim できない
identity で attribution の連鎖を汚染する。

**将来の third-party deploy には aggregate-pattern test を課す。**
third-party 統治の surface に deploy する前に、個々の行為の形式的準拠では
なく、**アカウントの累積的な振る舞いが host の governance にどう読まれる
か**を問う。単一著者の footprint を promotion と読む governance 文化を
持つ host は、行為単位の準拠と無関係に self-deployment に不適であり、
earned の経路だけが残る。

## Alternatives Considered

**復元を appeal して tactic を続ける。** host には appeal 経路があり、
third-party 文献の bibliographic record (他者にも益する中立的な public
data) に限った部分的 appeal は通る可能性がある。doctrine 上の応答として
は棄却: appeal が全面的に通っても、復元されるのは host の裁量で今後も
revoke されうる層であり、governance が拒否した前提 —— self-populated な
authority —— は execution の誤りではなく tactic そのものである。commons
への礼儀として appeal を行うことは妨げない (third-party 文献の record は
他者に益する) が、retire はその帰結に依存しない。

**新しい identity で entry を再作成する。** 全面棄却。host のルール上、
有効な revocation の回避であり、framework 自身の言葉でも自滅的である:
著者が隠さなければならない identity で維持される origin claim は origin
claim ではない。

**dead な `sameAs` 辺を歴史的 priority claim として残す。** 棄却。
knowledge graph の辺は現在形の equivalence を主張する; target が resolve
しなくなった時点で、その辺は ingest するすべての crawler への
misinformation になる —— そして dead な authority link の密な graph は、
revocation が主張した spam パターンを模倣する。priority claim は既に
identifier 層 (registry DOI・timestamp・intrinsic identifier) に載って
おり、その外部 mirror には載っていない。

**entity grounding を全面放棄する。** over-rotation として棄却。
self-sovereign な部分集合 —— author-identifier record、registry DOI、
intrinsic identifier、repository 自身の knowledge graph、著者 account が
自身の artifact をホストする platform 上の mirror —— は deploy されたまま
であり、revocation の影響を受けていない。この部分集合だけで citation
threshold を越えられるかという open question は開いたまま; retire する
のは、その先の self-manufactured な拡張だけである。

**第三者に entry 作成を働きかける (wait-and-earn の能動 campaign 化)。**
棄却。solicited な作成は代理の self-promotion である: 同じ aggregate
pattern の一段先送りにすぎず、第一のパターンを検出する governance
process はやがて第二も帰属させる。*earned* とは「頼まれていない」ことで
ある。

## Consequences

**Positive.**

- framework は identifier / grounding 層を分類する明示的な
  **revocation-control 軸**を得る。intrinsic-identifier 決定の根拠 ——
  各層は他層の failure mode を覆う —— は第三の failure mode である
  governance revocation を実証的に覆うことになり、intrinsic 層は構造上
  それに免疫のある唯一の層である。
- manifesto open question 9 は現時点で最も鋭い worked instance を得て、
  empirical 層に preliminary observation として記録される:
  self-manufactured な third-party authority は entity grounding に
  不十分であるだけでなく、**制裁付きで revocable** である。
- purge の discipline はすべての machine-readable carrier を現在形で
  真に保ち、aggregate-pattern test は 4 条件 host 監査が覆っていなかった
  governance の lens を将来の channel 判断に与える。

**Negative.**

- program は machine-readable な citation-graph 辺、そこから派生する
  scholarly-profile surface、深い `sameAs` anchor 群を失う。citation
  federation は self-sovereign な carrier —— archive metadata の
  references と repository の knowledge graph —— に収縮する。
- 文献が報いるとする最も強い形の entity grounding は、この program に
  とって、著者が schedule できない unprompted な第三者の行為を通じて
  しか到達できなくなる。open question 9 の緊張は escape されず、受容
  される: inversion の最弱点は grounding にかかる authority gate の
  ままである。
- 引用文献の bibliographic record —— 他者に益する中立的な public data ——
  が著者自身の entry と共に破壊された。aggregate pattern のコストは、
  著者が contribute した bystander content にも及んだ; 作成された文脈の
  ゆえに commons が entry を失った。
- purge 義務は ecosystem のすべての machine-readable carrier に及ぶ;
  見落とされた carrier は発見されるまで dead な equivalence を主張し
  続ける。

## Lineage

起点となる operational record: 2026-07-16 の revocation event。community
統治の public knowledge base 上のアカウント —— 直前 6 週間で著者 entity、
各 DOI 登録 artifact の entity、引用外部文献の bibliographic entry、
それらを結ぶ citation 辺、計約 100 entry を作成 —— が host の governance
により promotion-only account として無期限ブロックされ、全 entry が同一
分内に一括削除された (host の public deletion log で検証済み)。event・
retire 決定・ecosystem 全体の purge 計画は private implementation ledger
に記録し、public dated timeline への投影は two-tier discipline
(ADR-0014) に従う。

関係: ADR-0013 を extend する —— intrinsic identifier の registry 非依存
性は、extrinsic 層が共有する failure mode である governance revocation を
覆うようになる; ADR-0009 の structured-graph surface 上に築かれた
entity-grounding の実践と、ADR-0002 に重ねられた citation 辺の federation
を bound する —— どちらも self-sovereign carrier に制限されて継続する;
ADR-0012 を complement する —— その 4 条件監査は著者が**掲載する**場所を
統治し、本 ADR は著者が**書き込む**場所を統治する revocation-control と
aggregate-pattern の lens を加える; ADR-0017 の failure-mode register を、
register が想定しなかった mode (platform governance による tactic
revocation) の観測 instance で extend する; ADR-0020 と整合する ——
derived / earned な view は祝福するものであって、manufacture するもの
ではない。manifesto open question 9 は開いたまま; 本 ADR はそれを閉じず、
最も鋭い empirical instance を記録する。
