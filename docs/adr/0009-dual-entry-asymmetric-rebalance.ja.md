Language: [English](0009-dual-entry-asymmetric-rebalance.md) | 日本語

# ADR-0009: Dual Entry Points Are Asymmetric — Structured Graph Carries Citation, Prose Navigator Carries Agent Context

> **Summary.** ADR-0006 は prose-form navigator と concept-form structured
> graph を *co-equal* な補完 pair として deploy し、各々が distinct な
> LLM-mediated reader sub-population に serve するとした。2026 年の実証が
> その対称性を壊す: prose navigator は AI-search citation にほぼ効果を
> 持たず (採用率は一桁 %、agent crawl の約 0.1% しか request せず、有無で
> citation 数が区別できない) 、一方 structured graph は検索時の inclusion と
> machine 抽出精度を有意に押し上げる。本 ADR は ADR-0006 を amend する:
> 2 つの entry point は retain するが、役割は **非対称** になる —— structured
> graph が検索時 citation の primary lever (ADR-0008 の retrieval channel)、
> prose navigator は Business-to-Agent (B2A) の context surface (agent の
> navigation・token 効率の良い context 取得) として reframe され、AI-search
> citation の lever ではなくなる。

## Status
accepted

## Date
2026-05-30

## Context

[ADR-0006](0006-llm-first-ingest-dual-entry-points.ja.md) は 2 つの
structured entry point を「並列に、各々 canonical-maintained」で deploy した
—— prose-reading channel 向けの prose-form navigator と、
structured-data-ingesting channel 向けの concept-form structured graph ——
そして両者を **重複せず相補的** として扱った: navigator は *ここに何が
あるか* に、graph は *これらがどう関係するか* に答える。framing は対称
だった: 2 つの co-equal な surface、各々がその sub-population に不可欠、
両者間の drift は release-blocking defect。

2026 年の実証記録は、Layer 2 (Attribution Diffusion) にとって重要な軸 ——
検索時 citation —— でその対称性を壊す。

- **prose navigator は AI-search citation を動かさない。** 大規模測定が
  収束する: 採用率は調査対象 domain の一桁 % 台; AI 回答で最も cite される
  domain のうち、これを ship しているものはほぼ皆無; 数万件の bot 訪問の
  うち navigator file が request されるのは 0.1% のオーダー; matched-domain
  比較は有無で citation 数が統計的に区別できないことを見出す。主要な検索
  vendor はこの convention を support しないと公に表明した。citation 軸では
  その効果は noise だ。

- **structured graph はそれを動かす。** valid な structured data を持つ
  page は AI 回答 surface に有意に高い率で include され、model は prose より
  structured field から事実をはるかに正確に抽出する。graph の著者エンティ
  ティ部分は経験 / 専門性 signal としても機能する —— ADR-0008 の
  parametric-channel lever だ。

- **だが prose navigator は別の context で genuine な価値を retain する。**
  agent が user に代わって context を fetch する、あるいは tool を select
  する —— Business-to-Agent (B2A) execution context —— では、token 効率の
  良い prose digest は有用な navigation entry point だ。その価値は real
  だが forward-looking で、今日の citation 数ではなく agent-ecosystem の
  成熟に結びつく。

つまり ADR-0006 の「co-equal pair」は citation 軸では実証的に誤りであり、
context 軸では不完全だ。pair は persist すべきだが、*equal weighting* は
すべきでない。

## Decision

ADR-0006 を amend する: dual entry point は retain するが **役割が非対称**
になる。

1. **structured graph が検索時 citation の primary entry point。**
   ingest / citation の weight を担い、[ADR-0008](0008-rag-era-attribution-diffusion.ja.md)
   が名指しした retrieval-channel lever である。maintenance と freshness の
   effort はまずここに配分する。

2. **prose navigator は retain するが B2A context surface として reframe。**
   AI-search citation の lever としては維持しない; その仕事は
   agent-execution context における agent navigation と token 効率の良い
   context 取得だ。引き続き canonical-maintained で graph と同期される
   (ADR-0006 の drift-is-a-defect 規律は ship される限りのものを依然 bind
   する) が、citation outcome に対して最適化も測定もされない。

3. **ADR-0006 の同期規律は不変で生き残る。** 両 surface が assert する
   ものは相互に consistent であり続けなければならない。変わるのは *各々に
   適用する effort の weighting と success criterion* だけで、両者が矛盾
   しないという要件ではない。

この決定は **harness-neutral** である: 特定の prose convention も、特定の
linked-data vocabulary も、実証の背後にある vendor や study も名指し
しない。それらは *Lineage* に現れる。

## Alternatives Considered

**co-equal framing を保つ (ADR-0006 のまま)。** 却下: citation 軸での直接
測定に反する。prose navigator を co-equal な citation lever として扱うのは、
noise レベルの citation 効果しかない surface に同期と freshness の effort を
誤配分する。

**prose navigator を完全に drop する。** citation 効果が noise である以上
誘惑的。却下: B2A execution context では genuine で distinct な価値を retain
する。そこでは token 効率の良い digest が有用な agent navigation surface だ。
削除すればその channel —— agent ecosystem の成熟とともに *より多く* 出会う
channel —— を放棄する。正しい手は削除でなく rescope だ。

**prose navigator を retain するが維持をやめる。** 却下: 維持されない
navigator は graph から drift し、ADR-0006 は drift を release-blocking
defect とする。keep される surface は同期され続けねばならない;「retain but
neglect」は available な state ではない。

## Consequences

**Positive.**

- maintenance と freshness の effort が荷重を負う surface (structured graph)
  に集中する。それは ADR-0008 の retrieval lever でもある —— 2 つの ADR が
  同じ方向を指すようになる。
- program の stance が legible になる: structured graph は *citation の
  ため*、prose navigator は *user に代わって行動する agent のため*。reader
  はどの surface が何をするかを推測しなくてよくなる。
- 明示的な prior decision に対して、framework が evidence で update する
  ことを記録する —— emptiness clause を主張するだけでなく行使する。

**Negative.**

- ADR-0006 を elegant にしていた対称性が失われる; dual-entry の物語は
  「2 surface、2 つの異なる仕事」になり、一息で述べるのが難しくなる。
- prose navigator の retain された価値は B2A-context 成長への
  **forward-looking な賭け** であって、現在形の測定された return ではない。
  agent-execution context が期待通り成熟しなければ、navigator の retention は
  sunk な maintenance に見える。emptiness clause に従い軽く保持する。
- ADR-0006 を amend し、それと併せて読まれる; channel 語彙 (graph を
  retrieval-channel lever とする) について ADR-0008 に依存する。

## Lineage

Originating observation: ADR-0008 を生んだのと同じ 2026-05-30 の
daily-research ingest が、entry-point の efficacy に関する第 2 の cluster を
浮上させ、それが ADR-0006 の co-equal framing と矛盾した。採用率の数値
(調査対象 約 300,000 domain の約 10%; top-50 AI-cited domain のうち約 1)、
agent-crawl の request 率 (約 62,100 bot 訪問のうち約 84 ≈ 0.1%)、
matched-domain の null 結果 (約 37,894 domain で約 6.8 vs 約 6.7 citation)、
structured-data の inclusion lift (約 2.3 倍)、抽出精度の lift (16% → 54%) は
その cluster から引かれ、wiki concept page `GEO` と `authorship-strategy` に
記録されている。

本文から抽象化して除いた具体的 instance: prose navigator は Answer.AI の
`llms.txt` convention、structured graph は schema.org JSON-LD knowledge graph
(いずれも ADR-0006 の lineage に従う); 著者エンティティ signal は ORCID と
concept-DOI への `sameAs` を持つ Person schema (ADR-0004); prose convention を
support しないと公に表明した vendor、および数値の背後にある調査 / 測定企業は、
ここで名指しせず source cluster に記録する。B2A (Business-to-Agent) context は
agent ecosystem の成熟とともに program が出会うと見込む agent-execution
surface であり、その weighting は本 ADR が隠さず明示する賭けである。
