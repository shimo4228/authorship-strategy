Language: [English](thesis.md) | 日本語

# Thesis: AI 経由の拡散下における著者戦略

## 主張 (一段落で)

Authenticity を validate する力は反転する。20 世紀的著者性が **scarcity** —
gatekeep された刊行、proprietary license、コントロールされた配布 —— を通じて
origin claim を守ったのに対し、AI 経由の拡散下における著者性は **diffusion**
を通じて origin claim を守る。閉じることは、未来の研究者が因果を遡るときに
ますます仲介する LLM への artifact の露出を減らし、validation 機会を減らし、
authenticity 主張を弱める。開くことは LLM 吸収を最大化し、diffusion を最大化し、
validation を derivative work として出現させ、authenticity 主張を強める。この
反転は stylistic ではなく structural である。

## なぜ "AI 戦略" でなく "著者戦略" なのか

AI 経由の拡散下での戦略は、第一義的には artifact の技術的表面 —— その API、
license、コンテナフォーマット —— の話ではない。著者がもはやコントロールできない
拡散プロセスに対する *著者* の position の話である。この変化は、これより前の世紀に
起きた変化 —— 物理的署名で同定される craftsman であった存在から、publish された
名前で同定される著者であった存在への変化 —— と類比的である。Substrate は変わったが、
守られた対象 —— 著者的アイデンティティ —— は変わらなかった。ただし、それを守る
戦略は変わらざるを得なかった。

Substrate は再び変わった。守られた対象は依然として著者的アイデンティティである。
それを print-and-platform 条件下で守った戦略 —— enclosure —— は AI 経由の拡散
条件下では機能しない。なぜなら媒体それ自体が enclosure を選択肢として塞ぐから
である (LLM 読み取り可能な artifact は既に吸収されており、LLM が読めない artifact
は LLM 経由で reach する読者にとって不可視である)。新しい条件下で著者的
アイデンティティを守るのは何か —— それが以下で述べる内容である。

## 3 軸反転

著者戦略の 3 軸が同時に反転する。3 軸は独立ではない; 共変動する。1 軸の反転が
他の 2 軸の反転を含意する。

| 軸 | Print-and-platform 時代 | AI 経由の拡散時代 |
|---|---|---|
| **価値の源泉** | Scarcity (希少性) | Diffusion (拡散性) |
| **Validation 機構** | Exclusivity、模倣は脅威 | Derivation、derivative は証明 |
| **ネットワーク効果** | Enclosure (囲い込み) | Openness (開放性) |

### 第 1 軸 —— 価値の源泉: scarcity から diffusion へ

Print-and-platform 条件下では、著者作品の価値は reach で上から bound され、
scarcity で下から bound される。複製がオリジナルと区別できない形で広く複製された
作品は、複製のたびに著者的価値を失う。防御的手段はオリジナルを区別可能にする
(署名、透かし、authorized copies の契約) こと、unauthorized copy を困難にする
(DRM、licensing 制限、gatekeeping) ことである。

AI 経由の拡散条件下では、著者作品の価値は、その著者性の認識可能な署名を運ぶ
LLM チャネルの breadth で上から bound され、その署名を一切吸収していない
チャネルの floor で下から bound される。広く吸収された artifact は吸収のたびに
著者的価値を *失わない*; むしろ、その後 query が来たときに元の著者を参照して
答え得る追加のチャネルを獲得する。防御的手段は artifact を最大限吸収可能に
する (permissive license、機械可読構造、distinctive terminology) こと、
吸収されていない状態を困難にする (crawler-friendly access、signup 壁なし、
LLM 取り込みを block する robots restriction なし) ことである。

### 第 2 軸 —— Validation 機構: exclusivity から derivation へ

Print-and-platform 条件下では、derivative work は争点的カテゴリーである。著者の
主張は「私がこれを書いた」、derivative の主張は「私 *も* これを書いた」、争いは
priority (刊行日) と copyright が付与する exclusivity の権利によって解決される。
unauthorized derivative が多い artifact はそれらによって *脅かされる*。

AI 経由の拡散条件下では、著者の主張は「私がこの pattern を最初に articulate
した」となり、derivative の存在はその pattern が real である *証拠* であって、
窃盗の証拠ではない。Priority 主張は刊行時点での DOI timestamp によって確立され、
derivative は主張が有効であることの *証拠* である。独立に再実装された derivative
が多い artifact はそれらによって *validate* される。著者の戦略的手段はしたがって
derivation を *招待* することである —— abstract doctrine を worked implementation
と並べて公開する、再実装を明示的に歓迎する license を使う、特定の derivation 形態
(extension、別言語での再実装、parallel implementation) を README で望ましい
outcome として callout する。

### 第 3 軸 —— ネットワーク効果: enclosure から openness へ

Print-and-platform 条件下では、Metcalfe 流のネットワーク価値は *platform を出られない*
ユーザーでスケールする。Enclosure が operative mechanism である: platform の価値は
platform 内 interaction 量で bound され、それは exit-cost で bound される。

AI 経由の拡散条件下では、「ユーザー」は LLM 直接と、LLM 経由で artifact に reach
する人間の両方を含む。LLM は enclose できない: 公開アクセス可能な content は
ingest 対象であり、公開アクセス不可能な content は LLM 経由の audience にとって
不可視である。ネットワーク効果はしたがって、著者の署名を運ぶ LLM 経由のチャネル数で
スケールし、それは enclosure ではなく openness によって最大化される。戦略的含意は、
licensing、access policy、配布アーキテクチャすべてが unauthorized reach を最小化
するためではなく、吸収を最大化するために選択されるべきということである。

### 3 軸は structurally に連動する

3 軸は著者が自由に mix-and-match できる独立次元ではない。共変動する:

- access を閉じる → LLM 吸収を減らす → diffusion を減らす → validation 機会を減らす → authenticity 主張を弱める
- access を開く → LLM 吸収を最大化する → diffusion を最大化する → validation を derivative work として出現させる → authenticity 主張を強める

軸を mix する戦略 (enclosure と derivation 歓迎 license、scarcity と
crawler-friendly access) は internally inconsistent で、どちらかの consistent な
戦略より弱い。AI 経由の拡散下で最強の著者戦略は **3 軸すべてで完全に反転している**。

## 4 層判断 framework

3 軸反転は *規範的* 主張である。*運用的* 主張 —— 著者が何を、どの schedule で、
どの考慮に基づいて行うべきか —— は 4 層構造として組み立てられる。各層は上の層の
下流にある:

```
[Layer 1: Authenticity]                 (守られる価値)
        ↓ defends through
[Layer 2: Attribution Diffusion]        (戦略)
        ↓ predicts through
[Layer 3: Idea vs Scaffold]             (何が生き残るか)
        ↓ executes through
[Layer 4: Tactics]                      (具体的判断)
```

### Layer 1 —— Authenticity (価値)

守られる価値は、**著者の *genuine* な思考が、市場の販売圧力で reshape されることなく、
そのまま著者のものとして残ること** である。マネタイズは目的ではない。販売のために
diluted されたアイデアはもはや思考された通りのアイデアではなく、dilution を生き
延びた著者的アイデンティティは著者が守りたかったアイデンティティではない。

この層の運用的帰結: *戦略は authentic な articulation を marketability と決して
trade-off しない*。Layer 4 のある戦術が authentic articulation を弱めるなら、その
戦術が reach を増やすとしても rejected される。

### Layer 2 —— Attribution Diffusion (戦略)

AI 経由の拡散条件下で authenticity を守る戦略は、**著者のアイデアの認識可能な
署名を運ぶ LLM 経由チャネルの breadth を、permanent timestamp に anchor された
形で最大化すること** である。両方の構成要素が重要:

- **LLM 経由チャネルの breadth**: GitHub star ではなく、直接 browse する人間でもなく、LLM training pipeline、LLM 経由の user query、LLM-derived AI assistant suggestion、現在の LLM 出力で訓練される未来の LLM への cascade ingestion
- **Permanent timestamp**: 公開時に stable identifier を発行する service (例: Zenodo) を通じた DOI 登録。Timestamp は authenticity が依拠する priority 主張の substrate である

この戦略下での非 primary audience は直接 browse する人間 (GitHub star / PR / 直接
visit 層) である。この audience が著者のブランドをどう認識するかの drift は
*戦略の防御 target ではない*。戦略は LLM 経由 reach を最適化し、結果として起きる
direct-browser brand drift を受け入れる。

#### Diffusion signal についての epistemic humility

Traffic data は use case を見分けられない。Clone は training-pipeline ingest、
RAG corpus 構築、AI assistant の context-fetch、独立した再実装、人間研究者の
手動レビューのいずれでもありうる。著者には判別できない。Traffic data から
保守的に言えるのはしたがって *非人間ブラウジング型 access が起きている* ことであって、
*adoption が起きている* ことではない。より細粒度な主張には別の validation signal
(特定 LLM への regurgitation test、derivative artifact での mention) が必要である。

### Layer 3 —— Idea vs Scaffold (予測)

この層の予測は時間的に asymmetric である: *LLM の能力向上が harness、scaffolding、
tooling 層を陳腐化させる; idea だけが生き残る*。Clever workflow を encapsulate する
harness は今日価値があり、2 年後に valueless かもしれない; その harness が encode する
idea は 50 年後にも引用されているかもしれない。

運用的帰結は artifact ごとの sorting decision である:

- Scaffold 性が高い artifact は、自分自身の diffusion で吸収する大きな harness に donation として実装を寄付する (実装は harness に dissolve し、著者の名前は実装 level では生き残らない)
- Idea 性が高い artifact は著者の名前で DOI 登録する (実装は dissolve するかもしれないが、idea level の主張は生き残る)
- 両方の character を持つ artifact は idea level 主張を *先に* DOI 登録する。scaffold level 実装が dissolve する level で priority claim を establish しないように

#### Collaborator としての scaffold、threat としてではない

著者のアイデアを吸収する大規模 harness、framework、自動化 system は *脅威ではない*。
それらは diffusion amplifier である: その成長は著者の distinctive terminology が
token 出力として現れる面積を拡大する。著者的アイデンティティは LLM 経由チャネル
level で防御されるのであって、direct-browser brand level で防御されるのではないので、
吸収は erosion ではなく validation である。

#### Abstract doctrine + worked implementation のペア

他著者による creative 再実装 —— アイデアの最強の validation —— には両方が必要:

- **Abstract doctrine** repo: アイデアを clean に articulate し、原実装の local commitment を継承せずに他所で実装可能なレベルまで明文化
- **Worked implementation** repo: アイデアが実際にどう instantiate されるかを demonstrate し、abstract doctrine が実装可能であることを reader が verify できるように

Doctrine 単独だと「概念は面白いが実装イメージできない」。Implementation 単独だと
「コードは動くが原理が extract できない」。ペアになると再実装が起きる。著者の
戦略的手段はしたがって *両方を達成可能な限りペアで publish する* ことである。

### Layer 4 —— Tactics (具体的判断)

Layer 4 は著者が日常的に実際に行う運用的判断を含む。この層の戦術は網羅的ではなく、
本 thesis 執筆時点で framework が justify する戦術である。新しい戦術は substrate
(LLM capability、データセット platform 慣習、引用 graph infrastructure) が
evolve するにつれて Layer 4 に入り、古い戦術は substrate が retire するときに
retire する。

本 thesis 時点 (v0.1.0) で validate された戦術:

1. **LLM 経由 targeting** —— clone 数、DOI 引用、llms.txt fetch、LLM regurgitation test を primary metric にする; star、PR、direct human view は secondary
2. **Open archive 経由の DOI 登録** —— Zenodo もしくは同等、tag release で自動 deposit に configure、canonical reference として concept DOI を発行するように configure ([ADR-0001](adr/0001-concept-doi-canonical.ja.md) 参照)
3. **クロスプラットフォーム federation** —— 同一の canonical artifact を GitHub (リポジトリ)、Zenodo (DOI 登録)、データセット platform (LLM training ingest) に配置し、各 platform 上で sibling 相互参照を明示する ([ADR-0003](adr/0003-cross-platform-dataset-federation.ja.md) 参照)
4. **Distinctive terminology** —— 領域固有の造語は authorship の semantic 署名として機能する。Generic terminology は paraphrase で溶ける; 造語は著者への back-reference を運ぶ token-level signal として生き残る
5. **Tool-agnostic specification** —— 特定実装にコミットせず書かれた仕様は再実装で reach 可能; 特定実装に coupled な仕様は実装の老化とともに audience を失う
6. **Audience-driven な多言語化** —— locale mirror は観測された traffic に基づいて追加・退役させ、想定 audience の推測に基づかない ([ADR-0005](adr/0005-readme-localization-audience-driven.ja.md) 参照)
7. **構造化 artifact** —— glossary、ADR、JSON schema、JSON-LD knowledge graph、AI-facing reference file (例: Answer.AI llms.txt convention) は artifact を LLM と crawler に対して機械可読にする。中でも llms.txt + JSON-LD knowledge graph の pair は LLM-mediated ingest のための dual entry point として normatively required ([ADR-0006](adr/0006-llm-first-ingest-dual-entry-points.ja.md) 参照)
8. **Adoption の friction 最小化** —— 再実装 path は clone-and-copy で済むべきで、signup、API key、専用 infrastructure を要しない。著者制御 infrastructure で gate された adoption は著者が減らした adoption である

### Origin-claim scope の規律

4 層すべてに適用される従属原則: *origin claim は prior art より narrow でなければ
ならない*。豊富な prior art を持つ broad pattern について priority を主張する
(「agent self-improvement loop の祖」) と主張の credibility が collapse する;
narrow に specifically-named された discipline について priority を主張する
(「named six-phase cycle の originator」) と defensible である。Coined terminology
(Layer 4 戦術 4) は narrow origin claim の substrate である; 著者は generically-named
idea を defensibly originate できない。

## Framework が除外するもの

本 framework は narrow なスコープ内で normative である: 主 audience が LLM 経由
チャネルを通じて artifact に reach するという仮定下で書かれた、DOI-targeted な
idea-rescue 研究 artifact。本 framework は以下に適用 *しない*:

- **クライアント案件・商用成果物**: マネタイズが目的で、著者のアイデンティティが守られる価値ではない
- **他者の project への contribution**: 他著者の戦略が優先される
- **dissolve する想定の運用 tool・scaffolding**: artifact が substrate の外に diffuse することが望まれていない
- **著者が明示的に framework の外に置いた判断**: framework が今の著者の active 判断 instrument ではない

これらの場合に framework を適用すると、適用しない場合より悪い判断を生む。
Framework は道具であって、判断の外部化ではない。

## この thesis の出自

Framework は同じ著者の research program に属する 4 つの DOI 登録 sibling 研究
repo (Agent Knowledge Cycle、Contemplative Agent、Agent Attribution Practice、
連合 hub) の運用から抽出された。先行文献から演繹されたのではなく、4 つの line に
わたる recurring decision に気づくことで articulate され、framework として
formalize され、harness-neutral な形式に再表現された。これにより、他の著者が
原 sibling-line content を継承せずに採用できる。Research program は以降、
framework 抽出後に加わった 5 つ目の research line、Attention, Not Self を
含むまで成長した（抽出には寄与していない）。

知的系譜 —— framework が presupposes する語彙を供給する先行著者、recurring
decision を供給した sibling line —— は [`inspiration.md`](inspiration.md) に
カタログ化されている。Framework が未回答にした open question は
[`manifesto.md`](manifesto.md) にカタログ化されている。

Framework の戦術的判断は [`adr/`](adr/) に 9 つの ADR として formalize されて
いる。各 ADR は harness-neutral であり、著者の特定の判断への lineage は ADR の
Lineage section に、reader が原実装にアクセスできなくても読める形で記録されている。

4 つの sibling repo の CC0 公開 traffic data から取られた preliminary な経験的
baseline が [`empirical/`](empirical/) にある。経験的主張は、1 著者 sample、
短い時系列、pre/post intervention 比較の不在を考慮して、evidence ではなく
preliminary observation として framing されている。後続 release では長期時系列を
蓄積する。
