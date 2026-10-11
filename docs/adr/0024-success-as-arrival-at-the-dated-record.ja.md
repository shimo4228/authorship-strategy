Language: [English](0024-success-as-arrival-at-the-dated-record.md) | 日本語

# ADR-0024: Success は dated record に到達する use である —— 名前は観測し、各戦略は自らが持つ問いを述べる

> **Summary.** framework は自らの戦略を、著者のアイデアの認識可能な署名を
> 運ぶ LLM 経由チャネルの breadth を permanent timestamp に anchor された形で
> 最大化すること、と定義し、その instrument は何よりも、署名 —— 著者名や
> 造語 —— が idea とともに運ばれたかを問うてきた。この定義は 2 つの狙いを
> 混ぜていた —— answer engine が作品を再利用するときに著者性が生き残るか、
> そして作品がそもそも機械にどう見つけられ使われるか —— そしてその運用上の
> 重みは前者にかかっていた。だが回答に名前が印字されるかは answer engine が
> 決めることで、著者が決めることではない。本 ADR は success criterion を、
> 著者が守らねばならないもの —— dated な判断、*これがこの時点で考えられた*
> こと —— の上に固定する。**Success とは、著者の idea の use が dated record
> に到達することである** —— dated record とは、concept-DOI deposit、または
> その history と archive identifier が content を timestamp する repository
> である。名前は要件にしない: retrieve された record はすでに名前を運んで
> おり、モデルの weights の中では、想起された名前・造語・project 名・DOI が
> record へ戻る pointer として意味を持つ。戻る経路のない吸収は diffusion と
> して記録し、success には数えない。到達は二段階で判定する。各戦略は自らが
> 持つ問いを述べる —— この戦略は record への到達を、著者の personal-branding
> 戦略は人物としての著者を —— そして 2 つは互いに養い合うように書かれる。
> ADR-0022 は supersede され、その境界条項を文言上の禁止として執行していた
> guard は退役する。

## Status

accepted

## Date

2026-10-11

## Context

Plan: [docs/plans/arrival-success-and-branding-boundary.html](../plans/arrival-success-and-branding-boundary.html) (2026-10-11 承認)

**success の定義は、著者が動かせない変数に重みを置いていた。** thesis の
Layer 2 は戦略を「著者のアイデアの認識可能な署名を運ぶ LLM 経由チャネルの
breadth を、permanent timestamp に anchor された形で最大化すること」と名指し、
[ADR-0007](0007-human-attention-signals-not-a-metric.ja.md) の clause 3 は
「machine ingestion、programmatic retrieval、knowledge-graph presence、LLM
回答内での citation」を operative な尺度として列挙する。これらの尺度のいくつか
はすでに到達についてのものである: thesis の戦術 1 は clone・DOI 引用・llms.txt
fetch を数え、[ADR-0011](0011-two-channel-probe-protocol.ja.md) の probe
protocol は *owned identifier cited* を独立の boolean として記録する。重みを
担っていたのは署名だった: probe の parametric arm は success を、モデルが概念
*と著者名* を産出することと定義し、導出される ghost-citation rate は名前なしに
identifier が引用されることを問題の case として扱い、
[ADR-0017](0017-failure-mode-diagnostics.ja.md) は著者名なしに運ばれる概念を
第一の failure mode に分類する。回答が著者名を印字するかは answer engine の
設計の性質であり、answer engine はしばしばクリック可能な引用を一切持たずに
答える (Strauss et al., arXiv:2508.00838、answer engine の log 研究)。ゆえに
署名に重みを置く criterion は、起きていることの多くを失敗として数える。

**名前の問いが well-posed なのは weights についてだけである。** answer engine
が repository・essay・paper を retrieve するとき、著者名は retrieve された
page の上にある; モデルが名前を知っているかを問うことは、record が retrieve
されたかを問うことに何も加えない。この問いが中身を持つのは parametric な吸収に
ついてだけであり、そこでも名前はいくつかある pointer の 1 つにすぎない ——
造語、project 名、DOI もまた record へ戻る。

**admission の失敗が読まれないままだった。** 2026-07-02、program は served
page の所有権を主要な search console で検証し、その sitemap を送信した。console
は ADR-0007 のもとで "as a diagnostic, never as a target" として保たれた
(implementation log が両方を記録している)。2026-10-01 の全般 audit がその
console を 3 か月ぶりに初めて読んだ: search index は served URL 27 件のうち
1 件しか知らず、送信した sitemap は一度も fetch されておらず、page を指す
followed な inbound link は 1 本もなかった。instrument は存在した; framework
の success 定義のどこも、その読み取りを program が問わねばならない問いに
していなかった。文献はこの gate を先頭に置く: agentic search の causal replay
では、構造化された提示は回答あたりの対象文書の引用数を上げた (+0.50、95% CI
[+0.20, +0.84]) が、文書がそもそも引用されるかははっきりとは上げなかった
(+4.5 ポイント、CI [−1.4, +10.4]); 設定は単一の agent 構成と 113 組の matched
document pair である (CITECHOICE, arXiv:2609.15164)。提示はすでに retrieve
された文書のあいだで credit を動かす; 文書が retrieve されるかはその前に来る。

**sibling 戦略との会計境界は、2 つの軸で同時に引かれていた。** 著者の
personal-branding 戦略 (local repository) は、この戦略との境界を
"idea → LLM-mediated channels" 対 "person → human audience" と述べる —— payload
と audience を一緒に。これは 1 つの cell を持ち主不在のまま残す: machine
channel 上の person であり、実際には著者についての record を機械が読む
authority record に植えることを意味した。program がそのような record —— 著者・
paper・repository について —— を作成したとき、host はその集合を著者の宣伝と
読み、account を取り消して record を削除した
([ADR-0021](0021-self-sovereign-entity-grounding.ja.md))。

**genre はもはや単一の reader を選ばない。** [ADR-0022](0022-audience-layer-split.ja.md)
は doctrine artifact を LLM-mediated reader へ、essay を同時代の human reader
へ routing した。著者はいま README と essay を両方の reader に同時に向けて
書く —— 人のための prose、機械のための折りたたまれた detail (この repository
の README がその一例) —— そして essay の link をたどる人は、agent と同じ
record に到達する。

**観測される traffic の大半は、何かが到達したことを示すが、idea が使われた
ことは示さない。** program の日次 traffic snapshot (raw count、hub repository
の `traffic/data/*.jsonl` から 2026-10-11 に算出) では、2026-04 に record を
持つ 6 repository について、clone は page view を 2026-04 に 29.0 対 1
(1,943 / 67)、2026-09 に 8.1 対 1 (2,350 / 290) で上回った。hosting platform
は clone の origin を報告せず、referrer 付きの page view が意味のある割合に
なったのは 2026-09 からで、human 向けの campaign と並行してだった。あらゆる
fetch を success として数える定義は、crawler と試し読みで膨らむだろう。

## Decision

1. **dated record に到達する use を success として数える。** dated record とは
   concept-DOI deposit ([ADR-0001](0001-concept-doi-canonical.ja.md))、または
   その commit history と archive identifier が content を timestamp する
   repository ([ADR-0013](0013-intrinsic-identifier-layer.ja.md)) である。理由
   は守られる対象にある: dated な判断、これがこの時点で考えられたということ。
   どの event をどれほどの強さで数えるかは Decision 4 が定める。
2. **戻る経路のない吸収は、success ではなく diffusion として記録する。**
   identifier・link・回復可能な pointer を持たずに weights から paraphrase
   された idea は、観測された場所で記録する; それは success に数えない。その
   中の何も、reader が dated な判断を検証することを可能にしないからである。
3. **名前は観測し、要件にしない。** retrieval では、record が名前を運ぶ。
   weights では、想起された名前・造語・project 名・DOI が record へ戻る
   pointer である。naming probe は観測として続ける; この決定はどの artifact
   にも著者名を示すことも伏せることも求めない。
4. **到達を二段階で、1 つの list で判定する。**
   - *到達を伴う use (evidence):* その idea について owned identifier —— DOI、
     repository URL、archive identifier (ADR-0011 の boolean) —— を cite する
     回答; record に link する derivative; component を走らせる install;
     retrieval なしに、その idea について pointer (DOI、project 名、record に
     結びついた造語) を想起するモデル。
   - *Arrival proxy (観測):* clone、page view、referrer (link をたどる人を
     含む)、DOI resolution、crawler fetch。
   proxy は proxy の段で報告する。evidence 段の event は
   [ADR-0014](0014-implementation-tracking-two-tier-ledger.ja.md) の private
   implementation ledger に、ADR-0011 の probe run と、直接観測された引用・
   derivative・install から記録する; 著者は ledger を参照するたびにそれを読む。
   review の周期は新たに置かない (ADR-0014 も置いていない)。
5. **各戦略が持つ問いを述べ、2 つを互いに養い合うように書く。** この戦略は、
   著者の idea の use が dated record に到達するかを持つ —— retrieval への
   admission と、weights に残る pointer を含む。personal-branding 戦略は、
   人物としての著者が人々に知られ、人々と関わるかを持つ。その essay・
   profile・告知は、人や検索 index が record に到達する経路と link をつくる;
   dated record はそれらの行為に指し示す実体を与える。1 つの行為が両方に
   仕えうる; 行為を動機づける狙いを持つ戦略がその効果を記録し、両方に仕える
   行為は両方の ledger に記録する。境界は所有として述べる; どの行為も禁止に
   よってどちらかの戦略に割り当てない。

   > **注記（2026-10-12、[ADR-0025](0025-planning-and-task-state-in-a-public-rfc-store.ja.md)）:** Decision 4 と 5 が
   > 名指す private implementation ledger は公開 `rfcs/` store に置き換わった。
   > evidence 段の事象は該当する計器か channel のエントリに記録し、機微な詳細は
   > 非公開のノートに残す。両戦略に仕える行為は、この program が行う行為なら
   > `rfcs/` と implementation log に記録し、personal-branding の行為で record へ
   > 至るものはその戦略自身の行為ログから読み、写さない。

   > **注記（2026-10-12、[ADR-0026](0026-one-public-act-log-across-strategies.ja.md)）:** 上の注記と、本 Decision の
   > 「行為を動機づけた狙いを持つ戦略がその効果を記録し、両方に仕える行為は両方の ledger に
   > 記録する」という文を置き換える: すべての行為は、実施した戦略を添えて、共有の公開の
   > 行為ログ（implementation log）に 1 度記録する。personal-branding 戦略は行為の記録を
   > そこへ移す（RFC-0032）。上の各戦略が持つ問いは維持する。
6. **戦略をまたいで 1 つの原則を共有する: content は著者の思考が決め、
   distribution は content を変えずに optimize してよい。** この原則はすでに
   personal-branding 戦略の層表と、essay corpus の content-integrity 決定に
   共通する線である; この framework はそれを、自らの artifact における
   placement・indexing・linking の規則として採る。
7. **ADR-0022 を supersede する。** genre を単一の audience に routing する
   こと、およびその routing に立っていた条項は失効する:
   - その Decision 1 の routing と、名前のない artifact class を doctrine
     layer に置いた default;
   - その Decision 2 の層別 metrics、および Decision 6 による、この framework
     内部での essay layer の会計;
   - その Decision 3 による ADR-0007 clause 1 と 3 の層別 scope、および
     その Decision 4 による thesis の audience 降格の限定 —— ADR-0007 clause 1
     はいま、この framework のすべての artifact を律し、thesis の audience
     段落は書き直す。
   reception の数 —— essay と人物としての著者の reads・反応・follower ——
   は personal-branding 戦略と essay corpus が持つ。arrival proxy (Decision 4)
   はここに留まる。
8. **`scripts/verify-layer-boundary.sh` を退役する。** この guard は、essay
   corpus の会計 file を名指しする、または reception の数を述べる doctrine
   text をすべて fail させた —— 数に言及することの禁止であり、Decision 6 の
   原則より強い。script と、`docs/maintenance.md` 内のその参照を削除する。
9. **影響を受ける record を揃える。** ADR-0007、ADR-0008、ADR-0009、ADR-0011、
   ADR-0015、ADR-0017、ADR-0019、ADR-0023 の、この決定が変える箇所の下に
   dated note を加える; ADR-0022 の Status を superseded にする; thesis の
   守られる対象の節、第 1 軸と第 3 軸、Layer 2、audience 段落、Layer 3 の
   sorting note、戦術 1 と 4 を書き直す; glossary の entry と manifesto の
   open question 8〜11 を揃え、同じことを言い直している carrier (README の対、llms
   surface、graph、ADR index、adoption 表、conformance の tier、tactic
   lifecycle、deposit metadata、changelog)も揃える。2026-09 の probe pre-registration は変更
   しない。

## Alternatives Considered

**署名を success criterion として保つ。** 名指された著者は credit の最も
読みやすい形であり、probe がすでにそれを測っているため魅力的。却下: 回答内の
名前は answer engine の設計が決めるので、この criterion は著者が動かせない
変数を追い、ありふれた use の多くを失敗として採点する。(読まれなかった console
は review の cadence の別の失敗である; それが示すのは criterion が注意を向けさせ
なかったものであって、criterion が instrument に取って代われることではない。)

**帰属の有無を問わず、あらゆる use を success として数える。** thesis の
Layer 1 がすでに「idea が思考のまま diffusion を生き延びること」を success
criterion と名指しており、著者自身の実践が idea はコードより長く残ると考えて
いるため魅力的。著者が却下: 戻る経路なしに使われた idea は、それがいつ考えられた
かを検証するものを何も残さないので、dated な判断 —— 守るべきもの —— は守られ
ない。Layer 1 は content の下の floor として残り、運用上の criterion としては
残らない。

**変更を dated note だけで記録する。** repository に superseded な ADR が
なく、その場での note を好むため魅力的。却下: この変更は、thesis・8 本の ADR・
glossary・manifesto・component skill がそれぞれ再記述する運用上の success
criterion を置き換えるもので、それらの record に散らばった note は、reader が
たどって戻れる単一の record を残さない。

**ADR-0022 を部分的に supersede する。** その content の一部は健全である
(両層における content bound、安全ガード) ため魅力的。却下: ADR-0022 のすべての
条項は genre を 1 人の reader に routing することに立っており、それはもはや
artifact を記述しない; 健全な条項はすでにそれぞれの record (ADR-0019、
ADR-0021) に住んでいるので、部分的な supersede は退役した frame をそれらの
宿主として生かし続けることになる。

**audience で境界を引き、sibling 戦略に machine 向けの行為を与えない。**
きれいな線を与えるため魅力的。却下: artifact は両方の reader に向けて書かれる
ので、audience の線は単一の行為を半分に切り、一方の戦略が machine channel 上で
行為してはならないという規則は、本当に grey な zone に対する新しい禁止になる。

**2 つの戦略を 1 本の pipeline —— 機械が先、人が後 —— としてモデル化する。**
人がますます answer engine を通じて作品に到達するため魅力的。構造としては却下:
ほとんどの回答は人を先へ送らないので、機械の段を人の段で判定すれば、名前の
criterion を別の扉から呼び戻すことになる。経路は並列であり、Decision 4 の段が
それぞれを固有の evidence で判定する。

**境界 guard を保つ、または warning として保つ。** そのまま保つことは、古い
禁止を machine gate として効力を持たせたまま残すため却下した。warning のみの
形は **open —— revisit when**、reception の数がこの framework の release・
deposit・federation の決定を操舵したと判明したとき。

## Consequences

**Positive.**

- success criterion が、著者が手を打てるもの —— retrieval への admission、
  placement、artifact が運ぶ pointer —— を指す。
- 著者を名指さずに owned identifier を cite する回答は、いまや失敗ではなく
  到達と読まれる; ADR-0011 の ghost-citation の測定は不変で、その読み方が
  変わる。
- sibling 戦略との境界に持ち主不在の cell がなくなり、2 つの戦略が互いを
  助けるやり方が書き留められる。
- 文言上の禁止 1 つとその machine gate がなくなる。

**Negative.**

- success は観測しにくくなる。evidence 段の到達は稀で遅く、data の大半は
  proxy であり、clone は origin を運ばず、component を走らせる install は
  今日観測できない; 長い期間、誠実な読みは「proxy のみ」でありうる。
- ADR-0019 の content bound は、旧 essay layer だけでなくあらゆる場所で
  ADR-0007 からの支えを失う: Decision 6 は distribution を framework 全体で
  正当な target にするので、bound はいまや Layer 1 の根拠だけに立ち、より
  強く寄りかかられる。
- guard が退役したので、この framework の text に流れ込む reception の数を
  機械的に flag するものは何もない; 互いに養い合う 2 つの戦略に向けて再記述
  された open question 11 は、review に依拠する。
- ADR-0022 が答えた 2026-08 の欠陥 —— ledger を持たない承認欲求の動機が、
  停滞する human signal を純化として読ませた —— は、sibling 戦略の ledger が
  途切れれば戻りうる。その動機はいま framework の外に持ち主を持つ; その
  持ち主が ledger を保つかは、この framework の制御の外にある。
- ADR-0022 は accept から 2 か月で覆される; reader は何がそれを置き換えたかを
  知るために supersede をたどらねばならず、頻繁な反転は framework の読みやすさ
  を損なう。
- 第二の record が遅れる: personal-branding 戦略の境界 text と、ADR-0022 の
  doctrine-layer default に依拠するその ADR は、その戦略自身の session が書き
  直すまで古い frame を記述し続ける。書き直しはその repository に属する; この
  framework は依頼を渡し、編集はしない。
- 退役した script は git history から復元できる。

**Revisit when.** answer engine が retrieve した record について著者名を
default で示し始める (そのとき名前の criterion は戻しても cost がかからない)、
または ledger を読んだとき、2 四半期分の probe run と観測された引用に
evidence 段の到達が 1 件も記録されていない一方で、Context の 6 repository の
clone と view の合計が伸び続けていた (そのとき段には到達可能な evidence の形が必要になる)。

> **注記（2026-10-12、[ADR-0025](0025-planning-and-task-state-in-a-public-rfc-store.ja.md)）:** 「ledger を読んだとき」は、
> 該当する計器と channel の `rfcs/` エントリを読んだときと読む。

## Lineage

決定は 2026-10-11 の探索 session から出た。著者は、framework の component
skill が 2 つの狙い —— AI の引用で著者性が生き残るか、そして作品が機械にどう
見つけられ使われるか —— を混ぜ、前者に重みを置いていることを観察した。続いて
文脈を持たない 4 つの agent が brief だけから再編を論じた: essence judge は
最小限の変更を推奨し、現行 doctrine の擁護者は署名が use とともに運ばれねば
ならないと主張し、提案者は並列の出口の ledger を提案し、moderator は不一致を
1 つの価値の問い —— 帰属のない吸収は success に数えるか —— に還元した。著者は
否と答え、名前は要件ではないが DOI または repository への到達は要件である、
と付け加えた: これをこの時点で考えたという判断こそが守られねばならないもの
である。著者はさらに、machine 上の person という cell は well-posed な問いでは
ないこと、sibling 戦略を machine 向けの行為から締め出すべきではないこと、2 つの
戦略は互いに養い合うように書かれるべきことを判断した。plan の cross-vendor
review (gpt-6-astra 上の Codex agent) が、Decision 4 の二段階の到達判定、
Decision 8 の退役の形、そして ADR-0007 の note をその clause 1・2・4 へ広げる
ことを加えた。

Grounding: admission が allocation に先立つ順序について CITECHOICE
(arXiv:2609.15164); クリック可能な引用なしに与えられる回答について Strauss
et al. (arXiv:2508.00838); implementation log の 2026-07-02 search-console の
entry と 2026-10-01 の audit; clone 対 view の比について hub repository の日次
traffic snapshot。2 本の paper は [`inspiration.md`](../inspiration.md) に
収録してある。この決定が触れるあらゆる carrier の内部
survey は plan の research report
[docs/plans/research/2026-10-11-arrival-success-and-branding-boundary.md](../plans/research/2026-10-11-arrival-success-and-branding-boundary.md)
である。

Relations:
- ADR-0022 を全面的に supersede する (Decision 7 が失効するものを列挙し、
  ADR-0022 の Status がそれぞれの record の上で成り立つものを列挙する)。
- [ADR-0007](0007-human-attention-signals-not-a-metric.ja.md): clause 3 を
  再記述する; clause 1 は再びすべての artifact を律し、page view と referrer を
  arrival proxy として認める; clause 2 はこの framework 自身が行うことを記述し、
  人物としての著者に向けた行為は personal-branding 戦略自身の規則が律する;
  clause 4 は placement・indexing・linking について Decision 6 により緩められる。
- [ADR-0008](0008-rag-era-attribution-diffusion.ja.md): ghost-citation による
  却下理由は失効する; 両 channel を回すことは成り立つ。
- [ADR-0009](0009-dual-entry-asymmetric-rebalance.ja.md): entity resolution は
  dated record への resolution と読む。
- ADR-0011: instrument とその lexicon は不変 (series break なし); *owned
  identifier cited* の cell は到達と読む。
- [ADR-0015](0015-license-selection-by-audience.ja.md): ingest-audience test は
  影響を受けない。
- ADR-0017: 第一の failure mode は、戻る経路のない reach になる。
- [ADR-0019](0019-structural-optimization-vs-content-authenticity.ja.md):
  content bound は framework 全体で Layer 1 のみに立つ。
- [ADR-0023](0023-empirical-layer-role.ja.md): arrival proxy はその
  reference-baseline の最低限のもとで記録する。
- ADR-0001、ADR-0013、ADR-0021 を extend する —— それらの dated で
  self-sovereign な record こそ、use が到達すべきものである。
