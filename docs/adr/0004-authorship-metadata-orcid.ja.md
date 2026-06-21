Language: [English](0004-authorship-metadata-orcid.md) | 日本語

# ADR-0004: ORCID Auto-Update OFF での著者メタデータ

> **Summary.** 著者の persistent identifier record は concept DOI のみで enrich し、
> version DOI では決して enrich しない。Archive service の *Auto-Update* 機能
> (新公開された version DOI すべてを著者 record に別 work として自動 push する) は
> 明示的に disable する。著者 record は accumulating な version-DOI 台帳ではなく、
> research ecosystem の構造を mirror する clean な 3 行 (または小 N 行) の提示を retain する。

## Status
accepted

## Date
2026-05-18

## Context

DOI 登録 research ecosystem で作業する著者は典型的に persistent author identifier (ORCID iD、
または類似 service の同等 identifier) を持つ。Identifier は著者の公開作品が aggregate される
anchor として機能する: identifier に対する query が *Works* listing を返し、downstream
service (citation graph、search engine、institutional registry) がそれを canonical author
record として使う。

ORCID にリンクするほとんどの DOI 登録 service は *Auto-Update* 機構を提供する: 著者が
既存 artifact の新 version を publish すると、新 version DOI が ORCID Works listing に
別 entry として自動的に追加される。機構は convenient —— publication workflow から手動
step を取り除く —— だが、[ADR-0001](0001-concept-doi-canonical.ja.md) の *concept DOI を
canonical reference として使う* 規律と badly に interact する。

Interaction は以下の通り。[ADR-0001](0001-concept-doi-canonical.ja.md) 下では、artifact の
canonical reference はその concept DOI であり、最新 version に resolve する。Version DOI は
再現性 citation のために存在するが、artifact の public-facing identifier ではない。しかし
Auto-Update 下では、publish された全ての version DOI が ORCID Works listing に *別 work* として
push される —— listing は同じ概念的 artifact の version 間で dedupe しない。なぜなら
concept DOI と version DOI は listing にとって distinct な DOI だから。

中程度の release cadence を持つ research ecosystem (例: 4 artifact × year 4 version = year 16
entry) では、Auto-Update 機構は 1 年以内に概念的 artifact あたり複数 entry を持つ ORCID
record を produce し、entry は visibly に aggregate されない。2-3 年後には record は
概念的に少数の research line である何かについて数十 entry を含み、*research ecosystem の
構造* —— 3 または 4 line、各自の concept を持つ —— は record で見えなくなる。Record は
version DOI の長い undifferentiated な台帳として present する。

この dilution は framework の authenticity layer ([Layer 1](../thesis.ja.md)) と
conflict する: 著者の *genuine articulation* は concept level (3 または 4 research line、
各々自身のアイデンティティを持つ) にある; version DOI の長い台帳として present する record は
articulation を、より administrative な release-event-level identifier に obscure する。

## Decision

著者の ORCID record (または同等の persistent author identifier) は以下のように維持される:

1. *Works* listing は **concept DOI のみ** を含み、概念的 research line ごとに 1 つ
2. Archive-to-ORCID *Auto-Update* 機能は **disable**。新 version DOI は自動追加されない
3. Archive-to-ORCID *Link Works to ORCID* 機能は **enable**。これは著者が specific work を必要に応じて手動で ORCID に push する能力を retain する (例: 新概念的 research line が作成され、その concept DOI を追加する必要がある場合)
4. 新概念的 research line が追加されるとき、著者は新 line の concept DOI を手動で ORCID に push する。手動 push は per-line operation (per-version ではない) なので、頻度は research ecosystem の structural cadence (ほとんどの著者にとって year に 0 から数回) に matches し、release cadence (year に数回になりうる) には matches しない
5. Persistent-identifier profile の著者の biographical text は research ecosystem を concept level で describe する (例: "3 つの research line on ...")、count は Works listing の concept DOI 数を反映する。Biographical text は DOI を直接 list しない; Works listing がその役割を果たす

### 適用規律

著者が persistent author record を維持する規律:

1. 新 research line を追加するとき、最初の deposit が公開され concept DOI が判明したら、著者は citation-graph service の author-anchored Works view (例: ORCID iD 用の DataCite Commons) を開き、新 concept DOI の record page で *Add to ORCID Record* action を使う
2. ORCID profile の biographical text は research line の incremented count を反映するよう update される
3. 著者は Auto-Update が disable のままであることを verify する (設定が service-side 変更で reset される可能性あり)

## Alternatives Considered

**Convenience のため Auto-Update を enable する。** 却下: Convenience は per-line 手動 step を
省略する代わりに framework の authenticity layer と conflict する release-event-level
identifier で public record を汚染する。手動 step は infrequent (year に 0 から数回) で、
cost-benefit は authenticity preservation を favor する。

**別の professional profile (personal website、institutional page) を canonical author record として使い、ORCID を secondary mirror として残す。** 却下: ORCID と同等の persistent
author identifier は increasingly に downstream citation graph、search engine、institutional
registry が query する substrate である。Canonical author record は著者が prefer する場所では
なく、downstream service が見る場所にある必要がある。

**ORCID record を定期的に clean up して version DOI を削除する。** 却下: Clean up は
Auto-Update churn rate でスケールする recurring maintenance burden; source で churn を防ぐ
(Auto-Update を disable) 方が structurally に simpler。

## Consequences

**Positive.**

- 著者の persistent-identifier record は research ecosystem の構造に適切な概念 level で present し、個別 release event の administrative level ではない
- Persistent identifier を query する downstream citation graph と search engine が research ecosystem の構造 (小数の clearly-distinguished line) を surface し、長い undifferentiated 台帳ではない
- 手動 push step は 概念的 research line cadence (rare) でのみ起き、release cadence (frequent) では起きない

**Negative.**

- 著者は新概念的 research line が作成されるたびに新 concept DOI を手動 push することを思い出す必要がある。頻度は低く step を忘れやすい; framework は本 ADR と per-line 作成 checklist に step を documentation する
- Version DOI は persistent-identifier record に現れない。特定の歴史的 version を citation したい reader は version DOI を Works record で直接見つける代わりに concept DOI を follow して version listing に到達する必要がある。これは framework が version DOI を canonical identifier ではなく再現性 citation 例外として扱うことと consistent
- 著者は citation-graph service の UI で手動 push capability が available のままであることに依存する。Service が Auto-Update のみを deprecate して手動 push を捨てると、規律の維持が困難になる

## Lineage

原観察: 2026-05 月、著者は personal ORCID record (iD `0009-0002-6168-4162`) を 3 つの
sibling research line の 3 つの concept DOI で enrich し、対応する citation-graph service の
profile (DataCite Profiles) で Auto-Update を OFF に意図的に設定し、Link Works to ORCID は
enable のまま retain した。Choice はその時点で documented され、research ecosystem の release
cadence を考慮すると Auto-Update を enable すると ORCID record を 1 年以内に数十 entry に
膨張させ、framework の authenticity layer が present することにコミットする 3 line 構造を
obscure するという rationale で justify された。

同 operation からの secondary 観察: 作業中に立てた仮説 —— citation-graph service の author
search が concept DOI を全く surface しない (concept DOI の creator metadata が archive から
citation-graph service に propagate しないかもしれない) —— は incorrect だった。Archive
service は concept DOI と各 version DOI の両方に creator metadata を register する;
citation-graph service の author search は両方を surface する。*concept DOI のみ追加する*
規律はしたがって authorial choice であり、技術的 workaround ではない。同 workflow を follow する
次の著者は同じ偽仮説に misled されるべきでない。

Decision は corrective action を standing maintenance policy に汎化する: persistent author
record は research ecosystem が operate する概念 level でキュレートされ、release-level
identifier の administrative churn は design でその record から exclude される。
