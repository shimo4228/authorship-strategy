# Concept URI + DefinedTerm 実装計画 (authorship-strategy)

## Context

独自概念に canonical Concept URI を与え Schema.org DefinedTerm / DefinedTermSet として機械可読化したい、という依頼。search-first 調査の結論: **求めるインフラは hub repo (`shimo4228/shimo4228`) に既に実在・稼働中**であり、本件の実体は「新規構築」ではなく「authorship-strategy を既存エコシステム規約へ収束させる conformance 作業」である。著者確認済み: @id は hub-vocab へ全面移行、hub 側変更もスコープに含める。

---

## 1. Current State (調査結果)

- **Glossary**: `docs/glossary.md` (EN, 39 entries) + `docs/glossary.ja.md` (JA)。`##` 見出し + prose。明示 ID/anchor なし (GitHub 暗黙 anchor のみ、`## Attribution Diffusion (Layer 2)` → `#attribution-diffusion-layer-2` と括弧で崩れる)。alias は prose のみ (例: regurgitation test)。
- **graph.jsonld**: 91 nodes、Concept 20 個。@id = `https://github.com/shimo4228/authorship-strategy#concept/<slug>` (repo-fragment)。`DefinedTerm` 型なし。`definesConcept` は 18/20 (audience-layer-split / retrieval-suppressed-naming-probe が漏れ)。Concept→glossary リンクなし。
- **Hub 既存インフラ (GitHub Pages 配信中)**:
  - `concepts/<slug>.html` × 22 — DefinedTerm + WebPage + FAQPage JSON-LD、canonical tag、`inDefinedTermSet`、`sameAs → vocab#concept/<slug>`
  - `concepts/index.html` — DefinedTermSet
  - `vocab.jsonld` — DefinedTermSet + 103 DefinedTerm (classes/properties/15 hub 概念)、`vocab.html` で dereference 可
  - `sitemap.xml` (26 URLs)、生成は `scripts/concepts_data.json` → `scripts/build_concept_pages.py` (決定論・冪等・stdlib only)
- **Sibling 4 line (AKC/CA/AAP/ANS) は全て移行済み**: `["Concept","DefinedTerm"]` 型、共有概念 = `https://shimo4228.github.io/shimo4228/vocab#concept/<slug>`、line 固有 = `vocab#akc/concept/<slug>` 等。**authorship-strategy が唯一の未移行 line**。
- **skill 正本** (`~/.claude/skills/jsonld-knowledge-graph/SKILL.md`): Concept @id = vocab namespace と規定。cross-graph discipline = 「hub の @id が canonical、copy-paste 再利用、新規は hub 先行登録」。現 repo は規約乖離状態。
- **ADR**: 23 本、frontmatter なし・harness/vendor/framework 中立規約 (schema.org という語も ADR 本文禁止)。concept 参照は prose の相対リンクのみ。graph→ADR (`recordedIn`/`instantiatedBy`) はあるが逆向きなし。
- **RFC**: この repo に rfcs/ store は存在しない (台帳は `.notes/TASKS.md`)。
- **Articles**: zenn-content に graph なし。ADR-0016 により essay は entity federation (sameAs/ORCID/DOI/SWHID/固有語彙) で束ねる方針 — per-article node は設計上不要。
- **Authorship**: Person node @id = ORCID URL、CITATION.cff / .zenodo.json / codemeta.json に同一 ORCID。既存 identity source で十分。
- **CI/build**: authorship-strategy は完全手書き静的 (workflow ゼロ)。HF mirror は `hf-sync/sync.sh` (graph.jsonld + graph.jsonl のみ、手動)。

**二重 URI 問題**: three-axis-inversion / four-layer-framework / dual-entry-point は hub-vocab URI と repo-fragment URI が sameAs なしで併存。slug drift もあり (`idea-vs-scaffold-separation` vs hub page `idea-versus-scaffold-separation`)。

## 2. Existing Capabilities (再利用)

hub の concepts_data.json + build_concept_pages.py + vocab.jsonld + sitemap 生成、skill `jsonld-knowledge-graph` の @id 規約と `graph_lint.py` (複数ファイル指定で cross-file NAME-DRIFT 検査)、`hf-sync`、Person/ORCID federation。**新規に作るものはゼロ**。

## 3. Gap

(a) AS graph の Concept 20 個が DefinedTerm 未採用 + repo-fragment @id、(b) 二重 URI 未接続、(c) Concept→glossary リンク欠如、(d) definesConcept 2 件漏れ、(e) AS 固有概念の一部に concept page なし、(f) alias (regurgitation test) が構造化されていない。

## 4. Concept URI Recommendation

**新 URI 体系は設計しない。既存 2 層構造をそのまま canonical とする**:

- **Concept 識別子 (概念そのもの)**: 共有概念 = `https://shimo4228.github.io/shimo4228/vocab#concept/<slug>`、AS 固有概念 = `https://shimo4228.github.io/shimo4228/vocab#as/concept/<slug>` (AKC の `#akc/` に倣い line 略称 `as`)
- **Concept page (概念を記述する document)**: `https://shimo4228.github.io/shimo4228/concepts/<slug>.html` — Concept 本体とは `sameAs` / `subjectOf` で接続 (Concept≠Artifact 分離は既存設計が既に満たす)

理由: Pages 配信で dereferenceable、hub は federation 集約点 (CLAUDE.md 設計)、sibling 4 line と byte-identical 再利用可、ユーザー提示 Option A (`/concepts/<slug>`) は page 層として実在済み。repo-fragment URI (Option C) は repo rename/移設に弱く、既に少数派。

**Slug 正規化**: hub が canonical。`idea-vs-scaffold-separation` → `idea-versus-scaffold-separation` に統一 (glossary 見出しとも一致)。

## 5. Schema.org Mapping (最小)

sibling 実装パターンを踏襲 (新規語彙ゼロ):

```json
{
  "@id": "https://shimo4228.github.io/shimo4228/vocab#as/concept/vocabulary-discipline",
  "@type": ["Concept", "DefinedTerm"],
  "name": "Vocabulary Discipline",
  "alternateName": [{"@value": "...", "@language": "ja"}],
  "description": "...",
  "recordedIn": "https://github.com/shimo4228/authorship-strategy/blob/main/docs/glossary.md#vocabulary-discipline",
  "subjectOf": "https://shimo4228.github.io/shimo4228/concepts/vocabulary-discipline.html",
  "sameAs": "https://github.com/shimo4228/authorship-strategy#concept/vocabulary-discipline"
}
```

- `DefinedTerm` 型追加 (sibling 同型)。DefinedTermSet は hub `vocab.jsonld` の既存 set + concepts/index.html が担う — line graph には持たせない (sibling と同じ)
- `recordedIn` (既存 custom edge) → glossary の GitHub 暗黙 anchor へ deep link (glossary 本体は無改変 = 正本維持)
- `subjectOf` (schema.org) → concept page がある概念のみ。@context に `subjectOf` の `@type:@id` coercion 追加が必要 (値書き換えでなく coercion で直す — skill の定石)
- `sameAs` → 旧 repo-fragment URI を保持し外部が既に取得した旧 @id を孤立させない
- alias: `alternateName` に "regurgitation test" 追加 (RSNP)
- termCode / inDefinedTermSet は line graph には追加しない — sibling 4 line が持たず、AS だけ足すと新たな乖離になる (hub の page 側 JSON-LD が既に持つ)

## 6. Integration Model

```
                    Person (ORCID URL @id)  ←─ creator ──┐
                                                          │
  DefinedTermSet (hub vocab.jsonld / concepts/index.html) │
        │ hasDefinedTerm                                  │
        ▼                                                 │
  Concept URI  vocab#concept/<slug> | vocab#as/concept/<slug>
        │ sameAs ──→ 旧 repo-fragment URI (歴史保存)
        │ subjectOf ──→ concepts/<slug>.html   (concept page = document)
        │ recordedIn ──→ glossary.md#<anchor>  (定義の正本)
        │ instantiatedBy ──→ #adr/NNNN ── recordedIn ──→ docs/adr/NNNN.md
        │ groundedIn/citation ──→ arXiv / DOI (外部文献)
        ▲ definesConcept ── ResearchLine (repo, concept DOI) ── isPartOf ──→ hub
  Article/Essay: per-article node は作らない (ADR-0016: entity federation で束ねる)
```

- **ADR→Concept**: ADR ファイル側には何も足さない (frontmatter 追加も URL 記載も不可 — 中立規約)。関係は graph の `instantiatedBy` が既に保持。ADR prose は従来どおり glossary 相対リンク (同じ anchor に解決 = 重複管理なし)
- **RFC**: この repo に rfcs/ なし。rfcs を持つ repo で必要になったら「本文 prose に glossary 相対リンク」を最小形として推奨 (frontmatter への slug/URI 複製はしない — graph が唯一の metadata 保持層)

## 7. Implementation Plan

### Phase A — Pilot (3 概念、両 repo)

3 概念で移行の全経路をカバー:

| Pilot | 経路 | 内容 |
|---|---|---|
| `three-axis-inversion` | 共有・page 既存 | @id を hub の `vocab#concept/three-axis-inversion` へ移行 (copy-paste)、DefinedTerm 型、sameAs=旧URI、recordedIn=glossary anchor、subjectOf=既存 page |
| `retrieval-suppressed-naming-probe` | line 固有・page 既存 | @id → `vocab#as/concept/retrieval-suppressed-naming-probe`、alternateName に "regurgitation test"、**definesConcept 漏れ修正**、subjectOf=既存 page |
| `vocabulary-discipline` | line 固有・page 新規 | @id 移行 + **hub 側 concepts_data.json に 1 entry 追加** (定義は AS glossary に忠実に転記) → `build_concept_pages.py` 再実行 (page + index + sitemap 再生成) |

変更ファイル:
- `authorship-strategy/graph.jsonld` — 3 Concept ノードの @id/型/edge、@context に `subjectOf` coercion、当該 @id を参照する全 edge (definesConcept / downstreamOf / covariesWith / appliesTo 等) を同時更新
- `shimo4228/scripts/concepts_data.json` + `python3 scripts/build_concept_pages.py` 実行 → `concepts/vocabulary-discipline.html`、`concepts/index.html`、`sitemap.xml` 更新

検証:
- `uv run --with pyld python3 ~/.claude/skills/jsonld-knowledge-graph/scripts/graph_lint.py authorship-strategy/graph.jsonld shimo4228/graph.jsonld` (cross-file NAME-DRIFT 込み)
- 旧 @id 残存 grep: `grep -rn '#concept/three-axis-inversion' graph.jsonld` 等で edge 更新漏れゼロ確認
- glossary anchor 実在確認 (GitHub 暗黙 anchor 規則で導出した slug が実際の見出しと一致するか)
- build_concept_pages.py の冪等性 (再実行で diff ゼロ)

### Phase B — 残り 17 概念の全面移行 (Phase A 検証後、同一 pattern の機械的一括適用)

- 共有 3 概念 (four-layer-framework, dual-entry-point + Phase A の three-axis-inversion) は hub @id を copy-paste。残りは `vocab#as/concept/<slug>`。`idea-vs-scaffold-separation` は slug を `idea-versus-scaffold-separation` に正規化
- 全 20 概念に recordedIn=glossary anchor、page 保有 7 概念 (authorship-strategy, three-axis-inversion, attribution-diffusion, two-channel-attribution-diffusion, idea-versus-scaffold-separation, retrieval-suppressed-naming-probe, identifier-federation-triplet ※identifier-federation-triplet は hub 共有) に subjectOf
- definesConcept を 20/20 に補完
- 未掲載概念への concept page 追加は**一括では行わない** — ADR-0010 の anchoring obligation を満たす主要概念から必要時に追加 (page は義務でなく任意層)

### Phase C — 後始末

- `CHANGELOG.md` に conformance 記録 1 行 (新 ADR は起票しない — @id 規約の正本は skill であり、これは新決定でなく規約への収束)
- HF mirror 再同期 `bash ~/.claude/skills/hf-sync/sync.sh Shimo4228/authorship-strategy` — **外部 publish のため著者承認を得てから**
- hub 側 commit/push も同様に著者確認後
- `.notes/TASKS.md` 更新 (deploy 記録)。public projection (implementation-log.md) は doctrine 非投影 precedent に従い**見送り** (ledger のみ)

## 8. Pilot 確認項目

canonical URI 安定 (hub @id copy-paste で typo ゼロ) / JSON-LD 妥当 (graph_lint PASS + page 側は build script が決定論生成) / ADR からの参照 (graph edge 経由で復元可能か pyld expand で確認) / metadata 重複 (glossary 本体・ADR 本体は無改変 = 正本増えず。concepts_data.json の定義転記は既存の許容済み drift vector で今回新設ではない) / agent 探索性 (llms.txt 経由: hub llms.txt は concept index を既に広告済み — AS 側 llms.txt に graph の Concept URI 節を 1 行追記するかは Phase B で判断)

## 9. Migration

全件一括はしない。Phase A (3) → 検証 → Phase B (17、機械的) の 2 段階。concept page の追加はオンデマンド。zenn-content / 論文 / RFC への展開は行わない (articles は ADR-0016 の entity federation が既に担い、per-article migration は設計上不要)。

## 10. Risks

- **stale metadata**: concepts_data.json の定義は glossary の curated copy (既存・許容済み。hub CLAUDE.md が「line glossary が正本、忠実性維持」と規定)。glossary 改訂時の追従は既存 maintenance contract の範囲
- **broken canonical URI**: vocab#as/concept/... は vocab.html に anchor を持たない (dereference すると vocab.html 先頭に落ちる) — sibling line-local URI と同じ既知の性質。「namespace は dereferenceable 必須でない」が skill の明文方針
- **duplicate source of truth**: 増えない。定義正本 = glossary、URI 正本 = hub graph/vocab、page = 生成物
- **移行漏れ**: graph 内 edge の旧 @id 残存 → grep + graph_lint で機械検出
- **ambiguous identity**: sameAs で旧 URI を保持するため二重 URI は「解消」でなく「片方向に序列化」される — canonical の宣言が graph 上で明示されるので判別可能
- **maintenance burden**: 増分は「新概念追加時に hub 先行登録」1 手順のみ (skill 規約に既記載)

## 11. Recommendation

**ADOPT MINIMALLY** — 新システムはゼロ。既存 hub インフラ (vocab.jsonld / concepts pages / build script) への conformance 収束のみ。Discoverability は hub sitemap + Pages が既に担い、本件の実質改善は Retrievability (repo-fragment URI の解消で entity resolution が単一 URI に集約)、Disambiguation (DefinedTerm 型 + alias 構造化)、Graph reconstruction (Concept→glossary→ADR の辺が閉じる)、Provenance (creator=ORCID Person は既設で不変)。ADR-0009 の規律に従い citation lift は主張しない。
