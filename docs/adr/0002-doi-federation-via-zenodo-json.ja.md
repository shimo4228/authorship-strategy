Language: [English](0002-doi-federation-via-zenodo-json.md) | 日本語

# ADR-0002: `.zenodo.json` による DOI federation

> **Summary.** DOI 登録された artifact 間の sibling・source・platform mirror 関係は、
> archive deposit metadata の `relatedIdentifiers` として宣言する。これにより、
> artifact 間の citation network は metadata だけから recoverable になり、reader が
> prose disclosure を follow する必要がない。

## Status
accepted

## Date
2026-05-18

## Context

より大きな research ecosystem の一部である DOI 登録 artifact は、他の artifact との
関係を持つ: sibling research line、自身が derive する source artifact、predecessor の
archived version、自身の cross-platform mirror。Reader と citation-graph ingestion
pipeline は、research ecosystem を coherently に navigate するためにこれらの関係を
discovery する必要がある。3 つの discovery channel が利用可能:

1. **Artifact の README と documentation での prose 開示** —— 関係は人間可読形式で
   mention される。この channel は artifact に landing して documentation を読む reader に
   reach する; 自動化 ingestion pipeline に reach せず、LLM 経由の reference resolution に
   poorly suited
2. **外部 catalog と registry entry** —— 関係は別 catalog (research-program manifest、
   institutional research output registry) で宣言される。この channel は reader が catalog の
   存在を知り explicit に query することを要し、catalog 自体が maintenance burden と
   single point of failure になる
3. **Archive deposit metadata** —— 関係は archive deposit に伴う structured metadata で
   宣言される。現代の open archive service (例: Zenodo) は deposit metadata の
   `relatedIdentifiers` field を support し、それが downstream citation ingestion (DataCite、
   OpenAlex、Scholix、OpenCitations) に propagate する。ここで宣言された関係は
   citation graph に edge として自動的に propagate する

第 3 channel が structurally に最強。Deposit metadata で宣言された関係は citation graph に
edge として現れ、citation-graph API で query 可能で、いくつかの catalog UI で surface され、
README content または外部 catalog availability の変更に対して durable。

Deposit metadata で関係を宣言する実際的機構は archive service に依存する。Git hosting
platform からの tag push で auto-deposit する service (Zenodo が reference example) では、
repository 内の configuration file (`.zenodo.json` または同等) が deposit 時に読まれ、
その content が deposit metadata になる。ファイルは repository に persist し、
version-controlled で、artifact 自身を produce する workflow と同じ workflow で editable
である。

## Decision

本 research ecosystem の各 DOI 登録 artifact について、artifact 間関係は repository root の
`.zenodo.json` ファイルに `related_identifiers` array の entry として宣言する。以下の
relation を使う:

| Relation | いつ使うか |
|----------|-----------|
| `references` | Artifact が sibling research line を intellectually に reference し、その contribution が本 artifact を shape した。Reciprocal: pair ごとに 1 度宣言、適切なら両方向に |
| `isDerivedFrom` | Artifact が特定の先行 artifact から extract された (例: sibling line から re-express、archived version から port) |
| `isSourceOf` | Artifact が 1 つ以上の downstream artifact の upstream source である。控えめに使う: upstream-downstream 関係が意図的で、downstream artifact が source なしでは存在しなかった場合のみ |
| `isPartOf` | Artifact が より大きな federation のメンバーである (例: hub repository の federation membership) |
| `isVariantFormOf` | Artifact が非 DOI platform に mirror されており、その canonical URL が与えられている (例: Hugging Face Dataset mirror) |
| `isDocumentedBy` | Artifact が自身の README を補完する外部の canonical documentation source (例: hub repository の JSON-LD knowledge graph file) を持つ |

Relation は pair をなす artifact 間で symmetrically に宣言されるべき: artifact A が
artifact B への `references` を宣言したら、artifact B の `.zenodo.json` は対応する
relation (通常 `isReferencedBy`、または一部の pair では reciprocal に `references`) を
back に宣言すべきである。Symmetry は release ごとに宣言される; relation は各 artifact の
次の tagged release で citation graph に propagate する。

### 適用規律

著者が federation を維持する規律:

1. Research ecosystem に新 sibling artifact を追加するとき、新 artifact の `.zenodo.json` は references または referenced されている全ての既存 sibling への relation を宣言する
2. 各既存 sibling の `.zenodo.json` は新 artifact への reciprocal relation を宣言するように update される。可能なら同じ change set で
3. Cross-platform mirror は mirror の canonical URL を identifier として `isVariantFormOf` で宣言される
4. Hub repository (federation-membership-only artifact) は `isPartOf` で宣言される
5. README を補完する documentation artifact (例: hub-level の JSON-LD form 知識グラフ) は `isDocumentedBy` で宣言される

本 ADR の規律が採用される前に公開された record については、既存 deposit metadata を
archive の administrative interface で edit して欠落 relation を追加できる *新 version を
mint せずに*。これは 1 回限りの retrofit operation で、著者自身の reference のため
[`../skills/`](../skills/) に documented されている。

## Alternatives Considered

**関係を README prose のみで宣言する。** 却下: Prose disclosure は citation graph に
propagate せず、ほとんどの downstream discovery を drive する ingestion pipeline には
不可視。Citation query 経由で artifact を見つけた reader は federation context への
access を失う。

**Hub repository に別の research-program manifest file を maintain する。** 却下
(または、JSON-LD knowledge graph を通じて本 ADR と併用する): 別 manifest は single
point of failure を生み、reader がそれの存在を知ることを要する。Federation は hub のみから
ではなく、どの sibling artifact の deposit metadata からも discoverable であるべき。

**Crossref-style citation metadata を CITATION.cff `references` field 経由でのみ使う。**
却下: CITATION.cff `references` は一部の citation graph に propagate するが全部ではない;
archive-deposit metadata の `relatedIdentifiers` はより broad な ingestion network に
reach し、DataCite relation vocabulary を使う。これは CITATION.cff の simple references list
より expressive。両者は共存できる (本 repository の implementation でも併用している) が、
archive-deposit metadata が primary surface。

## Consequences

**Positive.**

- Citation graph が artifact 間 network を自動 ingest する; citation query 経由で arrive した
  reader は sibling、source artifact、cross-platform mirror に graph 経由で navigate できる
- Network は各 artifact の repository で version-controlled、標準 pull-request workflow で
  reviewable、repository history で auditable
- Federation に新 sibling を追加するには各既存 sibling の `.zenodo.json` を edit する必要
  がある —— federation size に対して linearly に scale し、追加時点に集中する manageable な
  maintenance burden

**Negative.**

- Sibling 追加時の maintenance burden は real: *N* sibling の federation に 1 つの新メンバーを
  追加すると 1 ではなく *N* 編集が必要。小規模 federation (本著者の program は 4 sibling) では
  これは 30 分の作業; 大規模 federation では作業が linearly に scale し、tooling 投資が
  warranted かもしれない
- Reciprocal-declaration 規律は各 sibling の release cadence に依存する: reciprocal edge は
  各 sibling の次の tagged release 後にのみ citation graph で visible になる。Release cadence が
  長い federation では citation graph が new edge を staggered fashion で発展させる
- 規律採用前に公開された record は archive の administrative interface で 1 回限りの
  retrofit を要する。Operation は機械的だが repository-side tooling だけでは自動化できない

## Lineage

原観察: 2026-05 月、著者は 3 つの sibling repository (Agent Knowledge Cycle、
Contemplative Agent、Agent Attribution Practice) に `.zenodo.json` ファイルを deploy し、
research ecosystem の artifact 間関係を encode する cross-reference を含めた。Federation
pattern は、既存の prose-disclosure approach (関係は README のみで mention) が citation
graph を artifact 間 edge のないままにしていた (関係は prose で substantial で
well-articulated だったにもかかわらず) という観察から extract された。Retrofit operation
(3 つの既存 deposit record を edit して欠落 relation を追加し、新 version を mint しない
こと) は約 30 分の administrative-interface 作業だった。

Decision は approach を汎化する: 関係は citation graph がそれを carry するように
deposit metadata に入れ、prose disclosure は artifact に landing した reader のために
README に居場所を保ち、両方は artifact 自身を update する同じ release-time workflow を
通じて sync 維持される。
