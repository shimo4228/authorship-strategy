# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Repository scaffold (LICENSE, .gitignore, CITATION.cff placeholder, .zenodo.json placeholder, CHANGELOG, README skeletons in English and Japanese, CLAUDE.md).
- Normative content: thesis (three-axis inversion + four-layer framework), manifesto (open questions), glossary (key terms), inspiration (lineage references). English primary, Japanese mirror.
- Architectural Decision Records (ADRs):
  - ADR-0001: Concept DOI as Canonical Reference
  - ADR-0002: DOI Federation via .zenodo.json
  - ADR-0003: Cross-platform Dataset Federation (GitHub, Zenodo, Hugging Face Datasets)
  - ADR-0004: Authorship Metadata with ORCID Auto-Update Disabled
  - ADR-0005: README Localization Policy — Audience-Driven Maintenance
- Empirical layer: traffic baseline (twenty-five days of CC0 data across four sibling repositories), method note, limitations.
- AI-facing infrastructure: graph.jsonld (schema.org JSON-LD), llms.txt (Answer.AI standard), llms-full.txt (consolidated Q&A reference).
- CODEMAPS: file-level architecture map (docs/CODEMAPS/architecture.md).
- Component-skill reference index (docs/skills/README.md): pointers to four external skill repositories that ship the operational forms of the framework — `claude-skill-authorship-strategy` (skill form of the four-layer judgment checklist), `claude-skill-release-doi` (release-time workflow operationalizing the identifier-federation triplet ADRs 0001-0003), `claude-skill-llms-txt-writer` (operationalizes Layer 4 tactic 7's Answer.AI llms.txt convention), and `claude-skill-jsonld-knowledge-graph` (operationalizes Layer 4 tactic 7's JSON-LD knowledge graph). Skill bodies are not copied into this repository; each component skill maintains its own canonical source.
- Component-status criterion: a skill is a *component* when it operationalizes content the doctrine explicitly names (judgment framework, named ADR, or named Layer 4 tactic). Skills useful to adopters but not specifically named are *adjacent ecosystem skills* — listed for reference, not required.
- Terminology discipline: the word *sibling* is reserved for the research-line level (peer research lines in the program). At the skill level, the terms *component*, *peer component*, and *adjacent ecosystem skill* are used; the phrase *sibling component skill* is avoided as overloaded.

## [0.1.0] - YYYY-MM-DD

Initial public release. DOI to be assigned by Zenodo upon tag publication.
