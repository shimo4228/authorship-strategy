# Authorship / Provenance Infrastructure 次段階評価 — DataCite relations / w3id.org / PROV-O / RAiD

## Context

著者の依頼: 既存の identifier / provenance 基盤(DOI, SWHID, ORCID, CITATION.cff, codemeta, graph.jsonld, hub vocab namespace)を前提に、4 候補の導入適否を「導入ありきにせず現物を読んで」判断する。評価は 3 並列調査(repo 現物 / DataCite API 実登録 / 外部標準の 2026-08-25 時点照合)に基づく。全事実は一次ソース確認済み。

**総合結論(先出し)**: 新標準の採用は実質 1 件のみ — **DataCite relations の「完成」(ADOPT MINIMALLY)**。これは新標準ですらなく、ADR-0002 が既に doctrine 化した層の非対称・欠落を埋める作業。w3id = DEFER、PROV-O = DO NOT ADOPT、RAiD = WATCH。加えて調査で **4 候補より優先度の高い既存基盤の穴**(T36 移行の未完: 17 concept URI が dereference 先未定義)を発見した。

---

## 1. Current Identity / Provenance Architecture(現物根拠)

| 層 | 実装 | 根拠ファイル |
|---|---|---|
| Person | ORCID `0009-0002-6168-4162`(graph.jsonld Person node @id、8-link sameAs、Wikidata は ADR-0021 で完全 purge 済・残渣ゼロ) | graph.jsonld:74 |
| Project/line | hub repo `shimo4228/shimo4228` + hub graph.jsonld の `ResearchLine` node(hub 自身は DOI なし・by design) | hub CLAUDE.md |
| Concept | `https://shimo4228.github.io/shimo4228/vocab#concept/<slug>`(共有 3)+ `…vocab#as/concept/<slug>`(line 固有 17)、`DefinedTerm` co-typed、旧 repo-fragment URI は sameAs 保持(T36, 2026-08-25) | graph.jsonld:114-147 |
| Decision | ADR ×23、@id = `github.com/…#adr/NNNN` fragment | docs/adr/ |
| Release | concept DOI `10.5281/zenodo.20263316` + version DOI(Zenodo 自動 `IsVersionOf`/`HasVersion`) | CITATION.cff |
| Exact source | SWHID `swh:1:snp:*` ×6(累積、**CITATION.cff のみ** — .zenodo.json / codemeta / DataCite に未投影) | CITATION.cff |
| Relation projection | `.zenodo.json` 42 related_identifiers → DataCite へ verbatim 伝播(実測確認) | .zenodo.json |
| 自動化 | graph_lint / verify-counts.sh / cffconvert / hf-sync。全 identifier 資産は手書き source of truth、mirror のみ生成 | scripts/ |

## 2. Existing Graph(ASCII)

```
Person (ORCID 0009-0002-6168-4162)
  │ creator / creators.nameIdentifiers(全 DataCite record 登録済)
  ▼
hub repo(DOI なし)──definesConcept──▶ vocab#concept/*(15 定義済)
  │ isPartOf(逆向き宣言)                vocab#as/concept/*(17 ← ⚠未定義)
  ▼
authorship-strategy(@id=GitHub URL, mainEntity→concept DOI 20263316)
  │ ├─ siblingOf ×4 ──▶ AKC/CA/AAP/ANS concept DOI(DataCite では References に平坦化)
  │ ├─ vocabularyDisjoint ──▶ AAP DOI(DataCite 投影不能 — 対応 relationType なし)
  │ ├─ derivesFrom ×5 ◀── skill repos(DOI なし → URL 投影のみ可)
  │ ├─ ADR #adr/0001..0023 ──groundedIn──▶ ExternalReference ×35(arXiv/SSRN/Wiley)
  │ └─ Concept ×20 ──recordedIn──▶ glossary.md#anchor
  ▼ HasVersion(Zenodo 自動)
version DOI(v0.6.0…v1.1.0)──(CITATION.cff のみ)──▶ swh:1:snp:*
```

DataCite 実登録(API 実測): AS concept DOI に 52 relatedIdentifiers(References×37 / HasVersion×12 / IsPartOf→hub URL / IsVariantFormOf→HF / IsDocumentedBy→hub graph)。AKC は手動逆エッジ `IsReferencedBy`×4 + `IsSourceOf`→CA、AAP は `IsDerivedFrom`→CA まで登録済み。**graph.jsonld 291 edge のうち DOI↔DOI で新規投影可能な事実は実質ゼロ**(sibling 4 件は登録済、vocabularyDisjoint は語彙が存在しない)。

## 3. DataCite Relations — **ADOPT MINIMALLY**(ADR-0002 の完成として)

**Fit**: これは新標準導入ではない。ADR-0002 が 6-relation 語彙と相互宣言規律を既に doctrine 化しており、gap は「規律の未執行」のみ。Zenodo は 34 relationType を self-service で受け付け(DataCite 4.7 の 39 中。欠落: Collects 対 / HasTranslation 対 / Other)、depositor 宣言は DataCite へ verbatim 伝播(実測 962k record)。DataCite GraphQL(PID Graph)は稼働中だが counter は DOI↔DOI relation しか light up しない。

**外部環境の決定的変化**: Crossref Event Data は 2026-04-23 停止(API 死亡を実測確認)。後継は publisher-deposit のみの data citations endpoint。**open web の DOI 言及を crawl するサービスは消滅** — registry に残る関係は registrant 自身の deposit だけ。これは「自分で宣言する relation の限界価値が 2024 年より上がった」ことを意味し、thesis(diffusion 下の origin claim は自己開示層が担う)と整合する。

**最小 relation set(repo あたり)**:

| relation | target | 状態 |
|---|---|---|
| `references` ×4 | sibling concept DOI | 登録済・維持(sibling 意味論は graph/CFF notes 側が保持 — DataCite に「sibling」型は無く、無理な型変換をしない) |
| `isReferencedBy` | 自分を参照する DOI | AKC/CA/AAP は登録済。**AS に欠落 → 追加**(相互宣言規律 ADR-0002 の執行) |
| `hasPart` → 20337008 / `isSupplementedBy` → 20558800 | doctrine-corpus / existence-proof | **AS に欠落 → 追加**(現状は弱い IsReferencedBy 相当すら無し) |
| `isSupplementTo` | 自 GitHub repo URL | ANS のみ保有 → **AS + 全 sibling(AKC / CA / AAP / doctrine-corpus / existence-proof)に追加**(DOI↔repo の registry 内バインド。著者指示 2026-08-25) |
| `isVariantFormOf` / `isDocumentedBy` / `isPartOf` | HF mirror / hub graph / hub | 登録済・維持 |
| `isDerivedFrom` / `isSourceOf` | 系譜(CA↔AAP 等) | 登録済・維持 |

**投影しないもの**: `vocabularyDisjoint`(語彙なし。4.7 の `Other`+`relationTypeInformation` は Zenodo 未対応かつ意味の劣化)、`extends`(ADR→ADR)、`recordedIn` / `instantiatedBy`(intra-repo anchor)、arXiv groundedIn(既に References 登録済・重複)。**graph.jsonld が唯一の source of truth のまま、.zenodo.json は projection carrier** — 新 SoT は増えない。

**SWHID relation**: DataCite 4.7(2026-03-03)が `SWHID` を relatedIdentifierType に正式追加。ただし **Zenodo の deploy 済 vocabulary は未対応**(swhid scheme なし、URL 押し込みは意味が濁る)。→ 今は投影せず、**review-when: Zenodo が 4.6/4.7 語彙へ追随した時点で version DOI → `swh:1:snp:` を追加**(release-doi skill に注記)。

**Maintenance cost**: `.zenodo.json` 編集のみ。伝播は次 release、または Zenodo の published-record metadata 編集で即時(新 version 不要)。新 tooling ゼロ。既知 drift(doctrine-corpus / existence-proof の未 release 編集が未伝播)は ADR-0002 が既に認めた release-cadence 制約で、機構は追加しない。

## 4. w3id.org — **DEFER**(Option A 維持、条件付き再訪)

**Fit / 現状**: canonical Concept URI = `shimo4228.github.io/shimo4228/vocab#…`(GitHub Pages、custom domain なし)。w3id は個人でも即日通る(merge 中央値 <24h、個人 namespace 実例多数 — 2026-08-25 実測)が、volunteer 運営で infra PR が 2018 年から未 merge の「one-person-deep」シグナルあり。

**Option 比較**: B(w3id canonical)は T36 直後の全 carrier 再 churn + 各 concept に第 3 の co-referring URI を追加し、ADR-0009 の成功基準(entity resolution)を**むしろ悪化**させる。C(alias)は 1 PR で安いが、現時点で vocab URI への external inbound link は観測ゼロ — 保険を掛ける対象がまだ存在しない。A(現状維持)の failure mode(GitHub Pages/username 喪失)は、旧 URI を sameAs で保持する T36 と同じ手順で migration 可能なことが既に実証されている。

**判定**: DEFER。**再訪トリガー**: (a) vocab URI への external inbound link が観測される、(b) custom domain 移行を検討する、(c) GitHub Pages の政策変更。トリガー発火時は Option C(alias / persistence layer のみ、canonical 不変)から入る。**前提条件**: 下記 vocab gap の解消が先(未定義 URI に永続層を被せるのは順序が逆)。

## 5. PROV-O — **DO NOT ADOPT**

**決定的事実**: arbitrary repo / website の PROV-O を ingest する外部消費者は**ゼロ**(検索エンジン・LLM crawler・OpenAIRE・DataCite いずれも不読。実在する uptake は workflow エンジン等の閉じた producer-consumer 契約のみ)。spec は 2013 年 Recommendation のまま凍結、WG 解散済み。SPDX 3.0 Build profile が同じ地面を規制起点の forcing function 付きでカバーしつつある。

**問いへの回答可能性**: 「何から派生したか」= graph `derivesFrom`/`isBasedOn` + DataCite `IsDerivedFrom`(登録済・消費あり)。「誰に帰属するか」= ORCID creators(全 record 登録済)。「どの decision から実装されたか」= `recordedIn`/`instantiatedBy`。「どの version 根拠か」= version DOI + SWHID。**PROV-O が新たに答えられる問いは無く、export しても読者がいない。** Scaffolding dissolution 検定: `shimo:` 語彙は PROV に無い意味(siblingOf / vocabularyDisjoint / groundedIn)を運ぶため削除できず、`existing structure + new layer` の純増になる — 導入価値の否定条件そのもの。

## 6. RAiD — **WATCH**

**現況(as-of 2026-08-25)**: ISO 23527、RA は ARDC(豪 NZ)と SURF(欧)のみ。**日本 RA なし、NII/JST の関与痕跡なし、無所属個人の self-service 経路なし**(DataCite FAQ 2026-08-07 が個人 self-registration 不可を明言。唯一の経路は contact@raid.org への人間交渉)。Project identity slot は hub repo + hub graph が既に埋めており、機能的欠落もない。加えて RAiD の「institutional research activity」フレームは practitioner-identity(研究者 framing 回避)と摩擦する。**Watch トリガー**: 日本 RA または個人向け self-service tier の出現(DataCite 4.7 が relatedIdentifierType に RAiD を追加済 = plumbing 先行の兆候。~12 ヶ月後に再照合)。

## 7. Comparative Matrix

| 観点 | DataCite rel. | w3id | PROV-O | RAiD |
|---|---|---|---|---|
| External interoperability | ◎ registry 直結・実測伝播 | ○ redirect のみ | × 消費者ゼロ | △ 消費側未成熟 |
| LLM benefit | △ 間接(DOI landing 経由) | △ 無し〜微 | × | × |
| Identity stability | ○(DOI 既存) | ○ だが第 3 URI 追加で resolution 悪化 | — | 取得不能 |
| Provenance value | ○ IsDerivedFrom 系 | — | △ 表現可・読者無 | △ |
| Implementation complexity | 低(.zenodo.json 編集) | 低(1 PR) | 中(generator 新設) | 不能 |
| Maintenance cost | 低(release 同梱) | ほぼゼロ(ただし新依存 1) | 中(projection 同期) | — |
| Metadata duplication risk | 無(既存 carrier 内) | sameAs 純増 | **高**(graph と全重複) | ORCID/DOI と重複 |
| Scaffolding reduction | 無(だが純増も無) | 無 | **負**(層純増) | 無 |

## 8. Recommended Architecture(採用分のみの最小 graph)

```
Person = ORCID ──creator──▶ 全 DataCite record(済)
Project = hub repo + hub graph.jsonld(RAiD 不使用)
Concept = hub vocab DefinedTerm URI(w3id 層なし。vocab.jsonld 定義を 17 件補完)
RFC/Task = .notes/TASKS.md(外部投影なし)/ Decision = ADR(graph #adr/* node)
Artifact relation(public)= .zenodo.json → DataCite relatedIdentifiers
     references(sibling)+ 相互 isReferencedBy + hasPart/isSupplementedBy(子)
     + isSupplementTo(GitHub)+ isVariantFormOf(HF)+ isDocumentedBy(hub graph)
Release = concept/version DOI ──(将来: SWHID relatedIdentifier)──▶ swh:1:snp:*
Provenance 語彙 = 既存 graph.jsonld(shimo: + schema.org)のまま(PROV-O 不使用)
```

one local source of truth(graph.jsonld + CITATION.cff)→ projection(.zenodo.json / codemeta / HF mirror)→ external registry(DataCite)の既存構造を変えない。

## 9. Implementation Order(承認後の作業)

1. **[前提・4 候補外] T36 vocab gap 解消**: hub `scripts/concepts_data.json` 経由で 17 `as/concept/*` term を `vocab.jsonld`/`vocab.html` に定義追加(hub の 1:1 ルール回復。生成 script 既存 — `sync_vocab_jsonld_mirror.py`)。または TASKS.md に起票して別セッションへ。
2. **AS `.zenodo.json` に 4 relation 追加**: `isReferencedBy`(参照元 DOI)、`hasPart` → 10.5281/zenodo.20337008、`isSupplementedBy` → 10.5281/zenodo.20558800、`isSupplementTo` → GitHub repo URL。ADR-0002 に日付つき注記(最小 relation set の確定 + Event Data 停止の環境変化)— 新規 ADR は立てない。
3. **sibling 横展開(今回実施・著者指示)**: `isSupplementTo` → 自 GitHub repo URL を、未保有の 5 repo の `.zenodo.json` に追加 — `agent-knowledge-cycle` / `contemplative-agent` / `agent-attribution-practice` / `doctrine-corpus` / `existence-proof`(各 local clone を編集。ANS は保有済のためスキップ)。各 repo の commit は本 repo と分離。
4. **伝播**: 次 release 同梱(通常経路)。即時反映したい場合のみ Zenodo published-record の metadata 編集(著者判断)。
5. **release-doi skill に review-when 注記**(global ~/.claude 側): Zenodo が DataCite 4.6+ 語彙へ追随したら version DOI に SWHID relatedIdentifier を追加。sibling repo のその他の欠落 relation(papers→AKC/AAP の isPartOf 等)は各 repo の次 release で同型修正。
6. **台帳**: diffusion ledger に本評価の判定(DataCite=deploy 候補 / w3id=DEFER+トリガー / PROV-O=DROP / RAiD=WATCH+12 ヶ月)を記録。TASKS.md 同期。public projection は deploy 後に日付行のみ。

## 10. What NOT to Implement

- PROV-O export(消費者ゼロ・graph と全重複・層純増)
- w3id namespace(現時点。inbound link ゼロで保険対象が不在、第 3 URI は entity resolution を悪化)
- RAiD(取得経路なし + practitioner-identity と摩擦)
- SWHID の URL 押し込み投影(Zenodo の正式 SWHID scheme 対応を待つ)
- `vocabularyDisjoint` の `Other` 型投影、relation 同期の自動化 tooling、RDF store / SPARQL / ontology framework(全て過剰)

## 11. Final Decision

| 候補 | 判定 |
|---|---|
| DataCite relation graph | **ADOPT MINIMALLY**(ADR-0002 の完成: 逆エッジ + 子関係 + isSupplementTo。SWHID relation は review-when) |
| w3id.org | **DEFER**(トリガー: external inbound link 観測 / custom domain 検討。入るなら Option C) |
| PROV-O | **DO NOT ADOPT** |
| RAiD | **WATCH**(~12 ヶ月、日本 RA / 個人 tier 出現で再 gate) |

**最も高い限界利益を与える変更(4 候補中)**: DataCite relation 層の完成。理由 — Event Data 停止後、registry に残る関係は registrant 自身の deposit だけになり、自己宣言 relation の限界価値が構造的に上がった。コストは `.zenodo.json` 数行で、新 source of truth も新依存も増えない唯一の候補。

**(4 候補外の発見・より優先)**: T36 移行の未完 — 17 の `as/concept/*` URI が dereference 先(vocab.jsonld/vocab.html)未定義で hub 自身の 1:1 ルールに違反。新標準の議論より先にここを閉じるべき。

## Verification

- `python3 ~/.claude/skills/jsonld-knowledge-graph/scripts/graph_lint.py`(AS + hub 両 graph)
- `scripts/verify-counts.sh` / `uvx cffconvert --validate`
- .zenodo.json 編集後: JSON validity + relation が Zenodo 34 語彙内であることを `zenodo.org/api/vocabularies/relationtypes` で照合
- 伝播後: `api.datacite.org/dois/10.5281%2Fzenodo.20263316` で relatedIdentifiers を実測確認
