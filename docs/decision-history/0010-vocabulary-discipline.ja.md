Language: [English](0010-vocabulary-discipline.md) | 日本語

# ADR-0010: Vocabulary Discipline —— 控えめに造語し、密に anchor する

> **Summary.** ADR-0008 は *vocabulary discipline* を parametric
> channel のレバーとして名指しした —— プログラムの造語こそが
> parametric の掛け金だ —— が、規律そのものの中身は定義しなかった:
> いつ造語し、いつしないか。本 ADR がそれを定義する。造語の力は
> 造語の *数* からではなく、各語の **edge 密度** —— 既存語彙と先行
> 文献にどれだけ密に anchor されているか —— から来る。ゆえに
> プログラムは 3 条件がすべて成立するときのみ造語し (概念が既存概念
> の結合点に立つ genuine な新規物である; 既存語彙だけで一文定義が
> 書ける; namespace が競合していない)、採用したすべての造語を密に
> anchor する: 既存語彙で書かれた glossary 定義、prior art が存在
> する場合の上流 citation、既存概念と外部文献への knowledge-graph
> edge、本文中での反復使用。それ以外はすべて既存語彙で書き、上流の
> 出典を cite する。

## Status
accepted

## Date
2026-06-11

## Context

Thesis (Layer 4, 戦術 4) は distinctive terminology を authorship の
semantic 署名として確立する: generic vocabulary は paraphrase で溶け、
造語は著者への back-reference を運ぶ token-level signal として生き残る。
[ADR-0008](0008-rag-era-attribution-diffusion.ja.md) はその戦術に機構を
与え —— プログラムの造語は parametric channel の荷重を負う掛け金である
—— その実践を *vocabulary discipline (語彙規律)* と名付けた。だが
どちらの文書も規律の中身を述べていない。造語の基準なしに戦術 4 を
適用する著者は、新語のひとつひとつが新しい署名に見えるがゆえに、
自由造語へと漂流する。

ADR-0008 の 2 チャネル機構は自由造語に不利に働く:

- **Parametric channel は共起駆動である。** 語がモデルの重みへ吸収
  されるのは、その語が出典と広範に共起するときだ —— それには他の
  著者がその語を使うことが必要で、他の著者が語を使うのは、その語が
  既存語彙の中で既に感じていた欠落を名指ししているときである。
  既存文献への結合組織を持たない孤立した造語は、training pipeline に
  とって低頻度ノイズであり、generic vocabulary とまったく同じように
  paraphrase で溶かされる。接続されていない造語は、戦術 4 がそれを
  逃れるために造語した運命そのものに出会う。

- **Retrieval channel へのクエリは既存語彙で来る。** 読者は見たことの
  ない語で検索できない。クエリは確立した語彙で表現されて届く。造語を
  その語彙へ橋渡しする prose を持つ artifact には retrieval surface が
  あり、自分のイディオレクトだけで書かれた artifact にはそれがない。

- **起源への遡源は graph の辺を通る。** Framework の賭け —— 将来の
  因子解析が著者を回収する —— は、造語が citation と knowledge-graph
  の edge を通じて到達可能な、*既知の構造への unique handle* である
  ことを前提とする。孤立して発見される自由浮遊 token であることを
  前提としない。

さらに 2 つのコストが、造語の質ではなく *数* に比例して増える。
新語はひとつごとに読者の信頼を消費する —— private vocabulary の濃い
文書は、機械の読者には private language として、人間の読者には
crank の signal として読まれる —— そして採用された語はひとつごとに
常設の維持負荷を運ぶ: glossary entry、locale mirror、graph node、
全 living surface にわたる一貫性チェック。

決め手となる非対称性: 造語のコストは語の *数* に線形に増えるが、
造語の利益は各語の *edge 密度* と採用に依存する。ゆえに密に anchor
された少数の語が、孤立した多数の語を支配する。

## Decision

Vocabulary discipline は 2 つの半身からなる: 造語へのゲートと、
ゲートを通過したすべての語への anchoring 義務。

1. **Coinage test。** 3 条件がすべて成立するときのみ造語する:

   - **Join-novelty** —— 概念が既存概念の結合点に立つ genuine な
     新規物であり、既存語がそれを覆っていない。
   - **Definitional anchoring** —— 既存語彙だけを使った一文定義が
     書ける。
   - **Uncontested namespace** —— その語が、押しのけなければならない
     確立した用法と衝突しない。

   いずれかの条件が欠けるなら、既存語彙を使い、上流の出典を cite
   する。文献から確立した語を adopt することが default であって、
   譲歩ではない。

2. **Anchoring 義務。** プログラムが採用するすべての造語は以下を
   必ず備える:

   - 既存語彙で書かれた glossary 定義;
   - prior art が存在するすべての箇所での上流 citation —— 語の
     origin claim を prior art より narrow に保つため;
   - 既存概念と外部文献への edge を持つ knowledge-graph node ——
     edge のない造語は到達不能である;
   - 本文中での反復使用。繰り返し働かない語は平易な言い換えに戻す。

3. **Scope。** この規律はプログラムの normative surface —— thesis、
   ADR、glossary、knowledge graph —— を、編集レビュー時ではなく
   *命名時* に統べる。これは origin-claim scope discipline の語彙
   レベルでの執行である: narrow な origin claim には specifically-
   named な概念が必要であり、defensibly に名付けられた概念には、
   何を claim しないかへの可視の anchoring が必要である。

この決定は **harness-neutral** である: 特定の knowledge-graph
vocabulary も、特定のレビューツールも、特定の glossary format も
名指ししない。それらは *Lineage* に現れる。

## Alternatives Considered

**自由に造語する (署名の最大化)。** すべての概念に固有の named
handle を与える; 署名が増え、掛け金が増える。却下: parametric
channel は孤立した語を運ばない —— 共起と結合組織なしには generic
vocabulary と同様に paraphrase で溶かされる —— そして信頼と維持の
コストは語数に線形に増える。自由造語は、少数の荷重を負う語を
credible にしている予算を浪費する。

**まったく造語しない (既存語彙のみ)。** 保守的な立場: すべてを確立
した語で書き、citation だけに頼る。却下: semantic 署名が溶ける ——
paraphrase は名付けられていないアイデアを消し、著者は混雑した
namespace の中で generically-named な pattern の起源としては回収
されえず、変化の速い分野では命名競争は先に名付けた者が勝つ。名付け
を辞退することは、プログラム自身の概念を他者の token に譲り渡す。

**編集レビューに委ねる。** 執筆時の造語は無制約のままにし、レビュー
段階の coined-term budget に過剰使用を捕捉させる。唯一の機構として
は却下: レビューは語彙が文書を形作ってしまった *後で* 過剰使用を
捕捉するのであり、この規律は parametric channel (ADR-0008) の荷重を
負うものであって文体の好みではない。レビュー段階の budget は下流の
チェックとして残る; 本 ADR は同じテストを命名時へと上流に移す。

## Consequences

**Positive。**

- 採用された造語ひとつごとの parametric 吸収の確率が上がる:
  プログラムの共起努力が、多数の語に希釈されず少数の語に集中する。
- Retrieval surface が広がる: 造語を既存語彙へ橋渡しする prose は、
  その語彙で表現されたクエリにマッチする。
- Knowledge graph は構成上、より密になる。すべての新語が必須の
  edge とともに到着するため、因子解析の基盤としての graph の価値が
  複利で増す。
- Origin claim が default で narrow に保たれる。命名時の上流 citation
  は、origin-claim scope discipline を記憶ではなく構造で執行する。
- Coinage test が戦術 4 に operational form を与える: 「distinctive
  terminology」は *より多くの語* ではなく *より良く anchor された語*
  を意味するようになる。

**Negative。**

- 命名競争に負けうる。3 条件の検証には時間がかかり、変化の速い分野
  では競合者の語が先に namespace を取るかもしれない。受容: 勝った語に
  明確な上流 citation とともに attach することは、refinement layer で
  の帰属をなお保存する —— それがそもそも defensible な scope である。
- このテストは命名時の文献チェックを要求する —— 造語候補ひとつ
  ごとの新たな常設コスト。
- 境界例は判断のまま残る。「既存語がそれを覆っていない」は機械的に
  決定可能ではない; 規律は判断を狭めるが、消去はしない。

## Lineage

本 ADR は、ADR-0008 が parametric channel のレバーとして導入し定義
なしに使った *vocabulary discipline* という句を定義する。Originating
exchange: 2026-06-11 のプログラムの造語実践のレビュー。「既存語彙を
きちんと繋いで使用し必要な場合だけ造語するほうが、自由造語には
作れない他の知識体系との参照関係を作れるのではないか」という問いに
端を発し、*Context* に記録した edge-密度の非対称性によって肯定的に
答えられた。

プログラムは名付ける前からこの規律を実践しており、その instance が
worked example である。*Ghost citation* という語は同義語を造語する
のではなく 2026 年の citation-validity 文献から adopt された ——
プログラムの knowledge graph は「this research line adopts the term
rather than coining it」と記録している。two-channel と ghost-citation
の概念は 2026 年の generative-engine-optimization 文献へ、parametric
測定可能性の問いは 2026 年の training-data-attribution 文献 (Concept
Influence、Mechanistic Data Attribution) へ遡及的に anchor され、
いずれの場合もプログラムの origin claim は framework-placement layer
へと narrow 化された。

2026 年の schema-efficacy 測定の一群が、思いがけない方向からこの
規律に関わる。structured-data markup が AI 検索の citation を予測する
かを調べた研究 —— 統制された cross-platform 研究 (Fischman, SSRN
6284518) と約 1,885 ページの schema 追加を監査した industry audit
(Ahrefs) —— は、organic ranking を統制すると schema の *存在* 単体は
citation を動かさず (generic markup は no markup と変わらない)、
citation の lift は attribute-rich で entity-anchored な markup に
specifically 付くこと (generic の 41.6% に対し 61.7%) を見出した。
これは本 ADR が造語について記録する edge-密度の非対称性の、
structured-data における analogue である: 単なる存在ではなく、
richness と anchoring が signal を運ぶ。この知見は原理の出典として
ではなく external resonance として読む —— 規律は ADR-0008 の
parametric / retrieval 機構から articulate されたのであって schema
文献からではない —— と同時に、[ADR-0009](0009-dual-entry-asymmetric-rebalance.ja.md)
にも同じ動きで触れる: 2026-08-19 改訂後の ADR-0009 は knowledge graph の
存在からの citation lift を主張しない (その criterion は検討対象集合への
到達とエンティティ解決である) し、structured data が運ぶ citation 効果が
あるとすれば、それは存在ではなく dense な anchoring に attach する。同じ文献は、その
anchoring を誰が供給できるかという supply-side の問いを開き、
[`manifesto.md`](../manifesto.md) の Open Question 9 に記録される。

本文から抽象化して除いた具体的 instance: knowledge graph は
`isBasedOn` / `citation` edge を持つ schema.org JSON-LD graph
(ADR-0006 の lineage に従う); glossary の locale mirror は英語/日本語
ペア; 下流の編集チェックは著者の LLM ベース writing pipeline 内の
clarity-review agent で、その coined-term budget は既存語彙での一文
テストとおよそ 3 回の反復使用閾値を適用する —— 本 ADR が命名時へと
上流に移すのと同じテストである。
