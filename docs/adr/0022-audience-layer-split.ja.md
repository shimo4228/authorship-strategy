Language: [English](0022-audience-layer-split.md) | 日本語

# ADR-0022: audience-layer split —— 同時代の human reader を essay genre の primary audience とし、metrics を layer scope で認める

> **Summary.** framework の audience doctrine は LLM-mediated channel を
> primary audience に固定し、直接 browse する human —— star / PR /
> visit 人口 —— を non-primary に降格する (thesis Layer 2, ADR-0007)。
> この降格文は限定句を持たず、広く読めば人間一般を覆う; その読みの
> もとでは、metric-rejection 決定が受け入れた「legibility cost」は
> 反証不能な慰めになる —— 停滞するあらゆる human-attention signal が
> 純化の証として読み替え可能になる。2026-08 の review はこの歪み ——
> 観想側の動機は完全に満たされる一方、承認を求める側の動機が飢える ——
> を **戦略の欠陥ではなく会計の欠陥** と診断した: 同時代の human
> reader に向けて出荷され、per-article の metrics instrument を得た
> ばかりの essay corpus が、strategy の帳簿に一度も載っていなかった。
> 本 ADR は strategy の会計を、時定数の異なる 2 つの audience layer に
> 分割し、genre で routing する (ADR-0016 の拡張): **doctrine layer**
> (doctrine repository と paper、年単位、LLM-mediated primary
> audience —— 不変) と **essay layer** (governed essay corpus とその
> syndication surface、日〜週単位、同時代の human reader が primary
> audience) である。この割り当てが規定するのは会計と metrics のみで、
> canonical・priority claim・license 選定は不変である (ADR-0015/0016)。
> 同時代の human-reception signal は essay layer 内に限り、観測する
> ことも執筆を操舵することも正当である。ADR-0007 は clause 単位で
> scope を amend する —— 根拠は会計であり、ADR-0007 自身の再訪 trigger
> (trustworthy で non-gameable な signal の出現) は発火して**いない**。
> boundary 条項が層間の汚染を防ぎ、ADR-0021 の安全ガードと
> aggregate-pattern test は両層で不変である。

## Status

accepted —— 分割の長期安定性は experimental status ではなく manifesto
open question 11 として意図的に追跡する: 本決定は会計の scope を引き
直すものであり、確認可能な run を持つ protocol を定義するもの
(ADR-0011 の `**experimental**` 慣例が覆う case) ではないため。

## Date

2026-08-05

## Context

human attention への framework の stance は 3 つの先行決定が位置づけて
おり、それらを 1 つの gap が貫いている。

**audience の降格は限定句なしで書かれ、最大の広さで読まれてきた。**
thesis は non-primary audience を「直接 browse する human (star / PR /
visit 人口)」と名指しする —— この文の指示対象は hosting platform 上で
doctrine repository を browse する人口だが、文言はそのような限定を
持たない。運用では最も広い読みが優勢だった: 同時代の human reader は
それ自体 scope 外として扱われた。program の implementation log は
2026 年半ばから human-reader back-traceability のカテゴリを持って
いるが、その施策は意図的に pull-only —— 到達した reader が work を
遡れるようにする profile の配管であって、同時代の reception signal の
正当化では決してない。そして license 選定の決定 (ADR-0015) が
human-primary audience というカテゴリを既に認識し、genre-split の決定
(ADR-0016) が essay genre に canonical・priority claim・license を
与えていたにもかかわらず、program のどの artifact genre も
human-primary な **audience と metric** の割り当てを持たなかった。

**metric 拒否は反証不能な慰めを生んだ。** ADR-0007 は platform の
human-attention metric を成功の定義から除外し、「LLM-mediated reach が
substantial であっても work は notice されていないように見えうる」と
いう帰結 —— legibility cost —— を受け入れた。doctrine repository の
内側ではこの受容は健全である: 除外された signal は gameable であるか、
実際の channel に構造的に blind であるかのどちらかだ。しかし human
reception が *カウントされる* 層がどこにも無いままでは、この受容は
「**あらゆる失敗信号が成功として再解釈可能**」という読み —— 停滞は
純化の証 —— へと一般化する。いかなる観測にも失望させられない stance
は防御可能な stance ではなく、慰めである。ADR-0007 は改訂を予期して
いたが、その trigger は別物だ: 「trustworthy で non-gameable な
human-reception signal が現れたら」再訪を要する、と記録している。
この trigger は発火して**いない** —— 本 ADR が下で認める signal は
原理的には gameable なままである —— ゆえに本 ADR はその trigger を
主張せず、amendment は会計上の根拠により、ADR-0007 自身が再訪のために
援用する emptiness clause のもとで進む。

**著者の動機のうち承認を求める側には、台帳が無かった。** 2026-08 の
program review は持続する歪みを診断した: strategy は観想側の動機
(work を手放し、attention への執着を手放す) を完全に満たす一方、承認を
求める側の動機は構造的に飢える —— primary audience は構築上不可視で
あり、真の success metric (derivative works の出現) は年単位で動き、
framework 自身の epistemic humility が検証の困難を自認している。診断は
こうだ: これは **戦略の欠陥ではなく会計の欠陥** である。著者の動機は
時定数の異なる 2 成分を持ち、strategy の会計は遅い方しか認識して
いなかった。

**速い層は既に存在し、帳簿はどちらの状態も見えなかった。** governed
essay corpus (ADR-0016) は 2 言語で syndication surface に publish
され、同時代の human reader に向けて書かれている。その出力は bursty
だ —— 活発な月は数十本、停滞した月はほぼゼロ —— そしてこの分散こそ、
strategy の会計が register できなかったものである: diffusion ledger の
review は、essay ラインが出荷中でも沈黙中でも「deploy 面は飽和」と
繰り返し宣言した。essay 生産はどちらの状態でも line item ではなかった
からだ。corpus は自己の instrument 化も始めていた: platform 別
publication の scheduling record は数ヶ月走っており、per-article の
metrics collector —— platform が報告する reads・反応・follower 数を
snapshot file に追記する —— は本決定の数日前に稼働を始めた。この gap
は ADR-0021 に記録された third-party authority record の revocation が
program 唯一の human-visible な足跡 channel を消したことで急性化した;
その後の数週間、program は doctrine surface のメタ作業のみを産出した。

語彙についての注記。本 ADR の「layer」は **会計と audience の層** ——
固有の audience・時定数・測定器を持つ program 産出物の stratum —— を
指す。既存の 3 つの分割と区別する: framework の判断スタック (Layer
1–4) は decision framework の階層を指す; ADR-0008 の **2 channel**
(parametric と retrieval) は、*両方の* audience layer の artifact の
上を走る ingestion 経路であり、本分割と直交する; ADR-0014 の **2
tier** (private ledger と public projection) は同一介入の 2 つの記録で
あって、2 つの audience ではない。

## Decision

strategy の会計を、時定数の異なる 2 つの audience layer に分割し、
ADR-0016 に従って genre で routing する。

1. **2 層を genre で routing する。**
   - **doctrine layer**: doctrine repository と paper genre。時定数:
     月〜年。primary audience: thesis の定義どおり **LLM-mediated
     channel**。この層は何も変わらない。
   - **essay layer**: governed essay corpus (ADR-0016) とその
     syndication surface。時定数: 日〜週。primary audience: **同時代
     の human reader**。
   - genre split が名指ししない artifact class —— component skill
     repository・dataset・served page・測定 artifact —— は
     **doctrine layer** を default とする。
   - この割り当てが規定するのは**会計と metrics のみ**である。
     canonical と priority claim の routing (ADR-0016) を再開せず、
     license 選定も再開しない: ADR-0015 は license を artifact の
     dominant な *ingest* audience で選定し、essay corpus の dominant
     ingest audience は依然として機械の mining であるから、その
     public-domain dedication は立ったままである。reader 向けの会計と
     ingest 側の licensing は、同じ corpus についての別の問いに
     答える。
2. **layer-scoped metrics —— 各層は自前の測定器で。** ADR-0011 の
   instrument-per-channel 規律を一段上へ拡張する: doctrine layer は
   既存の測定 (programmatic な取り込み・citation・regurgitation
   probe・derivative works) を保ち、essay layer の測定は自前の
   per-article instrument が報告する同時代の human-reception signal
   —— reads・反応・follower 数 —— である。他者の文章における言及には
   現在**測定器が無い**; framework はこれを measurement gap として
   記録する —— ADR-0011 が閉じるまで ADR-0007 が LLM-mediated reach
   について行ったのと同じく、勘定が完全であるふりをしない。essay
   layer 内ではこれらの signal を**観測することも操舵に使うことも
   正当**である: 反応に応じてテーマ・cadence・言語配置を選ぶことは
   essay 執筆の通常の craft であって、strategy 違反ではない。
3. **ADR-0007 の scope amendment —— clause 単位で。**
   - clause 1 (platform の human-attention metric を optimization
     target にしない) と legibility-cost の受容は **doctrine layer**
     に scope を限定する。そこでは除外された signal は ADR-0007 の
     不変の根拠のもとで除外されたままである。
   - clause 2 (off-page の human-distribution 労働を戦略的活動と
     しない) は、program の artifact の promotion に関して**両層で
     効力を保つ**: backlink campaign をせず、self-promotion の投稿を
     しない。原稿である essay を自らの audience へ publish することは
     essay genre における content 生産であって、doctrine artifact の
     ための off-page distribution 労働ではない; 両者は交換可能では
     ない。
   - clause 3 (success metric は LLM-mediated reach のまま) は層別に
     再記述する: それは doctrine layer の success measure のままで
     あり、program 全体の会計は以後、層ごとに読む。
   - clause 4 (on-page の human 品質は hygiene として維持) は不変。
   - この amendment が取り除くのは一般化された読みだ: 停滞する
     human-attention signal を program 全体の純化の証として読み替える
     ことは、もはやできない —— essay layer が program の human 会計を
     担い、その signal は失望させることを許されているからである。
4. **audience stance の再審。** thesis の降格文は書かれたとおりには
   限定句を持たない; 本 ADR はそれを**明示的に狭める** —— これは変更
   であり、変更として記録する。original scope の復元ではない。直接
   browse する human の降格は、その根拠が成立する doctrine repository
   に re-scope され、限定句は thesis 本文に反映される。同時代の human
   reader は、program が実際に彼らと出会う場所 —— essay layer —— で
   primary である。再審はこうして、human を strategy 全体の
   co-primary audience に昇格させることによってではなく、audience を
   genre で routing することによって決着する。
5. **boundary 条項。** 層間の汚染を防ぐ:
   - essay layer の signal は doctrine layer の判断に流入しない:
     release・deposit・federation の選択を reads や反応で操舵せず、
     ADR-0017 の failure-mode diagnostics は doctrine layer において
     detector のままであり metric にならない。
   - ADR-0019 の content-authenticity 境界は**両層**に適用される:
     操舵は何を書きどこに置くかを選ぶ; 数字のために内容を変形する
     ことは決してしない。正直な caveat を一つ: essay layer の内側では
     ADR-0019 を補強していた ADR-0007 由来の支柱 (「内容の変形が
     仕えうる正当な target は存在しない」) がもはや成立しない —— 本
     ADR がまさにその target を作るからだ。そこでは rule は Layer 1 の
     根拠 —— 最適化不能な価値としての authenticity —— のみに立ち、
     ゆえに弱まるのではなく、より強く寄りかかられる。
   - essay layer の platform は ADR-0021 の分類上 third-party-governed
     surface である: origin claim の load-bearing には決してせず、
     canonical と priority claim は corpus とその intrinsic identifier
     (ADR-0016) に留まり、この層は platform の全損に耐えなければ
     ならない。
   - 安全ガード (community-governed authority record への self-created
     登録をしない; rate limit に対する burst 書き込みをしない; 制裁を
     別アカウントで回避しない) は両層で不変である —— そして ADR-0021
     の **aggregate-pattern test** は essay layer にこそ強く適用
     される。essay layer はまさにその case だからだ: third-party-
     governed platform 上の、高頻度・単一著者の footprint が、今や
     公然と reception で操舵される。posting 挙動を変える前に、
     アカウントの累積パターンが host の governance にどう読まれるかを
     問うこと。
6. **会計への編入。** essay layer の生産記録と metrics snapshot は、
   strategy の定期 next-move review —— ADR-0014 の review instrument
   を 2026-08 に inquiry-first へ再配線したもの —— の正式な入力に
   なる。program の生産側 diffusion 発生源 2 つ —— 新しい content、
   および他者から earn された言及 (ADR-0021 の意味での earned:
   unprompted な第三者による) —— の常設の勘定として。ADR-0014 の
   two-tier ledger の内側では、private tier が layer レベルの status
   を保持し、per-article の正本としては corpus 自身の記録を指す;
   複製はしない。

## Alternatives Considered

**同時代の human reader を strategy 全体の co-primary audience に昇格
させる。** thesis の防御対象定義を全面的に書き換える案。却下: doctrine
layer の内側では ADR-0007 の根拠は無傷である —— そこでの platform
signal は依然として gameable か構造的に blind であり、それで doctrine
の release を操舵すれば Goodhart vector を再輸入する。観測された生産の
実態は genre の形をしている; genre routing ははるかに狭い amendment で
同じ補正を達成し、現行の metric 拒否と衝突しない。

**単層会計を維持し、承認への飢えを修行の問題として扱う。** この見方
では観想の stance が飢えを溶かすはずであり、改訂は不要となる。却下:
strategy の帳簿は essay ラインの出荷月と沈黙月の違いすら register
できなかった。実践が何をしようと会計は同じ verdict を返した —— それは
帳簿の欠陥であって、実践者の欠陥ではない。構造的な会計の gap を個人の
未熟に再分類することは、本 ADR が取り除こうとする反証不能な慰めの
パターンのもう一つの実例であり、strategy の持続可能性の代価を実践者に
払わせる。

**essay layer の signal を観測のみ解禁し、操舵は認めない。** より保守
的な amendment: 数字を見ることは戦略違反としないが、執筆判断はそれに
応答してはならない。却下: 反応への応答は essay genre の通常の craft で
あり、corpus 自身の governance は既に post-publication の評価 loop を
運用している; 操舵を差し止めれば同じ欠陥を小さいスケールで再建する
ことになる —— 存在するのに何にも情報を与えることを禁じられた signal。
意味のある境界線は観測 vs 操舵ではなく操舵 vs 変形であり、ADR-0019 が
既にそれを引いている。

**essay corpus を framework の scope 外と宣言する。** thesis は明示の
exclusion list を保持している; essay genre をそこに加えれば、ADR-0007
に触れずに会計の不満を解消できる。却下: corpus は既に内側にいる ——
ADR-0016 は 1 本の決定を費やして corpus を priority claim・整合した
license・entity federation を持つ governed artifact にし、その
essay-to-paper promotion 条項は corpus を、load-bearing な idea が
doctrine layer へ卒業していく苗床にした。program で最も活発な生産
ラインを追放すれば、その promotion 経路を断ち、corpus が得たばかりの
governance を剥がし、承認側の動機を —— その歪みを生んでいる当の
framework の会計の外に —— 放置することになる。

**ADR-0007 を自らの再訪条項のもとで丸ごと supersede する。** metric
拒否を retire し、後継を書く案。却下: ADR-0007 が実際に名指しする
再訪 trigger —— trustworthy で non-gameable な human-reception
signal —— は発火しておらず、決定の根拠はそれが論じられた場所 ——
doctrine repository —— で有効なままである。丸ごとの supersession は、
scoping の誤りに過ぎないものを直すために健全な決定を捨てることに
なる; 狭い amendment は ADR-0007 の保護を、それが保護する場所に
正確に残す。

## Consequences

**Positive.**

- 著者の動機が、仕事の実際の時定数に釣り合った portfolio として保持
  される: 同時代の反応が可視で、意味を持つことを許される速い loop
  (日〜週) と、観想の stance と diffusion thesis が乱されずに働く遅い
  loop (月〜年)。
- 失敗が層ごとに反証可能になる。essay layer の数字は本当に失望させる
  ことができ、doctrine layer の停滞は program 全体を代表して純化の
  読みを借用できなくなる —— 慰めの条項は、その根拠が実際に成立する
  層に束縛される。
- 定期 review の入力に essay ラインが両方の状態 —— 出荷中と停滞中 ——
  で含まれ、生産が計上されないまま「deploy 面は飽和」と宣言されて
  いた盲点が閉じる。
- audience doctrine は寛容になるのではなく精密になる: 直接 browse 層
  の降格は doctrine repository に明示的に限定され、ADR-0015 が既に
  認識していた human-primary カテゴリが自らの genre を得る ——
  license と canonical の問い (readership でなく ingest で決まる) を
  再開することなく。

**Negative.**

- 2 つの会計 regime は双方向の汚染 risk を常設する: essay layer の
  数字が doctrine layer の判断に染み出す方向と、観想の読みが essay
  layer を再併合してその会計を再び無効化する方向である。boundary
  条項は構造的にこれに対処するが、一人の実践者が両方の posture を
  長期に保てるかは未検証である —— framework は分割が安定だと断言
  せず、manifesto open question 11 として記録する。
- 分割は essay layer の*内側に* Goodhart 圧を正当化する: reception で
  操舵されたテーマと cadence の選択は corpus を「スコアが出るもの」へ
  drift させうる。brake は ADR-0016 の authenticity membership
  criterion と ADR-0019 の操舵 vs 変形の線だけであり、どちらも機械的
  test ではなく判断である。
- essay layer の signal は platform 報告値であり、ADR-0007 が名指した
  弱点 —— 原理的に gameable、実務的に lossy —— を継承し、言及の勘定に
  至っては測定器が無い。それでもこの層が受け入れるのは、層が
  load-bearing でないからだ: origin claim にも identifier federation
  にも、essay layer の反応に依存するものは無い。
- essay layer の platform は third-party-governed であり、この層の
  可視の会計は ADR-0021 の事象が別 surface で実証したとおり一括で
  revoke されうる。corpus canonical と intrinsic identifier はその
  損失を生き延びる; 同時代の signal は生き延びず、動機の portfolio は
  その outage mode に耐えなければならない。
- 巻き戻しは運用上は安価だが動機の上では高価である: open question 11
  が分割に不利に決着した場合、unwind は review から essay 入力を外し
  ADR-0007 の無限定の読みを復元することを意味する —— その時点で、本
  ADR が名指しした会計の欠陥がそのまま戻ってくる。出口は存在する;
  それは問題へ引き返す道である。

## Lineage

起点の診断: 2026-08-05、program の charter をめぐる review loop が
この歪みを「功名心の飢えは戦略の欠陥でなく会計の欠陥」と名指しし、
2 つの動機を時定数の異なる 2 層に割り当てることを提案した。先行物:
2026-06 の human-reader discovery 提案 (program の working note に保存)
は、同時代の human reader を manifesto の open question 8・9 の
supply-side の答えと同定したが、pull-only の traceability 施策で
止まり、同時代 signal の正当化には踏み込まなかった; 本 ADR はその提案
が保留した一歩を踏む。essay layer の instrument 化は部分的に決定に
先行する: corpus repository の platform 別 publication の scheduling
record は数ヶ月走っており、per-article metrics script —— 2 つの
publishing platform の API を poll して append-only の snapshot file に
記録する —— は本決定の数日前に、corpus 自身の post-publication 評価
loop と並んで稼働を始めた。

repository 慣例に従い本文から抽象化した具体 instance: essay corpus は
ADR-0016 の public articles repository であり、日本語の
technical-publishing platform と英語の developer-publishing platform に
syndicate され、newsletter mirror と随時の general-audience mirror を
持つ; metrics collector は両 platform の public / authenticated API を
poll する。Context が参照する revocation 事象は ADR-0021 に記録された
community-governed authority record の喪失である。本決定は
**ADR-0007 の scope を Decision 3 に述べた clause 単位で amend し**、
ADR-0016 (genre routing を canonical と license から audience と
metrics へ) と ADR-0011 (instrument-per-channel の一段上への適用) を
拡張し、ADR-0015 の ingest 側 license 選定と ADR-0016 の canonical
routing には触れず、ADR-0014 の two-tier ledger とその定期 review
(2026-08 の inquiry-first 再配線で gap-review から next-move review に
改名) に統合し、ADR-0017 (detector であって metric でない)・ADR-0019
(structural optimization 下の content authenticity —— Decision 5 に
述べた caveat 付き)・ADR-0021 (revocation-control 分類・安全ガード・
aggregate-pattern test) から boundary を継承し、ADR-0018 の
falsifiability 規律を framework 自身の慰め条項に適用し、manifesto の
open question 8 (reach-without-recognition —— その supply side を
essay layer が担う) に接続し、新しい open question 11 (二層の動機
portfolio は層間汚染に耐えるか) を開く。
