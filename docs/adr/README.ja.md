Language: [English](README.md) | 日本語

# Architecture Decision Records

各 ADR は AI 経由の拡散下における著者戦略についての戦術的判断を記録する。4 つの DOI
登録された research repo からなるエコシステムの運用から発見されたものであり、
top-down に prescribe されたものではない。

## Index

| ADR | Title | Status |
|-----|-------|--------|
| [0001](0001-concept-doi-canonical.ja.md) | Concept DOI を canonical reference として使う | accepted |
| [0002](0002-doi-federation-via-zenodo-json.ja.md) | `.zenodo.json` による DOI federation | accepted |
| [0003](0003-cross-platform-dataset-federation.ja.md) | クロスプラットフォーム データセット federation | accepted |
| [0004](0004-authorship-metadata-orcid.ja.md) | ORCID Auto-Update OFF での著者メタデータ | accepted |
| [0005](0005-readme-localization-audience-driven.ja.md) | README ローカライズ ポリシー —— Audience-Driven な維持 | accepted |

ADR 0001-0003 は **identifier-federation triplet** を形成する: ADR-0001 が canonical
reference の形 (version DOI ではなく concept DOI) を fix し、ADR-0002 が archive
deposit metadata (`relatedIdentifiers`) で artifact 間関係を宣言し、ADR-0003 が
federation を非 DOI platform (Git host、dataset platform) に拡張し、reader が
どの platform から入っても network が discoverable になるようにする。各 ADR は
独立に採用可能だが、規律の最強形は 3 つすべてを適用する。

ADR 0004-0005 は **maintenance-discipline ADR** である: ADR-0004 は著者が誰 *である* か
(ORCID enrichment policy)、ADR-0005 は著者が誰 *のために* 書くか (locale-mirror
retirement policy) について。両方とも同じ基底の動きをする —— 維持コストは推測される
将来状態ではなく実際の evidence で amortize される。

## Format

各 ADR は以下に従う: Status / Date / Context / Decision / Alternatives Considered
/ Consequences / Lineage。意図は、*decision* (何をするか、なぜか) が thesis が
予測する substrate 変化を生き残るようにすることである。

ADR は *harness-neutral* に書かれる: 特定の実装、vendor、framework 名は ADR 本文に
出現しない。特定の vendor や framework が原 decision を shape した場合、lineage は
*Lineage* section に、reader が著者の特定実装にアクセスできなくても follow できる
形で記録される。

基底の thesis (3 軸反転 + 4 層 framework) は [`../thesis.ja.md`](../thesis.ja.md)、
用語は [`../glossary.ja.md`](../glossary.ja.md)、本 ADR 群が答えない open question
は [`../manifesto.md`](../manifesto.md) を参照。
