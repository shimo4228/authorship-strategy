kind: external
# 秋の parametric contrast（RFC-0005）に eligible な新モデルはあるか — 2026-10-12 時点

as-of: 2026-10-12。外部 URL はすべてこの日に取得した（公開日は各行に併記）。fetch は要約器を通すため、引用句は
取得結果に現れた原文のうち 15 語未満を抜いたもの。ローカル資料は hub の `probes/` 配下（read-only）。
モデルは API を呼ばず、公式 doc・model card・release note の本文だけで判定した。

## 1. Summary

- **確定した eligible は 0 件。最有力は `claude-sonnet-5-5`（Anthropic、2026-09-28 公開）で、判定は "cannot tell"。**
  条件 1（cutoff）と条件 3（旧世代の zero baseline）は一次資料とローカル data で確認できた。残る条件 2
  （Free 既定 tier か）は、Anthropic 自身のページが「default」と書いておらず、第三者 2 件（2026-09-28、09-29）が
  既定と報じるだけ。パネルの運用（人手の default-tier web check）で 1 回確かめれば決まる。
- **OpenAI の 4 候補・Gemini `gemini-3.8-flash`・xAI `grok-4.7` は全て not eligible。** 決め手は条件 1:
  cutoff が全て 2026-06-01 より前（最も近い `gpt-6-luna` でも May 18, 2026 で 14 日足りない）。
  `gpt-6-luna` は ChatGPT Free/Go の既定になった（2026-10-07 の release note）ので、条件 2 は満たす公算が高いが、
  条件 1 で落ちる。規則は緩めない（事前登録の "Neither" 節: 「the rules are not loosened」）。
- **著者が決めること（1 つ）:** `claude-sonnet-5-5` を anthropic 列の pin に入れる（`probes-v11.yaml`、series break）か。
  入れるなら、(a) claude.ai の Free で既定かを人手で確認、(b) eligibility を run record に先に書く、
  (c) 2026-11-30 までに parametric の event run（full set、`--repeat 3`、search 抑制）を回す、の順。
  2026-10-01 の currency check で Anthropic の API key が 401（"API key is invalid."）だったので、key の復旧も要る。
- 副次の判断: ChatGPT Free の既定が 2026-10-07/08 に GPT-6 Luna へ動いたため、パネル方針（free chat default に追従）に
  従えば openai 列も `gpt-6-luna` へ動く。ただし eligible ではない。run しても contrast から外れ、別報告になる。
  それでも後続の eligible OpenAI モデルの「旧世代 baseline」にはなる（現パネルの `gpt-5.6-luna` には parametric 記録が無い）。
- 単一 family だけが eligible になる場合、事前登録上は R1/R2 または "no transition observed" までしか言えない
  （Counts against (b) は 2 family 必要）。cutoff が 2026-06-01 以降で default-tier のモデルは、2026-10-12 時点の
  公式 doc では Anthropic の Sonnet 5.5 以外に見当たらない。

## 2. 適用する規則（原文のまま）

出典: `docs/empirical/probe-preregistration-2026-09.md`「Eligibility: what counts as an "eligible model"」（2026-09-07 記録）。

> A panel model is **eligible** for this contrast when all of the
> following hold, determined from the provider's published model
> documentation at the time the model enters the panel and recorded in
> the hub's model catalog:
>
> 1. Its stated training-data cutoff is **on or after 2026-06-01**. The
>    ecosystem's public window opened around 2026-04; a cutoff two months
>    later is the minimum for the co-occurrence to have been crawlable.
>    A model with no published cutoff is *not eligible* and is recorded
>    as such, not guessed at.
> 2. It is the provider's widely served default-tier model, per the
>    protocol's panel rule, so that it replaces a prior-generation model
>    of the same family already in the panel.
> 3. Its prior-generation counterpart in the same family has a recorded
>    parametric zero baseline (all panel families do as of 2026-07-12).
>
> Eligibility is decided per model, before its event run, and written to
> the run record. A model found eligible only after its run is excluded
> from this contrast and reported separately.

関連する追記（同ファイル Amendments）:
- 2026-10-01: panel は 4 family（anthropic / openai / gemini / xai）。qwen は撤回。eligibility は不変。
- 2026-10-12: Annex A.1 に読みの注意を追記。eligibility は不変。
- 窓の規則: 「No eligible model enters the panel by 2026-11-30: the window closes empty」。分析は 11-30 と最初の
  eligible model の event run の遅い方の後、公開は 2026-12-31 まで。

「default-tier」の運用定義は `probes-v10.yaml`（hub）にある: 「the model served BY DEFAULT to a FREE-tier user in the
provider's consumer chat product」。有料 tier や agent 面だけの swap は PARTIAL swap で WATCH、採用しない。
「catalog NEW MODEL events alone never move the pin」。

## 3. 候補表（as-of 2026-10-12）

「旧世代 baseline」列は `probes/data/parametric.jsonl`（250 行）の確認結果。parametric 記録があるモデルは
claude-sonnet-4-6 / claude-sonnet-5 / gpt-5.5 / gemini-3.5-flash / grok-4.3 / qwen3.7-plus / qwen3.8-flash のみ。
`gpt-5.6-luna`・`gemini-3.6-flash` の記録は 0 行（grep で確認）。

| candidate | family | cutoff（引用 + URL） | default-tier?（URL） | 旧世代の zero baseline? | 判定 | 決め手 |
|---|---|---|---|---|---|---|
| `claude-sonnet-5-5`（2026-09-28 公開） | anthropic | "Training data cutoff: Jun 2026"（[Models overview](https://platform.claude.com/docs/en/models/sonnet-5-5/overview)）。claude.ai の system prompt（同日付）も "is the end of Jun 2026"（[system prompt](https://platform.claude.com/docs/en/release-notes/system-prompts/claude-sonnet-5-5)） | Anthropic: "Anyone can chat with Claude using Sonnet 5.5 on Claude.ai"（[Sonnet page](https://www.anthropic.com/claude/sonnet)）。Free plan の表は Sonnet=Yes / Opus=No で版は書かない（[pricing](https://claude.com/pricing)）。**"default" と書く Anthropic ページは見つからず。** 第三者: Simon Willison 2026-09-28 "now the model used for the free tier on claude.ai"（[blog](https://simonwillison.net/2026/Sep/28/claude-sonnet-5-5/)、自分で試した記述）、PCWorld 2026-09-29（[記事](https://pcworld.com/article/3246614/claude-sonnet-5-5-is-here-this-prompt-stops-it-from-wasting-your-usage.html)） | **あり。** 置換対象は panel pin の `claude-sonnet-5`（cutoff Jan 2026、[docs](https://platform.claude.com/docs/en/models/sonnet-5/overview)）。2026-07-12 の run に有効 24 行（8 probe × 3、detector v4）、`project_named` / `author_named` / `ghost_citation` の true は 0 | **cannot tell**（最有力） | 条件 2 のみ未確認。claude.ai の Free での既定を人手で確認すれば決まる。条件 1・3 は満たす |
| `claude-opus-5-5`, `claude-fable-5-1` | anthropic | 両方 "Jun 2026"（[Models overview](https://platform.claude.com/docs/en/models/overview)） | premium tier。Opus は Free で "No"（[pricing](https://claude.com/pricing)）。Fable は $10/$50 の最上位（overview 表） | `claude-sonnet-5` の slot を置換しない（tier が変わる） | not eligible | 条件 2（パネル基準は premium を除く） |
| `claude-haiku-5-5`（2026-10-07 公開） | anthropic | "Jun 2026"（[Models overview](https://platform.claude.com/docs/en/models/overview)） | 既定かは書かれていない。Free plan は "Haiku" を含む（[pricing](https://claude.com/pricing)）が、Free の既定は Sonnet とする報告が上の通り。公開日: [release notes](https://support.claude.com/en/articles/12138966-release-notes) | 上に同じ（small tier への tier 変更になる） | not eligible（既定でない公算大） | 条件 2。Sonnet 5.5 の web check で Free 既定が Haiku と出たら再判定 |
| `gpt-6-luna` | openai | "May 18, 2026 knowledge cutoff"（[model page](https://developers.openai.com/api/docs/models/gpt-6-luna)） | ChatGPT の Free/Go 既定（2026-10-07 の release note、Free/Go は翌日開始）: "Free and Go use GPT-6 Luna"（[OpenAI Developer Community の転載](https://community.openai.com/t/gpt-6-is-now-rolling-out-to-all-chatgpt-users/1404163)。openai.com と help.openai.com は fetch が HTTP 403） | panel pin の `gpt-5.6-luna`（cutoff "Feb 16, 2026"、[model page](https://developers.openai.com/api/docs/models/gpt-5.6-luna)）に記録 0 行。family には gpt-5.5 の記録あり（2026-06-12〜07-12） | **not eligible** | 条件 1: 2026-06-01 に 14 日足りない |
| `gpt-6-sol` | openai | "Apr 20, 2026 knowledge cutoff"（[model page](https://developers.openai.com/api/docs/models/gpt-6-sol)）。同ページは `gpt-6.1-sol` を "the newer Sol model" と案内 | Plus 以上の Chat 既定（同 release note: "Paid tiers use GPT-6 Sol"）。Free/Go の既定ではない | 同上 | not eligible | 条件 1（と 2） |
| `gpt-6.1-sol` | openai | "Apr 30, 2026 knowledge cutoff"（[model page](https://developers.openai.com/api/docs/models/gpt-6.1-sol)） | Free/Go の既定ではない（既定は Luna）。ChatGPT での扱いは release note に記載なし | 同上 | not eligible | 条件 1（と 2） |
| `gpt-6-astra` | openai | "Apr 30, 2026 knowledge cutoff"（[model page](https://developers.openai.com/api/docs/models/gpt-6-astra)） | 最上位（"most capable model"、同ページ）。Free/Go の既定ではない | 同上 | not eligible | 条件 1（と 2） |
| `gemini-3.8-flash`（2026-09-02 公開） | gemini | "The knowledge cutoff date for Gemini 3.8 Flash is March 2026"（[DeepMind model card](https://deepmind.google/models/model-cards/gemini-3-8-flash/)。同 card は一部 domain で "January 2025" 止まりとも書く） | 公開時点で "available to Google AI Pro and Ultra subscribers" の Gemini app 提供（[launch post](https://blog.google/innovation-and-ai/models-and-research/gemini-models/3-8-flash-and-3-8-flash-cyber/)）。既定とは書かれていない。panel の `gemini-3.6-flash` は 2026-07-21 に全 Gemini app user へ提供（[release notes](https://gemini.google/release-notes/)） | panel pin の `gemini-3.6-flash` に記録 0 行。family には gemini-3.5-flash の記録あり | **not eligible** | 条件 1: March 2026 は 06-01 より前 |
| `grok-4.7`（2026-09-21 公開） | xai | "The knowledge cut-off date of Grok 4.7 is May 2026."（[docs.x.ai models](https://docs.x.ai/docs/models)） | 不明。公開 post は "available today in Cursor and Grok Build" と API 等を挙げ、grok.com / X app の記述なし（[x.ai/news](https://x.ai/news/grok-4-7)）。pricing page は 403 | panel pin の `grok-4.3` に記録あり（zero） | **not eligible** | 条件 1: May 2026 は 06-01 より前 |

月単位の記述（"May 2026"、"March 2026"）は月初でも月末でも 2026-06-01 より前。"Jun 2026" は月初でも月末でも 2026-06-01 以降。
どちらの読みでも判定は動かない。

## 4. Limits

**確認できなかったこと**
- Anthropic の一次資料に Sonnet 5.5 を「Free の既定」と書くものが無い。release note（support.claude.com）は plan に触れず、
  Sonnet page は "Anyone can chat…" まで。既定の断定は第三者 2 件のみ。→ 条件 2 は web check 待ち。
- Anthropic Transparency Hub（anthropic.com/transparency、全文を 2 回に分けて読んだ）には Sonnet 5.5 の項が無い。
  cutoff の根拠は platform docs の表と claude.ai system prompt の 2 件で、Transparency Hub による裏取りは無い。
- OpenAI の release note 本体（help.openai.com / openai.com）は fetch が 403。既定 tier は Developer Community の
  転載（2026-10-07 投稿）と検索結果の抜粋に依る。cutoff は developers.openai.com の model page から直接取れた。
  cutoff が eligibility を落とすので、既定 tier の弱さは OpenAI の判定を動かさない。
- xAI の consumer 既定は一次資料から分からず、`grok-4.3` pin 自体も 2026-09-01 以来 WATCH のまま。
- 2026-10-01 以降の新モデルは公式 doc の範囲で探した: Gemini API changelog（2026-10-08 に `gemini-3.7-flash` が
  `gemini-3.8-flash` へ置換、3.9 / 4 / 新 Pro の記載なし）、xAI release notes（grok-4.8 / grok-5 の記載なし）、
  OpenAI の model page（6.1 Sol が最新）、Anthropic（Haiku 5.5 が 2026-10-07）。aggregator の一覧は道案内にだけ使った。
- cutoff は provider の自己申告で月単位。事前登録の "Cutoff self-report" 節の通り、後の改訂は記録して flag するだけで、
  分類は変えない。Gemini の card が示すように、領域によって実効 cutoff が大きく前倒しになりうる。
- 条件 3 の読み: 「prior-generation counterpart」を「置換される panel pin」と読むと、openai（gpt-5.6-luna）と
  gemini（gemini-3.6-flash）は記録 0 行。「同 family の記録済み旧世代」と読むと gpt-5.5 / gemini-3.5-flash がある。
  今回は条件 1 で落ちるため判定に影響しないが、将来これらの family に eligible が出たときに効く。
  Anthropic は両読みで満たす。
- Anthropic の event run には有効な API key が要る（2026-10-01 の currency check は
  `401 Unauthorized` / "API key is invalid."）。key は試していない。
- Sonnet 5.5 の公開（2026-09-28）は 2026-10-01 の catalog check の前だが、同 check の anthropic 行は error で
  `catalog_new_ids` が空。検知の抜けではなく check 自体が走らなかった。`verified_current` は 2026-09-01 のまま、
  `staleness_days: 90` により STALE は 2026-11-30 に出る。

**食い違い**
- 「Sol / Luna は ChatGPT chat にまだ無い」とする初期の記述（launch post の抜粋）と、2026-10-07 の release note
  （Chat で GPT-6 を展開、Free/Go は Luna）。後者が新しい。
- Sonnet 5.5 の既定: Anthropic 一次資料は沈黙、第三者 2 件は「Free tier の model」。一次側に反証は無いが、一次の肯定も無い。

**Scope searched**（2026-10-12）
- Local: preregistration 全文、`probes-v10.yaml` 全文、`currency.jsonl`（2026-10-01 の 5 行）、`model-catalog.jsonl`（末尾）、
  `parametric.jsonl`（model 別の行、sonnet-5 行の detect 値）。
- Web: OpenAI（developers.openai.com の model page 6 件、help / openai.com は 403、Developer Community 1 件）、
  Google（ai.google.dev の models / changelog、DeepMind model card、blog.google の launch post、gemini.google release notes）、
  xAI（docs.x.ai の models / release notes、x.ai/news/grok-4-7）、Anthropic（platform docs の overview / sonnet-5-5 /
  sonnet-5 / system prompt、anthropic.com の announcement / Sonnet page / transparency、claude.com/pricing、
  support.claude.com release notes）、第三者（Simon Willison、PCWorld、Notebookcheck）。
