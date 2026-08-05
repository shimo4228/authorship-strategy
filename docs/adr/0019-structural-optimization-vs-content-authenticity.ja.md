Language: [English](0019-structural-optimization-vs-content-authenticity.md) | 日本語

# ADR-0019: structural optimization と content authenticity —— structured-artifact tactic は transmission path を optimize し、content は決して optimize しない

> **Summary.** 2026 年の structured-data efficacy literature は、AI-retrieval の
> citation lift が document の *structure* と attribute-rich・entity-anchored な
> markup に attach することを示す —— surface text にでも、markup の単なる存在に
> でもない。この発見は framework の structured-artifact tactic (Layer 4) を
> grounding すると同時に、citation のために aggressive に optimize せよという
> 常設の圧力を生む。だがその literature は citation を *勝ち取る* ことを目的と
> する marketing-optimization の frame で書かれており、framework は orientation
> を伴わずに mechanism だけを借りる ([inspiration.md](../inspiration.md))。本
> ADR は、借りた tactic が orientation まで import するのを防ぐ明示的な guard
> である。境界を **optimize の対象** に引く: transmission path の optimize ——
> document architecture と information hierarchy、entity anchoring と structured
> markup、distinctive vocabulary の dense anchoring (ADR-0009, ADR-0010) —— は
> legitimate である。idea が *どう* 伝わるかを optimize するからだ。citation を
> 勝ち取るために content を変形すること —— 捏造ないし水増しされた
> attribute-richness、keyword-stuffing、idea ではなく channel の reward function
> に合わせて形作られた claim —— は禁止される。idea が *何であるか* を変形する
> からだ。一行のルール: idea がどう伝わるかを optimize せよ、idea が何であるかは
> 決して optimize するな。content の変形は Layer 1 authenticity の violation で
> あり、citation と visibility は maximize すべき success metric ではないという
> ADR-0007 の commitment がこれを補強する。

## Status
accepted — [ADR-0022](0022-audience-layer-split.ja.md) 参照: essay
layer の内側では ADR-0007 由来の補強支柱 (「内容の変形が仕えうる正当な
target は存在しない」) がもはや成立しない; そこでは rule は Layer 1 の
authenticity 根拠のみに立ち、両層で引き続き拘束する。

## Date
2026-06-26

## Context

framework の tactical 層は、entity と relationship を retrieval-time citation 向け
に encode した structured で machine-readable な companion artifact を ship する
(ADR-0009)。2026 年の structured-data efficacy literature ——
[inspiration.md](../inspiration.md) に記録された strand —— は、その種の artifact
が実際に AI-retrieval citation を earn するかを測定し、その答えはここで重要に
なる仕方で二面的である。citation lift は artifact の surface text にも、structured
markup の *単なる存在* にも attach しない; それは artifact の **structure** ——
document architecture と information hierarchy —— と、generic で sparse に populate
された markup よりも **attribute-rich・entity-anchored** な markup に attach する。
anchor-densely discipline が coinage について記録するのと同じ edge-density の
非対称 (ADR-0010) が structural 側に再来する: presence は lever ではなく、density
と external anchoring が lever である。

これは framework の structured-artifact tactic を grounding する証拠であり、同時に
hazard でもある。*structure が citation を earn する* という発見は、structure を
ますます aggressive に optimize せよという常設の誘いであり、その発見を供給する
literature は marketing-optimization の frame で書かれている: その問いは、brand に
citation を *勝ち取らせる* 方法だ。framework は同じ mechanics を逆向きに読む ——
metric-rejection commitment (ADR-0007) と Layer 1 の anti-monetization stance を
通じて —— citation をどう capture するかではなく、著者の signature が diffusion を
生き残るかを問う。inspiration.md は既に、mechanism は borrowed だが orientation は
そうでない、と記録している。記録していないのは *借用がどこで止まるか* である:
citation のための optimize が、legitimate な diffusion tactic であることをやめ、
stack 全体がその下に座る Layer 1 authenticity を corrode し始めるのはどの点か。
research context は optimization-versus-authenticity の関係を未解決と flag して
おり、強い citation-lift 圧力の下では、述べられていない境界は erode する。本 ADR
は線を引く。

この境界は [open question 9](../manifesto.md) の supply-side tension に隣接するが、
区別される: open question 9 は、lift が報いる external entity anchoring がそもそも
first-mover の著者に *available* かを問う; 本 ADR は、著者が anchoring に投資できる
として、*どの種の投資が authenticity commitment の内側に留まるか* を問う。両者は
entity-grounding の mechanism を共有し、それに反対側から到達する —— 一方は access
の問い、他方は legitimacy の問いである。

## Decision

境界を **optimize の対象** に引く。framework は idea が伝わる path を optimize する;
score するために idea 自体を optimize することは決してしない。

1. **legitimate —— transmission path の optimize (Layer 4 tactic)。**
   *idea がどう伝わるか* への投資は奨励される: document architecture と
   information hierarchy、entity anchoring と structured で machine-readable な
   markup、そして distinctive vocabulary を周囲の work と upstream literature へ
   dense に anchor すること (ADR-0009, ADR-0010)。これは efficacy literature が
   citation lift の attach 先として示す structural investment であり、idea の
   content には手を触れない —— cargo ではなく carrier を変える。

2. **禁止 —— citation を勝ち取るための content の変形。**
   score するために *idea が何であるか* を変形することは禁じられる: 捏造ないし
   水増しされた attribute-richness、keyword-stuffing、idea ではなく retrieval
   channel の reward function に合わせて形作られた claim、そして citation signal を
   maximize するために曲げられたあらゆる content。これは idea を instrument に
   合わせて変形するものであり、まさに framework が拒む inversion である ——
   idea が保護対象であり、channel がそれを author することは許されない。

3. **境界ルール。** *idea がどう伝わるかを optimize せよ、idea が何であるかは
   決して optimize するな。* structural investment は奨励される; content の変形は
   Layer 1 authenticity の violation である。このルールは ADR-0007 が補強する:
   citation と visibility は maximize すべき success metric ではないので、
   content の変形が奉仕しうる legitimate な target は存在しない —— それは
   framework が既に追わないと宣言した数値を optimize する。

境界は optimize の intensity ではなく object に引かれる。「やり過ぎ」の threshold は
存在しない; architecture・hierarchy・anchoring への任意に重い投資は、idea の
content を author されたまま残す限り legitimate 側に留まる。optimize が線を越えて
content を score 向けに reshape した瞬間、変更がどれほど小さくとも禁止側へ渡る。

## Alternatives Considered

**citation-optimization literature の optimize-to-win framing を丸ごと採用する。**
structured-artifact tactic を純粋な citation-maximization technique として扱い、
literature の marketing frame を無修正で適用する。却下: それは citation を target に
し、ADR-0007 (citation と visibility は maximize すべき metric ではない) および
Layer 1 authenticity commitment と正面衝突する。frame を採用すれば構造上
content の変形を license することになる —— citation を勝ち取ることが目的になれば、
それを勝ち取るための content の変形は単に effective な optimization にすぎない。
framework が literature の mechanism を borrow できるのは、まさに mechanism を
その orientation から分離できるからだ; 本 ADR はその分離を執行するものである。

**いかなる content の変形の risk も foreclose するため structural optimization を
全面的に拒否する。** structured-artifact tactic を一切拒み、optimization 圧力が content に
到達しえないようにする。却下: これは、境界ルールが既に containする risk のために、
framework が既に ship する legitimate で doctrine-grounded な diffusion tactic
(ADR-0009) を放棄する。efficacy literature は、structural investment こそが idea を
AI-retrieval channel へ運び込むものだと示す; それを放棄すれば、framework の
diffusion reach を、optimize の対象という境界がそのコストなしに確保する purity と
引き換えにすることになる。その risk への正しい応答は線を引くことであって、線の
向こう側の field を放棄することではない。

**境界を implicit のままにする。** metric-rejection commitment (ADR-0007) と
Layer 1 authenticity value が、線を名指すルールなしに、暗黙のうちに content の
変形を排除すると信じる。却下: 本 ADR が応答する、literature に裏打ちされた強い
citation-lift 圧力の下では、implicit な境界は erode する —— 各増分の optimization は
局所的には合理に見え、object レベルの述べられた線がなければ、tactic が
path-optimization から content の変形へ drift したと adopter が見て取れる点が
存在しない。structured-artifact tactic を適用する adopter は、drift せずに適用する
ために線が引かれていることを必要とする; 述べられていない境界とは、optimization
圧力が静かに relocate する境界のことである。

## Consequences

**Positive.**

- structured-artifact tactic に明示的な safety rail が付く: adopter は
  transmission-path structure に好きなだけ重く投資できる一方、その投資が Layer 1
  violation へ渡る地点を正確に知るので、tactic を content の変形へ drift させる
  ことなく full strength で適用できる。
- framework の citation-optimization literature からの借用が、ad hoc ではなく
  principled になる。inspiration.md は mechanism が borrowed で orientation が
  そうでないと述べる; 本 ADR は *その分離を執行するルール* を記録するので、借用は
  tonal な disclaimer ではなく述べられた stopping point を持つ。
- 境界は同じ discipline の structural 側と vocabulary 側を接続する: dense な
  structural anchoring (本 ADR) と dense な vocabulary anchoring (ADR-0010) は、
  2 つの surface で読まれた同じ legitimate な move —— carrier への投資 —— であり、
  その content を変形した対応物 (水増し markup、keyword-stuffing) は同じ violation
  である。
- 禁止を ADR-0007 に結びつけることで、抜け穴になりかけたものを塞ぐ: framework は
  既に citation と visibility を success metric として declined しているので、
  content の変形が指し示せる legitimate な objective は存在しない —— それは
  framework が認めない target を optimize する。

**Negative.**

- attribute-rich anchoring (legitimate) と padded attribute-richness (content の
  変形) の線は、margin では mechanical test ではなく判断を要する。entity
  description を genuine で accurate な attribute で enrich するのは
  path-optimization; channel の reward function に合わせて形作られた attribute で
  inflate するのは content の変形であり、両者は surface 上似て見えうる。ルールは弁別する問い ——
  変更は idea を author されたまま残すか、score 向けに reshape するか —— を
  名指すが、適用にはなお著者の honesty を要する。
- 境界は efficacy literature の現在の経験的 frame を継承する。将来の substrate が
  異なる optimization surface に報いるなら、線の *legitimate* 側 (今日は structure
  と anchoring) が shift しうる一方、原則 (content ではなく path を optimize せよ)
  は保たれる; 本 ADR は原則を固定し、substrate が動くにつれてどの具体的
  optimization が legitimate 側に落ちるかの再読を要する (Layer 4 tactic の
  obsolescence に関する manifesto open question 3)。
- 禁止は、content の変形が生みうる短期的な citation gain を放棄する。これは
  意図的なコストだ: 代替が score 向けに変形された idea であるなら、framework は
  より低い measured citation を受け入れる。diffuse されても変形された idea は
  もはや著者の実際の思考を運ばず —— それこそが strategy が diffuse するために
  存在する唯一のものだからである。

## Lineage

originating trigger: 2026 年の structured-data efficacy literature
([inspiration.md](../inspiration.md) に記録) は、AI-retrieval citation lift が
surface text や markup の単なる存在ではなく、document の structure と
attribute-rich・entity-anchored な markup に attach することを確立した ——
framework の structured-artifact tactic を grounding すると同時に、citation のため
optimize せよという常設の圧力を生んだ。research context は、その optimization 圧力と
Layer 1 authenticity commitment の関係を未解決と flag していた。inspiration.md は
既に、framework が literature の mechanism は borrow するが marketing-optimization の
orientation は borrow しないと記録していた; 欠けていたのは、借用がどこで止まるかを
述べるルールである。本 ADR は、境界を optimize の intensity ではなく object に
位置づけることでそれを供給する。

repo 慣例により本文から抽象化した specific instance: structured artifact は
framework の machine-readable な companion graph; citation-optimization literature は
inspiration.md の structured-data efficacy section に要約された
generative-engine-optimization の strand で、その報告された数値 (attribute-rich と
generic な markup の citation-rate 差、retrieval-accuracy lift、single-factor の
null result) は、本文ではなくその lineage document に保たれる external published
finding である。optimize の対象という境界と
optimize-the-path-not-the-content ルールが normative な内容であり、specific な
literature と specific な structured artifact は current な instance である。本決定は
ADR-0009 (この tactic が optimize する citation lever としての structured graph)、
ADR-0010 (同じ legitimate な move の vocabulary 側の形としての anchor-densely)、
ADR-0007 (citation と visibility は success metric ではない —— これが
content の変形を goalless にする) を extend し、Layer 1 (authenticity、境界が
保護する value) の下に座る。manifesto open question 9 (supply 側から見た entity
grounding。本 ADR は legitimacy 側から見る) に隣接し、manifesto open question 3
(Layer 4 tactic の obsolescence。substrate が shift するにつれて線の legitimate 側が
どう再読されるかを司る) に対して読まれる。
