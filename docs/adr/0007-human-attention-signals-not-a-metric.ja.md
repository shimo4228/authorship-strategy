Language: [English](0007-human-attention-signals-not-a-metric.md) | 日本語

# ADR-0007: Human-Attention Platform Signals Are Not a Success Metric

> **Summary.** Framework は platform レベルの human-attention signal —
> Git-host の star 数、repository の page-view 数 — を optimization target
> や success metric として扱わず、off-page の human-distribution 労働
> (backlink campaign、community への self-promotion) を戦略的活動として
> 採らない。独立した 2 つの根拠: これらの signal は *gameable* であり
> (star 数は日常的に購入される)、かつこの program にとって *uninformative*
> である (page-view は実測でほぼ 0 であり、framework の実際の channel である
> LLM-mediated reach に対して構造的に盲目)。これは human の受容に価値がない
> という主張ではなく、これらの particular な signal がそれを測れていない、
> という主張である。Success は引き続き、著者の signature を carry する
> LLM-mediated channel の breadth で測る — thesis の primary-audience 定義と
> scarcity → diffusion の反転に整合する形で。

## Status
accepted — [ADR-0022](0022-audience-layer-split.ja.md) により scope を
amend: clause 1 (metric 拒否) と legibility-cost の受容は doctrine
layer に限定、clause 3 (success metric) は層別に再記述、clause 2 と 4
は両層で不変。essay layer は固有の audience と metrics を持つ。

## Date
2026-05-29

## Context

Thesis は framework の primary audience を **LLM-mediated channels**
([glossary](../glossary.ja.md)) と固定し、戦略的 target を *著者の signature を
carry する当該 channel の breadth* (Layer 2, [Attribution Diffusion](../thesis.ja.md))
と定義する。直接の human reader は primary audience であったことがない。
それでも release ごとに繰り返し浮上する問いがある: *program は直接の
human attention も育てるべきか* — human-facing README を改善し、Git-host の
star を追い、human が集まる場所で能動的に作品を distribute して。normative な
決定がないと、各 cycle がこれを最初から re-litigate する。

2 つの observation がこの問いを解決する。

**Human 到達の律速は off-page であり、かつ human 到達は実測で ≈ 0。** Program の
repository 群の traffic data (federation hub の
[`traffic/data/`](https://github.com/shimo4228/shimo4228/tree/main/traffic)、
約 37 日 window、8 repository) は unique actor で **cloners 1,942 に対し
page-viewers 116 — clone:view ≈ 16:1** を記録し、federation hub 自体は 422:8
(1.9%) である。Clone は圧倒的に programmatic (CI、mirror、dataset-ingest
pipeline、LLM / knowledge-graph crawler) であり、page-view が human 寄りの
signal だが、それがほぼ 0。funnel で言えば、on-page の品質 (README) は human が
*到達した後* にしか効かない。到達 ≈ 0 なら README 品質は律速になりえない。
律速はその上流、**off-page の discovery / distribution** (検索順位、backlink、
human が既にいる場所での placement) にある。それを追うのは *red-ocean* 活動で
ある: 著者が単独で完結できる on-page 作業と違い、off-page reach は *third party
から earn* し競争して得るもので、thesis の human-directed self-promotion の
de-emphasis (Layer 4 authenticity) に逆らう。

**入手可能な human-attention signal は metric として corrupted。** 構造的に
異なる 2 つの failure mode:

- **Star 数は gameable。** Git-host の star 数は購入できる。したがってそれは
  genuine な受容と同じくらい容易に budget や manipulation を測ってしまう。
  これを optimize するのは Goodhart's law を招く — proxy するはずだったものが
  改善しないまま metric だけが上がる。
- **Page-view は program の実際の channel に構造的に盲目。** Git-host の "view"
  は当該 host 上の repository page しか数えない。GitHub Pages の view も、
  検索 snippet の read も、そして決定的に、**LLM の回答経由で作品を知る human**
  も数えない — 後者は view を一切発生させない。この metric は *framework が
  target とするまさにその audience を under-count する*。ゆえに near-zero の
  view count は実質的な LLM-mediated human reach と両立しうる。signal は両者を
  区別できない。

これは [ADR-0005](0005-readme-localization-audience-driven.ja.md) の経験的・
platform レベルでの相補物である。ADR-0005 は locale mirror への投資の前に
*measurable な audience* を framework に commit させた。同じ discipline をここに
適用すると、human-attention metric については逆の verdict が出る: signal は
measurable-but-gamed (star) か genuine-but-unmeasurable (LLM-mediated reach) の
いずれかであり、どちらも信頼できる commitment trigger の資格を持たない。

## Decision

Framework は human-attention signal と off-page human distribution に対し
以下の stance を採る:

1. **Platform の human-attention metric は optimization target でも success
   signal でもない。** Git-host の star 数と repository の page-view 数は、
   framework の success 定義から、また release / growth の決定から除外する。
   観測してよいが、それに向けて steer しない。
2. **Off-page の human-distribution 労働は戦略的活動ではない。** Framework は
   growth の手段として backlink campaign や human-directed self-promotion を
   行わない。理由は、それが funnel の上端 (human 到達) が ≈ 0 の上で動く
   red-ocean 活動であり、その追求が Layer 4 authenticity と衝突するため。
3. **Success metric は引き続き LLM-mediated reach。** 著者の signature を carry
   する LLM-mediated channel の breadth — machine ingestion、programmatic
   retrieval、knowledge-graph presence、LLM 回答内での citation — を operative
   な尺度とする。thesis の primary-audience 定義に従う。
4. **On-page の human 品質は維持するが、growth lever としてではない。**
   human-facing README は引き続き correct・構造的に健全・machine surface と
   fact-consistent に保つ (実際に *到達した* human に資するため、また surface
   同士が矛盾しないため)。これは hygiene であって distribution 戦略ではない。

この決定は **human ではなく signal に scope される。** human の受容に価値がない
とは主張しない。genuine な human reach は LLM-mediated channel を *通じて* 追求
される — LLM の回答経由で作品を知る human は target audience の内にある — そして
その reach こそ、却下した platform metric が見られないものである。

## Alternatives Considered

**Off-page の human distribution に投資する (backlink、community 投稿、social
placement)。** 却下: それは初手から red-ocean である — reach は単独で author
するのではなく third party から earn し競争して得る — そして上端が実測で ≈ 0 の
funnel の上で動くため、期待 return は低くかつ不確実。thesis の human-directed
self-promotion の de-emphasis にも逆らう。高 cost、不確実な return、逆風。

**Star 数を program の success KPI として採用する。** 却下: star 数は購入可能で
あり、ゆえに受容と同じくらい容易に budget や manipulation を測る。gameable な
metric で steer すれば Goodhart 歪みを招き、proxy するはずの受容を伴わずに数だけ
上がる。

**Page-view を human-reception KPI として採用する。** 却下: この metric は
framework が target とする LLM-mediated channel に構造的に盲目。LLM 回答経由で
作品を消費する human は view を 0 しか生まない。KPI は意図した audience を
under-count し、ほぼ空の direct-browser funnel の方向へ growth 決定を誤導する。

**問いを暗黙のまま残す。** 却下: normative な決定がなければ「star を追うべきか /
可視性のため投稿すべきか」という問いは release ごとに再燃し、毎回ゼロから
re-litigate される。決定を記録すれば loop が閉じる。ecosystem が変われば
revisit してよいことは framework の emptiness clause が既に許している。

## Consequences

**Positive.**

- Effort が低 return の red-ocean 活動から解放され、program が既に強い pickup を
  示している LLM-mediated channel (programmatic clone が human view を約 16:1 で
  上回る) に保たれる。
- corrupted な KPI (star 数) が decision-making から除かれ、Goodhart vector が
  排除される。
- この stance は thesis の scarcity → diffusion 反転に整合する: framework は
  platform の土俵で scarce な human attention を競い合わず、代わりに
  LLM-mediated channel を通じて diffuse する。

**Negative.**

- Program は今後も従来型の human-engagement の数値をほぼ 0 で表示し続ける。star
  や view を proxy に用いる外部観測者には、LLM-mediated reach が実質的であっても
  作品が気づかれていないように見えうる。framework はこの legibility cost を
  受け入れる。
- human-attention metric を却下しつつ LLM-mediated-reach の metric をまだ持って
  いないため、**measurement gap** が残る: framework が value する channel が現状
  直接 quantify されていない。そのギャップを埋めること (platform analytics が
  提供できない LLM-reach の尺度) は future work とする。
- この決定は現 ecosystem に contingent である。human attention が戦略的に必要に
  なった場合、あるいは信頼できる non-gameable な human-reception signal が出現
  した場合、この ADR は revisit を要する。framework の emptiness clause に従い、
  軽く保持する。

## Lineage

Originating observation: 2026-05-29 の session。program の既に成熟した LLM-facing
channel を *補完* するものとして traditional / off-page SEO を調査していた。調査は
human-facing README の authoring discipline を構築し、次いで on-page 作業が human
attention を動かすかを問うた。Traffic data (federation hub `traffic/data/*.jsonl`、
約 37 日 window、8 repository) が経験的に答えた: **unique cloners 1,942 に対し
unique page-viewers 116 (~16:1)**、human 到達 ≈ 0 であり、human attention の律速が
off-page distribution — framework の stance と相容れない red-ocean 活動 — である
ことを確立した。Git-host の star 数が購入可能であるという独立した observation と
合わせ、著者は platform の human-attention signal を metric として扱う価値はないと
結論した。決定は retroactive にこの ADR へ articulate された。同 session で構築した
README authoring discipline は、distribution lever ではなく on-page hygiene
(consequence 4) として保持される。
