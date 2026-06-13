Language: [English](0014-implementation-tracking-two-tier-ledger.md) | 日本語

# ADR-0014: 二層 ledger と定期 gap-review による実装トラッキング

> **要約.** Layer 4 tactic は一度撃って終わりではなく、時間軸で運用
> される deployment decision である。program は既に、どの tactic を
> いつ deploy したかを記録する public な intervention timeline を公開
> している。その empirical 層の規約 —— 効果主張なし、host 抽象化規律
> (ADR-0012)、運用詳細なし —— は、それを progress-management 機構と
> して兼用することを妨げる。本 ADR は二層 ledger を確立する: private な
> implementation ledger が tactic ごとの deploy status・ランク付き
> candidate intervention・運用詳細を持ち、public timeline はその投影
> として日付付きで効果主張なしに保たれる。定期 gap-review が、deploy
> 済み tactic を Layer 4 catalog と framework の open questions に
> 突き合わせて新規提案を生む。review 手順は framework の operational
> skill に置き、project 固有の配線は project の context file に置く。

## Status

accepted

## Date

2026-06-13

## Context

Layer 4 tactic は時間軸で持続する deployment decision であって、一度
限りの行為ではない。戦略を一貫して運用するには、どの tactic が deploy
済みで、何が pending で、次の一手が何かという running な運用像が要る
—— session ごとに自分の位置を再導出するのではなく、それに基づいて
一貫して動くために。

program は既に、empirical 層の一部として public な intervention
timeline を公開している: どの tactic をいつ deploy したかを記録する
DOI-versioned な成果物である。この timeline は empirical 層の常設規約
—— preliminary-observation tone、効果主張なし、external-collection
ADR (ADR-0012) が確立する host 抽象化規律 (各介入の背後にある具体的
host や運用上の identity は一般的記述に抽象化される) —— に支配される。
empirical 層が執行のために存在する normative/empirical 分離も適用される:
timeline は観測記録への methods companion であって、戦略文書ではない。

progress-management 機構は、これらの規約の逆を要求する。tactic ごとの
deploy status (deployed / in-progress / not-started / out-of-scope)、
根拠付きのランク付き candidate intervention、そして timeline の抽象化
規律が明示的に除去する運用詳細 —— host identity、rate limit、pending な
外部依頼 —— を持たねばならない。これらを public timeline に書き込むと、
その役割が壊れる: preliminary-observation な methods companion である
ことをやめて planning scratchpad になり、ADR-0012 の抽象化規律を破り、
運用詳細を public に晒す。timeline は DOI-versioned な記録であり、
planning note で enrich することは、empirical な機能を持たない内容で
versioned artifact を churn させることにもなる。

必要なのは、一貫した次手提案を駆動する運用 status の durable な置き場で
あり、public timeline を汚さず、かつ作業状態を session ごとにゼロから
再導出せずに済むものである。

## Decision

実装トラッキングを、役割の厳格な分離のもとで **二層** で維持する。
第一層、private な implementation ledger は operational source of
truth である: tactic ごとの deploy status (deployed / in-progress /
not-started / out-of-scope)、根拠付きランク付き candidate
intervention、そして public timeline が持ってはならない運用作業詳細。
第二層、public な intervention timeline は ledger の日付付き投影で
ある: 効果主張なし、運用詳細は ADR-0012 が定める水準に抽象化、canonical
な公開言語で。両者は決して merge しない。

四つの運用ルールが両層を統べる:

1. **Update rule.** 介入が deploy されたら、まず ledger を更新し、次に
   public timeline に日付行を投影する。ledger が常に source、timeline
   が常に projection。

2. **Gap-review procedure.** 定期 gap-review が新規提案を生む: ledger
   の現 status を読み、deploy 済み tactic を Layer 4 tactic catalog・
   framework の open questions・最新の関連文献に突き合わせて gap-analyze
   し、candidate intervention をランク付けし、各を framework の判断
   チェックリストに通し、残った candidate を ledger に記録して提示する。

3. **Division of homes.** review 手順は汎用であり framework の
   operational skill に置く —— どの adopter も回せるように。project 固有
   の配線 —— どの artifact が本 program の ledger と timeline か —— は
   project の context file に置く。portable な skill が個人の artifact
   位置を hardcode してはならないからである。

4. **Trigger.** gap-review は default で on-demand に回す —— 次の一手が
   問われたとき、または介入の一巡が閉じたとき。定期スケジュールは
   optional な wrapper であって、primary な起動機構ではない。

## Alternatives Considered

**Single-document トラッキング。** public intervention timeline 自身に
status とランク付き提案セクションを足す。却下: DOI-versioned な public
empirical artifact を運用作業内容で overload し、preliminary-observation
かつ methods-companion な役割を壊し、運用詳細を surface して ADR-0012
の抽象化規律を破り、empirical な機能を持たない planning note で
versioned record を churn させる。timeline は citable かつ public だが、
planning scratchpad はそのどちらでもない。

**Procedure を project context file に置く。** gap-review 手順全体を
reusable な skill ではなく project の context 文書に置く。却下: multi-step
の review-and-propose workflow は手順的内容であり reusable な skill 層に
属する; context 文書は project 固有の配線のためのものである。手順を
そこに置くと context file を肥大させ、その役割と不整合になり、project の
context を共有しない adopter に対して review を non-portable にする。

**形式的機構なし。** ledger-and-projection の規律も review loop も無しに、
会話と memory で ad hoc に追跡する。却下: 維持された記録なしでは deploy
status が drift し、public timeline と作業状態が silently に乖離し、
次の一手が、維持された gap-analysis からではなく毎回不整合に再導出される。
informal な手法は、利益を蓄積せずに、形式的手法の coordination cost を
session ごとに再生産する。

## Consequences

**Positive.**

- public timeline がその役割を保つ: planning scratchpad ではなく効果
  主張なしの介入記録。DOI-versioned な内容が運用 note で churn されない。
- 運用 status とランク付き提案が durable な置き場を得る; 次の一手が
  ad hoc な再導出ではなく反復可能な gap-analysis から生まれる。
- gap-review は framework の self-application である: program が自身の
  diffusion 実装を観測し、自らが公開するのと同じ tactic catalog と open
  questions から次手を生む。これは empirical 層の役割についての open
  question、および framework の自己再帰的適用についての open question に
  関わる。
- 汎用の review 手順は、同じ framework を運用する任意の著者が採用可能;
  project 固有なのは配線だけ。

**Negative.**

- 二つの artifact を同期し続けねばならない; update rule (ledger 先、
  次に projection) は時間的圧力下で skip されうる常設規律であり、作業
  状態と public 記録の間に drift を生む。
- private ledger は citable でない; public 記録は必然的に lossy な投影で
  あり、外部読者は介入と日付を見るが、その理由や却下された candidate は
  見えない。
- gap-review の提案品質は tactic catalog と open-question set が最新で
  あることに依存する; stale な catalog は stale な提案を生む。

## Lineage

起点となった need: 2026-06-13 の、公開 intervention timeline を、新規
戦略提案も生む living な progress-management 機構にしたいという要望。
この要望が、運用上の need と public artifact の empirical 層規約 ——
planning 内容も無修正の運用詳細も認めない —— の衝突を表面化させた。

本文から抽象化した specific instance: private ledger は project の他の
運用記録と並んで維持される project-memory note; public intervention
timeline は empirical 層の implementation-log 文書; framework の
operational skill はその authorship-strategy component skill; project の
context file は repository の agent-instruction 文書。review 手順の汎用形
はその component skill に記録され、本 ADR は決定とその理由のみを記録する。
