Language: [English](0008-rag-era-attribution-diffusion.md) | 日本語

# ADR-0008: RAG-Era Attribution Diffusion — Two Channels, Two Time Constants

> **Summary.** ADR-0006 は「モデルが artifact を ingest する」を単一の行為
> として扱った。実際には 2 つであり、時定数もレバーも正反対だ:
> **parametric channel** (アイデアは訓練時にモデルの重みへ吸収される;
> 遅い; 固有語とその出典の広範な反復共起が駆動する) と **retrieval
> channel** (artifact はクエリ時に fetch される; 速い; 新鮮さ・構造・
> 検索時の gatekeeper 要因が駆動する)。Framework は両者を別々に最適化し、
> 決して一方をもう一方と交換しない。retrieval だけの戦略の failure mode
> —— 出典は cite されるが著者は名指しされない —— は、retrieval が機能し
> parametric への焼き込みが未達のときにまさに起きるからだ。Success は
> channel ごとに測る。混合した数値は失敗している channel を隠す。

## Status
accepted

## Date
2026-05-30

## Context

Thesis は framework の target を *著者の signature を carry する
LLM-mediated channel の breadth* (Layer 2, Attribution Diffusion) と
固定する。[ADR-0006](0006-llm-first-ingest-dual-entry-points.ja.md) は
*reader population* を prose-reading sub-population と
structured-data-ingesting sub-population に分割し、各々に対応する entry
point を与えた。だが *ingest という行為そのもの* は単一として扱った。
実証記録は今やその行為を、レバーも時定数も単に異なるのでなく対立する
2 つの機構に resolve する。ゆえに単一の戦術セットは構造的に一方を
取りこぼす。

- **Parametric channel。** アイデアは訓練時にモデルの重みへ吸収され、
  モデルは何も検索せずそれを produce できるようになる。決定的な観察は、
  retrieval-augmented な回答における処理順序だ —— モデルはまず
  parametric 記憶から名前を選び、*その後で* 根拠となる reference を
  検索する。レバーは、プログラムの固有語彙とその正準出典が多数の表面で
  広く反復共起することだ。*名指し* される最強の予測因子は
  クロスプラットフォーム言及の広がり (相関 ≈ 0.664) で、囲い込まれた
  inbound link (≈ 0.218) を大きく上回る。時定数は訓練サイクル —— 数ヶ月
  —— で、この channel は速いフィードバックを与えない。

- **Retrieval channel。** artifact はクエリ時に retrieval-augmented (RAG)
  reader によって fetch される。新規素材は 3〜5 日で引用プールに入り、
  約 13 週間で測定可能な低下が始まる; 約 90 日以内に refresh された素材は
  同質の陳腐な素材より顕著に多く cite される。大規模な pairwise 研究
  (6 モデル、約 252,000 トライアル、1 要因ずつ変化) が検索時の gatekeeper
  要因 —— トピック関連性・具体的事実・最近のタイムスタンプ・リスト内
  位置 —— を分離し、フォーマットのみの変更や旧来の検索順位シグナルは
  ほぼゼロと出た。ADR-0006 の構造化 linked-data entry point は、この
  channel では prose navigator を上回る。時定数は日単位。

両者が別物であることの証明が、支配的な failure mode **ghost citation**
だ。retrieval channel は出典を fetch して脚注に載せるが、名前が
parametric 記憶へ焼き込まれていないため、モデルは著者を *名指しも推薦も
しない*。reference は存在するが、帰属は回答自体に再浮上しない。片方の
channel の最適化はもう片方を買わず、プログラムは現在、各々をどう設計
するかについて normative な stance を持たない —— 本 ADR が埋めるギャップ
である。

これは ADR-0007 の diffusion 機構側の相補物だ。ADR-0007 は *何を success
とみなすか* (human-attention signal ではなく LLM-mediated reach) を固定
したが、「diffusion」を未分割のまま残した; 本 ADR がそれを分割する。

## Decision

Attribution Diffusion を **2 チャネル戦略**として扱う。parametric
channel と retrieval channel を、別々のレバーで、別々の時間軸で最適化し、
別々の指標で測定する。

1. **Parametric channel —— 遅い、名前の焼き込み。** プログラムの
   *固有の造語語彙* とその正準出典の反復共起を多数のプラットフォームで
   最大化し、語と出典が将来の訓練データの中で密に共起するようにする。
   レバー: クロスプラットフォーム プレゼンス (federation triplet,
   ADR-0001–0003)、永続的な著者エンティティ (ADR-0004 の
   persistent-identifier グラフ)、そして **語彙規律** —— プログラム自身の
   造語こそが parametric の掛け金だ。時定数は訓練サイクル。短期シグナルの
   不在はこの channel では失敗ではない。

2. **Retrieval channel —— 速い、検索時。** 正準の機械向け entry point
   (ADR-0006) を新鮮・構造化・gatekeeper 整合に保つ: 減衰窓の内に
   再スタンプ・再生成し、この channel で両者が競合する場面では prose
   digest より構造化 linked-data 形式を優先し、具体的事実を
   タイムスタンプと曖昧さのないエンティティ定義とともに記述する。
   時定数は日単位。

3. **両方を並行で回す; 決して代替しない。** channel は補完的だ。ghost
   citation はまさに、機能する retrieval channel の上に parametric 焼き
   込みが不在のときの帰結なので、プログラムは両方を同時に維持し、速い
   retrieval 可視性を遅い名指しと、あるいはその逆を、交換しない。

この決定は **harness-neutral** である: 特定の retrieval assistant も、
特定の linked-data vocabulary も、特定の persistent-identifier registry
も名指ししない。それらは *Lineage* に現れる。

## Alternatives Considered

**Diffusion を単一のまま保つ (ADR-0006 の現状)。** よりシンプル ——
一つの戦術セット、一つの指標。却下: 2 channel は時定数もレバーも正反対
なので、単一の戦術セットは構造的に一方を取りこぼし、単一の混合指標は
どちらが失敗しているかを隠す。

**Retrieval channel だけを最適化する。** フィードバックが速く今日
測定できるため魅力的。却下: parametric 焼き込みなしの retrieval 引用は
ghost citation を生む —— 出典は cite されるが著者は名指しも推薦もされず、
帰属は下流で再浮上しない。テーゼの核心に反する。

**Parametric channel だけを最適化する。** 純粋主義の立場: 良いアイデアを
公開し、訓練に吸収させ、検索の機構は無視する。却下: 引用の大きくかつ
増大する割合が検索時のものだ。陳腐で非構造的な artifact は、いずれ
訓練されるとしても retrieval channel には見えず、その間の何年もの発見
可能性を放棄する。

## Consequences

**Positive.**

- Success 指標が channel 別にきれいに分割される: retrieval の success =
  artifact が引用源に現れる (速い、今測定可能); parametric の success =
  検索 *なし* に名前が生成・推薦される (retrieval を抑制したプロンプトで
  測定; 遅い)。平均しないので、失敗している channel は可視のまま残る。
  ADR-0007 が開いた測定層を鋭くする。
- 2 チャネルモデルが各既存 ADR に channel を与える: federation triplet と
  ADR-0004 は *parametric-channel* のレバーとして、ADR-0006 は
  *retrieval-channel* の表面として読めるようになる。ADR set は列挙でなく
  coherent になる。
- 語彙規律に根拠が与えられる: プログラムの造語は荷重を負う parametric の
  掛け金であって、文体の好みではない。

**Negative.**

- 新鮮さが一度きりの公開でなく常設の義務になる: 正準 artifact は減衰窓が
  閉じる前に再スタンプしなければならない。retrieval channel への新たで
  反復的な保守負荷だ。
- parametric channel を測るには retrieval を抑制した名指し probe を構築
  しなければならない; それが存在するまで parametric の success は測定では
  なく主張にとどまる —— ADR-0007 が既に記録した measurement gap の継続だ。
- 境界は恒久ではない。今日の retrieval 出力は明日の訓練データになるため、
  retrieval channel は時間差で parametric channel に流れ込み、両者は長期
  的に結合する。この決定は *運用モデルとしての区別* にコミットする ——
  framework の emptiness clause に従い軽く保持する —— のであって、channel
  が永遠に分離したままだと主張するものではない。

## Lineage

Originating observation: 2026-05-30、プログラムの daily-research stream を
companion concept wiki へ ingest する作業の中で、2026 年の citation
mechanics に関する findings の cluster が浮上し、それらを併せ読むと
ADR-0006 の single-act ingestion 仮定と矛盾した。クロスプラットフォーム
相関の数値 (言及の広がり ≈ 0.664 vs inbound link ≈ 0.218)、retrieval プール
の timing (3〜5 日で entry、約 13 週間で decay、約 67% の freshness lift)、
約 252,000 トライアルの pairwise gatekeeper taxonomy、そして ghost-citation
の処理順序 findings (まず parametric 記憶から名前、次に reference 検索) は、
その stream から引かれ、wiki concept page `GEO` と `authorship-strategy` に
記録されている。Google 検索順位 / AI 引用の重複崩壊 (≈ 70% → < 20%) は
同じ cluster に、2 channel が異なる価値ルールに従うことの独立した
corroboration として現れる。

本文から抽象化して除いた具体的 instance: retrieval-augmented reader は
Perplexity・ChatGPT Search・Google AI Overviews; 構造化 linked-data 形式は
schema.org JSON-LD グラフ、prose digest は Answer.AI `llms.txt` navigator
(いずれも ADR-0006 の lineage に従う); persistent-identifier グラフは
ORCID + concept-DOI の `sameAs` (ADR-0004); プログラムの固有造語語彙には
AKC・Contemplative-AI・テーゼ自身の三軸反転の語が含まれる。本 ADR が
後継に残す open question —— retrieval-feeds-training の lag を通じて 2
channel が測定可能に再結合したとき Attribution Diffusion をどう設計するか
—— は、ここで解決せず manifesto 項目として記録する。
