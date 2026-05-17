Language: [English](0001-concept-doi-canonical.md) | 日本語

# ADR-0001: Concept DOI を canonical reference として使う

> **Summary.** DOI 登録された artifact への全ての外部リンクは concept DOI ——
> 最新 version に resolve する identifier —— を使い、version 固有の DOI は決して
> 使わない。Version 固有 DOI は特定の歴史的 version の再現性引用にのみ使う。

## Status
accepted

## Date
2026-05-18

## Context

Versioned deposit を support する DOI 登録 service は、各 artifact について 2 種類の
persistent identifier を発行する:

- **Concept DOI** (*parent DOI*、*aggregate DOI*、*latest-version DOI* とも呼ばれる): artifact の最新公開 version に resolve する
- **Version DOI**: artifact の特定 version に resolve する

両方とも persistent で citable。最初の deposit 時、両者は典型的に連続する整数として
発行される —— concept DOI が先に発行され、initial version DOI が次に発行される。
公開後に UI 経由で artifact を操作する user は、version DOI が prominent に表示される
(公開直後の version の citation snippet 内) のを見て、それを canonical reference として
copy することが多い。

これは systematic な failure mode を生む。Version DOI が canonical reference として
使われると (README、citation file、badge URL、knowledge graph、ORCID profile、
downstream citation network において)、reference は initial version に freeze する。
後続 release は新しい version DOI を mint するが、downstream citation graph はそれを
見ない。Artifact が複数回 update された後も、公開 citation count は initial version に
pinned されたまま残る。

Failure は著者側からは notice しにくい: 全ての外部リンクは *正しく resolve する*
(version DOI は valid で実在する artifact を指す)。問題は link が *間違った*
artifact —— current version ではなく out-of-date version —— に resolve すること
である。Downstream citation ingestion pipeline (DataCite、OpenAlex、Scholix、Crossref)
が version DOI を network 全体に propagate し、citation graph が work の time-frozen view を
発展させる。

本 framework の著者は、誤って canonical reference として使われていた version DOI を
2 つの sibling repository にわたる 16 ファイルで inspect することで failure mode を
発見した。Concept DOI と initial version DOI の off-by-one が、最初の間違いを起こしやすく
していた。

## Decision

DOI 登録された artifact への全ての外部リンクは **concept DOI** を使う。Version DOI は
narrow な 2 つの文脈でのみ使う:

1. **歴史的 citation** —— 論文、README、外部 artifact が再現性のために *執筆時点の version を
   exactly* 引用する必要がある場合、version DOI が適切で、canonical-reference 規律は
   適用されない
2. **Changelog と history record** —— `CHANGELOG.md` entry、archived release note、明示的な
   historical archive は対応 version について version DOI を記録してよい。これらの record は
   遡及的に concept DOI に「修正」してはならない; record が保存するために存在する歴史的
   正確性が壊れる

それ以外の全ての文脈 —— README badge、README 散文、CITATION.cff の `doi` および `url`
field、`.zenodo.json` の `related_identifiers`、knowledge graph の `sameAs` triple、
ORCID *Works* entry、AI-facing reference file (`llms.txt`、`llms-full.txt`)、ソーシャルメディア
bio、外部 blog mention —— では concept DOI が canonical reference である。

### 具体的な著者規律

著者がこの decision を維持するための規律:

1. 最初の deposit が完了したら、deposit record から両方の DOI を identify する。Concept DOI は
   ほとんどの archive interface で *cite-all-versions* DOI とラベルされ、version DOI は
   特定 version 番号でラベルされている
2. 両方の DOI を deposit と並べて private note に明示的なラベル付きで記録し、後続の混乱を
   回避する
3. 次段落が通常 inhabit する全ての artifact で concept DOI を使う
4. 著者の repository に対して version DOI を search-tool query で定期的に検証する: 上記
   narrow context 以外での出現は drift incident であり修正対象

## Alternatives Considered

**Version DOI を全体で使い、release ごとに reference を re-issue する。** 却下: release
頻度に比例した churn を生み、fragile (1 つの reference 漏れが drift を生む) であり、
concept DOI はまさにこの作業を回避するために存在する。

**文脈次第で「stable」reference には version DOI を、「latest」reference には concept DOI を使う。**
却下: 2 つの文脈の境界は判断負荷が高く artifact ごとに variation するため、inconsistent な
適用を生む。Concept DOI が default で正しい選択であり、例外の小さな集合 (再現性 citation) は
規則の半分として管理するより例外として管理する方が容易である。

**GitHub release URL または canonical repository URL のみを使い、DOI を完全に避ける。**
却下: priority claim (DOI が anchor するよう設計されている) を放棄し、ingest pipeline が
populate する citation graph から artifact を取り除く。Framework の Layer 4 は明示的に
DOI 登録を priority claim の substrate として identify している; DOI を捨てる戦略は
Layer 4 を運用できない。

## Consequences

**Positive.**

- Citation network が canonical reference を ingest し、それは常に最新 version に resolve する; downstream citation count と version sprawl が artifact を特定の歴史的 version に pin しない
- 著者の外部 surface は release cadence に対して不変; concept DOI は一度設定すると maintenance を要しない
- Drift 検出は機械的操作になる (出現すべきでない場所での version DOI 検索)

**Negative.**

- 規律は deposit 時に即時適用しなければならない; concept DOI と initial version DOI の off-by-one が初回の間違いを起こしやすくする。規律は最初の deposit での間違いを許容する (recovery は機械的) が、間違いが未修正のまま残るほど cost は compounded する
- 再現性 citation は明示的 override を要する; 全ての DOI link を canonical reference として扱う reader は、一部の link が意図的に version 固有であることに気付かない

**Tradeoff acknowledged.**

Framework は artifact の *最新 version* を citation の canonical target として扱う。
歴史的精度 (各 version を公開時点で citation) を好む著者は policy を adapt すべき:
その context では version DOI が正しい canonical reference であり、concept DOI が例外
となるかもしれない。Framework の preference は LLM 経由の拡散 context を反映し、reader は
典型的に歴史的 snapshot ではなく current articulation を欲する。

## Lineage

原観察: 2026-05 月、著者は 2 つの sibling repository の DOI reference を audit し、
initial version DOI が canonical reference として使われていた 16 ファイルを発見した。
これは ORCID record、citation file、knowledge graph、AI-facing reference file に
propagate していた。Drift は ingestion-side correctness check (全ての URL は resolve した)
または外部 citation query (version DOI は valid で downstream consumer によって正しく
citation されていた —— ただ間違った artifact を citation していただけ) では検出されなかった。
Recovery は機械的だった: version DOI に対する search-tool query で全 16 occurrence を
locate して systematic に修正した。

Decision は corrective action を standing policy に汎化する: canonical-reference 形は
*常に* concept DOI、citation graph の substrate がそれをそう扱い、version DOI は
明確に適切な歴史的 context のために予約される。
