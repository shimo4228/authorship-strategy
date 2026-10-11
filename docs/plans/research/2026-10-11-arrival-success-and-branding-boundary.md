kind: internal
# D1（到達 = 日付つき記録への到達）と D2（personal-branding との境界を肯定形で書く）が触る箇所の一覧

as-of 2026-10-11。対象は authorship-strategy（以下 AS）、personal-branding（以下 PB）、`~/.claude/skills/authorship-strategy/`。
D1 / D2 は著者の決定として与件。ここに Verdict は書かない。

## Scope searched

- AS: `docs/thesis(.ja).md`、`docs/adr/0001–0023`（EN 主、JA は行番号を要所のみ）、`docs/manifesto.md`、`docs/glossary(.ja).md`、`README(.ja).md`、`llms.txt`、`llms-full.txt`、`graph.jsonld`、`docs/CODEMAPS/architecture.md`、`docs/maintenance.md`、`docs/adoption.md`、`docs/empirical/*`、`scripts/verify-layer-boundary.sh`、`scripts/verify-counts.sh`、`CITATION.cff`、`.zenodo.json`、`codemeta.json`、`CHANGELOG.md`（見出しのみ）。
- PB: `docs/strategy.md`（全文）、`CLAUDE.md`、`docs/adr/0001`、`0005`（全文）、`0002/0003/0004/0006`（grep）、`README(.ja).md`（grep）。
- 派生: `~/.claude/skills/authorship-strategy/{SKILL.md,references/strategy-reference.md,references/action-review.md}`、`~/.claude/skills/adr-writer/SKILL.md`。
- zenn-content は grep のみ（範囲外の参考）。
- 制約: この session に Bash が無い。**`verify-counts.sh` / `verify-layer-boundary.sh` は実行していない（本文を読んだだけ）**。`git log` も実行できず、`.git/logs/HEAD` の reflog 4 行（commit 件名）しか見ていない。ADR-0022 / 0023 の追加 commit が実際に触ったファイル一覧は未確認で、下の carrier 一覧は現ツリーの grep から作った。
- 数字（「23」「11」）と行番号は 2026-10-11 時点のツリー（HEAD b5419ff）。

## Found

### 0. 先に押さえる構造

- 旧い成功の定義は 1 か所にまとまっていない。次の 3 つの言い回しに分かれて各 carrier に複製されている。
  - (a)「著者の signature を運ぶ LLM-mediated channel の breadth」（Layer 2 定義）
  - (b)「著者名が答えに出る / 名指しされる」（naming probe、ghost citation、ADR-0017）
  - (c)「consideration-set 入り / entity resolution」（ADR-0009）
- D1 と矛盾するのは (a) の「signature を運ぶ」と (b)。(c) は D1 の「retrieval 側の入場（admission）」と同じ方向で、ほぼ整合する。
- ADR-0022 の audience 層分割は、別の複製系統で、thesis / glossary / README の外 / llms* / graph / CODEMAPS / .zenodo.json / codemeta.json / CITATION.cff に載っている。

### 1. 旧い成功の定義を符号化している箇所（AS）

**thesis.md**（`.ja.md` は同節）
- thesis.md:5–17 / thesis.ja.md:5–14 の claim 段落。「opening … strengthens the authenticity claim」。名指しには触れず、diffusion が validation を生むと言う。D1 とは矛盾しないが、「LLM が未来の読み手の因果追跡を媒介する」という前提がそのまま D1 の「記録への到達」に読み替えられる。
- thesis.md:19–38「Why authorship strategy」。「the protected thing — the authorial identity」「identified by a published name」（:24–28, :33）。保護対象が「著者の identity / 名前」と書かれている。D1 の「保護するのは“いつこう考えたか”という判断」と食い違う。**語の入れ替えが要る本命の 1 つ。**
- thesis.md:149–162 Layer 1。「The success criterion is the idea surviving diffusion as thought」（:152–154）。変更不要。ただし D1 の「成功」と同じ語を使う。語の衝突は Contradictions に書いた。
- thesis.md:164–173 Layer 2 定義。「maximizing the breadth of LLM-mediated channels that carry recognizable signatures of the author's ideas, anchored to a permanent timestamp」（:166–168）と Axis 1（:63–74）の「recognizable signatures … breadth」。**D1 の中核と衝突する。** 「signature を運ぶ breadth」が成功指標になっている。
- thesis.md:175–186。非 primary audience の降格と、essay 層への言及。ADR-0022 の分割そのもの（節 2 を参照）。
- thesis.md:218–222（Layer 3）。「the author's name will not survive at the implementation level」「DOI-registered under the author's name」。名前の生存が比較軸になっている。D1 では観測にとどまるので、文言の見直し対象。
- thesis.md:260 tactic 1「LLM-mediated targeting — clone counts, DOI citations, llms.txt fetches, and LLM regurgitation tests are the primary metrics; stars, PRs, and direct human views are secondary」。metric 階層。D1 とは「regurgitation test が primary metric」の部分が衝突する。この階層は doctrine 層にスコープされると明記されている（:260 後半）。
- thesis.md:263 tactic 4「Distinctive terminology … coined terminology survives as a token-level signal carrying back-reference to the author」。「author への back-reference」を「記録への pointer」と書き換えると D1 と整合する。根拠の骨格（造語 = 逆引きの手がかり）は残る。
- thesis.ja.md の対応箇所は :52–53, :87, :131–148, :181, :207, :210。

**ADR-0007**（`docs/adr/0007-human-attention-signals-not-a-metric.md`）
- :15–17 Summary の末文「Success continues to be measured by the breadth of LLM-mediated channels carrying the author's signature」。
- :106–110 **clause 3「The success metric remains LLM-mediated reach」**。「machine ingestion, programmatic retrieval, knowledge-graph presence, and citation within LLM answers — is the operative measure」。D1 で書き換わる条項。
- :117–121「Genuine human reach is pursued *through* the LLM-mediated channel」。
- :19–24 Status は ADR-0022 による「clause 3 を層ごとに言い直す」を既に注記している。
- :99–105 clause 2 の Note（2026-10-03）。「Repeated announcements of the same publication … remain excluded in both layers」。「both layers」は ADR-0022 の語彙。
- JA: `0007.ja.md:82–99`（clause 1–3）、:91–96（Note）。

**ADR-0008**
- :5–17 Summary。「the failure mode of a retrieval-only strategy — the source is cited but the author is not named」。
- :61–67 Context の ghost citation。「the retrieval channel fetches and footnotes the source, but … the model does not name or recommend the author. The reference exists; the attribution does not resurface」。
- :98–101 Decision 3。「Ghost citation is precisely the result of a working retrieval channel atop absent parametric burn-in」。
- :115–119 Alternatives「Optimize for the retrieval channel only」の却下理由。「retrieval citation without parametric burn-in produces ghost citations … That fails the thesis at its core」。**Alternatives の中で ghost citation を失敗とみなして却下している箇所。** D1 では「URL が引かれて記録に届く」ことは成功側に入りうるので、この却下理由の根拠が変わる。
- :132–136 Consequences。「parametric success = the name is produced or recommended *without* retrieval」。
- :80–89 Decision 1。「name burn-in」「Absence of short-term signal is not failure on this channel」。D1 では「名前の焼き付け」は pointer 目的に読み替えられる。

**ADR-0009**（`0009-dual-entry-asymmetric-rebalance.md`）
- :22–23, :29–32, :128–140, :210–215, :232–246。成功基準は「consideration-set entry / entity resolution」（2026-08-19 改訂済み）。D1 の「retrieval admission」とほぼ同じ方向。変更は最小限で、「author entity を resolve する」を「記録に resolve する」に寄せるかどうかだけが論点。
- :233–239 は、この基準に確立した測定が無いと自認している。D1 にとっては、「記録に到達したか」の測定が ADR-0011 の instrument でカバーされない領域のままという点で関係する。

**ADR-0010**（`0010-vocabulary-discipline.md`）
- :29–32「a semantic signature of authorship … carrying back-reference to the author」、:118–132 Alternatives「Coin freely (maximize signatures)」「the semantic signature dissolves … an author cannot be recovered as the origin」。D1 では「記録へ戻る pointer」と読める。ADR-0010 の判断（寡作で密に anchor する）自体は D1 と矛盾しない。語の整理だけで足りる。
- 造語の力は「edge 密度」という定義（:5–19）はそのまま使える。

**ADR-0011**（`0011-two-channel-probe-protocol.md`）
- :30–37, :73–76「Success on this arm is the model producing the concept and the author's name from weights alone」。
- :78–81, :101–106「Author named / project named / owned identifier cited」の独立 boolean と、ghost citation = `cited && !author-named`、「Naming counts only in prose: an author handle visible solely inside a cited URL is the ghost-citation scenario, not attribution」。
- :248–251。prose-only naming が厳しすぎないかという未解決の問い。
- :256–257, :396–399 Annex A。「diagnostic calibration, never a success metric」。この拘束は D1 でも残るが、プロトコルが測る「名前」が成功でなく観測になる。
- instrument の定義は変えなくてよい。「ghost citation」を失敗と呼ぶ語の運用だけが D1 と衝突する（owned identifier が引用されているなら、D1 では記録に到達している）。
- 検出 lexicon / 版管理は ADR-0011 の series-break 規則に従う（lexicon を変えない限り series break は起きない）。

**ADR-0017**（`0017-failure-mode-diagnostics.md`）
- :5–11, :15–20, :59–76, :106–128 Decision 1「Reach without recognition」。signal =「concept level は通るが author level は通らない」。recovery =「anchor densely / origin claim を narrow に / structural price として受け入れる」。
- :155–170 Decision 4（detector, not metric）と :184–205 Alternatives。「author-naming rate optimized as a goal is exactly the reach-chasing the framework forbids」。
- D1 との関係: (i) name 不在を「失敗モード」と分類している点（:59–62, :106–120）は D1 で位置づけが変わる。記録へ戻る経路が無いことが失敗で、名前の不在そのものではない。(ii) Decision 4 の「author-naming を KPI にしない」は D1 と整合する（名前は観測）。新しい禁止にはならない。
- manifesto OQ8 の第 1 項（manifesto.md:243）が同じ分類の正本。

**ADR-0013 / 0001 / 0021（整合する側）**
- ADR-0013:5–18（SWHID は“what content existed when”を証明）と manifesto.md:378–385（「provenance は残るが credit は失う」を OQ8 の失敗として扱う）。D1 は「provenance（日付つき記録）」を成功側に置くので、manifesto.md:380–385 の読み方が反転する。ADR-0013 / ADR-0001 の中身は D1 と同方向で、変更不要。
- ADR-0021:5–25（self-sovereign な層だけが origin claim を負う）は D1 の記録の定義と整合する。

**ADR-0015 / 0016**
- ADR-0015:13–14「attribution is carried by the federated-identifier layer rather than by the license」は D1 と整合する。
- ADR-0016:57–61「An essay published for LLM-mediated reach is mined, not read」は、D2 の「著者は人と LLM の両方のために README と essay を書く」と食い違う。audience 層分割ではなく ingest 側の説明なので、Note の要否は判断対象。

**ADR-0019**（`0019-structural-optimization-vs-content-authenticity.md`）
- :23–25, :105–108「reinforced by ADR-0007 … there is no legitimate target that deforming the content could serve」。Status（:28–32）は ADR-0022 による弱化を既に注記している。D2 で ADR-0022 が畳まれると、この Status の参照先が変わる。

**ADR-0022 自身**
- 節 2 を参照。

**manifesto.md**
- OQ8（:235–261）: :243 の第 1 失敗モード（reach without recognition、「diffusion does not carry the author's name」）、:250–261 の ADR-0022 worked instance。
- OQ9（:263–）: :306–309「reach-without-recognition tension … the instruments that would carry [the name]」。
- OQ10（:331–）: :378–385（上記）。
- OQ11（:416–451）: ADR-0022 の二層モチベーション分割が前提。D2 で前提が消えるため、OQ11 の扱い（閉じる / 書き換え / 残す）は ADR-0024 の判断事項。
- OQ2（:33–41）: :41「regurgitation tests — … checking whether the author's name appears in citation」。第二義的。
- OQ6（:176–177, :187–190）: author-attribution infrastructure の節。第二義的。
- 見出し数 `## Open question ` は現在 11。OQ11 を消す・増やすと `verify-counts.sh` の open-q 対象（CODEMAPS:28, :46、llms*.txt、README の一部）が動く。

**glossary.md / glossary.ja.md**
- glossary.md:40–49（Authenticity）: 「success criterion is the idea surviving diffusion as thought」。D1 で変えない。
- :51–59（Attribution Diffusion）: 「breadth … recognizable signatures」。**書き換え対象。**
- :84–85（Idea）: 「their name attached to in citation」。第二義的。
- :165–175（LLM-mediated channel）: 「breadth of LLM-mediated channels carrying the author's signature」。**書き換え対象。**
- :239–244（Distinctive terminology の signature）。語の整理。
- :286–300（Human-Attention Signal）: 「The framework measures success by the breadth … carrying the author's signature」。**書き換え対象。** ADR-0022 の scope 注記も同居。
- :302–323（Audience layer）: ADR-0022 の定義項目。
- :366–385（Ghost Citation）: 「cites an artifact's URL but does not name or recommend its author … failure mode」。**定義語の見直し対象。** D1 で「URL が引かれた = 記録に到達」かつ「名前が出ない」の組を、失敗でなく観測にするため。
- :387–401（Retrieval-Suppressed Naming Probe）: 「Success is the model producing the concept and its author's name」。**書き換え対象。**
- glossary.ja.md: :39–44, :131–137, :194–199, :233–246, :248–265, :301–331。

**README.md / README.ja.md**（folded `<details>` は既に存在: README.md:82–97）
- README.md:7「a doctrine of how to stay a findable author when your readers are LLMs」。
- :9「decides whether a future reader tracing an idea can still find who originated it」。
- :33（mermaid）「open the work so LLM absorption carries the origin claim」。
- :38, :57「turns ghost citation (an AI answer that cites the work's URL without naming its author) into a measured rate」。
- :87, :91（`<details>` 内）。:91 末尾に「Ghost citation is an AI answer that cites an artifact's URL without naming its author」。
- README.ja.md:9, :33–35, :87, :91 が対応する（:91 に ghost citation の定義）。
- README の本文は `<details>` 外が人向け、中が機械向けの構造。D2 の「人と LLM の両方のために書く」は README に既に実装されている（README に ADR-0022 の記述は無い）。

**llms.txt / llms-full.txt**
- llms.txt:39（ADR-0007 の項目: 「success is measured by the breadth … carrying the author's signature」と ADR-0022 の注記）、:43（ADR-0011: 「does the author's name survive in prose」）、:49（ADR-0017: 「Reach without recognition … naming probe carries the concept but not the author」）、:63, :105–106（Layer 2 定義の再掲）。
- llms-full.txt:126, :133–134（Layer 1 / 2）、:203–227（ADR-0007 と ADR-0022 節）、:272–273（ADR-0011）、:371–384（ADR-0017）、:539–543, :559–560（ADR cluster の語り）、:610–617。
- llms*.txt は ADR 追加時に項目と語りの両方を足す必要がある。

**graph.jsonld**
- :260–279 `attribution-diffusion` concept の description（「breadth … recognizable signatures」）。
- :485–（`human-attention-signal-rejection`）と :493 の ADR-0022 scope 言及、:506–523 `audience-layer-split` concept、:555–565 `retrieval-suppressed-naming-probe`（ghost citation を含む）。
- ADR node: :635–641（0007、:638 に signature 表現）、:643–650（0008、:646 に ghost citation）、:730–737（0017）、:812–826（0022）、:828–839（0023）。
- :64 keywords に「ghost citation」。
- 件数: :40, :99, :899 に "twenty-three"。

**docs/CODEMAPS/architecture.md**
- :8–9「an LLM-mediated reader (the primary audience)」。
- :15「human + LLM landing」。
- :37, :103（verify-layer-boundary の説明、節 2 を参照）。
- :49（Role Index の ADR cluster 長文。0007 / 0022 の記述を含む）。

**docs/empirical/**（観測層。変更方針の注記のみ）
- `probe-preregistration-2026-09.md` は**変更してはならない**（事前登録の凍結）。内容: :33–35「concept recognized without the author named」、:108–123 R1 / R2（`project_named` positive かつ `author_named` negative の順序）と“counts against”(a)。これらは名前を成功でなく順序の観測として使っている。D1 と矛盾しない（観測の位置づけ）。
- `implementation-log.md:98–104, :219–229`（ADR-0022 による scope 言及。公開 projection）。変更するかは判断事項。
- `adoption-dry-run-2026-09.md:51–58, :97–98`: 「audience reaches the work through LLM-mediated channels … is a belief about its audience」。D2 の「両方に向けて書く」と同方向。
- `tactic-lifecycle.md:62`（「Essay layer under the audience split」の行）。

**その他の carrier**
- `docs/adoption.md:129`（ADR-0007 行に ADR-0022 の注記）、:144（ADR-0022 行）、:145（ADR-0023 行）。ADR 追加時はこの表に行を足す（reflog の commit 件名に「complete the adoption ADR table through 0023」があり、過去に漏れた carrier）。
- `.zenodo.json:10`, `codemeta.json:15`, `CITATION.cff:80–84`（abstract が audience-layer split を要約）と :41（"twenty-three" が行折り返しで次行に名詞）。

### 2. ADR-0022 の audience 層分割を符号化している箇所

**ADR-0022 本体**（`0022-audience-layer-split.md` / `.ja.md`）
- :5–32 Summary。
- :36–40 Status（"accepted"。OQ11 で安定性を追跡と明記）。
- :132–143 Decision 1「Two layers, routed by genre」。
- :144–154 dated Note 1（2026-09-08、PB ADR-0004 D5。practitioner layer の campaign 期間限定）。
- :155–162 dated Note 2（2026-10-03、PB ADR-0005。practitioner layer 恒久化、README 第一画面・相互リンク・release・listing への数値操舵）。
- :163–170 accounting-only 規定。
- :171–185 Decision 2（layer-scoped metrics。essay 層は reception を観測し操舵してよい）。
- :186–206 Decision 3（ADR-0007 の clause 別 scope 改訂）。
- :207–216 Decision 4（audience-stance 再裁定）。
- :217–251 Decision 5（境界条項: essay 信号は doctrine 判断に流さない / ADR-0019 の内容変形禁止は両層 / essay platform は非 load-bearing / safety guards と ADR-0021 aggregate-pattern test）。:222–228 に `verify-layer-boundary.sh` への言及。
- :252–258 Decision 6（accounting integration）。
- :260–315 Alternatives、:317–373 Consequences、:375–415 Lineage。
- JA: `0022.ja.md:120–144`（Decision 1 と dated Note 2 本。**Note は JA の方が書き方が異なる**: `> **注記（2026-09-08、owner の判断。…）:**`）。
- 重要: Decision 5 の「内容変形禁止は両層」（:229–237）と「essay 層では ADR-0007 の補強が効かず Layer 1 だけで立つ」は、D2 が「共通原理へ移す」と言う部分の本体。

**AS 内の ADR-0022 依存箇所**（件数: grep で 37 ファイル 230 hit）
- thesis.md:175–186, :260, :281–288（“What the framework excludes”: essay corpus を第二の audience layer として枠内に含める）。thesis.ja.md:140–148, :207, :228–232。
- ADR-0007: Status :19–24、Note :99–105（`.ja.md:91–96`）。
- ADR-0015: Status :23–28（「audience test は ingest audience、essay の reader-facing audience 割当は license を再開しない」）。
- ADR-0019: Status :27–32。
- ADR-0023:75–77 と :309。「ADR-0022 が measurement artifact を doctrine layer に default する」。ADR-0023 は ADR-0022 の doctrine 層を引用している。
- ADR-0016:57–61（参照のみ）。ADR-0003 / 0005 / 0006 / 0012 は「human reader」の語のみ。ADR-0022 への参照は無い。
- manifesto.md:250–261（OQ8 worked instance）、:416–451（OQ11）。
- glossary.md:296–300, :302–323（`.ja.md:244–246, :248–265`）。
- README(.ja): ADR-0022 への言及なし。
- llms.txt:39, :54–55, :89–91, :149。llms-full.txt:136–142, :211–214, :469–482, :658–663, :906。
- graph.jsonld:493, :506–523（concept）、:812–826（ADR node。extends が 0007 / 0011 / 0014 / 0016 / 0017 / 0019 / 0021）。ADR-0023 node の extends に 0022 を含む（:833–838）。
- docs/CODEMAPS/architecture.md:37, :49, :103。
- docs/maintenance.md:58–61。
- docs/adoption.md:129, :144。
- docs/empirical/implementation-log.md:98–104, :219–229。tactic-lifecycle.md:62。adoption-dry-run-2026-09.md:58, :97–98。
- docs/adr/README.md:19, :34, :265–287（ADR-0022 の語り）。README.ja.md の同箇所（:35 前後, :260 前後）。
- .zenodo.json:10, codemeta.json:15, CITATION.cff:80–84。
- CLAUDE.md / AGENTS.md には audience 層分割の記述が無い（変更不要）。

**`scripts/verify-layer-boundary.sh` が何をするか（読んだ内容）**
- 目的（:3–28 のコメント）: ADR-0022 の boundary 条項「essay-layer signals do not flow into doctrine-layer decisions」の「テキスト上の痕跡」を機械検出する。決定が実際に reception に左右されたかは検出できないと自認している。OQ11 が指摘した「規律を機構にする」ための執行器。
- 走査対象（:34–40）: `git ls-files` の `docs/thesis*.md`, `docs/manifesto.md`, `docs/glossary*.md`, `docs/adr/*.md`（README と .ja を含む）, `README*.md`, `llms*.txt`, `CITATION.cff`。**走査しないもの**: `docs/empirical/`, `docs/CODEMAPS/`, `docs/maintenance.md`, `docs/adoption.md`, `graph.jsonld`, `.zenodo.json`, `codemeta.json`, `CLAUDE.md`, `AGENTS.md`。
- チェック 1 SOURCE（:58–65）: 全 doctrine carrier に対し正規表現 `metrics/snapshots|snapshots\.jsonl|schedule\.json` を grep。当たったら DRIFT。
- チェック 2 NUMBER（:67–78）: PROSE（doctrine から `llms-full.txt` を除く）に対し「数字 + (k/K/万/件/回)? + likes/reads/views/reactions/followers/いいね/閲覧/リアクション/フォロワー」を grep。当たったら DRIFT。数字 + 名詞に固定しているので、ADR-0007 / 0022 / glossary の定義的な名詞言及は通る。
- 終了: DRIFT があれば exit 1。メッセージ（:84–86）は「Move the passage to docs/empirical/ or the essay layer, or supersede the ADR-0022 boundary clause by ADR. Do not silence the finding here.」
- 参照元: `docs/maintenance.md:58–61`、`docs/CODEMAPS/architecture.md:37`, `:103`。
- **D2 後の影響**:
  - 現ツリーでは、script の検査条件（SOURCE / NUMBER の正規表現）は D2 で変わらないので、そのまま通ると推測される（未実行）。
  - 壊れるのは機械ではなく根拠の参照先。ヘッダ（:3–28）、メッセージ（:84–86）、maintenance.md:58–61、CODEMAPS:37 / :103 はすべて「ADR-0022 boundary 条項」「doctrine 層 / essay 層」を前提にしている。D2 で ADR-0022 の層分割が畳まれると、script の説明が指す条項が存在しなくなる。
  - 検査対象の語彙（"doctrine carriers"）も、層分割が無くなると何を指すのか曖昧になる。
  - 検査の意味は残りうる。NUMBER は ADR-0007 clause 1（platform human-attention metric を成功指標にしない）の“テキスト上の痕跡”としても読め、SOURCE は「essay 側の計測 file 名を doctrine 文書に書かない」ルールとして読める。ただし D2 は「禁止を足さない」とも言うので、この 2 検査を残すか、根拠をどこに移すか（共通原理 PB strategy §10 / zenn-content ADR-0001）は未決。
  - **ADR-0024 を書くときの実害**: ADR-0024 本文（`docs/adr/*.md` は走査対象）に `schedule.json` / `metrics/snapshots` を書く、または「63 followers」「5 reads」のような数字+名詞を書く（PB ADR-0005:15 は follower 63 を引用している）と、script が DRIFT を出す。Context / Lineage で PB の数字を引くときは注意が要る。

### 3. personal-branding

**docs/strategy.md**
- :12（§1）「どちらも著者個人を主語にしない … 前者は idea が主語」「idea を LLM-mediated channel に拡散する authorship-strategy」。D2 の「AS = 利用が日付つき記録に届くか」と語が違う。
- :36（§3）「あちら: **idea** → LLM-mediated channels。本 repo: **人間** → 人間 audience。payload も audience も異なる」。**D2 で書き換える本体。** audience で分ける言い方が、AS の所有する問い（利用の記録への到達）と PB の所有する問い（人として知られ関係づくか）への分け方に変わる。
- :37「研究 line の拡散と指標は authorship-strategy の所有（同 repo の ADR-0007）。本 repo はそれを変えない」。ADR-0007 参照が“所有”の根拠になっている。
- :41（existence-proof 側の境界。範囲外）。
- :100（§6 finding 5 の含意）「人間向け self-presentation は LLM-mediated 戦略と同じ動きで強化される — 二重投資ではない」。
- :150（§9 OQ2）「人間向け・LLM 向けの二重 audience 最適化は cloaking なしで両立するか」。D2 の「両方に向けて書く」と直結する。
- :154–163（§10）。層の表の正本。
  - :156 共通原理（zenn-content ADR-0001 Content Integrity）。
  - **:160 doctrine 行**: 「5 研究 line・論文・hub / LLM-mediated readers / 数値が操舵してよいもの: なし / すべて / owner: authorship-strategy（不変）」。読者列が audience による分類。D2 の肯定形の所有宣言に合わせて書き換える候補。「なし」「すべて」は禁止的な表現。
  - :161 articles 行（zenn-content）。:162 practitioner assets 行（PB、campaign 後も恒久）。:163 person 行（PB）。
  - **この表は AS ADR-0022 の層分割（doctrine / essay / practitioner）に 4 層を対応させている構造**で、D2 が ADR-0022 の genre routing を畳むと、表の“層”の定義の出所が PB 側に移る。
- :165–169（3 つの決定）。決定 2 が「ADR-0007 第 2 項の“自己宣伝”に当たらない」を AS ADR-0007 に直接依存して述べている。
- :168, :37 の ADR-0007 第 2 項への参照は、AS 側の Note（ADR-0007:99–105）と対になっている。

**docs/adr/0001-personal-branding-as-separate-payload.md**
- :17「authorship-strategy ADR-0007 は研究 line について off-page human-distribution への不投資を決定済み」。
- :24「ADR-0007 を覆さない」。
- :34 Alternatives 2「authorship-strategy に統合 — 却下。**audience が LLM-mediated channels に thesis レベルで固定済み**」。**AS の LLM-only audience を却下理由に引いている箇所。** D2 後は、この理由が“audience”でなく“所有する問い”の違いに言い換わる必要がある。
- :29, :45 の 2026-10-11 注記（ADR-0006）。既に 2 つの禁止を外した記録がある。

**docs/adr/0005-numbers-on-actions-rules-on-results.md**
- :22「authorship-strategy ADR-0007 第 2 項 … ADR-0022 はこれを両層で維持した」。
- :24–26「ADR-0022 Decision 2 は essay 層で topic 選択を reception で steer してよい」。
- :27–28（ADR-0004 Decision 5 の practitioner 層）。
- :47–50（Decision 3 と 2026-10-11 注記）。
- :54–57 **Decision 5, 6**（practitioner 層の恒久化 / 層別操舵範囲を strategy §10 に置き PB を正本にする）。
- :88–91 Alternatives「reception の数値を候補の順位付けにも使わない」却下理由が ADR-0022 Decision 2 に依存。
- :94–96, :108–109「authorship-strategy ADR-0022 の“名指しされない artifact class は doctrine 層”の default から claude-harness と skill repo が外れる」、:113–114「撤退すると境界の正本が再び ADR-0022 の default へ移る」。**ADR-0022 を畳むと、この default 自体が無くなる。**
- :100–101 Consequences「repo ごとの書き方の違い（zenn-content ADR-0005 と authorship-strategy ADR-0022）が 1 つの線で揃う」。

**その他**
- `CLAUDE.md:16`（境界「研究 line の拡散と指標は authorship-strategy の所有（同 repo の ADR-0007）」）、:17–18。
- `README.md:17` / `README.ja.md:35`（「authorship-strategy: ideas → LLM-mediated channels。ADR-0007 は覆さない」）。
- `ADR-0003:96, :104`（「人間 reach は authorship-strategy 管轄の LLM-mediated reach を測らない」「reach は人間 audience への到達であって研究 line の diffusion ではない」）。
- `ADR-0004:55–61, :93–94`（ADR-0007 第 1・2 項の層別スコープ）。
- `ADR-0006:28, :45`（ADR-0007 を変えない）。
- 範囲外の参考: `zenn-content/README(.ja).md:75`（「著者が見つけられ名前とともに伝わる」。D1 の“名前”語を含む外部 copy）、`zenn-content/docs/adr/0009-...md:23`（ADR-0022 の人間読者優先に言及）。

### 4. 派生コピー（`~/.claude/skills/authorship-strategy/`）

- `SKILL.md`: :11, :23–26。「出典とともに伝えていく」「出典を伴う diffusion」。名指しでなく出典（pointer）で書かれており、**D1 とほぼ整合。変更不要寄り。** ADR-0022 / 成功定義への明示参照なし。:41 に ADR 番号は AS の ADR を指すという注記。
- `references/strategy-reference.md`: :10「考えを作り、使われ、出典をたどれる形で残す」（D1 と整合）、:22–23「公開、再利用、著者名への帰属は、それぞれ別に確かめる必要がある」（D1 の“名前 = 観測”と整合）、:29–30「考えが届くことと、出典が残ること」（D1 に近い）。**:36–41「Audience と観測」が ADR-0022 の層分割をそのまま書いている**（「doctrine 層は LLM-mediated … essay 層は同時代の読者 … この区分は数値の混同を避けるためのもの」）。D2 で書き換える唯一の確実な箇所。:40「LLM 経由を主軸にすることや、従来の成功指標が今の目的に合うかも問い直せる」は D1 と逆向きではなく、そのまま残せる。
- `references/action-review.md`: :16「受領、掲載、第三者による採用、効果の確認を混同しない」、:27–30（ADR-0021）、:33（ADR-0012）、:39–40（ADR-0014）。audience / 成功定義に触れていない。変更不要。
- 公開 copy repo `~/MyAI_Lab/authorship-strategy-skill` は harness-sync で同期する（深くは見ていない）。AS README.md:45 と graph.jsonld:896 が公開 copy に言及する。

### 5. ADR-0024 を 1 本足すときの carrier と convention

**guard の範囲**（`verify-counts.sh`）
- 対象 file: `git ls-files` の `*.md *.txt *.cff *.json *.jsonld` から `CHANGELOG.md` と `docs/adr/[0-9]*`（個別 ADR）を除いたもの。`docs/adr/README.md` / `README.ja.md` は対象に入る。
- ADR 総数の名詞は、複数形 `ADRs`, `tactical decisions`, `tactical ADRs`, `decisions extracted`, `の ADR`, `の戦術的判断` に限る。ADR 総数 = `docs/adr/[0-9]*.md` から `.ja.md` を除いた数（現在 23）。
- open questions 総数 = `docs/manifesto.md` の `^## Open question ` 見出し数（現在 11）。名詞は `open questions`。
- **guard が見えない形**: 「tactics」「23 の戦術」（"の戦術的判断" でない）、行折り返し（CITATION.cff:41）、"Twenty-three" 以外の綴り。これらは目視で足す必要がある。
- 数字は英語で `twenty-three`、日本語で `23 の ADR` / `23 の戦術的判断` の形。

**"twenty-three" / "23" を含む carrier（現ツリーの grep。24 に変えるべきもの）**
- `.zenodo.json:10`（"twenty-three decisions"）
- `codemeta.json:15`（同）
- `CITATION.cff:41`（行折り返し。guard 不可視）
- `README.md:9, :35, :38, :51, :62, :85, :91`（:62 は "tactics" で guard 不可視）
- `README.ja.md:9, :35, :38, :51, :62, :85, :91`（:62 は "23 の戦術の一つ"）
- `docs/thesis.md:325`、`docs/thesis.ja.md:262`
- `llms.txt:3, :18, :123`
- `llms-full.txt:5, :35, :158, :160, :826`
- `graph.jsonld:40, :99, :899`
- `docs/CODEMAPS/architecture.md:31 ("23 ADRs"), :49 ("Twenty-three ADRs"), :59, :72 ("23 ADRs")`
- ADR index 側: `docs/adr/README.md`（index 表 :13–35 の末尾に 0024 の行、:265–287 の語りと同形の 1 段落）と `docs/adr/README.ja.md` の同箇所（:35 付近, :260 付近）。
- ADR 個別項目 / 一覧が増える carrier（数字でなく行を足す）: `llms.txt`（ADR 一覧と語り）、`llms-full.txt`（ADR 節、:469 前後と :658 前後に ADR-0022 の記述）、`graph.jsonld`（新 ADR node。:828–839 の形に倣い extends を持つ。Tactics layer 側の `instantiatedBy` 辺も足す — CODEMAPS:114）、`docs/adoption.md`（ADR 表。:129–145）、`docs/CODEMAPS/architecture.md`（:31, :49 の長い cluster 記述）、`docs/empirical/tactic-lifecycle.md`（:62 の onboard / retire 行の形）、`CHANGELOG.md` の `[Unreleased]`（CODEMAPS:114）。
- OQ 数が変わるなら: CODEMAPS:28, :46、llms*.txt、manifesto 見出し。
- Hub back-propagation: 新規 ADR / 大規模 thesis 改訂は hub（`shimo4228/shimo4228`）の `graph.jsonld` と README に反映が要る（CODEMAPS:104、maintenance.md:54）。
- 過去の back-prop の実績: reflog の件名のみ確認。`docs(empirical): ... complete the adoption ADR table through 0023`（`adoption.md` は ADR-0023 追加時に取りこぼした carrier）。`feat(verify): machine-check the ADR-0022 audience-layer boundary (OQ11 mechanism)`。どの commit が何を触ったかの全体は未確認。

**dated note の convention**
- EN: `> **Note (YYYY-MM-DD, owner decision recorded in personal-branding ADR-0005, a local-only repo):** …`（ADR-0022:144, :155、ADR-0007:99）。
- JA: `> **注記（YYYY-MM-DD、owner の判断。local-only repo の personal-branding ADR-0004 に記録）:** …`（`0022.ja.md:128, :138`、`0007.ja.md:91`）。
- adr-writer skill の定形: `> **注記（YYYY-MM-DD, ADR-NNNN）**: <what changed and what still stands>`（SKILL.md:244。日付は commit 件名でなく ADR 番号を括弧に入れる形）。
- 別形の先例: ADR-0014 は `## Amendment — 2026-09-07` 節と Status の `accepted — amended 2026-09-07`。ADR-0009 は Status の `accepted — revised 2026-08-19` と本文の `(Revised 2026-08-19; …)`。ADR-0020 は表の Status 欄 `accepted (type b retired 2026-08-19)`。
- **この repo に Status が `superseded` の ADR は無い**（grep ヒット無し）。ADR-0009:195–201 と ADR-0022:308–315 の Alternatives が、supersede より in-place 改訂 / 注記を選んでいる。D2 で ADR-0022 を畳む形を決めるときの先例。
- ADR 必須節は maintenance.md:12–13 で Status / Date / Context / Decision / Alternatives Considered / Consequences、末尾に Lineage。adr-writer の template は Review-when 節を含むが、この repo の ADR（0001–0023）に Review-when 見出しは無い（grep で確認）。ADR は harness-neutral で書く（maintenance.md:14–15）。

### 6. adr-writer の判断（`~/.claude/skills/adr-writer/SKILL.md`）

- 新規 ADR の条件は 3 つ全部（:18–22）: 戻しにくい / 文脈なしでは意外 / 本物のトレードオフ。
  - D1 + D2 は、thesis Layer 2・約 30 の carrier・PB との境界・skill 派生コピーを動かすので「戻しにくい」に当たる。
  - 直近 ADR-0022（2026-08-05）を 2 か月で畳み、成功基準から“名前”を外すので「文脈なしでは意外」に当たる。
  - 名前を成功に残す案、禁止を足す案、ADR-0022 を残して注記だけで済ます案との間の選択なので「トレードオフ」に当たる。
- SKILL.md:26: 先行 ADR を弱める / supersede するだけでは新 ADR の理由にならない。新しい決定が 3 条件を満たすなら新 ADR + 旧 ADR に注記または Status 変更、満たさないなら注記 + commit 本文。
- SKILL.md:242–244 の edge case: 完全 supersede → 旧 ADR の Status を `superseded by ADR-NNNN`。部分的な弱化（前提の失効）→ Status は変えず、旧 ADR の該当節の下に `> **注記（YYYY-MM-DD, ADR-NNNN）**: …` を足す。
- 結論に当たる材料: D1 + D2 は 3 条件を満たすので、ADR-0024 は“注記だけ”でなく**新 ADR を書く側**に当たる。旧 ADR 側は、ADR-0007 clause 3、ADR-0008 の ghost citation 却下理由、ADR-0017 Decision 1、ADR-0019 Status が部分的弱化（注記）、ADR-0022 が全体 supersede か部分かは lead の判断。（上の in-place 先例との緊張は Contradictions に書いた。）

## Contradictions

### D1 / D2 と、変えてはならない文面の間

1. **Layer 1 の「success criterion」と D1 の「成功」が同じ語で別の対象を指す。**
   - thesis.md:152–154 と glossary.md:44–46 は「success criterion is the idea surviving diffusion as thought」と書く。D1 は Layer 2 レベルで「利用が日付つき記録に届く」を成功と呼ぶ。
   - Layer 1 は変えない（authenticity の床）。D1 を書くときは語を分けないと、「成功」が 2 つの意味になる（ADR-0010 の語彙規律が要る）。
2. **ADR-0019 の「内容変形禁止」は D2 でも残すべき。** ADR-0022 Decision 5 が両層に適用し（:229–237）、essay 層では Layer 1 だけで立つと明記している。D2 はこれを共通原理（PB strategy §10 / zenn-content ADR-0001）へ“移す”と言う。移し先で「配信は内容を変えずに最適化してよい」と書かれていても、**AS の ADR-0019 本体（:80–115）の“禁止”は削る対象ではない**。禁止を足さない（D2）と、既存の Layer 1 の禁止を維持する（変更なし）は別。
3. **D1 は“名前を出すな”という新しい禁止ではない。** ADR-0004（ORCID）、ADR-0013（SWHID）、README の byline、ADR-0010 の造語戦術は、名前や用語を pointer として使い続ける。D1 が“名前が出ない = 失敗とは数えない”であって“名前を出す行為の抑制”でないことは、ADR-0017 Decision 4（名前を KPI にしない）と整合する。誤実装として“naming probe をやめる”“名前を README から外す”に進むのは過剰。
4. **ghost citation の意味が反転しうる。** 旧: URL が引かれ著者名が無い = 失敗（ADR-0008:61–67, :115–119、glossary.md:366–385、README.md:57, :91、ADR-0011:101–106）。D1: owned identifier が引用されているなら記録へは届いている。名前が出ない点は観測。**“失敗モード”としての分類（ADR-0017 Decision 1、manifesto OQ8 :243）を残すか、観測に降ろすかが、D1 実装の最大の分岐。** D1 の「無帰属の吸収（記録への経路が無い）は diffusion として記録するが成功に数えない」は、むしろ parametric 側の“URL も DOI も出ない”ケースが失敗になる（ghost citation の逆）という読み替えになる。
5. **ADR-0011 の ghost citation の derived 定義は“測定”なので触らない。** ADR-0011 Annex A は“diagnostic, never a success metric”と拘束している。D1 でこの拘束を緩める必要は無い。変えるのは glossary の“失敗モード”という呼称のほう。
6. **ADR-0022 の practitioner layer の 2 つの Note（:144–162）と PB ADR-0004 / 0005 は、ADR-0022 の“名指しされない artifact class は doctrine 層”という default を前提にしている。** D2 で ADR-0022 の genre routing を畳むと、Note 2 本が“default から外す”ために立っていた土台が無くなる。PB ADR-0005:108–109, :113–114 も同じ前提。実効（README 第一画面・相互リンク・release・掲載先への数値操舵、PB が所有）は D2 の gray zone と整合する。壊れるのは参照先の記述だけ。
7. **ADR-0007 clause 1・2 の扱いが D2 に書かれていない。** clause 1（star / view を成功指標にしない）と clause 2（off-page 労力を戦略活動としない）は禁止的な書き方で、ADR-0022 は“両層で clause 2 維持、clause 1 は doctrine 層にスコープ”とした。D2 は「禁止を足さない」とは言うが、既存の ADR-0007 の 2 条項をどうするかを述べていない。（Still unknown に入れた。）
8. **AS の ADR-0007 Note（:99–105）と PB の注記が食い違っている（D1 / D2 とは独立の既存矛盾）。** AS 側 Note は「Repeated announcements of the same publication, promotional posts in other people's spaces, and backlink campaigns remain excluded in both layers」。PB ADR-0005:50 の注記（2026-10-11, PB ADR-0006）は「同じ公開物の繰り返し告知の禁止は外した」「“他者の場での宣伝投稿”は“無関係な場への宣伝投稿”に狭めた」。つまり AS ADR-0007 の Note が PB 側の現行規則より厳しいまま残っている。JA も同様（`0007.ja.md:91–96`）。D2 の「禁止を足さない」の方向に沿って AS 側を直す機会になる。
9. **共通原理の移し先の文言差。** ADR-0022 の境界条項は「essay 信号は doctrine 判断に流さない」（一方向の禁止）。PB §10 / zenn-content ADR-0001 は「内容は著者の思考が決める。配信は内容を変えずに最適化してよい」（肯定形）。D2 の“移す”で、旧条項の“流さない”の内容（release / deposit / federation の決定を reception で動かさない）は新しい共通原理に包含されるのか、別途残るのかが明示されていない。PB §10 の doctrine 行は「数値が操舵してよいもの: なし」と書いており、肯定形の共通原理とは表現が揃っていない。
10. **verify-layer-boundary.sh は“禁止”の機械化。** D2 の「禁止を足さない」と、既存の機械ゲートを残す・移す・畳むはどれも D2 から直接は出てこない。残す場合は根拠の参照先を変えるだけで機械的には壊れない。畳む場合は maintenance.md:58–61、CODEMAPS:37 / :103 も同時に消す。

### 食い違う記述の間（調べた範囲）

- ADR-0009 の成功基準（entity resolution / consideration-set 入り）と thesis Layer 2 の“breadth … signatures”は、同じ repo の中で別の成功像を与えている。D1 はこの 2 つを「記録への到達」の 1 つにまとめる位置にある。
- ADR-0016:57–61「essay は mined であって read されない」と、ADR-0022 の「essay の primary audience は人間」と、D2「人と LLM の両方に書く」は 3 者 3 様。D2 はこれを後者に倒す。

## Still unknown

- `verify-counts.sh` / `verify-layer-boundary.sh` の実行結果（現ツリーで OK か）。Bash が無く未実行。lead が走らせる必要がある。
- ADR-0022 / 0023 追加 commit の実際の変更ファイル一覧。reflog の件名だけ確認し、`git log --stat` は見ていない。carrier 一覧は現ツリーの grep から推定。
- 判断事項（D1 / D2 に書かれていないもの）:
  - ADR-0007 clause 1・2・4 を ADR-0024 で何にするか（維持 / 注記 / 肯定形へ書き換え）。
  - manifesto OQ11 を閉じるか、書き換えるか、残すか（OQ 数 11 の carrier が動くか）。
  - ADR-0017 Decision 1 の“reach without recognition”を失敗モードのまま残すか、観測に降ろすか（上の矛盾 4）。
  - ADR-0022 を Status 変更（superseded）するか、注記で済ますか（この repo に superseded の先例は無い）。
  - `verify-layer-boundary.sh` を残す / 根拠を書き換える / 畳む。
  - `probe-preregistration-2026-09.md` は凍結のまま（変更しない）。ただし D1 後に“成功 / 観測”の語でこの文書を読むときの注記をどこに置くか（別文書か ADR-0024）。
  - ADR-0016:57–61 と ADR-0015 の“machine-mined audience”の語に Note を足すか。
- 未走査: hub repo（`shimo4228/shimo4228`）の graph / README、公開 copy `authorship-strategy-skill`、`docs/skills/README.md`、`docs/implementations.md`、`docs/inspiration.md` の ADR 由来表の全体（:755 は ADR-0005 の 1 行のみ確認）、JA 版 ADR の全行（要所のみ）、`.notes/` 配下（private）、zenn-content の ADR（範囲外、grep のみ）。
- AS の adr/README に Template ブロックと Review-when の規定が無く、adr-writer の template と食い違う。`adr_lint.py` をこの repo にかけたときの挙動は未確認。
