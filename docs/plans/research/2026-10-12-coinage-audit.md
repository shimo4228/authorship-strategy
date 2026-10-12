kind: external

# 造語棚卸し: ADR-0010 の 3 条件と本文での反復で、プログラム内の造語 94 語を判定する（as-of 2026-10-12）

判定規則は [ADR-0010](../../adr/0010-vocabulary-discipline.md) の Decision。造語してよいのは join-novelty（既存語が覆わない）、definitional anchoring（既存語彙だけで 1 文定義できる）、uncontested namespace（置き換えるべき確立した用法がない）の 3 つがすべて成り立つときだけで、残す語には glossary 定義・上流 citation・graph 節点と edge・本文での反復が要る。再出現の閾値は ADR-0010 Lineage の「約 3 回」を使った。RFC-0015（2026-10-12 withdrawn）が「汎用語を足すより造語を減らす」と切り替えた経緯を受け、本報告はその棚卸し本体にあたる。判定の根拠は 2026-10-12 時点の repo 内 grep と外部検索で、次の OQ5 sweep、または Harness-Zero 系の追随記事が出た時点で scaffold dissolution と ghost citation の行を再検索すると失効を避けられる。

## 1. Summary

判定対象は 94 語。hub の `concepts_data.json` で `coined` の 15 語と `distinctive` の 2 語（表 A、17 語）と、各 line の glossary が coined または framework-specific と示す補足語 77 語（表 B）。`coined-name` の 5 語（line 名）と `adopted` の 1 語（four-contemplative-axioms）は判定していない。

| 判定 | 表 A（17 語） | 表 B（77 語） | 計 |
|---|---|---|---|
| keep | 8 | 31 | 39 |
| plain phrasing | 5 | 38 | 43 |
| replace with 確立語 | 3 | 5 | 8 |
| merge into 他の造語 | 1 | 3 | 4 |

plain phrasing が最多なのは、CA の ADR slogan 群と AAP の essay 7 派生語が、定義した ADR 1 本と glossary にしか現れないため。ただし CA の slogan は ADR 本文では普通の英語として働いているので、実質の作業は glossary の slogan 一覧から外すだけで済む。

切る根拠が最も強い順に 5 語を挙げる。

1. **attention ceiling**（AKC）。規範文書での出現が 0 件で、出るのは glossary 1 行と CHANGELOG 1 行だけ。glossary が出典とする ADR-0010 に文字列がなく、graph には節点がない。同じ概念が graph では "cognitive economy"、ADR では題 "human cognitive resource as central constraint" と別名で書かれている。
2. **two-channel attribution diffusion**（AS）。4 語のフル名は規範文書で 0 件。本文は "two-channel"、"parametric channel"、"retrieval channel" で書かれている。この対立は RAG 論文以来の確立語 "parametric / non-parametric memory"（Lewis ほか 2020）で足りる。
3. **identifier-federation triplet**（AS）。AS の glossary に項目がなく（hub の `glossary_url` は `#doi-federation` を指す）、AS 自身の graph にも節点がない。hub 側の節点は name と description だけで edge が 0 本。3 本の ADR を束ねる参照ラベルで、DataCite の "PID Graph" が近い確立語として存在する。
4. **value-layer harness engineering**（hub）。「3 つの agent-design line を貫く through-line」と定義されているのに、その 3 line の README と ADR に 0 件。出現は hub の README・CLAUDE.md と claude-harness の ADR に限られる。
5. **ghost citation**（AS）。namespace 条件に落ちる。arXiv:2602.06718（GhostCite）が同じ綴りを「捏造された引用」の意味で使っている。ADR-0010 Lineage の「採用した語」という記述と glossary の「framework 自身の term」という記述も食い違う。本文での反復は多い（規範 12 ファイル）。

scaffold dissolution について、依頼時点で観測されていた 2 つの競合語は置換語にならない。**"harness distillation" は逆側**で、arXiv:2609.24974 と Arize の記事は、harness の振る舞いをモデル重みへ蒸留することを指す。AAP が「不健全な内面化」と呼ぶ側にあたる。**"harness impermanence" は 1 ページのみ**で、「消しやすく書く」設計規律を述べる。独立した第二の用例は見つからなかった。実際に同じ機構を覆う確立語は教育学の **scaffold fading**（Wood・Bruner・Ross 1976）で、AKC の定義自体が Vygotsky 由来と述べている。3 条件に当てはめると replace になる（不確実）。反復と到達範囲は全造語中で最大（約 15 repo）なので、撤去コストも最大になる。§3.2 で扱う。

## 2. 表 A: 判定対象 17 語

列の読み方。「規範」は owner repo の EN の README・CLAUDE.md・docs 本文・ADR 本文でその語が出るファイル数。glossary、graph、llms、metadata、CHANGELOG、plans、rfcs、ADR 索引、JA 双子は数えない。「全体」はそれらも含めて語が出るファイル数。edges は graph 節点の関係 property（composedOf、downstreamOf、pairedWith、extends、groundedIn、citation、instantiatedBy、derivesFrom、contrastsWith、hasFailureMode、appliesTo、about、workExample）を、節点から出る数／他節点から入る数で示した。sameAs・subjectOf・recordedIn・definedBy は数えない。件数は glob の差で ±2 程度ぶれうる。

| 語 | owner と定義位置 | 規範／全体 | 他の line と衛星 repo | edges 出／入 | 競合語（URL） | 判定 | 理由 |
|---|---|---|---|---|---|---|---|
| three-axis inversion | AS `docs/glossary.md:20`、thesis | 8／20。README 本文は "the inversion" で、語そのものは AI 向け `<details>`（README.md:91）にだけ出る | 他 line 0。衛星は doctrine-corpus 7 ファイル、authorship-strategy-skill 2、-rules 2（凍結） | 3／1 | 見つからず（完全一致検索、2026-10-12） | keep | thesis 2、manifesto 5、ADR 複数で反復する。概念でなく主張レベルの造語で、既存語が覆わない。 |
| attribution diffusion | AS `docs/glossary.md:51`、ADR-0008 | 16／43 | EP の doctrine.md ほか 3 ファイル。衛星は doctrine-corpus、skill/rules、claude-harness ほか約 6 repo | 4／5 | 近傍に credit diffusion（[Radicchi ほか 2009](https://arxiv.org/abs/0907.1050)、snippet 確認のみ）。同一概念ではない | keep（名前の再検討は不確実） | 最も反復する語。ただし ADR-0024 以後は「著者名は観測であり要件でない」ので、名前の attribution が定義より広い。AAP との disjoint 注記を各所に要する。 |
| two-channel attribution diffusion | AS `docs/glossary.md:355`、ADR-0008 | フル名は 0／5。短形 "two-channel" は 16 ファイル | 0 | 11／3 | parametric / non-parametric memory（[Lewis ほか 2020](https://arxiv.org/abs/2005.11401)） | merge into attribution diffusion | フル名は本文で一度も繰り返されない。「attribution diffusion の parametric / retrieval の 2 経路」と書けば足りる。 |
| idea-versus-scaffold separation | AS `docs/glossary.md:114`、thesis | 7／22 | 衛星のみ（rules、skill、doctrine-corpus、claude-harness の一覧）。他 line 0 | 5／4 | 見つからず | keep（不確実） | 反復と edge と上流 arXiv 3 本が揃う。AKC の scaffold dissolution と judgment lineage、mental model vs instance、AAP の "implementation dissolves, judgment persists" と意味が重なる。#10 を置換するなら連動して見直す。 |
| retrieval-suppressed naming probe | AS `docs/glossary.md:408`、ADR-0011 | 正式名は 5／18。非公式名 "regurgitation test" は 8／25。README は "a naming probe" | 0 | 11／1 | closed-book 設定（[Roberts ほか 2020](https://arxiv.org/abs/2002.08910)、abstract は設定を述べるが語は未確認） | plain phrasing: 「naming probe（検索オフ）」と「citation probe（検索オン）」 | 本文は正式名でなく "regurgitation test" や "naming probe" で書いている。正式名は 3 語の修飾子が「検索オフ」を言い直しただけ。 |
| vocabulary discipline | AS `docs/glossary.md:265`、ADR-0010 | 13／35 | CA ADR-0074 に 1。衛星は citation-sync、release-doi、claude-harness の skill | 8／1 | terminology management（単一の定義源なし） | keep | 造語でなく ADR-0010 の規則の呼び名（hub の origin_en が "no coinage is claimed" と明記）。3 条件の対象外で、反復もある。 |
| identifier-federation triplet | hub のみ（`concepts_data.json:359`、hub `graph.jsonld:313`）。AS glossary に項目なし | 7／約 29。README と thesis には出ない。ADR 内の参照ラベル | AKC・AAP の CHANGELOG に 1〜2 行。release-doi に 4 ファイル | AS graph に節点なし。hub 節点は 0 | PID Graph（[DataCite 2024-07-11](https://datacite.org/blog/datacite-connections-a-case-study-on-fair-island-project-metadata/)） | plain phrasing: 「DOI federation（ADR-0001〜0003）」 | glossary 定義と graph edge の義務を満たさない。出現回数は足りるが、3 本の ADR の束ね名にとどまる。 |
| harness alignment（harness drift を含む） | AKC `docs/glossary.md:181`／`:200`、ADR-0017 | 5／19 | AAP thesis に 1。claude-harness ADR-0019。human-gate は凍結 | alignment 6／―、drift 5／― | 第三者の "harness alignment" は見つからず。"harness drift" は別義 3 件（§3.9） | keep | 先行 drift 語との lineage 監査済みで、edge が 11 本あり prior art へ張られている。標題に含む位置論文が Zenodo にあり不変。drift の綴りは他用例と競合する。 |
| attention ceiling | AKC `docs/glossary.md:37` | 0／2 | 0 | 節点なし（近傍の "cognitive economy" は 1／1） | approval fatigue と automation complacency（§3.1） | plain phrasing: 「operator の注意予算」（ADR-0010 の題を使う） | 規範 0 件、graph 節点なし、glossary が挙げる出典 ADR に文字列がない。 |
| scaffold dissolution | AKC `docs/glossary.md:160`、`docs/scaffold-dissolution.md`、ADR-0022 | 10／約 24 | CA の ADR 4 本、AAP の glossary と ADR-0007、AS の rfcs。衛星は約 10 repo | AKC 1／1。hub 節点は 0 | scaffold fading（教育学）。weights 側の harness distillation（[arXiv:2609.24974](https://arxiv.org/abs/2609.24974)）。harness impermanence（[agentpatterns.ai](https://agentpatterns.ai/patterns/agent-design/harness-impermanence/)、1 ページ） | replace with scaffold fading（不確実。撤去コスト最大） | §3.2。AKC 自身が Vygotsky 由来の「消えるための構造」と書く。edge は少なく、Vygotsky への上流 edge も graph にない。 |
| security by absence | CA `docs/glossary.md:113`、AAP `docs/glossary.md:102`、AAP ADR-0001 | CA 15／約 60。AAP 約 15 | AKC の ADR 3 本、EP、doctrine-corpus。衛星は llm-agent-security-principles、chaos-tdd-fault-injection、contemplative-agent-rules、contemplative-mcp | CA・hub の節点は 0。AAP は prohibition-strength hierarchy 経由 | least functionality（[NIST SP 800-53 Rev.5](https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final)、CM-7 の本文は未取得） | keep | 3 line と衛星で反復し、「grep で答えられるか」という検査が定義に入っている。least functionality は一部を覆うが、「実装しない」までは覆わない。ADR-0010 の定めどおり上流として cite する。 |
| four business AI quadrants | AAP `docs/glossary.md:214` | 約 12／約 40 | doctrine-corpus 4 ファイル、agent-adoption-triage 5、CA ADR-0033 | 4／0 | workflows と agents の区分（[Anthropic 2024-12-19](https://www.anthropic.com/engineering/building-effective-agents)）。縦軸の片方に重なる | keep | 反復、edge、衛星が揃う。縦軸の一方は Anthropic の区分と重なるが、決定論 vs 意味判断の軸は他に見つからない。 |
| attribution gap | AAP `docs/glossary.md:353`、ADR-0009 | 約 15／約 30 | CA ADR-0033 に 2。agent-adoption-triage に 4。AS に 1 行 | 2／0。外部参照 edge は 0 | responsibility gap（Matthias 2004、DOI 10.1007/s10676-004-3422-1）。マーケティングと interpretability に別義（§3.5） | replace with responsibility gap（「ex-post separability 形」と注記）（不確実） | AAP glossary 自身が responsibility gap の狭い形と書いている。綴りが他分野で確立した別義と衝突し、AS の attribution との衝突で disjoint 注記も要る。 |
| existence proof format | EP `docs/glossary.md:22`、`docs/format/spec.md` | 約 14／約 38 | einstein-arena（instance #1） | 1／0 | 同名の第三者文書は見つからず。"Proof of Existence"（blockchain 公証）は別物（[Cardano CIP-0190](https://cips.cardano.org/cip/CIP-0190)） | keep | 成果物（document format）の名前で、反復も実例もある。衝突確認は 2026-06-05 に記録済み。 |
| gatekeeper inversion | EP `docs/glossary.md:6` | 約 13／25 | 0 | 1／1 | algorithmic gatekeeping（EP glossary が先行研究の厚さを自認） | replace with algorithmic gatekeeping（仮説は平叙で書く） | repo 自身が origin claim を主張していないのに、hub の label は `coined` のまま。仮説の呼び名で、概念としての新規性を持たない。 |
| oracle debiasing | EP `docs/glossary.md:14` | 約 13／28 | 0 | 1／0 | "oracle de-biasing" が統計と LLM routing の論文に節見出しとして存在（§3.6、snippet のみ） | plain phrasing: 「検証可能な証明を LLM の feasibility 回答面へ供給する」 | glossary 自身が debiasing の一般義と別物と断っている。名前が約束する意味と実際の意味が離れている。 |
| value-layer harness engineering | hub `concepts_data.json:709`、hub `graph.jsonld:363` | line repo で 0。hub の README と CLAUDE.md に各 1 | claude-harness の ADR-0037 と ADR-0019 | 4／0 | harness engineering（一般語）。第三者の同名用例なし | plain phrasing: 「価値規範を harness の rules 層に置き、他の層と同じ人間承認で扱う」 | through-line と称する 3 line のいずれの README・ADR にも出ない。部品の "harness engineering" は確立語、"value layer" は CA が既に使っている。 |

## 3. 個別 notes（表に収まらない根拠）

### 3.1 attention ceiling

`attention ceiling` を含むのは AKC の `docs/glossary.md:37`、CHANGELOG 1 行、hub の `concepts_data.json` 3 行だけ。glossary は出典を ADR-0010 としているが、ADR-0010（`0010-human-cognitive-resource-as-central-constraint.md`）に文字列はない。graph には同じ内容の節点が "cognitive economy"（"Treats human attention and judgment as the scarce resource"）という別名で立っている。つまり 1 つの概念に 3 つの名前（glossary、graph、ADR 題）があり、どれも本文では繰り返されない。外部では "attention ceiling" の第三者用例は見つからず（2026-10-12）、近い議論は approval fatigue、automation complacency（Parasuraman と Manzey 2010。AKC glossary が既に cite）、oversight fatigue として書かれている。

### 3.2 scaffold dissolution と依頼時点で観測されていた 2 つの競合語

| 競合語 | 何を指すか | 確立度 | 覆う範囲 |
|---|---|---|---|
| harness distillation（[Arize、2026-09](https://arize.com/blog/agent-harness-distillation/)、[Harness-Zero、arXiv:2609.24974、2026-09-21](https://arxiv.org/abs/2609.24974)） | harness が与えていた振る舞いをモデル重みへ訓練で移す。Arize は "can train general scaffolding into a model" と書く | 新興。一次の出典は論文 1 本で、Arize は論文を紹介する二次記事（独立した第二の用例ではない） | AAP が「不健全な内面化（モデル重みへ）」と呼ぶ側。AKC の「健全な溶解（人間の認知パターンへ）」とは逆側 |
| harness impermanence（agentpatterns.ai、last_reviewed 2026-09-09） | scaffolding を「将来のモデルが吸収する前提で、消しやすく書く」設計規律。定義文は "the discipline of authoring agent scaffolding" | 1 ページのみ（one-off）。ページは語の出自を特定の著者に帰さず、Google と Phil Schmid の文章を外部根拠に挙げる。その帰属は未確認 | 「消えるのが意図された終着」の設計側だけ。人間側の内面化は覆わない |
| scaffold fading（教育学。Wood・Bruner・Ross 1976、DOI 10.1111/j.1469-7610.1976.tb00381.x） | 学習者の能力が育つにつれ支援を段階的に外す | 教育学で 40 年以上の確立語（検索結果の要約で確認、原論文の本文は未取得） | AKC の定義（operator とエージェントが cycle を内面化し、skill ファイルが不要になる）と同型 |

結論。依頼時点の 2 語は置換語にならない（一方は逆側、他方は 1 ページ）。ただし 2026-09 に重み側の語が一次の論文と紹介記事で現れたことで、AAP の「健全／不健全」の対を「scaffold fading ／ harness distillation」と確立語で書き直せる状況になった。ADR-0010 の既定（確立語の採用）に従うなら replace になるが、AKC の 10 規範ファイル・約 15 repo・CA の instrument dissolution mandate（ADR-0101）まで及ぶので、撤去コストは全語中で最大。反復という点では最も「育った」造語でもある。判断は著者に委ねたい。不確実としたのは、「溶解」が持つ「終着であって後退でない」という含意が「fading」にあるか、本報告では判定できないため。

### 3.3 two-channel attribution diffusion と retrieval-suppressed naming probe

AS の README 本文は "a naming probe"、thesis は "regurgitation test" を使う。つまり本文は長い造語名を避けて平易な名で書かれている。ADR-0011 の標題は `two-channel-probe-protocol` で、ここも "two-channel" と短い。graph 節点の `groundedIn` は 9 本ずつあり、上流 citation の義務は果たされているので、名前を短くしても上流 edge は残せる。

### 3.4 ghost citation

- **namespace**: [arXiv:2602.06718](https://arxiv.org/abs/2602.06718)（GhostCite、2026-02-06 提出、v2 は 2026-05-14）は、abstract で LLM が捏造する引用を "ghost citations" と呼ぶ。AS の用法は「URL は引用するが著者名を出さない」で、現象が別。AS glossary も末尾でこの衝突を認めている。
- **記録内の矛盾**: ADR-0010 Lineage は ghost citation を「引用の妥当性に関する 2026 年の文献から採用した語（coined の同義語としてでなく）」と書き、graph も "this research line adopts the term" と記録する。一方 AS glossary（`docs/glossary.md:391-392`）は "This attribution-loss sense is the framework's own term" と書く。どちらかに揃える必要がある。
- **既存の判断との関係**: RFC-0022（rejected 2026-08-04）は、2 つの用法の区別を論じる防衛的な記事を書かないと決め、理由を「二つの用法は実質的に同じ事象を指す」としている。GhostCite の abstract の定義（捏造された引用）と glossary の定義（実在する URL の引用で著者名がない）は現象として別なので、RFC-0022 の前提は abstract と合わない。ここでの判定は記事を書くかどうかでなく、語を残すかどうかの話で、RFC-0022 の guard（記事を再提案しない）とは衝突しない。
- **反復**: 規範 12 ファイル（README、manifesto 4、ADR-0008、0010、0011、0015、0016、0017、0024、conformance ほか）。graph には節点がなく、説明文の中にしか出ない（ADR-0010 の anchoring obligation に反する）。
- **撤去の副作用**: probe の検出結果に "ghost-citation" 項目があり（`shimo4228/probes/`、append-only）、リネームするとデータ列名が変わる。ラベルだけ平叙に替えて列名は残す選択肢がある。

### 3.5 attribution gap

"attribution gap" は他分野で確立した別義を持つ。マーケティングでは広告費と成果の対応が取れない隔たり、interpretability では説明手法の主張とモデルの実挙動の隔たり（検索結果の要約で確認、一次資料の本文は未取得）。AAP の定義は「複数の判断要素が runtime で混ざり、事後に寄与を分けられない」で、Matthias（2004）の responsibility gap を ex-ante の予見可能性から ex-post の分離可能性へ狭めた形だと AAP glossary 自身が述べている。graph 節点は Matthias への上流 edge を持たない（glossary には引用がある）。hub の日本語名は「寄与の事後分離不能ギャップ」、AAP graph の日本語名は「帰責ギャップ」で、揃っていない。

### 3.6 oracle debiasing

glossary は debiasing の一般義（モデル内部のバイアス除去）と別物と注記している。検索で "oracle de-biasing" が arXiv:2606.11263（固有空間摂動の論文）と arXiv:2606.26836（LLM routing の論文）の節見出しとして挙がったが、abstract を取得すると両方ともこの語を含まなかった。節見出しの存在は snippet の確認止まりで、未確認と扱う。

### 3.7 value-layer harness engineering

hub の定義は 3 line を貫く縦糸だが、その 3 line の README・ADR で使われていない。CA の glossary には既に "value layer"（72 ファイル以上で使用）があり、AKC の cycle が "genre-neutral" である点と合わせて意味は足りる。probe の検出辞書（`probes/config/probes-v10.yaml` の `project_terms.value_layer`、v4 で追加）が 5 つの綴りを追跡している。

### 3.8 three-axis inversion

README の本文は "The inversion (core thesis)" の見出しと表で説明し、語そのものは AI 向け `<details>` にしか書かない。thesis（9 行）と manifesto（12 行）も "inversion" や "three axes" と短く書く箇所が多い。判定は keep だが、語を残す利点は主に AI 向け surface と probe（`concept-inversion`）に偏る。

### 3.9 harness drift の綴りの競合

AKC glossary は benchmark-comparability の意味での用例（Moghadasi と Ghaderi 2026）を既に記録している。検索ではさらに、製品名 Harness（harness.io）の IaC drift detection の文書群と、事業者 glossary の "Harness Exposure Drift"（エージェントが承認範囲を超えて権限を得る現象）が上位に出る。いずれも別義で、検索 retrieval 上の名前ノイズになる。"harness alignment" は第三者用例なし。

### 3.10 補足語のうち、判定に追加の根拠が要るもの

- **arrival 系**: "arrival" は一般語の stipulative な語義で、造語ではない。ADR-0024（2026-10-11）の語であり、規範文書での出現はその改訂波以降。arrival proxy は一般語 "proxy metric" で足りる。use with arrival は「記録へ戻る use」と平叙で書ける。graph に節点がなく、ADR-0010 の anchoring obligation（graph 節点と edge）を満たしていない。
- **pre-named gap-bearer**（AAP）: 16 ファイル・80 行で使われる中核語だが、glossary に見出しがない。Sponsor 項（`docs/glossary.md:170`）が `#pre-named-gap-bearer` へリンクするが、アンカーは存在しない。keep とし、glossary 項を足す。
- **self-reingestion**（AKC）: model collapse 文献の "self-consuming loop"（例 [arXiv:2402.07087](https://arxiv.org/abs/2402.07087)、snippet のみ）と近いが、AKC が扱うのは agent の notes や rules で、モデル訓練ではない。置換でなく plain phrasing とした（不確実）。
- **expiry-conditioned knowledge**（AKC）: 完全一致は第三者に見つからず、同じ発想は temporal validity、staleness、TTL として書かれている（mem0、SurrealDB の docs、snippet のみ）。plain phrasing（不確実）。
- **shadow instrument**（CA）: ML 運用で "shadow mode" と "shadow deployment" が確立（要約で複数の事業者文書を確認）。
- **chaos-TDD**（CA）: 単独の公開 skill repo（chaos-tdd-fault-injection）が語を名乗っており、ADR-0100 が by-default 義務を退役させたあとも残る。keep。"fault column" は ADR-0077 と ADR-0100 だけで使われ、plain phrasing。

## 4. 表 B: 補足語 77 語

glossary が coined または framework-specific と示す語のうち、表 A に入らないもの。ORCID、concept DOI、version DOI、DOI federation、cross-platform federation、llms.txt convention、JSON-LD knowledge graph、hub、sibling research line、substrate、harness-neutral、diffusion、enclosure・openness・derivation（三軸の値）、preliminary observation、retired の audience layer、AAP の causal traceability・accountable operator・approval gate・untrusted content・external adapter・sponsor・agent governance、AKC の Promote・the gate・Harness・Scaffolding・Intent alignment、CA の翻訳表の語（cycle、phase など）と retired の noise as seed・trust score・session insight、EP の earned/owned/rented（マーケティング語の借用）は、一般語または確立語を定義・区別しているだけなので対象外にした。attention-not-self には glossary がない。判定の基準は「定義した ADR 以外の本文に 3 回前後出るか」で、外部検索を回したのは §3 に挙げた語だけ。他の競合語は背景知識による推定で、未検索と明記する。

### 4.1 AS（`docs/glossary.md`）

| 語 | 定義位置 | 再出現と graph | 既存語 | 判定と理由 |
|---|---|---|---|---|
| Arrival (at the dated record) | `:62`、ADR-0024 | "arrival" を含む規範 EN 約 20 ファイル。全て 2026-10-11 の改訂波以降。graph 節点なし | citation、backlink、provenance | keep（暫定）。一般語の stipulative 用法で造語でない。独立利用 0。次の sweep で再判定する。 |
| arrival proxy | `:70` | 規範 7 ファイル（ADR-0024 に 5）。graph 節点なし | proxy metric（一般語） | replace with proxy metric。 |
| use with arrival | `:68` | ADR-0024 に 5、glossary。graph 節点なし | — | plain phrasing: 「記録へ戻る use」。 |
| ghost citation | `:384` | 規範 12。graph 節点なし | GhostCite の別義（§3.4） | plain phrasing: 「著者名を出さない引用」。namespace 条件に落ちる。 |
| abstract doctrine / worked implementation | `:125`／`:134` | 規範 6。節点あり（出 2、入 2） | specification と reference implementation | replace（不確実）。EP は同じ対を "spec + template + worked example" と書く。 |
| dual entry point | `:201` | 規範約 8。節点あり（出 6） | llms.txt と JSON-LD | plain phrasing。ADR-0009 が非対称と改め、"dual" が実態とずれた。 |
| origin-claim scope | `:452` | 規範 5（ADR-0018 に 6 行）。EP の doctrine にも 3 行。節点あり（出 2、入 2） | patent の claim scope | keep（不確実）。普通の語の複合。 |
| LLM-mediated channel | `:181` | 「LLM-mediated」を含む docs が 39 ファイル・185 行。節点なし | AI-mediated communication（[Hancock ほか 2020](https://sml.stanford.edu/publications/2020/ai-mediated-communication-definition-research-agenda-and-ethical-considerations)）が "X-mediated" の既存形 | keep。複合語で造語でない。 |
| four-layer framework | `:31` | 規範約 8。節点あり（composedOf 4） | — | keep。 |
| Human-Attention Signal | `:302` | ADR-0007 中心。節点あり（出 3） | vanity metrics（未検索） | plain phrasing: 「stars や page views などの platform の注目指標」。 |
| distinctive terminology | `:252` | thesis と ADR-0010。節点あり | neologism、coined term | plain phrasing。 |

### 4.2 AKC（`docs/glossary.md`）

| 語 | 定義位置 | 再出現と graph | 既存語 | 判定と理由 |
|---|---|---|---|---|
| signal-first | `:30` | 規範 10 以上（README、CLAUDE.md、ADR-0010・0011・0012・0013・0016）。節点あり | — | keep。CA の glossary も同一語を採用。 |
| line of approval | `:46` | glossary 3 行のみ。節点なし | — | plain phrasing: 「承認境界」。 |
| three-role loop | `:103` | README 5、ADR-0024・0026・0027・0028。節点あり | — | keep。 |
| bidirectional growth loop | `:237` | CLAUDE.md、ADR-0012（3）、ADR-0013。節点あり（出 2） | co-adaptation（未検索） | keep（不確実）。 |
| failure twin | `:246` | ADR-0014 のみ（8 行）。graph の名は "loop failure modes" | automation complacency と deskilling（glossary が既に cite） | plain phrasing: ADR-0014 の題「failure modes of the bidirectional loop」。 |
| self-reingestion | `:276` | ADR-0015、ADR-0003（2）。節点あり | self-consuming loop（§3.10） | plain phrasing（不確実）。 |
| text-observability | `:295` | ADR-0016 のみ。節点なし | — | plain phrasing。 |
| LLM-first artifact readability | `:303` | ADR-0025 のみ。節点あり | — | plain phrasing。 |
| expiry-conditioned knowledge | `:315` | ADR-0026 と、ADR-0024・0027・0028 の Review-when。節点あり | temporal validity と TTL（§3.10） | plain phrasing（不確実）。 |
| mental model vs instance | `:326` | ADR-0027 のみ。節点なし | — | merge into idea-versus-scaffold separation（意味が重なる）。 |
| judgment lineage | `:341` | CLAUDE.md 1、ADR-0019 1。節点なし | AAP の "implementation dissolves, judgment persists" と重複 | plain phrasing: 「decision records」。 |

### 4.3 AAP（`docs/glossary.md`）

| 語 | 定義位置 | 再出現と graph | 判定と理由 |
|---|---|---|---|
| prohibition-strength hierarchy | `:118` | README、thesis、CLAUDE.md、industry-mapping、metadata。節点あり（composedOf 3） | keep。 |
| accountability distribution | `:9` | 全体の主題。節点あり（composedOf 3） | keep。 |
| externalized accountability | `:22` | `social-consequence.md` のみ。節点あり | plain phrasing。 |
| pre-named gap-bearer | 見出しなし（§3.10） | 16 ファイル・80 行。節点あり | keep。glossary 項を足す。 |
| phase separation | `:435` | ADR-0010（37 行）、metadata、AAP 論文の標題。節点は phase-crossing decision のみ | keep。 |
| phase-crossing decision | `:450` | ADR-0010。節点あり | keep。CA の phase-crossing observation を吸収する。 |
| redirect impossibility（artificial／principled） | `:385` | quadrants 配下、ADR-0009。節点なし | keep（不確実）。 |
| skill-design gradient | `:462` | ADR-0010 と glossary のみ。節点なし | plain phrasing。 |
| phase descent | `:476` | 同上 | plain phrasing。 |
| target identifiability | `:489` | 同上 | plain phrasing。 |
| scale-resilience | `:502` | 同上 | plain phrasing。 |
| three-layer diagnosis | `:512` | 同上 | plain phrasing。 |
| dissolution signature checklist | `:536` | glossary のみ。glossary 自身が provisional と書く | plain phrasing。 |
| LLM function | `:300` | glossary と CA の pipeline。節点あり | keep。普通の語の複合（"semantic function" が近い語だが未検索）。 |

### 4.4 CA（`docs/glossary.md` の Project-coined phrases）

「定義 ADR 以外での再出現」は、その語が定義 ADR の外で出る ADR と文書のファイル数（glossary、CHANGELOG、llms、graph、plans、rfcs を除く、おおよその数）。

| 語 | 行 | 定義 ADR 以外での再出現 | 判定と理由 |
|---|---|---|---|
| one external adapter per agent | `:116` | 7 ADR（0021・0029・0032・0033・0045・0049・0062）と README。AAP ADR-0004 に harness-neutral 形 | keep。 |
| grounded distill | `:117` | ADR-0072 に 1 | plain phrasing。 |
| pivot snapshot | `:119` | ADR-0035・0073、CONFIGURATION.md、rfcs/0050 | keep。 |
| observability without steering | `:120` | ADR-0057 に 1 | plain phrasing: 「操縦しない観測」。 |
| value layer | `:124` | 72 ファイル以上（ADR-0058・0069・0080・0091 ほか）。節点あり | keep。CA の中核語。 |
| values at action time | `:134` | EN の ADR に文字列がない（ADR-0058 の題は "value injection at action time"） | plain phrasing: ADR-0058 の題に揃える。 |
| axiom-free distillation | `:140` | ADR-0057・0060・0072 | keep。 |
| self-reflection corpus | `:144` | ADR-0058 に 1 | plain phrasing。 |
| counterparty by author name | `:147` | 0（ADR-0055 にも文字列なし） | plain phrasing。 |
| content-verification handshake | `:150` | 0（ADR-0062 の題は "create-time verification handshake"） | plain phrasing: ADR-0062 の題に揃える。 |
| read-only pattern-composition instruments | `:155` | agent-observability-patterns に "read-only instruments" の skill。節点あり | keep（短形 "read-only instruments"）。長い形は ADR-0071 だけ。 |
| observability by default | `:159` | ADR-0089・0101、CLAUDE.md、skill | keep。 |
| shadow instrument | `:164` | ADR-0081・0097、skill（shadow-mode-validation） | replace with shadow mode（確立語）。 |
| shadow constitution | `:171` | README に 1、ADR-0092 の evidence 群 | keep。 |
| chaos-TDD | `:177` | ADR-0077・0100、単独 skill repo | keep。 |
| fault column | `:177` | ADR-0077・0100 のみ | plain phrasing。 |
| permanent facade | `:187` | ADR-0079 のみ | plain phrasing。 |
| decision packet | `:193` | ADR-0085・0093、skill、CYCLES.md | keep。 |
| post-distill durability gate | `:199` | ADR-0090 に 1 | plain phrasing。 |
| conformance kit | `:205` | ADR-0103・0112 | replace with conformance test suite（確立語、未検索）。 |
| behavioral eval layer | `:211` | ADR-0089 のみ | plain phrasing。 |
| IPD two-arm bench | `:218` | ADR-0092・0091、runbook | plain phrasing（IPD と two-arm はどちらも確立語）。 |
| null-pair calibration | `:218` | evidence 2 本 | replace with A/A test（確立語、未検索）。 |
| instrument dissolution mandate | `:226` | ADR-0110・0111・0113・0105・0107 ほか 6 ADR 以上 | keep。scaffold dissolution を置換する場合は連動して見直す。 |
| consumption plan | `:226` | 同上 | keep。 |
| instrument census | `:234` | ADR-0110、skill（weekly-gate、weekly-report） | keep。 |
| Phase 0 read-through | `:234` | ADR-0107 と skill | plain phrasing。 |
| confusion pairs | `:243` | ADR-0107 に 2 | plain phrasing（分類課題の確立語）。 |
| comment outcomes | `:252` | ROADMAP と skill（weekly-gate）のみ | plain phrasing。 |
| embedding sidecar | `:259` | ADR-0039・0043、runbook | keep。 |
| approval lineage | `:80` | ADR-0051・0052・0053・0082・0092・0097、runbook | keep。 |
| quadrant lens | `:279` | ADR-0033 のみ | plain phrasing: 「AAP の象限診断」。 |
| phase-crossing observation | `:278` | graph 節点と glossary のみ（glossary が挙げる ADR-0016 に文字列なし） | merge into phase-crossing decision。 |

### 4.5 EP（`docs/glossary.md`）

| 語 | 行 | 再出現 | 判定と理由 |
|---|---|---|---|
| claim-anchor chain | `:26` | spec 3、ADR-0003、doctrine。節点あり、keyword にも含む | keep。format の中核規則。 |
| internalized institutional prior | `:10` | doctrine、glossary、eval D4 | merge into gatekeeper inversion（graph でも downstreamOf）。 |
| machine-verifiable proof structure | `:30` | ADR-0004、`corpus/proof-structure.md` | plain phrasing: 「affiliation を持たない Person の JSON-LD」。 |
| feasibility question | `:34` | questions.md、faq.md、doctrine | keep。普通の語。 |
| gatekeeping eval | `:38` | ADR-0005、eval spec。keyword にも含む | keep。普通の語。 |
| instance #0 | `:42` | format 配下 | plain phrasing。 |
| institution-grade（制度級） | `:46` | doctrine、keyword | plain phrasing（professional-grade が近い。未検索）。 |
| payload / channel 分離 | `:50` | doctrine §5 のみ | plain phrasing。 |

## 5. 撤去コスト

repo 内のファイルは随時変えられる。Zenodo に預けた metadata と archive は、次の release で新しい version DOI が付くまで変わらない。

### 5.1 release を待つもの

- 全 line の `.zenodo.json`、`CITATION.cff`、`codemeta.json` の keyword と abstract。該当する語は AS の "two-channel"、"regurgitation"、"dual entry"、"arrival"、AAP の "Business AI Quadrant"、"attribution gap"、EP の "gatekeeper inversion"、"oracle debiasing"、AKC の "scaffold dissolution"、"harness alignment"。
- 預託済みの論文記録（不変）。AKC の位置論文 "Harness Alignment and Harness Drift..."（10.5281/zenodo.20578272）は標題に語を含む。AAP の companion paper の 1 本も標題に "Phase Separation" と "LLM Workflow Quadrant" を含む（どちらも keep の語）。hub の Papers 行は「預託後に編集しない」と hub CLAUDE.md が定めている。
- EP の v0.1.0 pre-registration 預託は、語を含む doctrine を固定している。語の変更は後続版で行う。
- HF dataset mirror の graph 複製は hf-sync を release 時に手動実行して更新する。

### 5.2 repo ごとの carriers

| repo | 触るもの |
|---|---|
| hub（shimo4228） | `scripts/concepts_data.json` の entry。`scripts/build_concept_pages.py` で `concepts/<slug>.html`、`concepts/index.html`、`sitemap.xml`（27 URL、RFC-0002 により検索 console へ送信済みなので、削除すると 404 になる）を再生成。`graph.jsonld` と `vocab.jsonld`／`vocab.html` の行（vocab は hub 水準の概念に限り、scaffold-dissolution、security-by-absence、four-business-ai-quadrants、three-axis-inversion、identifier-federation-triplet、dual-entry-point、value-layer-harness-engineering が該当し、行は 1:1 を保つ）。`traffic/dashboard/index.html` の graph 複製は `scripts/sync_graph_jsonld_mirror.py`、vocab は `scripts/sync_vocab_jsonld_mirror.py` で同期。`llms.txt`、`llms-full.txt`。`probes/config/probes-v1〜v10.yaml`（`project_terms` に "three-axis inversion"、"attribution diffusion"、value_layer の 5 綴りがあり、probe `concept-inversion` は三軸の語で問う）。 |
| authorship-strategy | `docs/glossary.md`／`.ja.md`、`graph.jsonld`（two-channel と retrieval-suppressed は各 8・12 行）、`llms*.txt`、README の `<details>`。ADR の題とファイル名（0008・0010・0011）は履歴なので書き換えず、supersede と注記で扱う。 |
| agent-knowledge-cycle | `docs/glossary.md`（EN のみ）、`docs/scaffold-dissolution.md`／`.ja.md`（語を名乗る文書）、`graph.jsonld`、`CITATION.cff`、`codemeta.json`、`README.md`／`.ja.md`、`CLAUDE.md`。ADR-0017・0022 の題。 |
| agent-attribution-practice | `docs/glossary.md`／`.ja.md`、`graph.jsonld`、README の 2 版、`docs/quadrants/*`、`docs/policy-mapping/*`（attribution gap は EN 4・JA 4 ファイル）、metadata 3 種。ADR-0001・0010 の題。 |
| contemplative-agent | `docs/glossary.md`（EN のみ）、`graph.jsonld`、`llms*.txt`。ADR の題の slogan は履歴。 |
| existence-proof | `docs/glossary.md`（日本語正本）、`graph.jsonld`、`README`・`CLAUDE.md`・`docs/thesis.md`・`docs/doctrine.md`、metadata 3 種。ADR-0002・0003 の題。 |
| 衛星 repo | akc-cycle の skill 群、claude-harness（skill、ADR、docs/components）、rules-stocktake、agent-stocktake、generation-audit、harness-pruning、readme-writer、agent-adoption-triage、llm-agent-security-principles、chaos-tdd-fault-injection。authorship-strategy-rules と human-gate は凍結で触らない。 |

### 5.3 着手順の目安

ほぼ glossary と hub だけで済む順に、attention ceiling（AKC glossary 1 項と hub 1 ページ）、identifier-federation triplet（hub 側のみ。AS の ADR 本文の言及は履歴として残す）、two-channel attribution diffusion（AS の glossary 2 版と graph 節点、keyword は短形 "two-channel" が残る）、value-layer harness engineering（hub の README・CLAUDE.md・graph・vocab と probe 辞書）。ghost citation と retrieval-suppressed naming probe は probe の列名とデータに触れるので、ラベルだけ替えて列名を残す案を含めて決める。scaffold dissolution は最後に回す。

## 6. 食い違い（記録内と外部根拠）

記録内:

- ghost citation: ADR-0010 Lineage（採用した語）と AS glossary（framework 自身の term）が逆を言う。RFC-0022 の前提（二つの用法は実質同じ事象）は GhostCite の abstract と合わない（§3.4）。
- identifier-federation triplet: hub の概念ページの `glossary_url` は `#doi-federation` を指し、triplet という項目は AS glossary にない。
- attention ceiling: glossary の出典 ADR-0010 に文字列がなく、graph の節点名は "cognitive economy"。
- attribution gap: 日本語名が hub と AAP graph で異なる。
- values at action time、counterparty by author name、content-verification handshake: CA glossary の slogan が EN の ADR 本文の綴りと違うか、ADR に存在しない。
- pre-named gap-bearer: AAP の glossary 内リンク `#pre-named-gap-bearer` のアンカーが存在しない。
- gatekeeper inversion: EP 自身が origin claim を放棄しているのに、hub の label は `coined`。
- dual entry point: ADR-0009 が非対称と改めたあとも名前は "dual"。
- ADR-0010 の anchoring obligation を満たさない語: ghost citation、Arrival 系、identifier-federation triplet は AS graph に節点がない。attention ceiling も AKC graph に節点がない。

外部根拠:

- 依頼時点の観測例（"harness distillation"、"harness impermanence"）は、取得した本文では scaffold dissolution と同じ機構を指していなかった。distillation は重み側、impermanence は設計規律で、独立した用例は 1 ページ。根拠の強さは、本文を読んだ一次または準一次の出典（論文 1 本、ページ 1 つ）で、検索要約より強い。
- "oracle de-biasing" は検索 snippet が節見出しを示すが、取得した abstract には語がない。abstract は節見出しを含まないので矛盾とは言えず、未確認として扱う。

## 7. 方法と限界

### 7.1 Scope searched

- **repo 内**: ripgrep の大文字小文字無視の語句検索（`Grep`）。出力は count モード（ファイルごとの一致行数）を基本にした。glob は md、json、jsonld、txt、cff（初期の数回は html と yaml も）。JA 双子は別ファイルとして数えたため、「全体」の件数に重複が含まれる。glossary の語は全文を読み、graph 節点は該当の block を読んだ。`.notes/` 配下は読んでいない。
- **他 repo の集計**: hub の `llms.txt` に載る公開 repo を対象にした。ワークスペース内のその他の directory（プログラム外のものを含む）と HF mirror の複製は集計から除いた。
- **外部**: 2026-10-12 に WebSearch と WebFetch を使った。主な検索語は "harness distillation"、"harness impermanence"、"scaffold dissolution"（生体材料の用例を除外）、scaffolding fading、"security by absence"、"harness drift"、"attention ceiling"、"attribution gap"、"gatekeeper inversion"、"oracle debiasing"、"Existence Proof Format"、"value-layer harness engineering"、"vocabulary discipline"、"three-axis inversion"、"idea versus scaffold"、"harness alignment"、"Business AI Quadrants"、PID Graph、"attribution diffusion"、"expiry-conditioned knowledge"、self-consuming loop、shadow mode、NIST 800-53 least functionality、AI-mediated communication。取得して本文または abstract を読んだのは次の通り。Arize の記事、agentpatterns.ai の harness impermanence、arXiv:2609.24974、arXiv:2602.06718、arXiv:2002.08910（abstract）、arXiv:2005.11401（abstract）、arXiv:2606.26836 と arXiv:2606.11263（abstract）、Anthropic の Building Effective Agents、DataCite の PID Graph の記事。それ以外の競合語（scaffold fading、least functionality、responsibility gap、マーケティングの attribution gap、self-consuming loop、temporal validity、shadow mode、credit diffusion、AI-mediated communication、Cardano CIP-0190）は検索結果の要約（snippet）で確認しただけで、一次資料の本文は読んでいない。

### 7.2 Still unknown

- WebSearch は完全一致の演算子を守らないので、「第三者用例なし」は弱い証拠。依頼文のとおり、OQ5 sweep #3 が 10 語で第三者利用 0 を示した結果を前提にした。
- harness impermanence の帰属（Google と Phil Schmid）はページの記述で、一次資料を読んでいない。独立した第二の用例は見つからなかった。
- scaffold fading の原論文（1976）の本文は取得していない。Roberts ほか 2020 の本文で "closed-book" の語が使われているかも未確認（abstract は設定だけを述べる）。NIST CM-7 の本文も未取得。
- 表 B の既存語の多く（vanity metrics、A/A test、conformance test suite、co-adaptation、semantic function、professional-grade）は背景知識による推定で、検索していない。
- 件数は glob の違いで ±2 程度の誤差がある。edges は節点の block を読んで数えたが、他節点から入る edge の網羅は目視による。
- 「撤去コスト」はファイルの列挙までで、各 release の実作業量は見積もっていない。
- hub の `label: coined` が実態と合うかは、gatekeeper inversion の 1 例しか確かめていない。
- scaffold dissolution を replace とした判定は、「溶解」と「fading」の含意の差を判断できていないため不確実。著者の判断が要る。
