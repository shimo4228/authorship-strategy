# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

(no unreleased changes)

## [0.3.0] - 2026-05-30

Records two ADRs since v0.2.0 — ADR-0008 (RAG-era attribution diffusion as
two channels) and ADR-0009 (dual entry points rebalanced to asymmetric
roles, amending ADR-0006) — and synchronizes the ADR set across all living
surfaces.

**Concept DOI (canonical): [10.5281/zenodo.20263316](https://doi.org/10.5281/zenodo.20263316)**

### Added

- ADR-0008: RAG-Era Attribution Diffusion — Two Channels, Two Time Constants. "The model ingesting the artifact" resolves into two mechanisms with opposite time constants and levers: a parametric channel (absorbed into model weights at training time; slow; driven by cross-platform vocabulary co-occurrence) and a retrieval channel (fetched at query time; fast; driven by freshness and structured data). The two are optimized and measured separately; ghost citation — the source is cited but the author is not named — is the failure mode of pursuing retrieval without parametric burn-in.
- ADR-0009: Dual Entry Points Are Asymmetric. Amends ADR-0006 on 2026 measurement that the two entry points are not co-equal: the concept-form graph carries retrieval-time citation while the prose navigator's citation effect is noise. The pair is retained but made asymmetric — the graph is the retrieval-channel citation lever, the navigator is rescoped to a Business-to-Agent (B2A) context surface rather than an AI-search citation lever.

### Changed

- ADR-count surfaces updated from seven to nine; `docs/adr/README` measurement cluster extended with ADR-0008 and the LLM-first ingest cluster annotated as amended by ADR-0009. ADR-0006 carries a forward-reference note to ADR-0009.
- `graph.jsonld`: added the ADR-0008 and ADR-0009 nodes (both `extends` ADR-0006), a `two-channel-attribution-diffusion` concept downstream of Attribution Diffusion, the two ADRs in the Tactics-layer instantiation list, and the asymmetric-rebalance amendment to the `dual-entry-point` concept (now `instantiatedBy` ADR-0006 and ADR-0009). Dataset description updated to nine ADRs.
- `llms.txt` / `llms-full.txt`: ADR list and cluster prose extended with ADR-0008 and ADR-0009; concept count updated to seventeen.
- `README` (en/ja), `docs/thesis` (en/ja), `docs/CODEMAPS/architecture`: ADR count updated to nine; ADR table extended.

### Notes

- Empirical grounding for both ADRs is drawn from a 2026-05 daily-research ingest (recorded in a companion concept wiki, pages `GEO` and `authorship-strategy`); the specific figures and vendors are recorded in each ADR's Lineage section, keeping the ADR bodies harness-neutral.
- Glossary term additions for the new vocabulary (two-channel diffusion, ghost citation, B2A context) are deferred to a follow-up docs commit; the terms are defined in the ADR bodies in the interim.
- v0.3.0 version DOI (for reproducibility citation only): [10.5281/zenodo.20453455](https://doi.org/10.5281/zenodo.20453455). Per ADR-0001 the concept DOI ([10.5281/zenodo.20263316](https://doi.org/10.5281/zenodo.20263316)) remains canonical for all display and citation.

## [0.2.0] - 2026-05-29

Records two ADRs since v0.1.0 — ADR-0006 (committed post-tag, not previously
released) and ADR-0007 (new) — and synchronizes the ADR set across all living
surfaces.

**Concept DOI (canonical): [10.5281/zenodo.20263316](https://doi.org/10.5281/zenodo.20263316)**

### Added

- ADR-0006: LLM-First Ingest via Dual Entry Points — every framework-governed artifact ships a prose-form navigator and a concept-form linked-data graph as a complementary, synchronously released pair, each reaching an LLM-mediated reader sub-population the other cannot.
- ADR-0007: Human-Attention Platform Signals Are Not a Success Metric — Git-host star counts (gameable: purchasable) and repository page-view counts (structurally blind to LLM-mediated reach) are excluded as optimization targets and success metrics; off-page human-distribution labor is declined as a red-ocean activity; success is measured by the breadth of LLM-mediated channels. On-page human quality is maintained as hygiene, not as a growth lever.

### Changed

- ADR-count surfaces updated from six to seven; `docs/adr/README` regrouped into four clusters (added the metric-rejection cluster).
- `graph.jsonld`: added the ADR-0007 node, a `human-attention-signal-rejection` concept downstream of the scarcity-to-diffusion axis, and the ADR-0007 instantiation in the Tactics layer; Dataset description updated to seven ADRs / four clusters.
- `llms.txt`: ADR list completed (ADR-0006 was absent) and extended with ADR-0007; cluster prose updated.

### Notes

- v0.2.0 version DOI (for reproducibility citation only): [10.5281/zenodo.20446331](https://doi.org/10.5281/zenodo.20446331). Per ADR-0001 the concept DOI ([10.5281/zenodo.20263316](https://doi.org/10.5281/zenodo.20263316)) remains canonical for all display and citation; the version DOI is recorded here for reproducibility only.

## [0.1.0] - 2026-05-18

Initial public release.

**Concept DOI (canonical): [10.5281/zenodo.20263316](https://doi.org/10.5281/zenodo.20263316)**

v0.1.0 version DOI (for reproducibility citation only): [10.5281/zenodo.20263317](https://doi.org/10.5281/zenodo.20263317)

The off-by-one between concept DOI (20263316) and initial version DOI
(20263317) follows the pattern documented in [ADR-0001](docs/adr/0001-concept-doi-canonical.md);
this CHANGELOG entry preserves both values as historical record per
ADR-0001's exception for changelog and history files.

### Added

- Repository scaffold (LICENSE, .gitignore, CITATION.cff, .zenodo.json, CHANGELOG, README skeletons in English and Japanese, CLAUDE.md).
- Normative content: thesis (three-axis inversion + four-layer framework), manifesto (open questions), glossary (key terms), inspiration (lineage references). English primary, Japanese mirror.
- Architectural Decision Records (ADRs):
  - ADR-0001: Concept DOI as Canonical Reference
  - ADR-0002: DOI Federation via .zenodo.json
  - ADR-0003: Cross-platform Dataset Federation (GitHub, Zenodo, Hugging Face Datasets)
  - ADR-0004: Authorship Metadata with ORCID Auto-Update Disabled
  - ADR-0005: README Localization Policy — Audience-Driven Maintenance
- Empirical layer: traffic baseline (twenty-four days of CC0 data across four sibling repositories plus two supporting repositories), method note, limitations.
- AI-facing infrastructure: graph.jsonld (schema.org JSON-LD, 28 top-level nodes), llms.txt (Answer.AI standard), llms-full.txt (consolidated Q&A reference).
- CODEMAPS: file-level architecture map (docs/CODEMAPS/architecture.md).
- Component-skill reference index (docs/skills/README.md): pointers to four external skill repositories that ship the operational forms of the framework — `claude-skill-authorship-strategy` (skill form of the four-layer judgment checklist), `claude-skill-release-doi` (release-time workflow operationalizing the identifier-federation triplet ADRs 0001-0003), `claude-skill-llms-txt-writer` (operationalizes Layer 4 tactic 7's Answer.AI llms.txt convention), and `claude-skill-jsonld-knowledge-graph` (operationalizes Layer 4 tactic 7's JSON-LD knowledge graph). Skill bodies are not copied into this repository; each component skill maintains its own canonical source.
- Component-status criterion: a skill is a *component* when it operationalizes content the doctrine explicitly names (judgment framework, named ADR, or named Layer 4 tactic). Skills useful to adopters but not specifically named are *adjacent ecosystem skills* — listed for reference, not required.
- Terminology discipline: the word *sibling* is reserved for the research-line level (peer research lines in the program). At the skill level, the terms *component*, *peer component*, and *adjacent ecosystem skill* are used; the phrase *sibling component skill* is avoided as overloaded.
