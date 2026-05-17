Language: [English](0005-readme-localization-audience-driven.md) | 日本語

# ADR-0005: README ローカライズ ポリシー —— Audience-Driven な維持

> **Summary.** 人間向け documentation (README ファイルおよび同等の landing-page content)
> の locale mirror は、想定 audience の推測ではなく、観測された traffic data に基づいて
> 追加・退役される。Measurable な direct 人間 audience を持たない mirror は、その言語
> コミュニティが abstract に *seem* important であっても退役される。

## Status
accepted

## Date
2026-05-18

## Context

幅広い potential 関心の project を host する repository は frequent な README ローカライズの
candidate である: maintainer は複数の言語コミュニティでの audience を reason し、それらの
コミュニティに project を accessible にするために locale-mirror README ファイル
(`README.zh-CN.md`、`README.pt-BR.md` 等) を produce する。

各 locale mirror には maintenance cost がある。Canonical README が edit される —— 新機能、
新 ADR、sibling-line reference —— たびに、各 mirror は accurate のまま残るために parallel に
edit されなければならない。Canonical README と stale な mirror 間の drift は、mirror が
ない場合より悪い outcome を produce する: mirror の言語の reader は canonical README が
superseded した content を見て、それに rely するかもしれない。

LLM 経由の拡散 context では、ローカライズ計算に追加の考慮がある: LLM 経由 audience
(LLM training pipeline、LLM 経由 user query) は locale mirror を要しない。LLM は canonical
(典型的に英語) source を読み、user の言語で応答する。*User* experience は locale-appropriate;
*ingestion* は locale-independent。Locale mirror はしたがって *direct browser* audience —— 
LLM 経由 path 経由ではなく直接 URL 経由で repository に arrive する reader —— のみに役立つ。

特定言語コミュニティの direct-browser audience が per-mirror maintenance cost を justify
するかは empirical question。事前推論 (「言語コミュニティが大きいから audience も substantial に
違いない」) は unreliable。なぜなら特定 repository の *direct-browser* audience は言語
コミュニティのサイズと全く matches しないかもしれない。

## Decision

人間向け landing-page documentation の locale mirror は、sustained period (少なくとも 30 日)
で測定された direct-browser traffic に基づいて、mirror が canonical document の edit ごとに
imposes する maintenance cost と比較して追加・退役される。

### 判断基準

Default decision は **著者の primary working language を超えた mirror なし**。Mirror は
以下の両方が成立する場合のみ追加される:

1. **Direct-browser audience の evidence**: Repository の traffic data (または同等の signal) が、direct human visit が提案された mirror 言語を prefer する reader を plausibly に含むことを示す。「Plausibly」は strict に interpret: non-trivial 数の unique 人間 viewer (自動化 tool に dominated される unique cloner ではない)、測定 window で sustained
2. **Sustained maintenance commitment**: 著者が mirror を以降の全ての canonical document edit で canonical document と sync 維持することを indefinitely にコミットする。Commitment は「今 translate する」ではない; 「translate し続け continuing translating する」である

Mirror は以下のいずれかが成立する場合に退役される:

1. **Direct-browser audience の absence**: 30 日以上の traffic data が、mirror の言語を prefer する reader からの direct human visit が statistically zero であることを示す
2. **Maintenance commitment の loss**: 著者が canonical document と parallel に mirror を edit するのを止めており、両者の drift が小数の edit を超える

### 適用規律

著者がローカライズ decision を維持する規律:

1. 新 repository を作成するとき、README は著者の primary working language で作成される。本著者の場合、英語と日本語; 他の著者では parallel editing を sustain できる小集合の言語
2. Locale mirror request (外部 request または著者自身の推測) は direct-browser audience の evidence が存在するまで defer される
3. Locale mirror が存在するが、sustained 測定 window 後の traffic data が direct-browser audience を示さない場合、mirror は hard deletion で退役される。Repository の version control が歴史的 content を retain する; audience evidence が後に emerge した場合の将来 restoration は機械的
4. 退役は changelog で documentation され、decision が後続 reader (および著者の将来の自分自身、そうでなければ mirror が存在しない理由を wonder するかもしれない) に discoverable になる

## Alternatives Considered

**全 major 言語コミュニティのために mirror を維持する。** 却下: Per-mirror maintenance
cost は mirror 数に対して linearly に scale し、canonical document の単一 edit が *N*-mirror
configuration で *N+1* ファイル edit を要する。Frequent-edit repository では、これは
project の documentation maintenance budget を audience benefit に commensurate しない形で
dominate する。著者の specific experience: 5-mirror configuration が per-feature
documentation 作業を約 6 倍に乗算し、per-mirror で statistically zero unique 人間 viewer の
測定 audience に対するものだった。

**Major release boundary でのみ mirror を維持する。** 却下: Canonical document を 1 release
cycle 分 lag する mirror は mirror がないより悪い。なぜなら mirror の言語の reader が
canonical document が superseded した content を見るから。*Mirror がないより悪い* drift 閾値は
小さい; 「release boundary で translate する」はそれを routinely 超える。

**Mirror に machine translation を使い、canonical document が substantially 変わるときのみ
edit する。** 却下 (hesitation 付き): Machine translation は markedly に向上し、最終的には
locale mirror の right substrate になるかもしれない。Current concern は machine translation が
技術的正確性を verify せずに fluent output を produce することである; coined terminology、
コード例、特定 URL path を含む documentation では、verification cost が parallel-editing cost に
approach する。Machine translation が technical content で trust できるようになったとき、
subsequent ADR が revisit するかもしれない。

**Canonical document を単一ファイル内で多言語化する (例: 英語と日本語の paragraph を
side-by-side で)。** 却下: これは 2 言語を超えて poorly scale し、各言語の reader の
readability を reduce し (unfamiliar passage を skip past するよう求められる)、人間 reader と
自動化 tooling の両方にとって awkward なファイルを produce する。2 言語 pair (canonical + 1
parallel mirror) が sustainable form; 2 を超えると cost-benefit が collapse する。

## Consequences

**Positive.**

- Documentation maintenance cost が著者の primary working language に bounded され、substantive content 作業の時間が free up される
- Drift リスクが最小化される: 2 言語の parallel editing は実際に sustainable; 5 または 6 の parallel editing はそうではない
- 判断基準は *evidence-based*: 新 mirror の将来 request は著者 preference で arbitrate されるのではなく traffic data に対して evaluate できる

**Negative.**

- Mirror のない言語コミュニティの reader は documentation への direct-browser path を持たない。(LLM 経由 path は remain: reader の LLM が canonical document を on demand で translate する。) Framework はこれを mirror 言語の direct-browser audience が典型的に対応言語コミュニティサイズよりはるかに小さいという観察を考慮して acceptable と扱う
- 退役された mirror はブックマークしていた reader に対して 404 response を produce する。Framework は同じ audience-evidence concern を考慮してこれを acceptable と扱う; mirror の言語の reader でブックマークしていた者は、仮定により、traffic data に direct human visit として現れるはずで、彼らの absence が退役を trigger した
- 判断は traffic-data availability に依存する。Traffic data を surface しない (または不安定な形で surface する) hosting platform 上の repository は規律を as-stated で適用できない; それらの repository は異なる audience signal を substitute するか、mirror-free に default するかしなければならない

## Lineage

原観察: 2026-05 月、著者は 4 つの sibling research repository にまたがる 5-locale-mirror
README configuration の 30 日分 traffic data を audit した。Audit は各非 primary mirror の
direct-browser audience が *statistically zero unique 人間 viewer* —— せいぜい single-digit
で、自動化 tool、LLM training pipeline、AI assistant context-fetch に dominated される
per-mirror clone count は数百 —— であることを発見した。Per-canonical-README edit の maintenance
cost は約 6 倍 (canonical edit 1 つ plus mirror edit 5 つ、各 mirror で cross-linguistic
quality verification overhead) だった。

退役 decision は deliberately になされ、4 つの非 primary mirror は hard-deleted され、
version control が歴史的 content を将来 restoration の possibility のために retain した。
Restoration 機構は退役 release の changelog に documentation されている。

Decision は approach を standing policy に汎化する: Locale mirror は evidence-driven な
追加であって default ではない; evidence の absence は mirror-free のままでいる、または既存
mirror を退役する十分な根拠である。
