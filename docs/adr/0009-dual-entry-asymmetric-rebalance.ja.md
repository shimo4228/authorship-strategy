Language: [English](0009-dual-entry-asymmetric-rebalance.md) | 日本語

# ADR-0009: Dual Entry Points Are Asymmetric — Structured Graph Carries Entity Resolution, Prose Navigator Carries Agent Context

> **Summary.** ADR-0006 は prose-form navigator と concept-form structured
> graph を *co-equal* な補完 pair として deploy し、各々が distinct な
> LLM-mediated reader sub-population に serve するとした。2026 年の実証が
> その対称性を壊す —— ただし、本 ADR が最初に壊れ目を置いた場所ではない。
> prose navigator は AI-search citation にほぼ効果を持たない (採用率は
> 調査対象 domain の約 1 割、agent crawl の約 0.1% しか request せず、
> 有無で citation 数が区別できない)。structured graph も、2026 年の対照実験の証拠の上では、
> 短期の citation lift を **もたらさない**: AI 回答 system の検討対象集合に
> 既に入っている page を対象とした matched-control 研究は、structured
> markup を追加しても uplift を見出さず、主要な検索 operator 自身の
> guidance も特別な markup は不要と述べる。それらの研究が測れないもの ——
> そして structured graph を retain する理由 —— は citation の *手前* の層
> だ: artifact・その concept・その著者が、AI 回答 system が crawl し
> index し entity として解決する対象の集合にそもそも入るかどうか。本 ADR
> は ADR-0006 を amend する: 2 つの entry point は retain するが、役割は
> **非対称** になる —— structured graph は検討対象集合への到達と
> エンティティ解決のための登録 surface (ADR-0008 の retrieval-channel
> surface。citation-lift の期待は付けない)、prose navigator は
> Business-to-Agent (B2A) の context surface (agent の navigation・token
> 効率の良い context 取得) として reframe され、AI-search citation の
> lever ではなくなる。

## Status
accepted —— 2026-08-19 改訂: structured graph に適用する success criterion を
*検索時 citation lift* から *検討対象集合への到達 / エンティティ解決* へ
移した; Decision の effort 配分は不変で、その理由の記述だけを正す; 元の
Lineage が保持していた 2 つの数値は一次出典に到達しなかったため削除した
(Lineage 参照)。下の Date は決定日のまま残す。

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

2026 年の実証記録はその対称性を壊す。2026-08-19 に再読すると、それは
本 ADR が最初に structured graph の効果を置いた場所も正す; 下の第 2・第 3
項がその再読であり、依拠する出典の日付は *Lineage* にある。Layer 2
(Attribution Diffusion) にとって
重要な軸は、artifact が AI 回答 system の検討対象集合に到達し、そこで
entity として解決されるかどうかであり、検索時 citation はその下流の
outcome であって、structured graph が作用する場所ではない。

- **prose navigator は AI-search citation を動かさない。** 大規模測定が
  収束する: 採用率は調査対象 domain の約 1 割; AI 回答で最も cite される
  domain のうち、これを ship しているものはほぼ皆無; 数万件の bot 訪問の
  うち navigator file が request されるのは 0.1% のオーダー; matched-domain
  比較は有無で citation 数が統計的に区別できないことを見出す。主要な検索
  vendor はこの convention を support しないと公に表明した。citation 軸では
  その効果は noise だ。

- **structured graph も短期の citation lift をもたらさない —— そして本 ADR
  の初版はもたらすと書いていた** (2026-08-19 改訂)。初版のこの項は、valid な structured data
  を持つ page は AI 回答 surface に有意に高い率で include され、model は
  prose より structured field から事実をはるかに正確に抽出する、と主張して
  いた。再照合の結果、その 2 文の背後にあった 2 つの数値はいかなる一次
  出典にも到達せず、2 文は撤回する。一次記録が代わりに示すもの:
  structured markup を追加した page の matched-control
  difference-in-differences 研究は、2 つの AI 回答 surface で citation の
  変化がゼロと統計的に区別できず、3 つ目では小さく説明のつかない減少を
  見出す; cross-platform 研究は organic ranking を統制すると markup の
  *存在* が citation を予測しないことを見出す; retrieval-pipeline 研究は
  markup 単独では modest な gain しか得られないとする; 主要な検索 operator
  の公開 guidance は structured data は生成 AI 検索に必須ではなく特別な
  markup を追加する必要はないと述べる; そして 2026 年の分野 survey は、
  discoverability に対して安定した縦断・cross-platform の因果効果を示す
  手法が査読対象に無いとする。横断的には、AI に cite される page は cite
  されない page よりはるかに高い率で structured markup を持つ —— 同じ研究が
  因果として読むことを明示的に拒む相関である。

- **対照実験の証拠が届かないのが、graph を keep する理由の層だ**
  (2026-08-19 改訂)。matched-control 研究の母集団は、AI system に既に多く cite されている page
  —— 既に検討対象集合の内側、既に crawl され surface されている page ——
  であり、著者らは、AI system にまったく見えていない page が最初に crawl・
  parse・index されるのを markup が助けるかどうかについては語れないと述べる。
  新しい著者 entity や新たに coin された concept が knowledge graph 内で
  初めて machine-resolvable になるかどうかは別の機能であり、query time では
  なく index time で働き、測定窓も異なる。本 program の artifact —— 初めての
  著者 entity、外部 record をまだ持たない concept —— にとってはそれが
  relevant な問いであり、structured graph はその問いが立てられる surface だ。
  それは登録 surface であり access floor (静的に serve され、page script を
  実行しない agent にも読める) であって、citation lever ではない。

- **だが prose navigator は別の context で genuine な価値を retain する。**
  agent が user に代わって context を fetch する、あるいは tool を select
  する —— Business-to-Agent (B2A) execution context —— では、token 効率の
  良い prose digest は有用な navigation entry point だ。その価値は real
  だが forward-looking で、今日の citation 数ではなく agent-ecosystem の
  成熟に結びつく。

つまり ADR-0006 の「co-equal pair」は citation 軸で両方向に誤り —— どちらの
surface も短期の citation lever ではない —— であり、context 軸では不完全だ。
pair は persist すべきだが、*equal weighting* はすべきでない。2 つの surface
は異なる仕事をするからだ: 一方は AI system が検討対象集合を組み立てる場所に
artifact とその entity を登録し、他方は既に artifact を知っている agent に
serve する。

## Decision

ADR-0006 を amend する: dual entry point は retain するが **役割が非対称**
になる。

1. **structured graph が検討対象集合への到達とエンティティ解決の primary
   entry point。** artifact・その concept・その著者 entity を AI 回答 system
   の crawl・index・エンティティ解決に向けて登録する surface であり ——
   [ADR-0008](0008-rag-era-attribution-diffusion.ja.md) が名指しした
   retrieval-channel surface —— 静的に serve された構造しか読まない agent に
   対する program の access floor である。maintenance と freshness の effort
   はまずここに配分する。短期の citation lift は期待せず、主張もしない:
   非対称の根拠は、citation 軸での prose navigator の測定された null と、
   structured graph の登録役割であって、graph の citation 効能ではない。
   (2026-08-19 改訂; 初版は検索時 citation を criterion として名指していた。)

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

**co-equal framing を保つ (ADR-0006 のまま)。** 却下: prose navigator に
ついて citation 軸での直接測定に反し、異なる仕事をする 2 つの surface ——
一方は AI system が検討対象集合を組み立てる場所に artifact を登録し、他方は
既にそれを知る agent に serve する —— に同期と freshness の effort を等配分
してしまう。

**prose navigator を完全に drop する。** citation 効果が noise である以上
誘惑的。却下: B2A execution context では genuine で distinct な価値を retain
する。そこでは token 効率の良い digest が有用な agent navigation surface だ。
削除すればその channel —— agent ecosystem の成熟とともに *より多く* 出会う
channel —— を放棄する。正しい手は削除でなく rescope だ。

**prose navigator を retain するが維持をやめる。** 却下: 維持されない
navigator は graph から drift し、ADR-0006 は drift を release-blocking
defect とする。keep される surface は同期され続けねばならない;「retain but
neglect」は available な state ではない。

**元の criterion を保つ —— structured graph を検索時 citation の lever と
する (本 ADR の初版)。** 再照合 (2026-08-19) で却下: その主張を担っていた
2 つの数値は一次出典に到達せず、2026 年の対照実験の証拠は逆を向く。記録が
支持しない主張で正当化された effort 配分は、配分そのものが正しくても正直な
配分ではない。

**structured-graph の効能主張を撤回し、非対称の根拠を prose navigator の
null だけに置く。** 却下: それでは graph への first-priority の effort に
述べられた肯定的理由が無くなる。登録 / エンティティ解決の役割こそ effort が
*向かう先* であり、まさに対照実験が scope 外と宣言する層だ —— それを述べる
方が、配分を説明しないまま残すより正直である。

**本 ADR を supersede する新 ADR で、どちらの entry point も短期の
citation lever ではないと記録する。** 却下: 決定 —— 両 surface を retain し、
effort を非対称に配分し、同期規律を保つ —— は変わらない。動くのは success
criterion と述べられた理由だけだ。日付つきのその場での改訂は、1 つの決定の
履歴を 1 つの file に legible に保つ; supersede は、決定の変更ではなく理由の
変更のために履歴を 2 つに割ることになる。

## Consequences

**Positive.**

- maintenance と freshness の effort が structured graph に集中する。それは
  ADR-0008 の retrieval channel の登録 surface でもある —— 2 つの ADR が
  同じ方向を指すようになる。
- program の stance が legible になる: structured graph は *見つけられ解決
  されるため* (検討対象集合への到達、エンティティ解決)、prose navigator は
  *user に代わって行動する agent のため*。どちらも *citation のため* では
  ない。reader はどの surface が何をするかを推測しなくてよくなり、surface が
  もたらさない return を期待することもなくなる。
- 明示的な prior decision に対して、framework が evidence で update する
  ことを記録する —— 二度: 一度は ADR-0006 の co-equal framing に対して、
  もう一度 (2026-08-19) は数値が検証を生き延びなかった本 ADR 自身の初版に
  対して。emptiness clause を主張するだけでなく行使する。

**Negative.**

- ADR-0006 を elegant にしていた対称性が失われる; dual-entry の物語は
  「2 surface、2 つの異なる仕事」になり、一息で述べるのが難しくなる。
- prose navigator の retain された価値は B2A-context 成長への
  **forward-looking な賭け** であって、現在形の測定された return ではない。
  agent-execution context が期待通り成熟しなければ、navigator の retention は
  sunk な maintenance に見える。emptiness clause に従い軽く保持する。
- **citation lift は structured graph の期待値に含まれない。** graph が述べ
  られた仕事 —— 検討対象集合への到達、エンティティ解決 —— を達成している
  かどうかの操作的な測度は、外部にも本 program にも確立していない: program
  の probe 計測器 (ADR-0011) は query time における owned identifier の
  citation を測るのであって index time のエンティティ解決ではなく、現時点で
  この criterion を測っていない。それを測ろうとする試みはいずれも ADR-0007
  の bound 内に留まり (診断であって success metric ではない)、ADR-0023 の
  reference-baseline 役割のもとで empirical 層に報告される。そうした測度が
  存在するまで、graph への first-priority の effort は、述べられた機構と
  対照実験の明示的な scope 限界に拠るのであって、観測された return に拠る
  のではない。index-time エンティティ解決の操作的測度が利用可能になったとき、
  ADR-0011 の計測器がそこへ拡張されたとき、あるいは対照実験が AI 回答 system
  に未 index の page に届いたときに、配分を再検討する。
- **criterion の surface は self-sovereign だが、その outcome はそうでない。**
  graph は ADR-0021 のもとで self-sovereign な carrier だが、第三者の回答
  system の index 内で解決されることは著者が schedule できない outcome であり、
  ADR-0021 が「unprompted な第三者の行為によってのみ到達可能」と記録する層と
  同じだ。first-priority の effort を正当化するのは program が制御する surface
  であって、制御しない outcome ではない。
- ADR-0006 を amend し、それと併せて読まれる; channel 語彙 (graph を
  retrieval-channel surface とする) について ADR-0008 に依存する。

## Lineage

Originating observation: ADR-0008 を生んだのと同じ 2026-05-30 の
daily-research ingest が、entry-point の efficacy に関する第 2 の cluster を
浮上させ、それが ADR-0006 の co-equal framing と矛盾した。採用率の数値
(調査対象 約 300,000 domain の約 10%; top-50 AI-cited domain のうち約 1)、
agent-crawl の request 率 (約 62,100 bot 訪問のうち約 84 ≈ 0.1%)、
matched-domain の null 結果 (約 37,894 domain で約 6.8 vs 約 6.7 citation) は
その cluster から引かれ、wiki concept page `GEO` と `authorship-strategy` に
記録されている。元の Lineage が保持していたさらに 2 つの数値 ——
structured-data の inclusion lift と structured-field の抽出精度 lift ——
は 2026-08-19 に遡行したところ、帰属の無い二次 digest に行き着き、その
digest 自身の出典は marketing blog で、到達できる一次研究は無かった; 両者は
本 ADR から削除し、本文では代替の数値を主張しない。数値は取り消し線つきで
あってもここに再掲しない: 本 repository の primary audience は LLM ingest で
あり、prose に残った撤回済みの数値は再伝播する; 2026-08-19 の日付つき照合
記録がそれを保持する。いずれも下の横断結果 (53%、「ほぼ 3 倍」) とは一致
しない —— 前者は別の値で、後者は digest が所在を特定できない journal 研究に
帰属させていた —— ので、相関が lift に言い換えられたものではなく、背後に
到達できる研究が無い数値だった。同じ元の項にあったもう 1 文 —— graph の
著者エンティティ部分が parametric channel 上の経験 / 専門性 signal として
機能する —— は一次出典に対して検証されておらず引き継がない; 著者エンティティ
surface 自体は影響を受けない (ADR-0004, ADR-0021)。

本改訂で適用した admission rule: venue を問わず、design・sample・control・
限界を開示していて読みをそれに照らして検証できる source は admit する;
背後にいかなる study・design・sample にも到達できない数値は drop する。

改訂の出典 (2026-08-19)。本文ではなくここにのみ名指しする; epistemic status
つきの全文読解は [`docs/inspiration.md`](../inspiration.md) §"Structured-data
efficacy literature (2026)" に保持する:

- Ahrefs, *We Tracked 1,885 Pages Adding Schema. AI Citations Barely
  Moved.* (Louise Linehan, 2026-05-11) —— matched
  difference-in-differences、処置 1,885 page 対 control 4,000、Google AI
  Overviews −4.6%、AI Mode +2.4%、ChatGPT +2.2% (後 2 者はゼロと統計的に
  区別できない); 母集団は処置前に AI Overview 引用 100 件以上の page に限定
  ("already inside the consideration set"); 横断的には AI-cited page の 53%
  が JSON-LD を持ち、非引用 page の「ほぼ 3 倍」。
- Google Search Central, *Optimizing your website for generative AI
  features on Google Search* (2026-05-15 公開、2026-07-10 最終更新) ——
  "Structured data isn't required for generative AI search, and there's no
  special schema.org markup you need to add."
- Gianluca Fiorelli, *The Ahrefs Schema study is right. And it's testing
  the wrong thing* (iloveseo.net, 2026-05-11) —— 既引用 page に対する 30 日窓
  は index time ではなく query time を測る; structured data が entity を
  knowledge graph 内で初めて machine-resolvable にするかどうかは「別の研究」。
- Olivier Martinez, *Optimizing Visibility in Generative Engines: A
  Critical Survey of Generative Engine Optimization (2023-2026)*
  (arXiv:2607.14035, 2026-07-15) —— 45 研究; "no reviewed technique shows a
  stable, longitudinal, cross-platform causal effect on organic
  discoverability or downstream behavior."
- Volpini et al., arXiv:2603.10700 および Fischman, SSRN 6284518 —— 既に
  `docs/inspiration.md` に記録済み; 前者の "JSON-LD markup alone provides
  only modest improvements" と後者の統制後 presence null が、structured 側で
  repository が保持する 2 本の source である (後者は再照合時に全文を取得
  できず、著者の公開要約から読んでいる —— `docs/inspiration.md` 参照)。
- Borysenko, arXiv:2604.02544 (2026-04-02) —— AI coding agent が異種の HTTP
  client で documentation を fetch し、page script を実行するものは一部に
  限られるという server-side 測定; Context の access-floor 文の出典。

本文から抽象化して除いた具体的 instance: prose navigator は Answer.AI の
`llms.txt` convention、structured graph は schema.org JSON-LD knowledge graph
(いずれも ADR-0006 の lineage に従う); 著者エンティティ signal は ORCID と
concept-DOI への `sameAs` を持つ Person schema (ADR-0004); prose convention を
support しないと公に表明した vendor、および prose-navigator 側の数値の背後に
ある調査 / 測定企業は、ここで名指しせず source cluster に記録する;
「検討対象集合 (consideration set)」は、AI 回答 system が既に crawl し surface
している page の集合を指す matched-control 研究自身の用語である。B2A
(Business-to-Agent) context は agent ecosystem の成熟とともに program が
出会うと見込む agent-execution surface であり、その weighting は本 ADR が
隠さず明示する賭けである。
