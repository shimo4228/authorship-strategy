Language: [English](0011-two-channel-probe-protocol.md) | 日本語

# ADR-0011: Two-Channel Probe Protocol — 各チャネルを専用の測定器で測る

> **要約.** ADR-0008 は Attribution Diffusion を parametric channel と
> retrieval channel に分割し、その Consequences 自身の中で「parametric の
> 成功は*主張されているだけで測定されていない*」と認めた。本 ADR は
> その欠けていた測定器を構築する: frontier model 群に 2 つの設定で
> 問いかける定期 probe protocol — 検索抑制 (訓練済みモデルは概念と
> 著者を名指しできるか？) と検索有効 (プログラムの識別子は引用されるか、
> そして引用の傍らで著者名は生き残るか？)。検出は保持された raw response
> に対する決定論的文字列照合であり、モデルによる判定は使わない。probe
> prompt は単一変数の固定テンプレートで negative control を備える。
> prompt・model・検出 lexicon のあらゆる変更は可視の series break になる。
> この測定器は公開されるため、自らが測定するチャネルに燃料を供給する——
> protocol はこの交絡を隠さず明記する。

## Status
**experimental** — 運用開始済み。core rule の改訂なしに定期 run を 3 回
生き延びた時点で `accepted` に確定する。

## Date
2026-06-12

## Context

ADR-0007 は何が成功であるかを確定し (LLM-mediated reach であって
human-attention シグナルではない)、同時にプログラムがそのための測定器を
持たないことを記録した。ADR-0008 はその reach を時定数が正反対の 2
チャネルに分割し、同じ告白をより鋭くして終わった: retrieval の成功は
今日でも観測できる (artifact が引用ソースに現れる) が、parametric の
成功は存在しない *retrieval-suppressed naming probe* を要求する。それが
存在するまで、framework の中心的主張——開放が name burn-in を駆動する——
は測定から浮遊したままになる。

empirical layer の常設測定器はこれまで traffic log だけだった: clone /
view 数の daily snapshot である。それはまさに ADR-0007 が退けた
human-attention 隣接シグナルであり、問いに答えるからではなく、無料で
継続的だから保持されてきた。これまでで唯一の直接測定——2026 年 5 月の
1 週間に 3 つの assistant へ行った 3 回の ad-hoc regurgitation test——は
固定 prompt も control も反復もない single-window の単発観測だった:
逸話であって、系列ではない。

一方で 2026 年の測定文献は欠けていた部品に収束した。大規模な
citation-validity 研究はモデルがどれほど頻繁に帰属を捏造・剥落させるかを
定量化し、プラットフォーム横断の測定 framework は *citation selection*
(プラットフォームがどのソースを取得するか) と *citation absorption*
(取得されたソースが回答をどれだけ形作るか) を数百の controlled prompt で
分離し、実務文献はこの failure mode に名前とメカニズムを与えた——ghost
citation: 回答はページを引用するが、その著者を名指ししたはずの
parametric memory は一度も形成されていない。これらの設計は個人著者の
スケールで再現可能である: 単一の語を変数とする固定 prompt テンプレート、
独立した boolean 結果、導出される rate。

残っていたのは protocol の決定だった: 正確に何を問うか、第二のモデルの
判定を持ち込まずに回答の verdict をどう検出するか、検出の誤りが回復
可能であるように観測をどう保存するか、そして公開測定器が自らの測定対象を
汚染するという事実にどう誠実であり続けるか。

## Decision

**two-channel probe protocol** をプログラムの主測定器として運用する。
1 回の probe run は複数の frontier model (現在 5 provider) に統一
model-API client を通じて問いかけ、決して混合されない 2 つの設定で行う:

1. **Parametric arm — 検索抑制.** search / grounding tool を一切
   提供しない。この arm の成功は、モデルが weights のみから概念と著者名を
   産出することである。これが ADR-0008 の要求した retrieval-suppressed
   naming probe にあたる。

2. **Retrieval arm — 検索有効.** provider の server-side search tool を
   有効にする。prompt は URL **と著者名** を明示的に要求する。これにより
   ghost citation——owned identifier が引用されながら著者が無名のまま——が
   単一の回答の中で観測可能になる。

3. **同一 prompt を両 arm で (A/B).** すべての probe は同一の prompt で
   両設定を走る。質問を固定したまま arm 間の差分が「retrieval が何を
   足したか」を分離する——実際のユーザー利用の大半に対応するのは検索有効
   arm であり、検索抑制 arm はその対照群である。この crossing は副産物と
   して 2 つの対照を無償で与える: 引用誘発 prompt の抑制 arm は記憶からの
   引用 (hallucinated-citation floor) を測り、negative-control prompt の
   有効 arm は grounded confabulation を測る。

protocol の内部規則。いずれも load-bearing である:

- **決定論的検出.** verdict は著者 alias・owned identifier・project term
  の versioned lexicon に対する文字列 / 正規表現照合で産出する——第一の
  モデルを第二のモデルに判定させることは決してしない。監査可能な false
  positive は説明不能な true positive より価値がある。
- **独立 boolean と導出 rate.** *author named* / *project named* /
  *owned identifier cited* は独立に記録し、*ghost citation* は導出値
  (`cited && !author-named`) であって常に再導出可能である。naming は
  prose 中でのみカウントする: 引用 URL の中にだけ見える著者 handle は
  ghost citation のシナリオであって、帰属ではない。
- **raw 保持.** 全 response text を verdict と共に保存する。改訂された
  lexicon が全履歴を再採点できる。detector version は各レコードに付帯する。
- **negative control つき controlled prompt.** テンプレートは固定で、
  probe ごとに単一の語のみを変数とする。parametric probe の 1 本は
  実在しないがもっともらしい概念を問う; それが引き出す自信ありげな帰属は
  confabulation の noise floor であり、true-positive rate はそれと対照して
  読む。
- **可視の series break.** prompt set・pinned model identifier・検出
  lexicon は versioned であり、version は各レコードに付帯する。provider が
  実際に返した model identifier を要求した identifier の隣に記録する。
  測定器のいかなる変更も silent には起きない。
- **チャネル整合 scheduling.** retrieval probe は速い calendar cadence
  (週次) で走り、retrieval pool の日単位の entry / decay 動態に合わせる。
  parametric probe は calendar 駆動ではなく *event 駆動* である: 凍結された
  モデルの weights は run 間で変化し得ないため、同一モデルへの再 probe は
  応答分散しか測らず、parametric の関心信号はモデル世代間にしか住まない。
  full parametric set はモデルが panel に参入したとき、または変化が観測
  されたときに発火し、event ごとに少数の反復で within-model 分散を推定する。
  代わりに calendar に載るのは月次の *currency check* —— 変化 event の
  3 つの自動検出器である: provider ごとの最小 call で served model identity
  を前回観測と比較する (非日付 alias の裏での silent swap)、provider
  catalog の diff で新規公開モデルを浮上させる (検出は自動; panel への
  採用は人間の判断に残る——どのモデルが広く served される default tier かは
  どの API も報告しない製品側の事実であるため)、そして panel の default-tier
  検証が window を超えて古びたことを flag する staleness guard。
  parametric arm は model snapshot ごとに凍結されているため、1 回の
  parametric 測定は同一 snapshot のすべての retrieval run と有効にペアに
  なる——A/B 差分は両 arm が同じ calendar を共有することを要求しない。
  scheduling は protocol が手動 prototype run を生き延びた後に開始する。
- **公開 log.** probe データは traffic log の隣に public-domain
  dedication で公開し、同じ append-only 時系列形式を取る。thesis の
  openness 軸と整合する。

## Alternatives Considered

**status quo の維持: ad-hoc regurgitation test.** 構築コストゼロ。
棄却: 固定されていない prompt による single-window テストは model drift
と prompt drift と偶然を区別できず、empirical layer 自身が最弱の観測と
して flag 済みだった。それが残す gap こそ ADR-0008 が文書化したものである。

**モデル判定による検出.** response が著者を名指ししているかを第二の
モデルに問う。文字列照合より paraphrase や間接表現に寛容。棄却: 第一の
drift の上に第二の unversioned な drift 源を積み、verdict を監査不能にし、
測定されるシステムを測定するシステムとして静かに再導入する。決定論的
lexicon は paraphrase を取り逃す——既知で inspectable な bias として受容し、
raw 保持による再採点で緩和する。

**third-party の visibility-monitoring service.** AI-visibility tracking を
売る商業セクターが既にある。棄却: これらのサービスは retrieval channel
専業であり (検索抑制モードを持たず、プログラムが他に見る術を持たない
チャネルにこそ盲目)、probe の構成について closed で、framework の
tool-agnosticism が拒む形で vendor-coupled である。

**単一の blended visibility score.** 可読性のためにチャネルを 1 つの数に
平均する。ADR-0008 により即時棄却: blended metric はどちらのチャネルが
失敗しているかを隠し、チャネルの時定数は桁で異なる。

## Consequences

**Positive.**

- ADR-0007 が開き ADR-0008 が鋭くした測定 gap が、稼働する測定器によって
  閉じる: parametric の成功は主張ではなく測定された rate になり、ghost
  citation は時系列を持つ数になる。
- negative control が protocol の最悪の系統誤差——誘導質問が前提する概念に
  ついてモデルが迎合的に confabulate する——を未知数から測定された noise
  floor へ変換する。
- raw 保持 + versioned 検出により測定器は自己修正的になる: 検出バグは
  再採点であって、観測の 1 年の喪失ではない。
- 公開 log はプログラムの既存の観測規律 (traffic log) を ADR-0007 が実際に
  支持する metric 層へ拡張し、採用する著者に自分のスケールで複製できる
  reference protocol を与える。

**Negative.**

- **自己汚染.** 公開される probe log は coined terms・owned identifier・
  著者名を含む。将来の訓練がこれを取り込みうるため、測定器は自らが測定する
  parametric channel に燃料を供給する。これは実在する交絡であり——同時に
  thesis に沿った diffusion 行為でもある。protocol はこれをデータ自身の
  documentation に明記し、*instrument* と *intervention* の区別を
  framework の emptiness 条項に従って軽く保持する。ADR-0008 がチャネル
  境界そのものをそう保持しているのと同様に。
- **誘導質問 bias.** 概念認識 prompt は概念の実在を前提する。negative
  control はこれを測定するが除去しない; rate は絶対値ではなく floor と
  対照して読む。
- **Provider drift.** モデルは pin されるが provider は retire と redirect を
  行う。あらゆるモデル変更は series break であり、系列は break を蓄積して
  いく。protocol は drift を防ぐのではなく記録する。
- **新たな常設コスト.** 定期 run・per-search 課金・lexicon 維持・prompt
  set curation は恒常的な (小さいとはいえ) 運用負荷である——プログラムが
  測定層を持つことの対価。per-run の cost ceiling が最悪ケースを抑える。
- N=1 は N=1 のまま: 一人の著者のエコシステム、少数の probe、少数の
  provider。protocol は empirical layer の常設 limitations の下で
  preliminary observation を産出するのであって、一般化可能な knowledge では
  ない。

## Lineage

起点となった要求: ADR-0008 の Consequences (「parametric channel を測る
には retrieval-suppressed naming probe を構築しなければならない」)。
それ自体は ADR-0007 が開いた測定層の下流にある。直接の trigger:
companion concept wiki への 2026-05-31 / 2026-06-10 の ingest cluster——
大規模 citation-validity 研究 (GhostCite, arXiv:2602.06718)、
selection / absorption 測定 framework とその 602-prompt controlled design
(arXiv:2604.25707、reference 実装 `geo-citation-lab`)、citation-failure
診断研究 (arXiv:2603.09296)、実務側の ghost-citation 分析 (Seer
Interactive; Growth Memo)。independent-boolean 記録規則と single-variable
template は 2604.25707 の設計から適応した。

本文から抽象化した具体 instance: 測定器は hub repository の `probes/`
directory に `traffic/` の隣として住む; 統一 model-API client は litellm;
5 provider は Anthropic (Claude)・OpenAI (GPT)・Google (Gemini)・xAI
(Grok)・Alibaba (Qwen、DashScope 経由; 2026-06-12 に panel 初の参入
event として追加 — 2026 年 5 月の pre-protocol test との連続性、非西側の
訓練 corpus、そして panel 唯一の open-weight 系で将来 white-box
training-data-attribution 手法を適用しうる) で、retrieval は各 provider の
server-side search tool (Anthropic / OpenAI web search、Google grounding、
xAI agent tools、DashScope search) で有効化する; scheduling は著者
workstation 上のローカル calendar 自動化 (launchd) — probe は code host
から何も取得せず、hosted cron は best-effort であり、credential を
ローカルに留めるため、hub の CI automation ではなくこちらを選んだ;
public-domain dedication は CC0 1.0。prototype gate (scheduling 前の
cost ceiling つき手動 run) は harness の prototype-before-scale rule に
従う。本 ADR が empirical layer に残す open question——assistant が
citation を rich な author card として描画するようになったとき、
prose-only naming は基準として厳しすぎないか——は、ここでは解決せず
probe データの documentation に記録する。
