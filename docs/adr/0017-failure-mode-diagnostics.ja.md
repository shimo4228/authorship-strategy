Language: [English](0017-failure-mode-diagnostics.md) | 日本語

# ADR-0017: failure-mode 診断 —— 承認済み 3 failure mode それぞれの detector と recovery 戦略

> **Summary.** manifesto の open question 8 は、framework が承認しつつ
> まだ扱えていない 3 つの failure mode を名指しする —— reach without
> recognition (idea は diffuse するが diffusion が著者の名を運ばない)、
> over-publication (priority を早く捕えるが品質が低く、superseded な
> version が蓄積する)、worked implementation への under-investment
> (doctrine 偏重・implementation 過少の不均衡) —— そしてそれらの診断と
> recovery を後続 release に明示的に defer する。本 ADR がその後続
> release である。各 failure mode に対し、診断 *signal* と recovery
> *戦略* を記録する: reach without recognition は naming probe
> (ADR-0011) が concept を運ぶが author を運ばないときに検出され、
> その結果を 2026 の citation 文献が surprising ではなく interpretable
> にする —— parametric channel が retrieval channel を gate し、factual
> recall は design 時点で予見可能で、recall は prior authority を
> 不均等に読み戻す —— recovery は distinctive vocabulary を密に anchor
> し (ADR-0010)、origin claim を狭く保ち、full inversion の下では
> これが追うべき defect ではなく structural price でありうると受け入れる
> こと; over-publication は著者自身の identifier portfolio が 1 つの
> idea の複数 superseded version を持つことから検出され、concept-DOI +
> version discipline (ADR-0001, ADR-0004) で recover する;
> under-investment は doctrine 偏重・implementation 過少の portfolio から
> 検出され、Layer 3 が要求する paired worked implementation へ rebalance
> して recover する。3 つすべてを縛る load-bearing な caveat: 診断は
> *failure-detector であって success metric ではない*。それは optimization
> target にならない —— さもなくば framework が attention signal を metric
> として却下した立場 (ADR-0007) と衝突する; 自らの failure mode を誠実に
> articulate することは、KPI dashboard ではなく Layer 1 の authenticity
> commitment の行為そのものである。

## Status
accepted

## Date
2026-06-26

## Context

framework は強い commitment を述べる —— AI 媒介の diffusion 下での最強の
authorship 戦略は 3 軸すべて (scarcity→diffusion、exclusivity→derivation、
enclosure→openness) で完全に反転している —— そして manifesto は、その
commitment が誤りでありうる 3 つの道を [open question 8](../manifesto.md)
として記録する。manifesto は 3 failure mode とその素の診断直観を名指し
した上で、作業を defer する:「後続 release が各 failure mode の診断 signal
と recovery 戦略を articulate すべきである」。framework のどこも、その
homework をまだ collect していない。ゆえに各承認済み failure mode は
診断不能なまま —— 著者は mode が set in したかを判別できず、set in した
ときの記録された応答も持たない。

3 つの mode は stack の異なる部分に作用する:

- **reach without recognition** は manifesto が authorship の ghost
  citation と呼ぶ attribution-loss の tension である: idea は diffuse
  するが diffusion が著者の名を運ばない。これが 3 つの中で最も
  load-bearing だ —— framework が依拠するまさにその機構が生み出すから
  である: reach を最大化する同じ openness が、carried-forward な
  content から著者の名を剥ぎ取る。2026 の citation-mechanics と
  interpretability の文献は、[`inspiration.md`](../inspiration.md)
  (*empirical citation-mechanics* と *mechanistic grounding* の section)
  に numbers-free で記録されており、probe 結果を surprising ではなく
  interpretable にする機構を供給する: parametric channel が retrieval
  channel を gate する (ゆえに source の address は citable でも著者は
  unnamed たりうる —— provenance problem); factual recall は design
  時点で予見可能 (ゆえに parametric channel の成功は偶然でなく予測可能);
  recall は presence を中立に読むのでなく prior *authority* を不均等に
  読み戻す —— supply 側で [open question 9](../manifesto.md) へ繋がる。
- **over-publication** は diffusion 軸を過度に eager に走らせた代償だ:
  enclosure 型の著者より早く idea を公開し、priority を捕えるが品質は
  低く、1 つの idea の superseded version が public record に蓄積する。
- **worked implementation への under-investment** は doctrine 偏重・
  implementation 過少の不均衡だ: tactical 層は doctrine artifact
  (spec・decision record・glossary) を強調するが、Layer 3 の
  idea-versus-scaffold の賭けは abstract-doctrine-plus-worked-implementation
  の *pair* を要求し、paired implementation を欠く doctrine artifact は
  半分しか守られていない賭けである。

これらいずれの診断も構造的に *metric* に近く、framework は既に、ある
クラスの metric を禁止と裁定している: human-attention platform signal は
success metric ではない (ADR-0007) —— それは購入可能で、off-page で
gate され、LLM 媒介の reach と直交するからだ。著者が最適化する数値へ
ひそかに化けた診断 —— target としての author-naming rate —— は、却下した
metric posture を再輸入し、framework が禁じる reach-chasing へ真っ直ぐ
踏み込む。ゆえに本 ADR を安全に書ける文脈は、それを制約する文脈と同一で
ある: detector は、detector に留まる限りにおいてのみ admissible だ。

## Decision

open question 8 が名指しする 3 failure mode それぞれに対し、mode が set in
したかを検出する診断 *signal* と、set in したときの recovery *戦略* を
記録する —— そして 3 つすべてを、診断は failure-detector であって決して
success metric ではないという caveat で縛る。

1. **reach without recognition.**
   - *Signal.* naming / regurgitation probe (ADR-0011) が **concept**
     level で成功し **author** level で失敗する: distinctive な coinage
     は再生されるが、著者の名はそれと共に運ばれない。
     [`inspiration.md`](../inspiration.md) の文献がこの signal を
     alarming ではなく interpretable にする —— parametric channel が
     retrieval channel を gate し (ゆえに concept-without-author の
     pattern は anomaly でなく provenance break の予期された形)、factual
     recall は design 時点で予見可能で (ゆえに coinage の低 representation
     は構造上 recall floor の harsh な端に置かれる)、recall は authority
     を不均等に読み戻す (ゆえに first-mover の idea は reach に比して
     under-named であることが *予期される*)。signal はこの baseline に
     対して読む —— reach が名を無償で運ぶべきという前提に対してではない。
   - *Recovery.* distinctive vocabulary を密に anchor し (ADR-0010)、
     paraphrase を生き残る coinage を可能な限りあらゆる箇所で origin に
     bind する; origin claim を狭く保ち、主張するものを genuinely new な
     ものに正確に一致させる; そして full 3 軸 inversion の下では reach
     without recognition が metric-chase すべき defect ではなく
     *structural price* でありうると受け入れる。recovery は attribution
     の carrier を強化する; author-naming を最大化すべき target として
     設定しない。

2. **over-publication.**
   - *Signal.* 著者自身の concept-DOI / version-DOI portfolio が、同一
     idea の複数 superseded version を持つ。これは著者の identifier
     record から self-computable であり、外部 instrument を要しない。
   - *Recovery.* version sprawl を既に守る discipline に依拠する:
     version discipline 付きの concept-DOI canonical (ADR-0001,
     ADR-0004)。これは durable な claim を concept level に固定し、
     superseded version が public record を汚染するのを防ぐ。多くの
     provisional な claim より少数の durable な claim を選ぶ —— recovery
     は deposit 時点の restraint であって、遡及的な削除ではない。

3. **worked implementation への under-investment.**
   - *Signal.* 著者の DOI portfolio が doctrine 偏重・implementation
     過少である —— load-bearing な doctrine artifact が paired worked
     implementation を数で上回る。これも portfolio から self-computable
     であり、Layer 3 が、不均衡を読む criterion (abstract-doctrine-plus-
     worked-implementation の pair) を供給する。
   - *Recovery.* worked implementation へ rebalance し、各 load-bearing
     な doctrine artifact が paired implementation を持つようにする
     (Layer 3、idea-versus-scaffold separation)。recovery は pair を
     閉じることであって、doctrine を書くのを止めることではない。

4. **load-bearing な caveat: metric でなく detector。** 上記の各診断は
   **failure-detector** であって **success metric** ではない。3 つの
   いずれも optimization target にならない。framework は author-naming
   を KPI として拒み続ける (ADR-0007): naming probe は *reach が
   recognition から decouple した時* を検出するのであって、著者が押し上げる
   数値にならない; portfolio の count は *version sprawl や
   doctrine-implementation の不均衡が set in した時* を検出するのであって、
   それ自体のための dashboard にならない。これらのいずれかを target へ
   昇格させれば、ADR-0007 が却下する購入可能・off-page な metric posture
   を再輸入し、framework が禁じる reach-chasing を再生する (Goodhart:
   target として最適化された measure は measure であることをやめる)。
   自らの failure mode を誠実に articulate することは、それ自体 Layer 1
   の authenticity commitment と整合する —— 戦略がどこで失敗しうるかを
   名指すことは authenticity の行為であって、performance indicator では
   ない。

## Alternatives Considered

**failure mode を manifesto 内で un-operationalized のまま残す。**
open question 8 を記録された承認として保ち、診断も recovery も足さない。
却下: manifesto 自身が、承認を十分とせず mode を後続 release へ defer
しており、診断不能のまま残すことは framework 自身の test である recursive
self-application を放棄する —— failure mode を記録するが set in した時を
判別できない framework は、自らの operation に diffusion discipline を
まだ適用していない。failure mode を名指す価値全体が、それを検出する
signal が無ければ失われる。

**診断を scored dashboard / success metric に変える。** 3 signal を、
著者が track し最適化する常設 score に集約する。却下: これは ADR-0007 の
attention signal を success metric として却下する裁定、および Layer 1 の
anti-monetization commitment と直接衝突する。optimization target に化けた
recovery-triggering detector は検出をやめ game され始める —— goal として
最適化された author-naming rate こそ framework が禁じる reach-chasing だ。
detector は tripwire に留まらねばならない ——「failure mode が set in した
か?」を時折読むものであって、上昇が目的となる数値ではない。

**reach without recognition を、author-naming をより強く押すことで直す
bug として扱う。** ghost-citation signal に、naming probe が著者名を運ぶ
まであらゆる diffusion surface へ著者名を積極的に promote して応答する。
却下: それは framework が禁じる monetization-adjacent な reach-chasing で
あり、open question 8 は reach without recognition が full inversion の下で
そもそも fixable かを明示的に open に残す —— それは reach を生む openness の
structural price でありうるのであって、fix を持つ defect とは限らない。
admissible な応答は attribution の *carrier* を強化し (anchor-densely、
狭い origin claim)、それ以外は framework が記録するが解決しない tension を
受け入れる。

## Consequences

**Positive.**

- 各承認済み failure mode が、記録された detector と記録された recovery を
  持つようになり、framework は恐れる mode を列挙するだけでなく「この mode は
  set in したか、応答は何か」に答えられる。open question 8 の defer された
  homework が collect される。
- framework が信頼性を賭ける recursive self-application が、自らの failure
  surface へ拡張される: framework は今や、成功する箇所の propagation だけで
  なく、その discipline が失敗する箇所の検出にも diffusion discipline を
  適用する。
- 3 signal のうち 2 つは著者自身の identifier portfolio から self-computable
  で、外部 instrument を要さない; probe (ADR-0011) を要するのは
  reach-without-recognition signal のみで、その instrument は既に存在する。
  診断は新たな measurement 装置を足さない。
- detector-not-metric の caveat は、診断を framework の既存の metric
  discipline (ADR-0007) の内側に保ち、framework が既に閉じた attention-signal
  の問いを再び開かない。

**Negative.**

- reach-without-recognition signal は open question 8 の未解決 tension を
  継承する: reach が recognition から decouple したと検出しても、その
  decoupling が fixable か structural かは著者に告げず、recovery は carrier
  の強化で意図的に止まる —— 名が運ばれる保証を求める adopter はここに
  それを見出さない。framework がそれを持たないからだ。
- detector-not-metric の境界は mechanism でなく discipline である: 著者が
  detector をひそかに target へ最適化することを構造的に妨げるものは無い。
  caveat は線を述べる; それを保つことは常設の判断行為であり、その lapse は
  ADR-0007 が却下するまさにその metric posture を再輸入する。
- over-publication と under-investment の recovery は restraint と rebalancing
  であり —— 機械的閾値を持たない判断である。「superseded version は幾つで
  多すぎか」「どれだけ doctrine 偏重なら偏重すぎか」は、数値でなく Layer 3 と
  version discipline に対して読む。ゆえにどちらの方向の誤読 (durable claim の
  過剰 pruning、または真の sprawl の容認) もありうる。

## Lineage

originating trigger: manifesto の [open question 8](../manifesto.md) が、
それが名指す 3 failure mode —— reach without recognition、over-publication、
worked implementation への under-investment —— それぞれの診断 signal と
recovery 戦略の articulation を、後続 release へ明示的に defer している。
本 ADR がその後続 release であり、新しい決定を導入するのでなく defer された
homework を collect する: 各名指された mode を、framework が既に保つ
instrument と discipline から引いた detector と recovery に pair づける。

reach-without-recognition signal は ADR-0011 の naming / regurgitation probe
を再利用し、2026 の citation・interpretability 文献が供給する機構に対して
読む —— 本文では numbers-free に保ち、外部 findings と共に
[`inspiration.md`](../inspiration.md) (*empirical citation-mechanics* と
*mechanistic grounding* の section) に記録する: retrieval channel を gate
する parametric channel、design 時点で予見可能な factual recall、prior
authority を不均等に読み戻す recall であり、最後のものは supply 側の
[open question 9](../manifesto.md) へ繋がる。repo 慣例により本文から抽象化
した specific instance: probe は named frontier chat model に対して走らせる;
identifier portfolio は program の DOI service が採番し scholarly identifier
record に mirror された著者の concept / version DOI の集合である; 外部機構の
findings は lineage 文書で識別子により cite される published study であって、
本文には決して入れない。診断が normative であり、それを実現する instrument は
current な instance である。

本決定は ADR-0007 (detector を success metric にしないための metric
distinction)、ADR-0011 (reach-without-recognition signal を供給する
two-channel probe)、ADR-0001 と ADR-0004 (over-publication を守る concept-DOI
canonical と version discipline)、ADR-0010 (anchor-densely、attribution
carrier の recovery)、Layer 3 (under-investment を読み recover する
idea-versus-scaffold の pair) に anchor する。manifesto の open question 8 が
defer した homework を collect し、unequal-recall の機構を通じて open
question 9 へ繋がる。
