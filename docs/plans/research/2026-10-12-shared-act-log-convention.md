kind: internal
# 行為ログを公開の 1 本に、実施元つきで書く規約（2026-10-12 著者決定）への書き換え箇所の棚卸し

as-of 2026-10-12。非公開 repo の中身は引用しない。所在は `<repo>:<path>:<line>` と種類だけ。パスは `~/`。

## 再現

現状の観測（行為ログ・介入記録の所在、書き手、AS log の形）。

### 1. 行為ログ・介入記録の所在

| # | 記録 | repo / path | 公開 | 形式 | 規模 | 書き手 | 今の書き方の規則 |
|---|---|---|---|---|---|---|---|
| A | AS implementation log | authorship-strategy:docs/empirical/implementation-log.md | 公開 | 節ごとの表 10 枚、3 列（Intervention / Date / Recorded in）。実施元の列なし | 257 行、表の行 45 | AS session（maintenance.md:39「1 つの commit で state と log の日付行」） | maintenance.md:36 英語・効果を主張しない・host や私的運用を ADR-0012 の水準に抽象化。log 内 :86-87 と :231-245 に同旨 |
| F | AS rfcs/ ストア | authorship-strategy:rfcs/ | 公開 | 1 エントリ 1 ファイル、frontmatter `state:` | rfcs/README.md 43 行 + エントリ | AS session | maintenance.md:31-34, 37-38。ADR-0025 Decision 1-4 |
| G | zenn-content 公開予定 | zenn-content:scripts/schedule.json | 公開 | JSON。記事ごとに file / canonical_url / date / devto URL | 1058 行 | 記事 session。Dev.to cross-post job が読む（zenn-content:CLAUDE.md:13,72-73） | 生産記録（何をいつ公開するかの機械入力）。行為の事後記録ではない |
| H | zenn-content 計測 | zenn-content:scripts/metrics/snapshots.jsonl | 公開 | JSONL（ts / source / slug / 数値） | 644 行 | scheduled task `weekly-article-metrics-collect`（commit する、push しない。SKILL.md:15） | 計測値の記録。行為ログではない（zenn-content:CLAUDE.md:54-60） |

注:
- G は「公開行為の予定と URL」を持つので、行為ログの一次資料として使える。ただし生成物であり、行為ログの 1 行 1 行為の形とは別物。重複して書くかの判断材料: G は date と URL を持つが、Zenn / Dev.to 以外の行為は持たない。
- 手がかりの語で Grep した範囲（`*/docs`, `*/.notes`, 各 CLAUDE.md、~/.claude の skills / rules / scheduled-tasks / docs/adr）では、A-H のほかに「1 行 1 行為」型の行為ログは見つからなかった。`.notes/wiki-harvest/ledger.md`（attention-not-self, agent-attribution-practice, agent-knowledge-cycle, contemplative-agent）と `attention-not-self/.notes/daily-research/ledger.md` は題名に ledger を含むが、収穫・調査の台帳で、題名と配置だけの判断（中身は読んでいない）。
- daily-research は記録ファイルへの書き込み規則を持たない。daily-research/CLAUDE.md:232 は「repo は read-only 参照のみ。deploy・台帳更新はしない」。

### 2. 書き手の自動化（~/.claude/scheduled-tasks/*/SKILL.md、全 7 本。うち 1 本は非公開 repo の task なので名前を伏せた）

| task | 記録ファイルへの書き込み | commit / push |
|---|---|---|
| listing-pr-daily | PB queue（状態・結果・実行ログ）、PB scorecard 行為ログ（SKILL.md:34-36,53）。外部には PR / issue（1 回最大 3 件）、自分の repo の topics 変更（G1、行為ログには書かない :35） | PB repo は commit しない（:54）。harness 側の最新 commit は 879cc67「write PB acts only to the PB act log」（~/.claude の reflog 末尾） |
| listing-explore-rotation | PB inbox（候補追記・探索ログ）。外部書き込みなし（:6） | PB repo は commit しない（:64） |
| akc-plugin-catalog-watch | なし。read-only（:23-25）。出現時の提案として AS `rfcs/0010-plugin-directory-usage-baseline.md` の Status に確認日を記録すると述べる（:20）が、書き込みは提案に留める | なし |
| plugin-directory-status | なし。read-only、報告のみ（:8-9, 19-23） | なし |
| weekly-article-metrics-collect | zenn-content:scripts/metrics/snapshots.jsonl に追記（:14） | commit する、push しない（:15） |
| （非公開 repo の定期 task 1 本） | 自 repo の実行ログ（行為ログではない） | 未確認 |
| jrp-opus-first-morning-check | なし。one-time read-only（:3, 8-17） | なし |

- akc-plugin-catalog-watch.md:9 は「Console フォーム経由で提出」という非公開の経路の行為を背景に持つ。AS log に対応する行は見当たらない（AS log の行 163-164 は preprint 提出で別件）。
- listing-pr-daily が書く行為ログの行は `| 日付 | PR | URL | 経路 | ID repo → 掲載先 |` の形（SKILL.md:36）。実施元の列は無く、メモ列に task の内部 ID が入る。

### 3. AS implementation log の現状（節ごと）

行番号は implementation-log.md。表の行数は 1 行 1 intervention。

| 節 | 表の行 | 行数 | 一般語で伏せた行（host・相手を一般語にしている行） |
|---|---|---|---|
| Identifier federation | 42-50 | 9 | 49（on-demand public web archive）。ORCID / Software Heritage / Zenodo 系は名指し（45, 46, 48） |
| AI-facing ingest | 56-62 | 7 | 0（llms.txt / graph.jsonld など成果物名で書く） |
| Citation graph and scholarly surface | 68-77 | 10 | 71（scholarly preprint server）、72（bibliographic-graph service）、73（author-curated archive community）、74（academic citation graph, model hub, professional network 等を列挙）。68-70, 75, 76 は Wikidata を名指し |
| External collections | 83-84 | 2 | 83, 84（community-curated directories）。:86-87「specific hosts は ADR-0012 の水準、this log does not re-expose them」 |
| Measurement | 93 | 1 | 0 |
| Human-reader back-traceability | 108-113 | 6 | 110（developer-publishing and newsletter platforms）、112（source-hosting metadata surface）、113（video channel を含まないが profile を一般語） |
| Search-index surface | 127-131 | 5 | 128, 129（major search console, cross-engine URL-notification protocol）、130（developer-publishing platform）、131（source-hosting metadata） |
| Third-party AI-derived repository surfaces | 148-149 | 2 | 148, 149（synthetic wiki / documentation hub） |
| AI-native preprint platforms | 163-164 | 2 | 163, 164（university-affiliated venue / AI-scientist-community venue） |
| Practitioner case sharing | 170 | 1 | 170（AI-attribution initiative's call） |

- 一般語で伏せた行の合計は、上の行番号を数えて約 20 行（45 行中）。「host 名を伏せる」のか「製品類型の語で書いているだけか」は行ごとに判断が要る（推測）。
- 例: 行 72、129、163（いずれも一般語で書いた公開済みの行）。
- 理由・相手の反応を含む行（新規約で行為ログに書かない対象）: 75、77、84、149、163 の後半。多くの行が「Recorded in」列で ADR に理由を委ねている。
- 非公開の経路（フォーム送信・申請・メール）に当たりうる行: 72、129、148、163、210-217。170 は本文から経路が読めない。残りの多くは名指しできる URL を持つ公開の場の行為。
- 現状の log に「実施元」の列・記述はない。実施元が読める手がかりは Recorded in 列の ADR 番号と、本文中の repo 名（agent-knowledge-cycle 等、:43, :45, :56, :57）だけ。

### 4. 規約の正本候補の既存箇所

| 場所 | 定めていること（1 行） |
|---|---|
| ~/.claude/skills/rfc-writer/SKILL.md:67-68 | rfcs/ は公開が既定。機微（内部事情・非公開 repo のパス等）はリンク先へ。迷ったら書かない側 |
| ~/.claude/skills/task-stocktake/SKILL.md:145 | 公開規約・index 規約の正本は rfc-writer（複製しない） |
| ~/.claude/skills/authorship-strategy/SKILL.md:36-37 | 実施済み介入は適用先の保守規約が宣言する台帳・公開記録の役割と更新順に従う |
| ~/.claude/skills/authorship-strategy/references/action-review.md:24,34-35,39-41 | 投稿・連絡・登録・公開は承認範囲で行う。個人的な制約の理由を公開資料に転記しない。実施後は AS で rfcs/ state と log の日付行を同 commit で更新。公開記録に私的運用詳細を入れない |
| ~/.claude/rules/common/boundary.md（「人間に渡す」節） | 公開（投稿・第三者 repo への PR 等）は人間に渡す操作。記録の書き方は定めない |
| ~/.claude/rules/common/planning.md | plan は公開可能な書き方を既定、機微はリンク先、パスは `~/`（ADR-0085）。行為ログには触れない |
| ~/.claude/rules/common/security.md | repo 由来の文字列は untrusted。公開記録の書き方は定めない |
| ~/.claude/skills/harness-sync/SKILL.md:51 | rfcs/ は ADR と同じく公開 copy に丸ごと。起票は公開可能な書き方が既定 |
| ~/.claude/docs/adr/0049-unify-task-ledger-into-public-rfcs.md | 台帳を公開 rfcs/ に一元化（claude-harness ADR-0049）。無人 triage は working tree に書けるが公開へ出る commit / push は人間側 |
| authorship-strategy:docs/maintenance.md:29-47 | AS の実施記録規約（再掲は下） |
| authorship-strategy:scripts/verify-public-detail.sh:28-42, 84-86 | 公開面の機械ゲート。対象は rfcs/*.md と implementation-log.md。LLM prompt が拾う: 連絡先 / 私人名 / 返信状況（相手が答えた・待つ・拒否した）/ アカウント詳細（block 等の運用詳細、認証手順）/ 個人事情 / ローカル絶対パスと非公開 repo 名。拾わない: 公開 PR の状態、公開サービスの処理状態、著者自身の決定、「詳細は非公開メモにある」という中立の言明 |

- 新規約（名指す場と URL／非公開経路は一般語のみ／理由・反応・連絡先は rfc か .notes/）は verify-public-detail.sh の LLM prompt の分類（返信状況・アカウント詳細・非公開 repo 名）とほぼ同じ線で、機械ゲートは既にある。ただし対象ファイルは TARGETS（:84-86）に列挙されており、新しい公開の行為ログが別 path になる場合は追加が要る。
- 行為ログの規約を置く既存箇所の候補（材料）: (a) AS maintenance.md「実施を記録するとき」（AS の規約の正本、PB 規約と別 repo）、(b) 全 project 共通なら harness の skill（rfc-writer §公開規約は rfcs/ 専用、authorship-strategy skill の action-review は AS 適用先に限る）か rule（常駐の環境固有事実。rules/README.md の採用基準は「環境固有の事実・配線・罠」）。rule に置く場合は `rationale` / `review-when` が要る（rules/README.md）。

### 5. 各 repo の記録規約（行為や実施の記録先・書き方）

| repo | 箇所 | 内容 |
|---|---|---|
| authorship-strategy | docs/maintenance.md:29-47 | :31-34 計画とタスクは rfcs/。:35-36 実施済み介入は implementation log、日付付き介入だけを英語、効果を主張しない、host や私的運用情報は ADR-0012 水準に抽象化。:37-38 機微は `.notes/`、ファイル名にも書かない。:39 介入を実施したら 1 commit で state・Status・log 行。:40-41 push 前に verify-public-detail.sh --llm。:42-43 2026-10-12 までの履歴は `.notes/archive/diffusion-ledger-2026-06-to-10.md`（非公開）、「PB の行為で記録へ至るものは PB の行為ログ（経路の列）が正本で、ここには写さない」 |
| authorship-strategy | docs/empirical/implementation-log.md:3-6, 86-87, 231-245 | 冒頭（dates are interventions）、External collections 節の「does not re-expose」、How this log is maintained（working detail を除外、planning は rfcs/、ADR-0025） |
| authorship-strategy | docs/adr/0012-link-index-channel-selection.md:178-184 | 具体名を本文から抽象化した記録（large skill-component registry、eight community-curated link directories）。「抽象化の水準」の出所 |
| authorship-strategy | docs/adr/0014-implementation-tracking-two-tier-ledger.md:33-40,52-67,129-136 | 二層（private ledger + public projection）の原典。:24-25, 60-63, 135-136 が ADR-0025 による注記。Decision 3-4 は有効 |
| authorship-strategy | docs/adr/0023-empirical-layer-role.md:65-67, 87, 317-318 | log を intervention-record genre として empirical 層に置く。:87 に「もはや private ledger の projection ではない」の注記 |
| authorship-strategy | docs/adr/0024-success-as-arrival-at-the-dated-record.md:135-170 | Decision 4 は evidence-tier を private ledger に記録と書く（:145-150、:163-170 に ADR-0025 注記）。Decision 5 は「両戦略に効く行為は両方の ledger に記録」（:151-161）、注記は「PB の行為は PB の act log を読み、写さない」（:168-170） |
| authorship-strategy | docs/adr/0025-planning-and-task-state-in-a-public-rfc-store.md:93-116, 173-177 | Decision 2（log は別文書で planning を書かない）、Decision 3（機微は非公開で link、filename にも書かない、公開前に verify-public-detail.sh と著者が diff を読む）、Decision 4（1 commit）、Decision 5（旧 ledger は非公開 archive）。:173-177 Consequences に「ledger を名指した文書・scheduled task・sibling program の ledger が変わる」 |
| authorship-strategy | CLAUDE.md / AGENTS.md | 行為ログ・実施記録の規則は無い（「保守規約の該当節を参照」のみ）。2 本は同内容に保つ規約 |
| zenn-content | CLAUDE.md:13, 54-60, 72-73 | schedule.json と metrics の用途（上 G, H） |
| hub repo | CLAUDE.md | 行為ログの規則は無い（traffic 計測・dataset mirror の記述のみ） |

### 6. 他 repo の「公開の投影」構造（AS の旧 two-tier と同型か）

- AS の旧型（private ledger + public projection）と同型の「行為の私的原簿 + 公開の投影」は、AS 以外に見つからなかった。AS 自身もすでに ADR-0025（2026-10-12）で撤去済み（ADR-0014 の Decision 1 と台帳が真の原典である点を supersede。Decision 3-4 は有効）。
- 類縁（行為ログではない）:
  - claude-harness ADR-0049（~/.claude/docs/adr/0049-unify-task-ledger-into-public-rfcs.md）: 台帳を公開 rfcs/ に一元化。AS ADR-0025 の原型。
  - contemplative-agent ADR-0094 / 0095（contemplative-agent:docs/adr/0095-retire-task-ledger-machinery.md）: task ledger の機構を退役。
  - contemplative-agent の episode log: 生ログは非公開（非公開の DR mirror がある）、公開 dataset（contemplative-agent-data）には載せない（DATACARD.md:89,104）。エージェントの行為の「原簿と公開の濃縮」だが、著者の行為ログとは別。
  - PB の行為ログは AS の公開 log に読まれる側（写しなし）。今回の規約で PB の行為を公開の 1 本へ移すと、この読み取り関係が消える。

### 7. 同種の語の他の所在（件数）

`implementation-log|行為ログ|scorecard|listing-queue|recognition…` の Grep（`~/MyAI_Lab` 直下 2-3 階層の .md、47 ファイル、191 件）。AS は docs 内で約 18 ファイル、PB は約 14 ファイル（research 配下の計画・調査報告を含む）。plans/research の履歴文書は書き換え対象から外す前提（推測）。

## 原因

書き換えが要る箇所（file:line と、その行が今の規約を定めている根拠）。「今の規約」= (i) 行為ログは 2 本（AS 公開 log と PB 非公開行為ログ）に分かれる、(ii) AS は PB の行為を写さず PB の経路列を読む、(iii) AS log は host・私的運用を一般語に抽象化する、(iv) 実施元の列は無い。

### AS（authorship-strategy、公開）

| file:line | 現状の定め | 新規約との差 |
|---|---|---|
| docs/maintenance.md:35-36 | 日付付き介入だけを英語で、host や私的運用情報は ADR-0012 水準に抽象化 | 「公開の場の行為は場所と URL を名指す」「非公開の経路は行為があった事実だけを一般語で」へ書き換え。ADR-0012 水準の抽象化は host 名を伏せる規則で、名指しと逆 |
| docs/maintenance.md:37-38 | 機微は `.notes/`、ファイル名にも書かない | 新規約の「理由・反応・連絡先は行為ログに書かない（行き先は rfc か .notes/）」と同方向。整合の確認で足りる（推測） |
| docs/maintenance.md:39 | 実施したら 1 commit で state と log 行 | 実施元（どの戦略・どの repo の session か）を足す。PB の session から書く場合の commit 先は未定 |
| docs/maintenance.md:42-43 | 履歴は `.notes/archive/diffusion-ledger-2026-06-to-10.md`、PB の行為は PB の行為ログが正本でここには写さない | :43 の後半が「PB の行為も AS の公開 log に書く」へ反転する |
| docs/empirical/implementation-log.md:3-6 | 冒頭の説明（which of the framework's tactics were deployed on the author's own ecosystem） | 公開の 1 本が「著者の全戦略の行為」になるなら冒頭の範囲が変わる |
| docs/empirical/implementation-log.md:38-170 | 表 3 列。実施元なし | 実施元列の追加（表 10 枚が全部対象）。既存 45 行の遡及方針（空欄か、不明と書くか）は決定事項 |
| docs/empirical/implementation-log.md:86-87 | 「specific hosts … held at the abstraction level ADR-0012 sets; this log does not re-expose them」 | 公開の場の行為は名指しになるので文意が逆転。External collections 節の 83-84 行を名指し化するかも判断（掲載 PR は公開の場の行為） |
| 同 :42-170 の一般語行（約 20 行、上 §3 の行番号） | 製品類型の語（"a major search console" 等） | 公開の場の行為は場所と URL に書き換え。非公開の経路（72, 129, 148, 163 の一部、:214-217）は一般語のまま、事実だけ |
| 同 :75, 77, 84, 149 | 理由・platform の反応を含む | 新規約で「理由・相手の反応」は書かない。行を事実（いつ何をしたか）に絞る対象。これらは既に公開済みで、書き換えは公開済み文面の変更 |
| 同 :95-104, 115-123, 134-144, 152-159 | 節頭の散文（目的・枠付け） | 理由の散文を含む。新規約の「理由は rfc か .notes/」との関係を決める要（散文は節の目的で行為の理由か不明） |
| 同 :198-217「Not yet done」/ :219-229「Explicitly out of scope」 | 未実施・見送りの記録 | 行為ログは「行った行為」のみ。見送りと pending の置き場の決定（rfcs/ か log に残すか） |
| 同 :231-245 How this log is maintained | 運用規則（working detail 除外、ADR-0025） | 新規約と二重定義になる。書き換えまたは maintenance.md への参照化 |
| docs/adr/0024-success-as-arrival-at-the-dated-record.md:151-170 | Decision 5 と注記（PB の行為は PB の act log を読み、写さない） | 反転箇所。supersede か注記かは ADR の扱い（akc-cycle.md の ADR 扱い）で lead が決める |
| docs/adr/0025-planning-and-task-state-in-a-public-rfc-store.md:93-96, 97-104 | log は別文書。機微は非公開で link。verify-public-detail.sh | 実施元つき・名指し規約と整合の確認。Decision 2 の「planning は log に書かない」は新規約の「理由は rfc」と同方向 |
| docs/adr/0014-implementation-tracking-two-tier-ledger.md:33-40, 129-136 | 二層（歴史記録）。:130 に log の説明 | 歴史記録。:24-25, 60-63, 135-136 に注記済み。新規約では追加注記が要るか判断 |
| docs/adr/0023-empirical-layer-role.md:65-67, 87 | intervention-record genre の定義 | 公開 log の範囲が変わるなら :65-67 の記述確認 |
| docs/adr/0012-link-index-channel-selection.md:178-184 | 抽象化の出所 | 歴史記録（Alternatives / Lineage 相当）。書き換え対象ではなく、新規約が ADR-0012 の抽象化水準を行為ログには適用しないことの根拠として参照される |
| scripts/verify-public-detail.sh:84-86 | TARGETS = rfcs/*.md と implementation-log.md | 公開行為ログの path が変われば追加。LLM prompt（:28-42）は新規約とほぼ同じ線 |
| 他の参照: docs/adoption.md:155, docs/empirical/README.md:130,133, docs/empirical/tactic-lifecycle.md:13,97,109,111, rfcs/README.md:7, rfcs/0002-search-index-admission.md:25, llms.txt:26,57,97, llms-full.txt:548,722,827, graph.jsonld:350,869,1365, docs/adr/README.md:334 | log を指す・説明する箇所 | log の名前と位置が変わらなければ書き換え不要。説明文（「intervention timeline」「methods companion」）が範囲変更で食い違うなら要確認。*.ja.md の対（ADR 日本語版）にも同じ行がある |

### PB 側

PB 側の書き換え箇所は scorecard の行為ログ節、strategy の記録の節、境界の ADR とその注記、行為の数の ADR、行為ログに書く運用の RFC 3 本、listing の queue と inbox の計 8 系統。所在は PB 側の文書なので `.notes/act-log-pb-sites-2026-10-12.md` に置いた。

### harness（~/.claude、非公開。公開 copy は claude-harness）

| file:line | 現状 | 新規約との差 |
|---|---|---|
| scheduled-tasks/listing-pr-daily/SKILL.md:12, 35-36, 54 | PB 行為ログに 1 行足す。PB repo は commit しない | 書き先を公開の 1 本にする場合、AS repo は公開なので commit / push の扱い（boundary.md「公開は人間に渡す」）の再整理が要る。行の形（:36）に実施元を足す |
| scheduled-tasks/listing-pr-daily/SKILL.md:53 | queue の実行ログに追記 | queue は非公開のまま残るなら変更なし |
| scheduled-tasks/listing-explore-rotation/SKILL.md | 外部に書かず inbox のみ | 行為ログに書かないので変更不要（外部行為がないため） |
| scheduled-tasks/akc-plugin-catalog-watch/SKILL.md:9, 20 | 背景に非公開経路の行為（Console 経由の提出）、提案として AS rfcs/0010 の Status に確認日 | 行為ログには書かない task。非公開経路の行為をログに「事実だけ」書く対象の例 |
| skills/authorship-strategy/references/action-review.md:37-41 と SKILL.md:36-37 | 適用先の保守規約が決める台帳・公開記録に従う | 一般化した文言のため、各 repo の保守規約が変わるなら変更不要。「公開記録には私的運用詳細を入れず」(:41) は新規約と同方向 |
| skills/rfc-writer/SKILL.md:67-68, skills/task-stocktake/SKILL.md:145 | rfcs/ の公開規約 | 行為ログの規約をここに置くなら追記先の候補（rfc-writer は rfcs/ 専用の題） |
| rules/common/*.md | 行為ログ・公開記録の書き方の規定なし（boundary.md の公開操作の列挙のみ） | 新設するなら rules/README.md の採用基準・`rationale` / `review-when` が要る |
| 公開 copy claude-harness | skill / rule / task の公開 copy | 変更後は harness-sync（~/.claude/skills/harness-sync/SKILL.md）で同期 |

## 角度 7 非公開 repo の棚卸し

非公開 repo の名前と目的を含むので、公開の report には載せず `.notes/private-repo-inventory-2026-10-12.md`（非公開）に置いた。

## 確認

読んだ範囲:
- 全文 Read: authorship-strategy:docs/empirical/implementation-log.md（257 行）、docs/maintenance.md、docs/adr/0025（:86-117）、0024（:100-180）、0012（:170-185）、CLAUDE.md、~/.claude/scheduled-tasks の listing-pr-daily / listing-explore-rotation / akc-plugin-catalog-watch / plugin-directory-status、authorship-strategy:scripts/verify-public-detail.sh（:1-100）。
- 部分的に Read / Grep: PB の文書（該当行のみ）、AS の ADR-0014、harness の rfc-writer / task-stocktake / authorship-strategy skill / action-review、zenn-content の CLAUDE.md・schedule.json（先頭 12 行）・snapshots.jsonl（先頭 2 行）、各 repo の CLAUDE.md / README の先頭数行、各 repo の `.git/logs/HEAD` 末尾行と `.git/config`。
- 数え方: AS log の表の行数は implementation-log.md の行番号から数えた（10 表、45 行）。一般語で伏せた行は §3 に行番号を列挙して数えた（約 20、行ごとの判定は主観を含む）。PB 行為ログ・Recognition ログのデータ行は 0（表の見出し行の直後に空行）。ファイルの行数は Grep の `.` count（空行を除く可能性があり、±数行）。
- 読んでいない: PB の listing-queue / inbox の中身（行数だけ）、AS の `.notes/` 配下（非公開メモ）、daily-research の記録ファイル、各 `.notes/wiki-harvest/ledger.md` の中身、zenn-content の `.notes/note-publishing/`。
- 実行できなかった: Bash が無く `gh repo list` と `git log` が使えない。最終 commit 日は reflog の epoch からの手計算。

## Still unknown

- AS log の行 170（Practitioner case sharing）の行為が公開の場か非公開の経路か。行 73（archive community への包含）が申請を伴ったか。
- `~/MyAI_Lab` 直下の約 55 repo（今回未確認）のリモートと、行為ログに相当する記録の有無。`_archive` は対象外にした。
- PB の行為ログに今後書く行為の経路（フォーム・申請・メールに当たる行為が PB でどれだけ起きるか）。現状データ行 0 で、実測できない。
- 新規約の下で、listing-pr-daily が AS repo（公開）に書き込む場合の commit / push の担当（boundary.md は公開を人間に渡す操作に含める。PB は commit しない設計）。
- 既存の公開済み文面（行 75, 77, 84, 149 など理由・反応を含む行）を新規約に合わせて書き換えるか、遡及しないか（PB の ADR-0007:64 は「済んだ行為は遡って載せない」とした前例がある）。
- 一般語行を名指しに書き換える場合の、dead URL になった行（Wikidata 系、行 68-70, 75-76）の扱い。
