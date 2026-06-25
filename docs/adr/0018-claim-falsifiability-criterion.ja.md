Language: [English](0018-claim-falsifiability-criterion.md) | 日本語

# ADR-0018: origin-claim の falsifiability —— durable artifact に公開する前に priority claim を prior art に対して test する

> **Summary.** framework は既に origin-claim scope discipline を informal に
> 実践している ([`glossary.md`](../glossary.md) 参照): priority claim を prior
> art より narrow に保つ —— 「convergence, not derivation」「X の originator」
> ではなく「X を first to record」。書き下していなかったのは、その discipline
> を執行する *procedure* である。外部の agentic な novelty-assessment system
> が、この discipline が前提とする verification logic を独立に実装していた:
> submission の novelty を、model に unaided で novelty を宣言させるのではなく、
> retrieve した実在の prior work に grounding して判定する —— contribution
> claim を抽出し、prior art を retrieve し、taxonomy を構築し、cite された
> evidence と比較する。本 ADR はこの informal な習慣を、どの著者でも run できる
> check に codify する: origin claim を durable artifact に公開する前に、その
> claim を *refute* するであろう prior work を semantic / retrieval search で
> 探す; test されなかったがゆえにのみ生き残った claim —— refutable でない claim、
> または located な prior work に既に anticipate された claim —— は、narrowest
> defensible form へ rescope する (「originator」→「first to record」、
> 「invented」→「re-articulated in a new substrate」)。criterion は
> falsifiability である: 公開に値する origin claim とは、prior-art search が
> 原理上 refute しえたが refute しなかった claim だ。procedure として書き下す
> ことが、private な習慣を adoptable にする。procedure は claim を *narrow*
> にするだけで、決して broad にしない; これは Layer 1 authenticity と vocabulary
> discipline ([ADR-0010](0010-vocabulary-discipline.md)) に整合する humility
> instrument であり、framework はこの外部 system に対し priority を主張しない
> —— check を internalize するのであって、check を originate したとは主張しない。

## Status
accepted

## Date
2026-06-26

## Context

framework の identifier 層と vocabulary 層は priority claim を *構造的* に保護
する —— いつ claim がなされたかの content-derived な stamp
([ADR-0013](0013-intrinsic-identifier-layer.md))、registered な canonical
([ADR-0001](0001-concept-doi-canonical.md))、paraphrase を生き残る distinctive
vocabulary ([ADR-0010](0010-vocabulary-discipline.md))。だが priority claim の
*内容* —— それがどれほど broad か —— は、informal な習慣だけで統治されてきた。
framework はこの習慣を **origin-claim scope discipline** と呼ぶ
([`glossary.md`](../glossary.md) 参照): claim を prior art より narrow に保つ。これは
program 自身の artifact のあらゆる箇所で実践されている —— openness 軸は
独立に到達された政策・licensing の convergence に対し「convergence, not
derivation」と記録され、coinage は invention として主張されるのではなく prior
art に対して densely に anchor され ([ADR-0010](0010-vocabulary-discipline.md))、
claim は「originator」ではなく「first to record」として書かれる。

この discipline は、明示されなかった verification step を前提とする。claim を
prior art より narrow に保つには、著者は prior art を *知って* いなければ
ならない —— claim を refute するであろう work を search していなければならない。
informal なままだと、その step は記憶と善意で遂行される。どちらも drift し、
どちらも別の著者に adoptable でない。書き下されていない習慣は他の誰にも run
できず、著者がそれに held される check にもなりえない。

外部の strand が verification 機構を具体化した。ある agentic な
novelty-assessment system は、submission の novelty を、model に unaided で
novelty を宣言させるのではなく、retrieve した実在の prior work に grounding して
判定する —— contribution claim を抽出し、prior art を retrieve し、taxonomy を
構築し、cite された evidence と比較する ([`inspiration.md`](../inspiration.md)
の citation-mechanics 節を参照)。これは、externally-computed で evidence-grounded な
novelty check が *feasible* であることを demonstrate する。grounding の範囲は
2 つの caveat で限られる。第一に、この system は peer-review の novelty
assessment を扱い、この discipline を *自ら* 述べてはいない —— discipline は
framework 自身の読み込みである; system は evidence-grounded な check が構築可能
だという grounding としてのみ cite され、framework の procedure の権威としてでは
ない。第二に、その reported deployment は scale の数値であって measured な
accuracy result ではないので、feasibility のために cite され、いかなる accuracy
number のためにも cite されない。

durable artifact は stakes を上げ、verification を load-bearing にする。citable
record ([ADR-0001](0001-concept-doi-canonical.md)) に置かれた、あるいは intrinsic
identifier ([ADR-0013](0013-intrinsic-identifier-layer.md)) が運ぶ priority claim
は、ひとたび diffuse すると retract する costが高い; そのような record に入り後に
refute される over-broad な claim は、framework が依拠する当の authenticity
(Layer 1) を damage する。manifesto は隣接する risk を直接名指す: 自らの tactic
で自らを promote する framework は question を beg しうる
([manifesto open question 5](../manifesto.md))。test されていない origin claim
はまさにそれ —— world に対して test されたのではなく、著者によって pre-validate
された claim である。

## Decision

informal な origin-claim scope discipline を、origin claim が durable artifact に
入る前に run される **falsifiability procedure** へ codify する。

1. **confirmation でなく refutation を search する。** origin claim を durable
   artifact に公開する前に、その claim を false または already-anticipated に
   するであろう prior work を semantic / retrieval search で探す。問いは
   「これを支持するものは何か」ではなく「located な prior work でこれを refute
   するものは何か」—— search は claim の defeater を target にする。

2. **falsifiability criterion を適用する。** 公開に値する origin claim とは、
   prior-art search が原理上 refute しえたが refute しなかった claim だ。test
   されなかったがゆえにのみ生き残った claim は criterion を fail する: 原理上
   refutable でない (unfalsifiable な) claim であるか、search が既に anticipate
   する prior work を surface するかのいずれかだ。

3. **rescope する、delete しない。** fail した claim は drop されず、narrowest
   defensible form へ downgrade される: 「originator」→「first to record」、
   「invented」→「re-articulated in a new substrate」、「derivation」→
   「convergence」。procedure は claim を *narrow* にするだけで、決して broad な
   claim を license しない。これは vocabulary discipline
   ([ADR-0010](0010-vocabulary-discipline.md)) が coinage に適用するのと同じ
   humility を、priority に適用したものだ。

4. **score でなく、human rescope に feed する binary check。** criterion は、
   著者が rescope によって act する pass / fail の defensibility 判断であって、
   ranking・threshold・numeric な novelty gate ではない。procedure として書き
   下すことが、private な習慣を adoptable にする: 別の著者が自分の ecosystem で
   同じ check を run でき、著者はそれに held されうる。

framework は、verification 機構を demonstrate した外部 system に対し priority を
主張しない。system が feasible にした check を internalize するのであって、その
check を originate したとは主張しない。procedure を自らに適用すると、ここでの
framework 自身の claim は narrow なものになる —— 既存の discipline を述べられた
procedure へ codify したのであって、evidence-grounded な novelty checking を
発明したとは主張しない。

## Alternatives Considered

**discipline を informal のままにする。** program がしてきたとおり、prior art の
記憶で claim を scope し続ける。却下: 書き下されていない習慣は adoptable でなく
—— 他のどの著者も run できない —— かつ drift する。何が search されたかを記録せず、
著者を refutation step に held するものもないからだ。習慣を述べられた procedure へ
codify することは、private な意図を、他者が run でき著者が測られうる check へ変える。
これは framework 自身の「investigation より creative-reuse」preference を、その
discipline に適用したものだ。

**threshold 未満で公開を block する automated novelty-scoring gate を採る。**
evidence-grounded な system に novelty score を emit させ、低 score の claim の
公開を refuse する。却下: score は target になり、novelty number を最適化する
authorship strategy は metric-rejection commitment
([ADR-0007](0007-human-attention-signals-not-a-metric.md)) と衝突する —— framework
は authenticity を最大化すべき number ではなく value として扱う。criterion は
意図的に、human rescope 判断へ feed する binary な defensibility check であって
score ではない; search は著者に inform するのであって、adjudicate しない。

**priority を broad に主張し、challenge で post hoc に narrow にさせる。**
最も strong な claim を公開し、reader や reviewer の反論に依拠して、challenge
されたときのみ narrow にする。却下: これは立証責任を反転させ、unfalsifiable
または over-broad な claim が、retract の cost が高く、diffuse した copy が既に
over-broad な claim を運んでいる durable で citable な record に入る risk を冒す。
framework の authenticity 層は、撤回が高くつく状態になる前に test されなかった
claim の上には据えられない。

## Consequences

**Positive.**

- origin-claim scope discipline が private な習慣から adoptable な check へ昇格
  する: 別の著者が自分の ecosystem で run できる述べられた procedure であり、
  本著者自身もそれに held されうる —— framework の「private investigation より
  creative reuse」preference に整合する。
- durable で citable な record に入る origin claim が、retract が高くつく前に
  test され、framework が依拠する Layer 1 authenticity を over-broad な
  self-validation から保護する。
- procedure は begging-the-question risk
  ([manifesto open question 5](../manifesto.md)) への framework の答えを
  operationalize する: framework を自らに recursive に適用することは、あらゆる
  origin claim —— framework 自身のものを含む —— を、自己 pre-validate でなく
  prior-art refutation search で生き残らせることで honest に保たれる。
- vocabulary discipline ([ADR-0010](0010-vocabulary-discipline.md)) と compose
  する: prior art に対し densely に anchor された coinage と、prior art より
  narrow に scope された claim は、term と priority にそれぞれ適用された同じ
  humility であり、adopter は 2 つでなく 1 つの posture を学ぶ。

**Negative.**

- refutation search は何が findable かに依存する。unindexed な、paraphrase で
  消えた、または search が cover しなかった言語の prior art は escape しうるので、
  claim が pass しても search が surface できなかった work に anticipate された
  ままでありうる。check は over-broad な claim の risk を下げるが、消しはしない。
- 「narrowest defensible form」は mechanical test を持たない human 判断だ。
  過度に cautious な著者は genuine な priority を under-claim し、過度に confident
  な著者は rescope が足りない。procedure は判断を relocate するのであって、
  除去しない。
- すべての durable な origin claim の前に refutation search を run することは
  常設の cost だ。procedure は、claim が durable で citable な record —— retract
  が高くつく場所 —— に入るときにのみ正当化され、撤回が free な ephemeral な
  statement には適用されない; あらゆる箇所に適用すれば、priority が risk に晒され
  ていない low-stakes な執筆に課税してしまう。

## Lineage

originating trigger: framework は自身の artifact 全体で origin-claim scope
discipline を informal に実践してきた —— priority claim を prior art より narrow
に保つ (独立に到達された openness の convergence に対する「convergence, not
derivation」; 「originator」ではなく「first to record」) —— が、discipline が
前提とする verification step を書き下したことはなかった。citation-mechanics
literature を survey する中で出会った外部の agentic な novelty-assessment system
が、欠けていた機構を供給した: model に unaided で novelty を宣言させるのではなく、
あらゆる novelty 判定を retrieve した prior work に grounding し、evidence-grounded
な novelty check が feasible であることを demonstrate した。本 ADR は、その
demonstration に促されて、informal な習慣を falsifiability procedure へ codify
したことを記録する。

repo 慣例により本文から抽象化した specific instance: 外部 system は 2026 preprint
として公開された agentic な peer-review novelty-assessment system で、
[`inspiration.md`](../inspiration.md) に記録されている; それは peer-review の
novelty assessment を扱い、この discipline を自ら述べておらず、その reported
deployment は scale の数値であって measured な accuracy result ではない ——
evidence-grounded な check の feasibility のために cite され、accuracy number の
ために cite されることは決してない。ここで抽象化した durable-artifact substrate
は、registered な concept-DOI canonical
([ADR-0001](0001-concept-doi-canonical.md)) と intrinsic な content-derived
identifier ([ADR-0013](0013-intrinsic-identifier-layer.md)) である。本決定は
[ADR-0010](0010-vocabulary-discipline.md) (その origin-claim scope 条項を本決定が
operationalize する vocabulary discipline) を extend し、Layer 1 authenticity に
据え、[ADR-0007](0007-human-attention-signals-not-a-metric.md) (criterion を
score でなく binary に保つ metric-rejection commitment) を補完し、manifesto の
[open question 5](../manifesto.md) (procedure が guard する begging-the-question
risk) と [open question 9](../manifesto.md) (隣接する supply-side tension である
prior-authority gating) に anchor する。外部 grounding は
[`inspiration.md`](../inspiration.md) に、discipline の定義は
[`glossary.md`](../glossary.md) に記録されている。
