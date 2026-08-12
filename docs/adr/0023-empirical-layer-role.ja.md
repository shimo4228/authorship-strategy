Language: [English](0023-empirical-layer-role.md) | 日本語

# ADR-0023: empirical layer の role —— reference baseline を primary role とし、case-study narrative を限定し、validation evidence は明示的設計によってのみ

> **Summary.** manifesto の open question 7 は、framework の empirical
> layer が 3 つの role —— validation evidence / reference baseline /
> case study —— のどれを果たすのかを問い、現状を後者 2 つの意図的な
> hybrid として「時系列が限られていることを踏まえて」開いたまま記録
> している。本 ADR は hybrid をどれか 1 つに潰すのではなく**構造化する**
> ことでこの問いを閉じる。3 つの候補 role の違いは内容よりも、layer が
> 主張することになる claim の強さにあり、曖昧さの実害は、どの artifact も
> 自分がどれほど強い claim を立てているかを宣言していなかったことに
> ある。決定は次の通り: **reference baseline** が layer の primary role
> であり、全 artifact が満たすべき最低要件である (再現可能な data
> または日付付き record、文書化された method、明示された limitations)。
> **case-study narrative** は限定された secondary role —— 特定の
> artifact に付随し、解釈であると明示された interpretive note であり、
> 決して効果主張に昇格しない。**validation evidence** は layer が主張
> しない role である —— 事前に実験として設計され、公開時に validation
> evidence であると明示的に指定された artifact が現れない限り、layer の
> どの artifact も framework の normative な主張を validate するものと
> して読まれない。この role の昇格は決して無言では起きない。validation
> role の辞退は「観測が原則の改訂を trigger しうる」という standing
> rule を弱めない: 改訂を*促す*には preliminary observation —— layer が
> すでに提供している強さ —— で足り、framework を *validate* するには
> 実験として設計された artifact による evidence を要するが、layer は
> それを持つと主張しない。preliminary-observation の tone は layer が
> 主張するすべてのものの floor であり続ける。

## Status

accepted

## Date

2026-08-12

## Context

manifesto の [open question 7](../manifesto.md) は empirical layer が
果たしうる 3 つの role を名指しし、それぞれが異なる設計を要求すると
観察する: *validation evidence* は layer が実験として設計されている
こと (pre/post contrast、統制比較、replication) を要し、*reference
baseline* は data の再現可能性と method の文書化だけを要し、*case
study* は raw data ではなく interpretive narrative を要する。現状は
reference baseline と case study の hybrid と記録され、形式化は
「時系列が限られていることを踏まえて、認識済みかつ意図的」として
延期されている。

問いが立てられて以降の 2 つの展開が、この延期のコストを変えた。

**layer は hybrid が位置づけない genre を蓄えた。** 問いが書かれた
時点で layer は単一の traffic baseline を持つだけだった。いまは 4 つの
artifact genre を持つ: traffic baseline (interpretive note 付きの
data)、probe baseline
([ADR-0011](0011-two-channel-probe-protocol.ja.md) の測定 instrument の
初回出力)、external-literature note (他者の公刊 findings を framework の
前提に照らして読む note)、そして intervention timeline
([ADR-0014](0014-implementation-tracking-two-tier-ledger.ja.md) の
ledger の public projection)。各 genre は layer の index
([`empirical/README.md`](../empirical/README.md)) の中で自らの
framing をその都度 ad hoc に交渉しながら入ってきた —— index は
「a different genre (また別の genre)」と 2 度述べている —— layer が
新しい artifact の role を定める記録済みの rule を持たなかったからだ。
同時に layer の出力は他所で load-bearing になった:
[ADR-0017](0017-failure-mode-diagnostics.ja.md) の failure-mode
diagnostics は layer の instrument に照らして読まれ、
[ADR-0022](0022-audience-layer-split.ja.md) の会計分割は measurement
artifact をその doctrine layer —— essay layer と対をなす、doctrine
repository と paper を持つ会計上の layer —— に default で振り分ける。
他の決定が読みに来る layer は、自らがどれほど強い claim を立てるの
かを言うべきである。

**延期の根拠は実は拘束しない。** 問いはより長い時系列を待つとして
開かれたが、3 つの role の違いは layer が主張する claim の強さにあり、
保有する data の量にはない。より長い series は baseline を鋭くするが、
それ自体が layer により強い role を主張する資格を与えることはない。
それを与えるのは設計の変更 —— 事前に実験として組まれた artifact ——
だけである。したがって role の問いはいま答えられるものであり、開いた
ままにすることには現在進行のコストがある: 自分がどれほど強い claim を
立てているかを宣言しない artifact は過大に読まれうるし、最もありそう
な過大読みは layer が決して招いてはならないもの —— interpretive note
が validation evidence と取り違えられること —— である。

2 つの standing convention があらゆる答えを拘束し、本 ADR では決定
対象ではなく固定された前提として扱う。第一に、layer が立てるすべての
claim は **preliminary observation** として書かれる —— この tone
convention は layer の全主張の floor である。第二に、framework は
**証拠が原則を改訂しうる** ことを維持する: 経験的観測が normative な
決定と矛盾するとき、観測を抑圧するのではなく decision record を改訂
する。この flow を断つ role 割り当ても、tone floor を超えて観測を
膨らませる role 割り当ても、構成上あり得ない。

## Decision

empirical layer の role を、構造化された hybrid として形式化する:

1. **reference baseline が primary role であり、最低要件である。**
   layer は、後続 release と採用する著者が自らの観測を文書化された
   参照点に照らして解釈できるために存在する。layer 内の全 artifact は
   baseline の最低要件を満たさなければならない: 再現可能な data
   または日付付き record、文書化された method、そして明示された
   limitations —— 第三の条件は manifesto の問いが挙げる 2 条件を
   超えて、layer 自身の standing な実践から本 ADR が加えたもので
   ある。この bar を満たせない artifact は、独立の artifact としては
   layer に入らない。bar に届かない観測がそれによって文書化されない
   channel へ押し出されることはない: 既存 artifact の明示された
   limitations の中に記録されるか —— layer が pre-protocol の
   single-window テストをすでにそう記録しているように —— bar を
   満たせるまで program の作業記録に留まる。

2. **case-study narrative は限定された secondary role である。**
   interpretive narrative は認められる —— 著者がどのパターンを注目に
   値すると見たかを記録することが baseline を使用可能にする —— が、
   それは特定の artifact に付随し、解釈であると明示され、決して効果
   主張に昇格しない。layer 全体が qualitative case study として再
   framing されることはない; narrative は baseline に仕えるのであって、
   その逆ではない。これは index の standing な whole-layer の読み方
   指示 —— layer を「明示的 limitations 付きの case study として」
   読めという指示 —— を per-artifact の形に**狭める**変更であり、
   index の当該文は本決定を記録するのと同じ change で改訂される。

3. **validation evidence は layer が主張しない role である。** 次の
   両方が成り立たない限り、layer のどの artifact も framework の
   normative な主張を validate するものとして読まれない: artifact が
   *事前に実験として設計されている* こと (述べられた claim をテスト
   する pre-specified contrast または pre-registered protocol)、かつ
   公開時に validation evidence であると *明示的に指定されている*
   こと。この指定 rule は ADR-0011 の visible series break の role
   水準における対応物である: role の昇格は決して無言では起きない。
   事前に仕様化された測定 instrument は、それだけでは事前に仕様化
   された contrast ではない: ADR-0011 の probe protocol は prompt・
   control・検出 rule を事前に固定し、それが測定を規律するが、
   normative な claim のテストが data より先に仕様化されたわけでは
   ない —— したがってその出力は baseline data として layer に入るので
   あって、validation evidence としてではない。両条件を満たす
   artifact が現れるまで、layer が主張するすべては
   preliminary-observation の強さに留まる。

4. **各 artifact の role は layer の index で宣言される。** index は
   全 artifact について、それがどの role を果たすか —— baseline
   data / interpretive note / intervention record /
   external-literature note —— を宣言し、読者が内容より先に claim の
   強さに出会うようにする。index は本決定を記録するのと同じ change で
   この宣言を持つよう改訂され、artifact が layer に入るたび、および
   各 release で本 ADR に照らして照合される。genre ごとの ad hoc な
   交渉は終わる; 新しい artifact は本 ADR に照らして role を宣言して
   入る。

5. **元の 3 role の外にある 2 genre を位置づける。** intervention
   timeline は baseline の *methods companion* である: 将来の設計
   された contrast が必要とする介入日付を供給する —— これは将来の
   validation-evidence artifact のための infrastructure であって、
   自らは validation role を一切主張しない。external-literature
   note は *他者の* evidence を、引用文献自身が主張する強さのまま、
   出典付きで報告する; framework の前提を文脈化するのであって、
   layer 自身の観測の強さを引き上げることは決してない。

6. **改訂 flow は不変である。** validation role の辞退は、経験的観測が
   normative な決定の改訂を trigger しうるという standing rule を
   弱めない。layer の 2 つの用途は異なる強さを要求する: 改訂を
   *促す* には preliminary observation —— ADR-0017 の diagnostics が
   すでに走っている強さ —— で足りる一方、framework を *validate*
   するには実験として設計された artifact による evidence を要する。
   normative な決定と矛盾する preliminary observation は、本 ADR の
   後も前とまったく同じだけ actionable である。

## Alternatives Considered

**layer を validation evidence として形式化する。** 観測が効果主張を
支えられるよう layer を実験として再設計する。棄却: 実験が必要とする
contrast は観測開始前に閉ざされている —— layer 自身の limitations が、
tactics は data window が開く前に deploy 済みであり pre/post 比較は
遡って再構成できないと記録している —— し、単一著者の ecosystem は
統制比較も replication も単独では供給できない。さらに悪いことに、
layer を validation の生産に commit させることは効果を見出そうとする
standing な圧力を生む —— それは framework の metric 規律
([ADR-0007](0007-human-attention-signals-not-a-metric.ja.md)、
ADR-0017) が拒否するために存在する posture そのものである。この
role の誠実な入手可能性は既存 data の再 framing ではなく *設計に
よる昇格* (Decision 3) による。

**layer を純粋な reference baseline として形式化し、解釈を追放
する。** interpretive note を剥ぎ、layer に data と method だけを
運ばせる。棄却: note こそが baseline を採用する著者にとって使用
可能にする —— 著者がどのパターンに注目したかの記録を欠く data は、
解釈を文書化されていない channel へ押し出し、そこではそれがどれほど
強く読まれるかを縛るものが何もない。既存の artifact はすでに data と
読みを織り交ぜている; 実行可能な規律は境界に印を付けることであって、
締め出すことではない。

**layer を case study として形式化する。** N=1 の観測は qualitative
であると認め、layer を interpretive narrative として再 framing する。
棄却: layer の最も load-bearing な内容 —— 再現可能な traffic series と
probe protocol の append-only record —— を例示へ降格させる。case-study
framing は「data は framework を例示するために選ばれた」という読みを
招くが、それは正確に逆である: 採用する著者にとっての layer の価値は、
data が何を示そうとも文書化された method で収集されることにある ——
framework 自身の legibility に不利に働くにもかかわらず公開されて
いる、ほぼゼロの human-arrival の数字を含めて。

**意図的 hybrid を形式化しないまま保つ。** manifesto の通り open
question 7 を開いたままにする。棄却: 延期の根拠は拘束しない (より
長い時系列は data が何を示すかを変えるが、layer がどの role を主張
してよいかは変えない) し、曖昧さのコストは layer とともに育った ——
4 つの genre が framing を ad hoc に交渉し、下流の決定が、claim の
強さを一度も固定しなかった layer から読んでいる。manifesto は
framework が答えられない問いを抑圧するのではなく分節化することで
改善されると述べる; 同じ規律は、答えられるようになった問いを閉じる
ことを要求する。

## Consequences

**Positive.**

- 各 artifact がどれほど強い claim を立てるかが、内容より先に宣言
  される: 各 artifact の role が layer の index に述べられ、layer
  自身の標識に従う読者が interpretive note を validation evidence と
  取り違えることはない。
- 新しい artifact は ad hoc な交渉の代わりに entry 手続きを持つ:
  baseline 最低要件を満たし、解釈に印を付け、validation role は事前
  設計プラス明示的指定によってのみ主張する。
- 昇格経路は閉ざされるのではなく明示される: layer は validation
  evidence を持つに至りうるが、それは事前設計によってのみ ——
  role の入手可能性は否定されるのではなく、値付けされる。
- 改訂 flow は書面で保護される: preliminary observation は
  normative な改訂を trigger するのに引き続き十分であり、layer の
  謙抑の形式化が framework を自らの証拠から隔離するために使われる
  ことはない。
- open question 7 が記録された決定によって閉じられ、manifesto の
  第 4・第 8 の [open question](../manifesto.md) が敷いたパターン ——
  延期された宿題が後続の decision record によって回収される —— を
  完成させる。

**Negative.**

- framework は自らの empirical layer によって中心的主張を validate
  されないまま持ち続け、本 ADR はそれを修復するのではなく可視化する。
  evidence を求める読者は、layer の最強の artifact が依然 baseline で
  あることを見出す。framework はこれを誠実さのコストとして受け入れる:
  代替は設計が担えない強さを主張することだった。
- artifact ごとの role 宣言は小さな standing の編集義務であり、怠れば
  本 ADR が全域から除いた曖昧さが局所に再導入される。照合 trigger
  (Decision 4) は怠りの window を限定するが、消しはしない。
- entry bar は押し出しを生みうる: bar を満たせない観測は既存
  artifact の limitations の中で運ばれるか作業記録に留め置かれ、
  留め置くことは文書化を規律と引き換えにする —— pure-baseline 代替
  案が棄却された理由である押し出しコストの、狭められたが零ではない
  版である。
- interpretive note と効果主張の境界は判断であって機械的テストでは
  ない —— ADR-0017 が detector の閾値について受け入れたのと同じ形の
  規律である。どちらの方向への読み誤り (真正な signal の過剰 hedge、
  narrative の因果への漂流) も引き続き可能である。
- validation role の辞退は、証明を求める採用者には framework が
  テストから自らを隔離しているように読まれうる。応答は明示された
  昇格経路と不変の改訂 flow であって、より弱い主張ではない —— だが
  この読みは実在する legibility コストであり、ADR-0007 が受け入れた
  のと同種である。

## Lineage

起点となった要求: manifesto の open question 7。3 つの候補 role を
名指しし、reference-baseline-plus-case-study の hybrid を意図的と
記録し、形式化を開いたまま残した。この問いは 2026-08 に取り上げ
られた —— framework に残る延期された問いの見直しが、延期の根拠は
もはや拘束せず曖昧さのコストが layer とともに育ったと認めたためで
あり、本 ADR はそれに続いた決定である。implementation-tracking の
決定自身の記録 (ADR-0014、およびそれを記述する decision-index の
narrative) は、その review が「empirical layer の role をめぐる
open question に関わる」と記していた; その前方参照はここで決着する。

決定の前提は layer 自身の自己記述から引かれる —— empirical index
([`empirical/README.md`](../empirical/README.md)) は
preliminary-observation tone、reference-baseline の意図、「明示的
limitations 付きの case study」という読み方の指示をすでに述べて
おり、本 ADR は前二者を layer の記録された role として形式化し、
第三のものを whole-layer の指示から per-artifact の interpretive
note へ狭める (Decision 2)。role を「それが主張する claim の強さ」で
framing する仕方は次に従う: ADR-0011 の instrument 規律 (その
visible-series-break rule が、無言では起きない role 昇格の model で
ある)、ADR-0017 の detector-not-metric caveat (その diagnostics は、
本 ADR が改訂 flow のために保存するのと正確に同じ
preliminary-observation の強さで走る)、ADR-0014 の two-tier ledger
(その public projection が Decision 5 で位置づけられる
intervention-record genre である)、ADR-0022 の layer-scoped 会計
(measurement artifact を本 ADR が統べる doctrine layer に default で
振り分ける)。

本決定は manifesto の open question 7 を閉じる。変えるのは empirical
layer の記録された role であり、index はそれに応じて改訂される ——
Decision 2 が狭める whole-layer の読み方指示と、Decision 4 が加える
per-artifact の role 宣言である —— 一方、既存のどの artifact も
layer から再分類されず、決定が立脚する tone convention と改訂 flow は
本 ADR が導入する rule ではなく保存する前提である。
