# RFCs

この repo の計画とタスクの公開台帳 — 1 エントリ 1 ファイル `NNNN-slug.md`、ID は
`RFC-NNNN`。提案から小さな作業項目、再提案しない判断（終端エントリ）まで同居する。
**state は各ファイルの frontmatter が唯一の正本**。判断は
[ADR-0025](../docs/adr/0025-planning-and-task-state-in-a-public-rfc-store.md)、実施済みの介入の
日付つき時系列は [implementation log](../docs/empirical/implementation-log.md) にある。

起票の手順と規約（足切り・採番・様式・公開規約）の正本は
[skill: rfc-writer](https://github.com/shimo4228/claude-harness/blob/main/skills/rfc-writer/SKILL.md)、状態語彙は
[skill: task-stocktake](https://github.com/shimo4228/claude-harness/blob/main/skills/task-stocktake/SKILL.md)。規約本文をこの
README には書かない（複製は drift する）。

| # | Title |
|---|---|
| [0001](0001-provenance-hardening-pass.md) | provenance-hardening pass（AAP → AKC → 他 repo） |
| [0002](0002-search-index-admission.md) | 検索索引への入場: GSC の URL 検査、Bing Webmaster、Brave submit-url |
| [0003](0003-code-wiki-badge-restore.md) | Code Wiki で生成済みの repo にだけ badge を戻す |
| [0004](0004-openalex-researchmap-consolidation.md) | OpenAlex の著者名寄せと researchmap の掲載 |
| [0005](0005-autumn-parametric-contrast.md) | 秋窓の parametric contrast を事前登録の規則どおり判定する（期限 2026-12-31） |
| [0006](0006-oq5-and-insource-resweep.md) | OQ5 recursion sweep と Wikipedia insource 検索を再測する |
| [0007](0007-openattribution-adoption.md) | OpenAttribution の採否: (a) domain claim か (b) 送る側の採用表明まで待つか |
| [0008](0008-user-site-repo.md) | user-site repo `shimo4228.github.io` を新設するか |
| [0009](0009-alias-sameas-and-profile-fields.md) | 別名アカウントの sameAs と外部 profile 各欄の扱い |
| [0010](0010-plugin-directory-usage-baseline.md) | plugin directory の掲載記録と Usage の基準値 |
| [0011](0011-citation-monoculture-intake.md) | Citation Monoculture を inspiration と ADR-0011 の注記に取り込む |
| [0012](0012-ahrefs-did-scope-note.md) | Ahrefs の JSON-LD DiD の適用範囲を ADR-0009 か OQ9 に書く |
| [0013](0013-admission-audit-preregistration.md) | 入場（admission）監査の事前登録 |
| [0014](0014-referrer-three-way-split.md) | referrer を AI エンジン・検索・人の面の 3 つに分けて集計する |
| [0015](0015-glossary-plain-term-bridge.md) | 造語の隣に、問う側が使う汎用語を 1 文添える |
| [0016](0016-vendor-studies-coi-note.md) | vendor 著者の研究を COI つきで manifesto に 1 文入れるか |
| [0017](0017-watch-agentic-resource-discovery.md) | WATCH: ARD（`/.well-known/ai-catalog.json`） |
| [0018](0018-watch-perplexity-pages.md) | WATCH: Perplexity Pages |
| [0019](0019-watch-hosted-mcp-doc-server.md) | WATCH: zero-config・第三者 host の MCP doc-server |
| [0020](0020-watch-raid.md) | WATCH: RAiD（研究活動の識別子） |
| [0021](0021-defer-w3id-alias.md) | DEFER: w3id.org の永続 URI |
| [0022](0022-no-ghost-citation-disambiguation-essay.md) | ghost citation の曖昧性解消記事を書かない |
| [0023](0023-no-agent-benchmarks-as-seeding-channel.md) | agent benchmark と leaderboard を seeding channel にしない |
| [0024](0024-no-repo-wiki-alternatives.md) | DeepWiki の代替サービス群に onboard しない |
| [0025](0025-no-wikipedia-self-citation.md) | Wikipedia に自分の成果物を引用させない |
| [0026](0026-no-2026-07-scholarly-and-community-surfaces.md) | 2026-07-01 の外部リサーチで落とした surface 群 |
| [0027](0027-hf-daily-papers-and-posts-unavailable.md) | HF Daily Papers と HF posts は経路がないので使わない |
| [0028](0028-ai-native-venues-2026.md) | AI-native venue 4 件と、新しい AI-native venue の line |
| [0029](0029-no-prov-o-export.md) | PROV-O の provenance export を採らない |
| [0030](0030-no-term-only-doi.md) | 造語単独の DOI を取らない |
| [0031](0031-no-bulk-jsonld-embed.md) | served page を持たない repo へ JSON-LD を一括で埋め込まない |
