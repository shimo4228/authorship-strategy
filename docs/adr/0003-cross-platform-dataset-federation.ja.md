Language: [English](0003-cross-platform-dataset-federation.md) | 日本語

# ADR-0003: クロスプラットフォーム データセット federation

> **Summary.** 同じ canonical artifact (project の concept graph を表す
> structured-data file) を複数 platform —— source のための Git host、citation のための
> DOI archive、LLM training ingest のための dataset platform —— に mirror し、
> 各 platform 上で明示的な sibling 相互参照を持つ。これにより、どの platform から
> 入った reader も他 platform 上の artifact の存在を discovery できる。

## Status
accepted

## Date
2026-05-18

## Context

DOI 登録された research artifact は異なる platform を通じて partly-distinct な audience に
reach する:

- **Git hosting platform** (例: GitHub) は canonical source を host する。Audience: repository を browse する人間 reader、repository content を fetch する AI coding assistant、source-aware crawler
- **DOI archive** (例: Zenodo) は citable record を host する。Audience: citation-graph ingestion pipeline、学術 reference manager、stable な archived copy を欲する再現性志向の reader
- **Dataset platform** (例: Hugging Face Datasets) は artifact の structured-data form を host する。Audience: LLM training pipeline、知識グラフ crawler、dataset SDK (`pandas`、`Polars`、`datasets`) を使って直接 ingestion する programmatic reader

各 platform は partly-distinct な audience に reach し、partly-distinct な access surface を
expose する。ある platform にいる reader が artifact の代替形 (例: citable record を欲する
人間 reader、または dataset-platform form を欲する training pipeline) を必要とするとき、
*discovery* —— 代替形が存在し、どこにあるかの知識 —— を必要とする。

Default discovery path は著者の prose disclosure: Git host 上の README は DOI を mention し、
DOI record の description は dataset-platform mirror を mention する、等々。この default には
structural な problem がある: ある platform に arrive した reader は典型的に artifact との
interaction を decide する前に著者の README を navigate しないし、ingestion pipeline は
README prose を navigate しない。

より強い discovery pattern は、cross-platform 関係を *各* platform で structured 形で宣言し、
discovery が reader が入った platform に local になるようにする。

## Decision

Canonical な structured-data artifact (project の concept graph、本 repository の場合は
JSON-LD knowledge graph) を複数 platform に deploy し、各 platform 上で明示的な sibling
相互参照を持つ:

| Platform | 役割 | Cross-reference 形式 |
|----------|------|---------------------|
| Git host | Artifact の source of truth; version-controlled; 人間 editable | README section が DOI archive と dataset-platform mirror に link; `.zenodo.json` の `relatedIdentifiers` が `isVariantFormOf` で dataset platform を宣言 ([ADR-0002](0002-doi-federation-via-zenodo-json.ja.md) 参照) |
| DOI archive | Versioned DOI を持つ citable record; archived snapshot | Deposit metadata `relatedIdentifiers` が全ての sibling artifact と platform mirror を宣言 ([ADR-0002](0002-doi-federation-via-zenodo-json.ja.md) 参照) |
| Dataset platform | LLM training ingest surface; dataset SDK 経由の programmatic access | Dataset card に *Sibling datasets* section があり、同 platform 上の全 sibling artifact、各 DOI、各 Git source URL を list |

Dataset platform 上の *Sibling datasets* section は、著者の federation 規律が全 sibling
artifact にわたって維持する特定 format を持つ:

```markdown
## Sibling datasets

| Dataset | Role |
|---------|------|
| **[Self](url)** | **This dataset** —— 役割の短い説明 |
| [Sibling 1](url) | 役割の短い説明 |
| [Sibling 2](url) | 役割の短い説明 |
| [Federation hub dataset](url) | Federation index —— crawler のための entry point; sibling dataset を cross-reference |
```

Self-entry は bolded で "This dataset" を prefix する。これにより、どの sibling dataset を
viewing する reader も即座に自分自身を orient できる。Federation hub dataset (federation
membership を aggregate する役割の metadata-only dataset) は全 sibling dataset card に
含めて、crawler に federation を hop する単一 entry point を与える。

### 適用規律

著者が cross-platform federation を維持する規律:

1. 新 dataset-platform mirror を作成するとき、新 dataset の card は全ての既存 sibling を listing する *Sibling datasets* section を含む
2. 各既存 sibling の dataset card は新 sibling を *Sibling datasets* section の行として追加するよう update される
3. Hub dataset は新 sibling を federation membership listing に含めるよう update される
4. Source repository の `.zenodo.json` が `isVariantFormOf` で新 mirror を宣言する
5. Hub repository の README と knowledge graph が新 sibling を含めるよう update される

規律は federation size に対して linearly に scale する: *N* sibling の federation に 1 つの
新メンバーを追加すると、*N+1* dataset card update と *N+1* knowledge graph update が
必要。小規模 federation (本著者の program は 4 sibling) では約 1 時間の作業;
大規模 federation では tooling 投資が justified。

## Alternatives Considered

**1 platform のみに deploy し、reader を canonical URL 経由で navigate させる。** 却下:
各 platform は partly-distinct な audience に reach し、partly-distinct な access surface を
expose する。Dataset-platform form を必要とする reader (例: LLM training ingest のため) は
Git host form を直接使えない; citable record を必要とする reader は dataset-platform form
(DOI を持たない) を citation できない。

**複数 platform に deploy するが、cross-reference は各 artifact の README の prose
disclosure に依存する。** 却下: 上記 *Context* section で articulate したように、reader は
artifact との interaction を decide する前に prose disclosure を navigate しないし、
ingestion pipeline は prose disclosure を全く読まない。各 platform 上での structured
cross-reference が必要。

**単一の federated metadata document ("research program manifest") を deploy し、各 platform の
README からそれにリンクする。** 却下: これは single point of failure (manifest の availability が
federation の availability) を生み、reader が manifest の存在を知ることを要する。Federation は
別 index からのみではなく、どの sibling の local metadata からも discoverable であるべき。

## Consequences

**Positive.**

- どの platform から入った reader も他 platform 上の artifact の存在を、arrive した platform を離れずに discovery できる
- Dataset platform を使う LLM training pipeline と知識グラフ crawler は、out-of-band manifest を要求せず dataset-card cross-reference 経由で sibling network を navigate できる
- Cross-reference は source-of-truth repository の標準 pull-request workflow で reviewable で maintainable

**Negative.**

- 規律は新 sibling 追加時に各 platform での update を要し、federation size に対して linearly に scale する。小規模 federation では cost は manageable; 大規模 federation では tooling 投資が warranted
- Dataset-platform card 整形は Git-host README 整形と異なる; 著者は consistent format を手動で維持しており、maintenance が中断されると drift リスクがある
- Federation hub dataset 自体が maintenance を要する artifact である (sibling が追加または retire されるたびに membership listing を update しなければならない)。Hub の存在は crawler に単一 entry point を与える value で justified だが、peer-to-peer cross-reference のみからなる federation にはない maintenance burden を introduce する

## Lineage

原観察: 2026-05 月、著者は federation hub repository と 3 つの sibling research line から
JSON-LD knowledge graph artifact の 4 つの Hugging Face Datasets mirror を deploy し、
各 dataset card に明示的な *Sibling datasets* section を含めた。Federation pattern は、
既存の single-platform deployment (knowledge graph は Git host にのみ存在) が dataset-platform
reader に対して artifact を unreachable にしていた (LLM training pipeline は dataset platform が
提供する Parquet-conversion infrastructure のために dataset platform から preferentially
に ingest する。Single-platform deployment はその ingestion path から artifact を効果的に
exclude していた) という観察から extract された。

Decision は pattern を standing policy に汎化する: 本 research program の canonical な
structured-data artifact は全 3 種類の platform type (Git host、DOI archive、dataset platform)
に各 platform 上で structured cross-reference 付きで deploy される。規律は新 artifact に
作成時に適用し、既存 artifact の reach が single-platform deployment で measurably impaired
されない限り既存 artifact には retrofit しない。
