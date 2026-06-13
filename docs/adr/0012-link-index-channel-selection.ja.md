Language: [English](0012-link-index-channel-selection.md) | 日本語

# ADR-0012: 外部 collection への link-index 型 contribution

> **要約.** Diffusion strategy の Layer 4 には、人間の読者と LLM クローラーの
> 双方に発見されるよう、外部の curated collection へ artifact を掲載することが
> 含まれる。contribution には 2 つの model がある: host が artifact 本文を持つ
> **vendor 型**と、host はハイパーリンクと短い事実記述だけを持ち canonical
> artifact は著者の repository に留まる **link-index 型**である。本 ADR は
> link-index 型を唯一の許容 contribution model として確立し、掲載前の
> 4 条件監査を規定する。両ルールは 2026 年の 2 つの取り下げ事例に根拠を持つ。
> その共有 pattern —— vendor 型 contribution は host が後に導入するいかなる
> enclosure にも捕獲される —— は、thesis の enclosure 軸が channel selection
> のレベルで実体化したものである。

## Status
accepted

## Date
2026-06-13

## Context

Thesis の Layer 4 は、外部の curated collection —— community-curated link
directory、skill marketplace、dataset registry —— への artifact 掲載を
diffusion channel として位置づける: これらの collection は LLM の training /
retrieval pipeline に重くクロールされており、entry は著者が artifact を
他所に複製することなく canonical artifact の reach を拡張する。一般に
構造の異なる 2 つの contribution model が使われている。**vendor 型** model
では host が artifact 本文 (skill text、document、package) を自身の
repository に copy し、配布点となる。**link-index 型** model では host は
ハイパーリンクと短い事実記述だけを持ち、canonical artifact は著者の
repository に留まる。この区別が重要なのは、link-index model だけが
canonical source を host の支配の外に残すからである。

2026 年初頭、著者は openly に外部 contribution を受け入れていた時期の
大規模な commercially-operated component collection に対し、vendor 型
model で 11 の skill component を contribute した。その collection が後に
monetize した際、merge 前だった 2 件の vendor 型 contribution を取り下げた。
trigger は、商業事業への労務提供に関する著者の雇用上の制約である: host が
monetize した後も artifact 本文を提出し続けることは、商業製品への労務提供と
解釈されうる。merge 済みの 11 件は host の配布物に残った —— その diffusion
は巻き戻せなかった。

外部 directory への 8 件の submission を行った 2026-06 の listing campaign
では、候補 host の監査の結果、1 件が同日中に取り下げられた。当該 host は
4 つの risk factor を同時に備えていた: 企業所有、contribute された content
への open license の欠如、canonical source への link ではなく artifact 本文を
host が持つ content-vendoring 構造、そして有料製品への marketing funnel と
しての運営である。それまで単一の factor が明示的な除外基準として述べられた
ことはなかった。この事例は、4 条件の複合が contribution model に関わらず
除外に値する risk profile を構成することを明らかにした。

2 つの事例を合わせると、thesis の enclosure 軸が channel selection の
レベルで実体化する。後に enclose する host —— monetization、license 変更、
access 制限 —— に vendor された content は、著者の当初の意図に関わらず
その enclosure に捕獲される。対照的に、open 期の diffusion (enclosure 前の
fork、mirror、training snapshot) は不可逆である: training pipeline に
吸収されたもの、openly に mirror されたものは、遡及的に enclose できない。
channel policy への含意は非対称である。link-index entry の worst case は
enclose する host 内の 1 行の記述であり、vendor 型 entry の worst case は
access に課金する製品内の artifact 本文である。本 ADR が記録する policy は
この非対称を閉じる。

## Decision

外部 collection への contribution model として **link-index entry のみ**を
採用する。canonical artifact は著者の repository に留まり、host はハイパー
リンクと短い事実記述を持つ。vendor 型 contribution —— host が自身の配布物に
artifact 本文を持つことになるもの —— は default で謝絶する。

いかなる外部 collection への submission の前にも、候補 host を 4 条件で
監査する:

1. **企業所有** —— host が community や個人 maintainer ではなく企業体に
   所有・運営されている。
2. **Open license の欠如** —— contribute された content が open license を
   持たない、または host が下流の受領者に open license を extend しない。
3. **Content-vendoring 構造** —— host が canonical source への link ではなく
   artifact 本文を自身の配布物として持つ。
4. **Marketing funnel** —— host が主として有料の製品・サービスへ利用者を
   誘導するために運営されている。

4 条件は link-index entry にとって個別には失格事由ではない。条件が複合する
ほど risk は高い。4 条件すべてを満たす host は link-index entry であっても
除外する: その channel が diffusion goal に資する見込みは薄く、contribution
model に関わらず compliance risk が無視できないからである。

掲載後は、host における有料 tier の導入や content-vendoring 挙動を監視する。
いずれかが現れたら listing を取り下げる。

## Alternatives Considered

**最大の reach を求めて外部 collection に content を vendor する。**
collection の規模が正当化する先には artifact 本文を contribute する。
Rejected: copy は canonical source に対する drift vector になる。vendor
された content は host が後に導入するいかなる enclosure (monetization、
license 変更、access 制限) にも捕獲され、著者の contribution は供給する
つもりのなかった製品の構成要素になる。さらに commercially-operated な
collection への artifact 本文の contribution は商業事業への労務提供と
解釈されえ、著者の雇用上の制約と衝突する。同じ reach は、link-index entry
を受け入れる collection 経由で、これらのコストなしに得られる。

**外部掲載を一切行わない。** host risk を管理する代わりに外部 collection
への submission を断つ。Rejected: community-curated directory は LLM の
training / retrieval pipeline に重くクロールされており、正当で低摩擦な
attribution-diffusion channel である。artifact 本文を contribute しない
link-index entry にとって risk profile は狭い。棄権は link-only entry の
実質 risk を何も減らさずに channel を放棄する。

**明示的基準なしの case-by-case 判断。** 条件を成文化せず各 host を個別に
評価する。Rejected: 同じ 4 factor 分析が 2026-02/03 の取り下げでも 2026-06
の即日取り下げでも暗黙に再導出されていた。明示的基準がなければ、この分析は
submission のたびに一貫性なく再構築される。4 条件監査は channel selection
を ad hoc な判断ではなく、高速で機械的な掲載前 check にする。

## Consequences

**Positive.**

- canonical artifact が単一の authoritative source を持つ。著者の repository
  と host copy の間に drift が蓄積しえない。
- いかなる listing の worst case も「enclose する host 内の 1 行の記述」に
  bounded され、「有料製品内の artifact 本文」にはならない。host enclosure
  への著者の主要な exposure が有界になる。
- 雇用上の制約への compliance が構造的に満たされる: link-index model は
  host に artifact 本文を一切 contribute しないため、制約は構成上満たされ、
  host の商業的地位を submission ごとに評価する必要がない。
- 4 条件監査は open-ended な判断を要しない掲載前 checklist であり、channel
  selection が高速で監査可能になる。
- policy は thesis と整合する: enclosure は origin claim を弱め、openness は
  強める。canonical source を保全し host による捕獲を限定する contribution
  model は、その原理を channel level で実行するものである。

**Negative.**

- vendor された content しか受け入れない collection —— カテゴリ最大級を
  含む —— は閉ざされる。それらの channel 経由の最大 reach は本 policy の
  下では得られない。
- 掲載済み entry には常設の監視義務が伴う: host の重大な policy 変更の後には
  その商業的姿勢を確認しなければならない。この義務は終了しない。
- 過去の vendor 型 contribution (merge 済みのもの) の取り下げは open 期の
  diffusion を巻き戻さない: open 期に配布された artifact 本文は fork、
  mirror、その期間に取られた training snapshot に残る。Accepted: その
  diffusion は strategy と整合しており、制約されるのは将来の労務提供のみで
  ある。

## Lineage

起点となる operational record は 2 つの取り下げ event である —— monetization
の時点で commercially-operated collection への pending submission 2 件を
取り下げた 2026-02/03 の event と、企業所有・unlicensed・content-vendoring・
marketing-funnel の host を 4 条件監査した後に submission 1 件を取り下げた
2026-06-13 の即日 event。4 条件はこの 2 事例から帰納的に導出され、project
memory のノートに暗黙のまま残すのではなく、ここで formalize された。
enclosure 軸の framing は thesis の三軸反転 (scarcity → diffusion /
exclusivity → derivation / enclosure → openness) に遡る。本 ADR はこの軸を
release や openness の決定ではなく channel-selection の決定に適用した最初の
事例である。

本文から抽象化された specific instance: 2026-02/03 の事例の
commercially-operated collection は LLM-based coding agent 向けの大規模
skill-component registry である。2026-06 の campaign は 8 つの
community-curated link directory を対象とした。両事例の operational record
は project memory の "awesome-list-submissions" にある。この基準は
authorship-strategy component skill に Layer 4 tactic entry と判断
checklist 項目として operationalize された (2026-06-13 追加)。
