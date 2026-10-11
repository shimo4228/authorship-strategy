kind: internal
# authorship-strategy のタスク管理を公開 `rfcs/` store へ統合するための内部棚卸し（as-of 2026-10-12）

方針: 事実・件数・`file:line` だけを書く。どれを rfc にするかは lead が決める。機微の中身（連絡先・人名・相手の返信状況・アカウント詳細・メールアドレス）は写さず、所在と種類だけ書く。パスは `~/` で表す。`<memory>` は `~/.claude/projects/` 配下のこの repo の project memory dir。

略称: **L** = `<memory>/diffusion-channel-status.md`（843 行）/ **T** = `.notes/TASKS.md`（87 行）/ **H** = `.notes/handoff-2026-10-11-session-remainders.md`（40 行）/ **W** = `.notes/wiki-harvest/ledger.md`（274 行）/ **X** = `.notes/exploration-2026-10-11.md`。

## 再現（現状の観測）

### 1. memory ledger L（`<memory>/diffusion-channel-status.md`）

**構造**: frontmatter（L1–9）+ 日付降順の節（L17–60、最新が上でない節順は混在）+ 時系列の旧節（L62–842）。L3 の `description` は 1 行で 🛑 Wikidata 事象と 3 つの 🔄 方針転換を要約している。

**この ledger 自身の読み方宣言**: L34「本台帳は deploy の記録と dedup のためだけに読む。『次の一手』生成の起点にしない。Candidate 節・八巡目残り 12 件・WATCH 群は deployment queue の歴史記録であり、問い空間を縛らない。DROP ガードは re-deploy 禁止の意味のみ」（2026-08-04 著者指示）。T L28 は同じ候補群を「未採択の提案」と呼ぶ。

**ID の衝突**: `C19` が 2 つの別物に使われている（L283 = Google Code Wiki、L707 = 縦軸 position paper 化。後者は T の D31 で rejected）。`C20`（L707）は D31 に同梱。`C21`〜`C24` は L722–740。

見出しごとの行範囲と分類（H = 閉じた履歴 / O = 開いている項目を含む / D = DROP・再提案しない / M = 運用則・メタ）:

| 行範囲 | 見出し | 分類 |
|---|---|---|
| 1–15 | frontmatter・前文 | M |
| 17–19 | 🔄 2026-08-19 task-stocktake + triage | H（T の D22–D43 への要約） |
| 21–28 | 🔄 2026-08-05 二層台帳化 ADR-0022 deploy | H + M（ADR-0022 は ADR-0024 が supersede、L835） |
| 30–34 | 🔄 2026-08-04 gap-review 退役 → inquiry-first | M（L34 が台帳の読み方を規定） |
| 36–40 | 🔄 十巡目〜十一巡目 | O（③④⑤）+ D（②） |
| 42–52 | 🛑 2026-07-16 Wikidata 層の全損 | H + D（L51 再提案しない）+ 公開リスク最多 |
| 54–60 | 2026-07-19 judgment gate を two-channel 化 | M + O（L59 ADR は defer） |
| 62–89 | ✅ Done — identifier / AI-facing / citation / external / measurement | H |
| 91–94 | ⏳ Partial / pending | O だが実質 stale（Wikidata 層は死亡、OpenAlex は T11） |
| 96–101 | ⬜ Not-started（4 件） | O（stale） |
| 103–137 | Implemented 06-13 / Done 06-15 / 06-17 | H（L113 に 06-13 時点の「著者判断待ち」3 件が残存） |
| 139–178 | human-reader M1/M2、M10–M13 | H（L156–167 に残候補） |
| 180–190 | 📋 四巡目（RSL / C2PA / OpenAttribution） | D + O（OpenAttribution は T3） |
| 192–220 | 📋 五巡目（agent-native channel） | O + D |
| 222–234 | 📋 六巡目 content-placement | H + M（L230–234 に運用則） |
| 236–277 | C15 / doctrine-hardening / v0.8.0 | H |
| 279–314 | 🔍 Candidate interventions（C1–C18） | O + D（下記） |
| 316–323 | Out-of-scope / フェーズシフト認識 | D / M |
| 325–335 | 公開: v0.6.0 | H |
| 337–364 | DeepWiki | H（L363–364 に follow-up） |
| 366–384 | GitMCP（RETIRED 2026-08-19）+ Context7 DROP | H + D |
| 386–395 | ADR-0020 | H |
| 397–437 | 七巡目 Code Wiki → COURSE-CORRECTION | H + O（L437 = T1）+ D（L406–410） |
| 439–528 | 📋 八巡目 20 候補 | O→全件決着（L528）+ D（L454） |
| 530–587 | 九巡目 deploy + follow-up | H |
| 589–612 | SEO 徹底実施 | H（L605–610 に発見事項） |
| 614–668 | AI-native 出版プラットフォーム参入 | H（レビュー診断は D25 で withdrawn） |
| 670–684 | 📋 GitMCP 実測監査 | H |
| 686–693 | 🔍 WATCH ARD / ai-catalog.json | O |
| 695–709 | value-layer harness engineering | H + D（L709 用語単独 DOI は不採用） |
| 711–730 | 📋 十巡目 | H（C21, C22）+ O（C23）+ D（L730） |
| 732–740 | C14 派生 marketplace / C24 申請 | H + O |
| 742–770 | 📋 07-19 venue triage | D（4 件とも決着） |
| 772–800 | 📋 08-12 著者トリアージ | D + O（WATCH 2 件） |
| 802–816 | 📋 08-25 標準規格横断評価 | H + D + O（WATCH / DEFER） |
| 818–823 | 2026-09-05 外部 initiative への事例提供 | O + 機微 |
| 825–831 | 2026-10-01 SEO/GEO 全 surface 監査 | O |
| 833–838 | 2026-10-11 ADR-0024 + 探索 | O |
| 840–842 | PB 由来の経路 | M（空の追記先。行は 0 件） |

**開いている項目**（1 件ずつ。「状態語相当」は task-stocktake の 9 語に当てた場合の読み。ledger 自身は状態語を持たない）:

| # | 項目 | 行 | 状態語相当 | T との重複 |
|---|---|---|---|---|
| O1 | Code Wiki 生成待ち → 生成された repo にだけ badge 再追加（Tier 1 全 10 本 request 済み） | 427–437, 283, 718 | blocked | T1 と同一 |
| O2 | OpenAttribution（SPUR Content Telemetry）。v1.0 final で再開条件成立 | 186, 297, 717, 837 | accepted（採否待ち、実質 draft） | T3 と同一 |
| O3 | M9 researchmap 掲載 / M5 OpenAlex 名寄せ | 91–94, 160–161, 178, 295 | blocked | T11 と同一 |
| O4 | 旧 #3 derivative 計器（derivative 出現待ち）/ 旧 #5 arXiv（被引用痕跡待ち） | 99, 295 | blocked 相当 | T になし |
| O5 | C12 SWE-bench-Live 第二 channel（条件「EinsteinArena が baseline を出す」。L299 で EinsteinArena は RESOLVED のため条件の成否は未記録） | 204, 300 | blocked / draft | T L28 にポインタのみ |
| O6 | C13 CC0 training-corpus hub への doctrine-corpus ingest（要二次 research） | 216, 301 | draft | ポインタのみ |
| O7 | C14 第三者 skill registry への link-index 掲載（派生の自前 marketplace は deploy 済み L732、C24 は申請済み L740） | 215, 302 | draft | ポインタのみ |
| O8 | C16 prose↔deposit convergence relation（essay が deposit を持ったとき発火） | 256, 304 | blocked 相当 | ポインタのみ |
| O9 | C17 EN/JA placement audit（measurement） | 305 | draft | ポインタのみ |
| O10 | C18 OSF Preprints を論文の第二 deposit に | 306 | draft | ポインタのみ |
| O11 | C23 配置チャネル効果量の一次照合。W の候補 T（D34 で rejected）と同じ素材（arXiv:2606.20065・Muck Rack 等）を扱う。C23 側の状態は未更新 | 724, 728 | draft | ポインタのみ |
| O12 | 十一巡目 ③ interviewer skill + skills.sh 導線 | 39 | draft | ポインタのみ |
| O13 | 十一巡目 ④ zero-gatekeeper earned 回路（connpass LT・Latent Space Paper Club・第二波 3 件。LT 大会日 2026-09-04 は経過済み） | 39 | draft | ポインタのみ |
| O14 | 十一巡目 ⑤ paste-ready doctrine capsule | 39 | draft | ポインタのみ |
| O15 | pool 次点 5 件（定義スタブ群 / traffic データ記事 / OER 登録 / EPF instance #2 公募 / MADR 型 template） | 39 | draft（低） | なし |
| O16 | ARD / ai-catalog.json WATCH。発火条件 = GitHub agent finder か HF Discover Tool の実稼働を一次確認 | 686–693 | blocked 相当（照合先が弱い） | ポインタのみ |
| O17 | Perplexity Pages（#10）WATCH。発火条件 2 つ（Pages 再構築 + answer index 仕様の一次再確認）。副次: Computer による website publishing は別候補として gate 未実施 | 795–800 | blocked | なし |
| O18 | MCP doc-server（#19）WATCH。発火条件 = zero-config・第三者 host・query 機能つきの出現 | 790–793 | blocked 相当 | なし |
| O19 | RAiD WATCH（再照合 ~2027-08）/ w3id DEFER（発火条件 3 つ）/ SWHID→DataCite 投影 review-when | 811, 813, 814 | blocked ×2 + review-when | なし |
| O20 | C24 anthropics 公式 plugin directory への掲載。X L15 / H R5 によれば akc-cycle・harness-scope は掲載済みだが、ledger は未更新（「LISTED に更新」が残る）。監視用 scheduled task が ledger C24 を名指す | 740 | accepted（更新作業） | なし |
| O21 | 外部 initiative への事例提供（詳細は非公開ノート） | 818–823 | blocked 相当 | なし |
| O22 | 2026-10-01 監査: hub の local commit 2 件が push 未、graph 変更のため push 後に HF mirror 再同期が要る。著者判断待ち 3 件（persona の sameAs 扱い・user-site repo・profile 各欄） | 830–831 | accepted ×1 + draft ×3 | H R3 と重複 |
| O23 | 2026-10-11: claude-harness 集約 sync 保留。著者の手作業待ち 4 件 | 835, 838 | blocked / accepted | H R1–R6 と重複 |
| O24 | DeepWiki follow-up: CA 側「contemplative axioms」密 anchoring（CA セッションの領分）、skill 19 repo の wiki 生成・drift は未個別確認 | 363–364 | draft | なし |
| O25 | two-channel gate の ADR 化は defer（use-channel 候補が数件 land してから） | 59 | draft | なし |
| O26 | 八巡目「寝かせ」3 件: #7 per-page schema.org / #14 S2 citation-intent / #17 CRediT 前方参照 | 788 | draft（低） | なし |
| O27 | 小項目: IndexNow 再 POST の恒久化（L600）/ Zenn タイトル取りこぼし 4 本（報告のみ、L607）/ graph への concepts 逆 edge（見送り、L610） | 600, 607, 610 | draft（低） | なし |
| O28 | 次回測定の期日: OQ5 sweep・Wikipedia insource は「次 release or 2026-11 頃」、Common Crawl 監査は月次再実行可（採用は別判断） | 540, 569 | blocked 相当（日付条件） | T D24 / D39 が記述 |
| O29 | L113 の 06-13 時点「著者判断待ち」3 件（existence-proof の registry 掲載 / SWHID の conformance Tier / count drift）。以後の記録で決着したかは ledger 内で未確認 | 113 | 不明 | なし |
| O30 | 「PB 由来の経路」節。personal-branding 側が行為ごとに 1 行を書き足す追記先（現在 0 行） | 840–842 | M（生きた書き込み先） | なし |

**DROP・再提案しない**（1 件ずつ）:

| # | 項目 | 行 |
|---|---|---|
| D-a | Wikidata など第三者管理の権威記録への self-created 登録系すべて（ADR-0021）。P2397 も obsolete | 3, 51 |
| D-b | ghost-citation disambiguation 記事（著者不採用） | 39 |
| D-c | RSL（ADR-0015 と衝突。dormant 条件 = OQ6 現実化 + CC0 profile の idiomatic 化） | 184, 298 |
| D-d | C2PA self-signed（ADR-0013 と衝突） | 185, 298 |
| D-e | PaperBench / MLE-bench を seeding channel として | 207, 307 |
| D-f | Arena.ai agent leaderboard | 208, 307 |
| D-g | 自前 MCP server（Layer 4 anti-pattern） | 214, 307 |
| D-h | Context7（artifact-type mismatch） | 374 |
| D-i | DeepWiki 代替: GitSummarize / GitDiagram / DeepWiki-Open・Grok-Wiki・RepoWiki・CodeWiki / Repowise・CodeBoarding / Gitingest・Repomix・repo2txt・uithub | 283, 406–410 |
| D-j | Wikipedia 自己引用 / HN・Reddit バズ狙い | 318–319 |
| D-k | 八巡目 DROP（約 21 組）: DBLP、CORE・BASE、ResearchGate、Google Scholar profile、Custom GPT・Poe、Gemini Gems、ChatGPT Plugins、HF Spaces、Lobsters、各種 Discord、Lemmy・kbin、LessWrong・AF、ai.txt・TDMRep、WebSub・RSS、Crossref・DataCite Event Data、Altmetric・PlumX、Scite.ai、OpenCitations・COCI、Dimensions・Lens、CORE を mention-tracker に、Connected Papers・Inciteful | 454 |
| D-l | HF Daily Papers（arXiv ID 必須）/ HF posts（投稿条件を満たさない）。実行不可と確認済み | 545–546 |
| D-m | TOE-Share（D42）/ AgentArxiv（D36）/ AISC（D15）/ AGENT4SC（D16） | 746, 755, 761, 766 |
| D-n | 八巡目 #2 PhilPapers（DROP）/ #8 Mastodon（DROP、ADR-0007 条項衝突）/ #6 #9 #20 と週次執行ループ（見送り） | 781–786 |
| D-o | PROV-O（再提案しない。失効条件 = 主要 research graph か LLM crawler が repo 内 PROV-O ingest を公式化） | 812 |
| D-p | 用語単独 DOI（不採用で確定） | 709 |
| D-q | 新 AI-native-venue line の提案（「次巡で re-litigate しない」） | 57 |
| D-r | served page を持たない 6 repo への JSON-LD embed 一括展開（ANS のみ deploy。CA / AKC / AAP / AS は trigger-gated の LATER、doctrine-corpus / existence-proof は NO。hub への wholesale dump も却下） | 580–581 |
| D-s | 十巡目の「再提案しない」群（OpenAttribution v0.1 継続、レビュー診断、C19 paper 化、八巡目残り 12 件） | 730 |

**MEMORY.md 索引行**（`<memory>/MEMORY.md`）: ledger の行は L6。1 行が 9,000 字超 12,000 字未満（Grep で長さ判定）。性質は、巡 1〜9 の deploy 履歴を commit SHA・識別子・連絡先つきで 1 行に畳んだ要約で、最後の日付付き記述は 2026-08-05。08-12 以降の節を反映していない。L7 は `task-ledger-wiring.md` への索引で、「二層分立、統合しない」（2026-07-06 著者決定）を載せる。

### 2. `.notes/TASKS.md`（T、87 行）

**Pending（L13–20）6 行**: accepted 2 行（T3, T7）/ blocked 4 行（T1, T11, T28, T29）。

| ID | 状態 | 要旨 | 行 | ledger との重複 |
|---|---|---|---|---|
| T1 | blocked | Code Wiki 生成待ち。再開条件・照合先・成立時の 3 要素あり | 15 | L427–437, 283（O1） |
| T3 | accepted | OpenAttribution 再 gate。再開条件は成立済み、本文は「採否は著者へ」で終わる。task-stocktake の語彙では「採否判断がまだ要る」は draft | 16 | L186, 297, 837（O2）/ H R4 と同一 |
| T7 | accepted | provenance-hardening pass。最初の step は著者の prior-art edge validate。詳細は `.notes/provenance-layer-candidates.md` | 17 | ledger に行なし |
| T11 | blocked | M9 researchmap 掲載 / M5 OpenAlex 名寄せ。3 要素あり | 18 | L91–94, 160–161（O3） |
| T29 | blocked | 秋窓 parametric contrast の判定（事前登録は `docs/empirical/probe-preregistration-2026-09.md`、期限 2026-12-31）。3 要素あり | 19 | ledger になし。memory `probe-measurement-system.md:11,28` が T29 を名指す |
| T28 | blocked | 次回 release-doi で Zenodo description の human-conducted signal 補強を同梱。3 要素あり | 20 | ledger になし。L785 の Zenodo AI policy 局面に隣接 |

**Done / Rejected / Withdrawn（L32–81）45 行（D1–D45）**。D44 が D43 より上（L78/L79）、D45 は空行 L80 の後ろで表から切り離されている（L81）。数えた内訳:

| 結果 | 件数 | ID |
|---|---|---|
| done | 25 | D1, D2, D5, D6, D9–D14, D17–D21, D23, D24, D35, D38–D41, D43–D45 |
| resolved | 1 | D7 |
| obsoleted | 3 | D3, D8, D22 |
| rejected | 6 | D4, D16, D26, D29, D31, D34 |
| withdrawn | 10 | D15, D25, D27, D28, D30, D32, D33, D36, D37, D42 |

**その他の節**:
- L3–9 ヘッダ: 二層分立（TASKS = 作業状態 / ledger = 戦略状態）を宣言。L7 に「著者決定: 二層分立、統合しない」。
- L22–24「引き継ぎ資料へのポインタ」1 本（Wikidata revocation の handoff）。
- L26–30「候補台帳へのポインタ」3 本: ledger の候補群（ID 列挙つき）/ wiki-harvest ledger（「台帳行は T17 に集約」と書くが T17 は存在しない）/ loop-blueprint（未採択提案 4 件）。
- L83–87「棚卸し記録」4 項。**L87 の「harvest（未起票・著者判断）」に 6 件の未起票項目が散文で残る**: ADR-0019・0021 の相関の読み / hub `index.html` の sameAs / hub concepts・vocab の author block / `docs/inspiration.md` の p 値の出典違い / Zenodo の CCBot 403 の論点 / arXiv:2606.02184 Ghost Couple（C1 候補）。D41（L76）にも「未対応の副産物（別判断）」3 件がある。

### 3. `.notes/` の全ファイル（28 ファイル）

非空行数は Grep で数えた。「タスク行」は台帳行として開いているものを指す。

| ファイル | 非空行 | 性質 | 開いているタスク行 | 参照元 |
|---|---|---|---|---|
| TASKS.md | 75 | 作業台帳 | あり（6） | claims.py が名指し |
| handoff-2026-10-11-session-remainders.md | 30 | 引き継ぎ（rfcs 統合向けと明記、L1） | あり（R1–R15） | X / 本調査 |
| exploration-2026-10-11.md | 83 | 探索・取り込み設計（提案 + 候補表） | 提案 7 + 新施策 6（台帳行ではない） | H L5 |
| wiki-harvest/ledger.md | 229 | 候補台帳（採否前）。wiki ページを `[[...]]` で 50 行引用 | なし（候補 25） | T L29, memory `task-ledger-wiring.md` |
| claims.jsonl | 21 | claims.py の追記専用ジャーナル（claim / release / spawn の JSON 行） | — | claims.py `journal_path` |
| handoff-wikidata-revocation-20260716.md | 123 | 引き継ぎ + 事象の参照インデックス。**機微を含む** | 候補 1（§5-2(b)） | T L24 |
| provenance-layer-candidates.md | 26 | 作業リスト（T7 の素材） | T7 | T L17 |
| loop-blueprint-2026-08-12.md | 46 | 運転設計（未採択提案 4 件） | 提案のみ | T L30 |
| codex-proposals-20260802.md | 72 | 外部提案の評価（D29 で決着） | なし | T D29, D39 |
| zenodo-ai-policy-metadata-audit-20260804.md | 102 | 点検記録 + 文言案 | T28 | T D17, T28 |
| gitmcp-audit-20260703.md（+ evidence 4 files） | 123（+1,045） | 証拠・測定記録 | なし（D5/D26/D27 で決着） | T D5, D26, D27 / L672 |
| oq5-recursion-sweep-2026-08-19.md | 186 | 測定記録（連絡先 1 件を含む、L188） | なし | T D24 / L540 |
| s2-primary-verification-2026-08-19.md | 74 | 一次照合メモ | なし | T D35 |
| s4-adr0009-verification-2026-08-19.md | 128 | 一次照合メモ | なし | T D43 |
| toe-share-terms-2026-08-19.md | 105 | 第三者規約の読みメモ | なし | T D42 |
| cc-capture-audit-2026-08.md | 183 | 測定記録 | なし | T D39 |
| cc-attribution-submission-2026-09-05.md | 24 | 提出内容の控え。**連絡先・氏名・所属を含む（L6–8）** | なし | L823 のみ |
| ideation-instructions-2026-09-07.md | 47 | 変更記録（実施済み、タスクなし） | なし | TASKS・memory からは参照なし |
| archive/human-reader-discovery-strategy.ja.md | 185 | 作業文書（archive） | なし | T D32 |
| archive/deisland-paste-blocks.md | 75 | 貼付文面（archive） | なし | T D1 |
| archive/expansion-ideas-2026-07-01.md | 270 | 候補 20 件の作業文書 | なし | L441, 460, 532 / MEMORY.md L6 |
| archive/ai-native-platforms-survey.md | 157 | 調査（archive） | なし | T D3 / L616 |
| archive/ai-native-submission-harness-sketch.md | 104 | 設計スケッチ（archive） | なし | T D3 |
| archive/adr-draft-ai-native-platform-entry.md | 54 | 廃棄した ADR ドラフト | なし | T D30 |

**`.notes/` は `.gitignore:2` で追跡外**。`docs/` や ADR から `.notes/` ファイルへのリンクは存在しない（Grep）。言及は `docs/plans/` の 3 本（`claude-code-prompt-concept-hazy-wave.md:21,126` / `claude-code-prompt-breezy-octopus.md:105,117,122` / `ethereal-floating-bachman.md:81`）と `docs/plans/research/2026-10-11-arrival-success-and-branding-boundary.md:247,328` にあるが、いずれも `.notes/TASKS.md` を指す記述で、plan と research は過去の記録。

**`claims.jsonl`**: 21 行。claim 10 / release 10 / spawn 1。2026-08-19 の triage セッション（1 セッション ID）が task ID `T-10-OQ5-RESWEEP` などを積んだ。最終行（L21, 2026-08-25）は `spawn RFC-0004 --origin idea`。この repo に `rfcs/` は無く、harness の `rfcs/0004-zenodo-metadata-edit-procedure.md` と同じ番号で、同日にこの repo で Zenodo metadata の編集が行われている（L の D45）。**推測**: 別 repo の RFC を cwd のこの repo で spawn した記録。AS の `rfcs/` を 0004 から始めると、この spawn 行が AS の RFC-0004 の系譜として読まれる。

### 4. `.notes/wiki-harvest/ledger.md`（W）

**構造**: harvest 3 回分（L6 = 2026-07-08、L161 = 07-19、L211 = 08-02）+ 既消化リスト（L138–144）+ graph 反映記録（L148–159）+ surface-check の dismiss 項（L206–209, L271–274）。候補 25 件:

| 回 | 候補 | 件数 |
|---|---|---|
| 07-08 | A–Q | 17 |
| 07-19 | R–U | 4 |
| 08-02 | V–Y | 4 |

**ledger 内の status 欄の集計**（自分で数えた）: promoted-graph 11（A, B, C, E, F, G, H, J, K, L, M）/ promoted-graph-partial 1（P）/ RESOLVED 1（D、L34）/ verified-no-change 1（W、L235）/ new 11（I, N, O, Q, R, S, T, U, V, X, Y）。T の記録と突き合わせると、B → D35 / D → D7 / V → D43 / C・E → D37 / F–M・R・S・T・U・X・Y → D34 で決着済みだが、**W 側の status 欄は D と W 以外更新されていない**。A は L217 で V に吸収。**N・O・P・Q は D34・D37 のどちらにも名指しされていない**（D37 の「他」に含まれる読みはできる）。

**性質**: ヘッダ（L1–3）が「採否前の作業用 ledger / NOT a citable artifact / 公開成果物には wiki ページ・vault パスを引用しない」と宣言。task-stocktake は wiki-harvest 型の候補台帳を sweep 対象外にしてポインタ 1 行を置くと定める（`~/.claude/skills/task-stocktake/SKILL.md:205–208`）。T の L29 が既にそのポインタ。

### 5. `handoff-2026-10-11-session-remainders.md` の R1–R15

| R | 要旨 | 既存行との重なり |
|---|---|---|
| R1 | personal-branding 側へ境界検討依頼を貼る | L838（手作業待ちに同項）/ T になし |
| R2 | GSC URL 検査・Bing Webmaster・Brave submit-url | L826–831, 838 / X §4-2 / T になし |
| R3 | user-site repo 新設の採否 | L831, 838 / T3 の前提 |
| R4 | OpenAttribution の採否（(a) R3 の後に claim (b) 送る側の動きを見てから決める） | **T3（T L16）と同一事項**。選択肢の文言まで一致。H は状態語を「accepted（採否待ち）」とする |
| R5 | plugin directory の Usage CSV を取得 → empirical 基準値 | L837–838 / L740（C24 LISTED 更新）/ X §3 #5 |
| R6 | claude-harness 集約 sync | L835。H 自身が「AS の rfc にはしない候補」と注記 |
| R7 | Citation Monoculture（arXiv:2608.19230）を inspiration・graph・ADR-0011 注記へ | repo 内 Grep 0 件（未取り込み）。ADR-0011 Annex A（D35）の隣接 |
| R8 | Ahrefs DiD の適用範囲（既引用ページのみ）を ADR-0009 か OQ9 へ | D43 が ADR-0009 を改訂済み。同 ADR の Lineage（`docs/adr/0009-dual-entry-asymmetric-rebalance.md:302`）に「100+ AI …」の母集団限定の記述あり。「未引用側は未検証」の明示が Decision 側にあるかは未確認 |
| R9 | admission 監査の事前登録（`docs/empirical/` 新規） | X §3 #6 / ledger になし。T29 の 2026-09 事前登録とは別系列と H が明記 |
| R10 | referrer 三分類の集計 | L836 の計器（hub の日次 snapshot）がデータ源。集計は未着手 |
| R11 | 翻訳層（造語の隣に汎用語を 1 文） | X §4-5 / 既存行になし |
| R12 | JA エッセイの syndication 先に note を加えるか | X §4-4 / L784（essay syndication 面は将来の別候補）。H 自身が姉妹 repo 向けと注記 |
| R13 | vendor 著者の研究を manifesto に COI つきで 1 文 | X §3 #4 / 既存行になし |
| R14 | 研究 pipeline → repo の取り込み経路 | 姉妹の研究 pipeline repo の作業（H 注記）|
| R15 | hub `traffic/README.md` の「clone:view 30:1〜215:1」が現状と不一致 | L39 の pool 次点「traffic データ記事 (30:1)」と数字が同系。L836 に現状値 |

## 原因（参照と依存の所在 — 移行で追随が要る箇所）

### 6. 公開リスクの所在（種類別・件数・代表行）

行番号の後ろの数字は件数。全ソースを Grep と Read で確認した結果で、代表行のみ挙げる。

| 種類 | 所在 | 備考 |
|---|---|---|
| メールアドレス | L361, 431（第三者組織の窓口 1）, 740 / `.notes/cc-attribution-submission-2026-09-05.md:7` / `.notes/oq5-recursion-sweep-2026-08-19.md:188` / MEMORY.md L6 | 計 ledger 3 行 + notes 2 ファイル + 索引 1 行。**公開 rfc には書き写さない** |
| 第三者の個人・アカウント名 | L44（Wikidata 管理者の handle）, 373・676（第三者 repo 作者）, 540（独立採用の最近傍 repo の所有者名）, 831（persona の外部 handle 2 本）/ T L59（D24 に同上）/ handoff-wikidata の L10 | ledger 5 行 + T 1 行 + notes 1 ファイル |
| 返信状況・外部応答 | T L18 / L818–823 / T L60 / T L16 | 第三者の対応を書く行が約 5（中身は写さない） |
| アカウント・ブロック・削除の詳細 | L3, 42–52（運用上の詳細）/ T L43–49（D8–D14）, T L44（D9 に revision 番号）/ `.notes/handoff-wikidata-revocation-20260716.md`（123 行）| 事象そのものは ADR-0021 と公開 essay が既に扱っている。公開していないのは運用上の詳細 |
| 運用手順に関する記述 | L52, 499・630〜675（約 15 行）, 744 / T L19, T L47 | 値は書かれていない。運用の手順が書かれている |
| 識別子（公開 profile 由来） | L125（LinkedIn slug・Scholar user id）, 603（YouTube channel ID）, 600（IndexNow key file 名）, 162・174（旧アカウントの handle）/ T L18（ORCID）| 公開 profile に出ているものが多いが、「どれを rfc に置くか」は別判断 |
| private repo・ローカル絶対パス | L749（絶対パス 1）, L24・27・52・58・349・563・565・624・699・722・837 の `~/` パス / L58 の private repo 名 / T L16, 45, 49, 56, 57, 81 / handoff-wikidata L77, 117, 137 | 絶対パスは L749 の 1 件。`~/.claude/` 等は 20 行超 |
| 個人的な制約に関わる記述 | L85, 327 / MEMORY.md L10 / `<memory>/awesome-list-submissions.md:30,39` | ledger は理由の中身を書かず存在だけを書く。**MEMORY.md L10 と awesome-list-submissions.md は理由の中身を含む**。skill `references/action-review.md:34–35` が「個人的な制約の理由を公開資料へ転記しない」と定める |
| workflow run ID | L103, 171, 182, 194, 224, 260, 289, 370, 401, 574（10 行、異なる ID 8 種）| T・H・W には 0 件 |
| wiki / vault 参照 | W に `[[...]]` 50 行 / L に memory link 14 行（L3, 32, 44, 76, 78, 85, 89, 99, 121, 150, 295, 305, 678, 707）/ `docs/maintenance.md:46–47` が「wiki ページや vault のパスを出典として引用しない」と定める | W は L1–3 でも同じ宣言 |
| 内部 repo・内部語彙 | T L53, 56, 45 / H L12, 28, 30 / L23, 27 | 公開 repo でない名前が混ざる（名前は写さない） |
| 効果・結果の記述 | 数値つきの観測: L836（clone:view 比 29.0→8.1）, 540・T D24（全 0）, T D39（0/17）, T D40・D27（badge 0・referrer 0）, T L18（OpenAlex の works 数）, L603（視聴回数）/ W の効果量引用（候補 H, V, W, T の数値）| `docs/maintenance.md:15–17` は観測に “preliminary observation” または “consistent with” を要求。ADR-0023 は intervention timeline を効果主張にしないと定める（`docs/adr/0023-empirical-layer-role.md:131,158–170`）。実施記録の語尾に「効果主張なし」と書く行は ledger に多数ある |
| 第三者の規約・仕様の読み | L184–190, 797（Perplexity）, T L16 | 事実記述。as-of 日付つき |
| commit SHA | ledger・T の随所（公開 repo の SHA が大半。非公開 repo の SHA が L58 に 1 件）| |

### 7. 追随が要る参照

**repo 内（`file:line`）**

| 対象 | 所在 | 内容 |
|---|---|---|
| `docs/maintenance.md` | L29–38 | 「実施を記録するとき」節。L31 が private ledger = `diffusion-channel-status.md` を名指し、L38 が ADR-0014 を根拠とする。**ledger の所在を宣言する唯一の repo 内正本**。personal-branding・skill・scheduled task がここを経由する（下記） |
| ADR-0014 | `docs/adr/0014-implementation-tracking-two-tier-ledger.md`（`.ja.md` あり）L3–6, 20, 29, 48, 106, 111 | Decision = 「private ledger（運用上の正本）と public timeline（日付つき・効果主張なし）の 2 層、混ぜない」。**Alternatives の第 1 項「単一の公開 tracking document」を『運用詳細と計画内容が timeline の empirical 役割と privacy を損なう』として却下**（L75–76）。Status は `accepted — amended 2026-09-07`。Lineage（L111–114）が「private ledger は project-memory note、場所は maintenance reference が持つ」と書く |
| ADR-0021 | EN L219–220 / JA L201–202 | 「private implementation ledger」に言及 |
| ADR-0022 | EN L141, 272, 424 / JA L125, 244, 373 | 「private ledger」「two-tier ledger」に言及。ADR-0024 が supersede（L835） |
| ADR-0023 | EN L66, 312 / JA L59, 288 | 「ADR-0014 の ledger の public projection」= intervention-record genre |
| ADR-0024 | EN L146–147, 160, 316 / JA L129–131, 140 | evidence 段の事象を「ADR-0014 の private implementation ledger」に記録、「両方の ledger」に記録、と明記。**2026-10-11 の accepted ADR が ledger の private 性に依存する** |
| `docs/adr/README.md` / `.ja.md` | L26（2 層の記述）, L139–153, 240–267 | ADR 索引と narrative |
| `docs/glossary.md` / `.ja.md` | L338–339 / L279–280 | 「ledger tier (private ledger / public projection)」の定義 |
| `docs/empirical/implementation-log.md` | L238–242（「How this log is maintained」） | 「working detail は別の private ledger にある」。公開 projection の役割宣言 |
| `docs/adoption.md` | L136 | ADR-0014 の要約行 |
| `docs/empirical/adoption-dry-run-2026-09.md` | L151 | ADR-0014 への言及 |
| `llms.txt` | L46, 78, 90 | ADR-0014 の記述（長行） |
| `llms-full.txt` | L328, 598, 686 | 同上 |
| `graph.jsonld` | L516, 706, 708 | `private ledger`・ADR-0014 node・recordedIn。**graph 変更は HF mirror 再同期を伴う** |
| `CITATION.cff` | L57 | abstract に two-tier |
| `.zenodo.json` L10 / `codemeta.json` L15 | description に two-tier | |
| `CHANGELOG.md` | L117, 175, 256, 274, 275 | 過去 release の記述（履歴）|
| `CLAUDE.md` / `AGENTS.md` | 該当語なし（`docs/maintenance.md` へ誘導するのみ、L22）| 追随は不要。同内容を保つ規約（L25） |
| `README*.md` | 該当語なし | |
| `.gitignore` | L2 `.notes/`、L6–7 `*.packed.html` / `*.artifact.html` | `rfcs/` は追跡される |
| `docs/plans/` | 上記 5 本 | 過去の記録。追随不要が妥当だが判断は lead |

**repo 外**

| 対象 | 所在 | 内容 |
|---|---|---|
| skill `authorship-strategy`（global） | `~/.claude/skills/authorship-strategy/SKILL.md:34–37`（"Operating the strategy over time"）, `references/action-review.md:37–40` | 「適用先の保守規約が宣言する台帳・公開記録の役割と更新順に従う」「private ledger を先に更新し、public timeline があれば日付付き介入だけを投影する（ADR-0014）」。**台帳の所在は書かず maintenance.md に委ねる形** |
| 公開 copy | `~/MyAI_Lab/authorship-strategy-skill/skills/authorship-strategy/references/action-review.md:39–40` ほか | 同文。更新は harness-sync |
| rules | `~/.claude/rules/common/task-tracking.md:9` | 単一表 `.notes/TASKS.md` と store `rfcs/` の 2 形を規定。AS の個別記述なし。`authorship-strategy` rule は ADR-0017 で退役済み |
| scheduled task `listing-pr-daily` | `~/.claude/scheduled-tasks/listing-pr-daily/SKILL.md:13, 36–38` | **ledger のパス（`diffusion-channel-status.md` 末尾の節「PB 由来の経路」）を名指しし、行為ごとに 1 行を追記する**。ledger 移設で書き先が消える |
| scheduled task `akc-plugin-catalog-watch` | `~/.claude/scheduled-tasks/akc-plugin-catalog-watch/SKILL.md:20, 24` | 掲載検出時に「ledger の C24 を LISTED に更新」と提案する（read-only）。名指しの対象は ledger |
| scheduled task `listing-explore-rotation` | 同 `SKILL.md:29, 38` | ADR-0012 / ADR-0021 を参照。ledger は名指さない |
| 姉妹の personal-branding 戦略の文書 | 境界の決定・行為ログ・plan の計 4 ファイル | 「AS の実施台帳（`docs/maintenance.md`『実施を記録するとき』）にも参照 1 行を足す」「節『PB 由来の経路』」。**境界の決定の見直し条件が「AS が実施台帳の所在・更新順を変えた」ことを再読の発火点と定めている** |
| memory | `<memory>/task-ledger-wiring.md:3,10,12,14,18` / `MEMORY.md:6,7` / `probe-measurement-system.md:11,28` / `daily-research-morning-brief-flow.md:17,19` | 二層分立の著者決定（2026-07-06）、TASKS を先に読む運用、T29 の名指し、daily-research の手順（ledger → projection → TASKS の順） |
| `~/.claude/scripts/claims.py` | L120–125 `journal_path` = `.notes/claims.jsonl` / `ledger_path` = `.notes/TASKS.md`, L283–303 `rfc_store_path` = `<repo root>/rfcs` | 次節 |
| `daily-research/CLAUDE.md:3` | 「repo 自身の運用文脈（…タスク台帳／open questions／実施履歴）」 | 汎用の記述。個別パスの名指しなし |
| skill `wiki-harvest` | `~/.claude/skills/wiki-harvest/SKILL.md:109` | `.notes/` を gitignore して候補台帳を private に保つ手順 |

**3 つの「二層」が別物で混在している**:
1. ADR-0014 の two-tier = private ledger と public projection（implementation-log）。
2. memory `task-ledger-wiring.md` の「二層分立」= TASKS.md（作業状態）と ledger（戦略状態）。T L7 も同じ。
3. ADR-0022 の「二層台帳化」= doctrine layer と essay layer の audience 会計（ADR-0024 が supersede）。

**verify 機構**: `.claude/verify.sh` は無い（`.claude/` には `settings.local.json` のみ。`docs/plans/ethereal-floating-bachman.md:9` も「機械ゲートは `scripts/verify-counts.sh`」と書く）。`scripts/` は `verify-counts.sh` 1 本。ガード対象は `git ls-files '*.md' '*.txt' '*.cff' '*.json' '*.jsonld'` から **`CHANGELOG.md`、`docs/adr/[0-9]*`、`docs/plans/` を除いた集合**（`scripts/verify-counts.sh:46–50`、除外理由は L41–44 のコメント。直近 commit 369a004 の変更）。数えるのは ADR 総数（`docs/adr/[0-9]*.md` のうち `.ja.md` を除く、L96）と open question 数（`docs/manifesto.md` の `^## Open question ` 行、L110）。照合する名詞は `ADRs` / `tactical decisions` / `tactical ADRs` / `decisions extracted` / `の ADR` / `の戦術的判断` / `open questions`（L103–105, 111）。**`rfcs/*.md` は新設すれば自動的にガード対象になり、本文に「N ADRs」「N open questions」型の数が現在の総数と食い違って書かれていると DRIFT で赤くなる**。除外するなら L50 の `grep -vE` に `^rfcs/` を足す形になる（docs/plans/ と同じ扱い）。`docs/plans/research/` は `docs/plans/` 配下なので、この report 自体は対象外。

### 先例（姉妹 repo）と claims.py の挙動

| repo | `rfcs/` のエントリ数（自分で数えた） | README の形 |
|---|---|---|
| contemplative-agent | 50（0001–0050、欠番なし）+ README | 見出し + 3 段落の規約ポインタ + 表（`# / Title`、state 列なし）。規約本文は書かず `skill: rfc-writer` / `task-stocktake` / harness ADR-0049 へリンク |
| agent-knowledge-cycle | 1 + README | 同形 |
| zenn-content | 1（done 2026-10-03）+ README | 同形（task-stocktake・ADR へのリンクを省略した短い版） |
| `~/.claude`（harness） | 35（0001–0035）+ README | 同形。相対リンクで skill・ADR へ |

**frontmatter の例**: AKC `rfcs/0001-conflict-cost-local-metric.md:1–3` は `state: draft` のみ。harness `0001-public-rfcs-rollout.md:1–4` は `state: done 2026-08-25` と `review-when:`。CA `0001` は `state: withdrawn 2026-08-30`。状態語に日付を続けられる。`claims.py` が読むのは `state:` の先頭語だけ（`task_head`、L534–554）。本文の最初の非見出し行が `ready` の 90 字要約になる（L557–583）。rfc-writer は本文を Rust RFC テンプレート（Summary 〜 Future possibilities + Status + Next action）に寄せ、「小さな作業項目は該当なし節を省いてよい」とする（`~/.claude/skills/rfc-writer/SKILL.md:39–66`）。

**単一表・private 台帳からの移行の先例**:
- AKC: 単一表 `T-003` を `RFC-0001` に移送し、本文に「旧 ID: T-003（`.notes/TASKS.md` から 2026-08-25 移送）」と残す（`rfcs/0001-…:23`）。AKC の単一表に残った `T3` は ID 形式が `claims.py` の正規表現（`^(?:T|RFC)-…`）に乗らず、`ready` の誘導行が出ない（`~/.claude/rfcs/0001-public-rfcs-rollout.md:46–48`）。AS の `T1`, `T3`… も同じ形式で、`T-` ハイフンを欠く。
- CA: 旧 store 18 件を全件判定（移送 15 / 終端 archive 3 / 残置 0）。機微起因の書き換え 0（同 L42–44）。旧 `.notes/tasks/` は現在 `.notes/archive/tasks/` に 129 ファイル（Glob）。
- harness: 単一表と store が併存する移行期の仕様。`ready` は store を先に見て、単一表に `T-` または `RFC-` 形式の行があれば「単一表にも行がある」誘導 1 行を出す（`claims.py:586–593`）。task-stocktake は「行が尽きた単一表は store へのポインタ 1 行だけを残す」と定める（`SKILL.md:20–22`）。
- **閉じた履歴の扱いの規定**: ADR-0049 Decision 4 は「archive 機構は持たない。終端エントリは削除・退避せずその場に残す（dropped も却下理由ごと残る）。旧 store の終端エントリだけ `.notes/archive/tasks/` へ退避」。RFC-0001 の規定は「単一表だけの小 repo は移行必須ではない（提案性の行が生まれた時に rfcs/ を初設する）」「移送前に repo ごと機微点検を 1 回」「移送判断は 1 件ずつの人手判断」（`rfcs/0001-public-rfcs-rollout.md:28–34`）。rfc-writer §0 は「完了後の後追い起票はしない — それは ADR か commit log の領分」「却下理由を残す価値があるなら起票してよい」（`SKILL.md:24–27`）。
- ADR-0049 の Review-when は「`rfcs/` への流入が 3 か月間 0」「公開が原因の機微情報事故」。公開は撤回不能（L74–77）。

**`claims.py` の store 検出**: cwd ではなく `repo_root()`（`CLAUDE_PROJECT_DIR` → `git rev-parse --show-toplevel` → cwd の順、L100–117）の直下の `rfcs/` を見る。`rfcs/` が symlink なら辿らない。ファイル名は `^\d{4}-` で、`README.md` は弾かれる（L289）。`claims.jsonl` は `.notes/claims.jsonl` 固定（L120–121）で、`.notes/` が gitignore のため非公開のまま。`claim` / `spawn` の ID は `T-…` か `RFC-…` を受理（L77）。

## 確認（読んだ範囲と数え方）

- **L**（`<memory>/diffusion-channel-status.md`）: 1–843 行を 4 回に分けて全文 Read。見出し行は Grep（`^#{1,3} `）で行番号を確定。開く項目・DROP の行番号は本文 Read 時に記録し、`C23|OpenAttribution|Code Wiki|…` の Grep で再確認した。
- **T**: 1–87 行を全文 Read。Pending 6 行・D1–D45 の件数は表の行を 1 件ずつ数え、結果語別に集計して 45 と一致させた。
- **H**: 全文 Read。**W**: 1–80 行、105–274 行を Read（81–104 は候補 K・L・M で、見出しは Grep で確認）。status 欄は見出し行の Grep から集計。
- **`.notes/` 全ファイル**: Glob で 28 ファイルを確定。非空行数は Grep `.` の count。性質判定は、TASKS・H・W・claims.jsonl・cc-attribution・ideation・provenance・loop-blueprint・handoff-wikidata・codex・exploration（1–60, 60–90）・zenodo・toe・oq5・cc-capture・gitmcp・s2 の先頭を Read して行った。**archive の 6 ファイルと gitmcp evidence の JSON 4 本は中身を開いていない**（Glob の名前と T・L の記述による）。
- **参照元**: T・memory への参照は Grep（ファイル名で）。`.notes` 内の相互参照は files_with_matches。
- **repo 内参照**: `diffusion-channel-status|TASKS\.md|private ledger|private implementation ledger|private planning ledger|two-tier|\.notes/|ADR-0014|0014-` を repo 全体で Grep。長行は `-o` で語を確定した。ADR は `docs/adr/` を別に Grep。
- **repo 外**: `~/.claude/{skills,rules,scripts,hooks,docs/adr,scheduled-tasks}` と `~/MyAI_Lab`（`diffusion-channel-status` の全 repo Grep、`personal-branding`・`daily-research`・`authorship-strategy-skill` を個別に Grep）。
- **先例**: 4 repo の `rfcs/` を Glob し README 4 本・AKC `0001` を Read。CA の `state:` は値を Grep で出せず（`-o` 指定のため）、`0001` のみ別途確認。harness ADR-0049・RFC-0001・task-stocktake SKILL・rfc-writer SKILL・`claims.py` の該当行を Read。
- **verify**: `scripts/verify-counts.sh` を全文 Read。実行はしていない（この session に Bash が無い）。
- **公開リスクの数え方**: 種類ごとに Grep で行を拾い、代表行を残した。「約」を付けた数は 1 行内に複数語がある場合の概算で、行数の厳密な集計ではない。

## Still unknown

- `verify-counts.sh` を現ツリーで実行した結果（Bash なし）。
- `.notes/archive/` の 6 ファイルと gitmcp evidence の JSON 4 本の中身、および W の L81–104 の本文。
- `claims.jsonl` L21 の `RFC-0004` が harness の RFC を指すという推測の検証（同 session ID の他の記録）。
- `listing-pr-daily` の追記先が移設後にどこへ向くか（書き換えの要否と、personal-branding 側の境界の決定の再読）。
- `akc-plugin-catalog-watch` が実際に掲載を検出して自己 disable したか（task の状態ファイルは見ていない）。
- C24 の LISTED 化・Usage の計測値（X・H の記述を信頼しており、directory 側は見ていない）。
- N・O・P・Q（W）の著者側の扱い（T の D34・D37 の列挙に名指しがない）。
- L113（06-13 時点の「著者判断待ち」3 件）が後の記録で決着したか。
- O5（C12）の条件「EinsteinArena が baseline を出す」の成否（L299 は RESOLVED だが C12 側の条件は更新なし）。
- 公開 repo 向けの secret scan / harness lint が rfc の本文（メール・パス）をどう扱うか（commit gate は実行していない）。
- `awesome-list-submissions.md`・`wikidata-qids.md` など、lead の指定外の memory ファイルに含まれる公開リスクの全量（個人的な制約の語のみ Grep）。
