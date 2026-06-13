# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.6.0] - 2026-06-13

Records ADR-0013 (the intrinsic content-derived identifier layer that
complements the extrinsic DOI and closes manifesto open question 4) and
the empirical layer's implementation log — an intervention timeline
timestamping which diffusion tactics were deployed on the ecosystem and
when, the methods companion the *no pre-versus-post intervention
comparison* limitation calls for.

### Added

- ADR-0013: Intrinsic Content-Derived Identifiers as a Complementary Priority-Claim Layer. Adds an intrinsic identifier layer — SWHID (ISO/IEC 18670), computed from the artifact and its version history, verifiable without consulting any registry, granular down to a single line — complementing the extrinsic DOI layer; each layer covers the other's failure mode. Every release now triggers an explicit archival request to a content-addressed public software archive, with the snapshot identifier recorded alongside the DOI in citation metadata; for DOI-impractical artifact genres the intrinsic identifier is the designated substitute priority-claim mechanism. Closes manifesto open question 4 (a status note in the manifesto records the resolution). Lineage: the 2026-06-13 diffusion-channel review and the same-day bulk archival of all 36 public repositories of the program. graph.jsonld gains the ADR-0013 node (`extends` ADR-0003) and its Tactics-layer instantiation.
- `docs/empirical/implementation-log.md`: an intervention timeline recording which of the framework's tactics were deployed on the author's own ecosystem and when, grouped by the layer each operationalizes. It is the methods companion the *no pre-versus-post intervention comparison* limitation requires — supplying the intervention dates a future contrast would need — makes no effect claim, and states the recursive-self-application concern (manifesto open question 5) rather than hiding it. English-only, per the empirical layer convention.

### Changed

- ADR-count surfaces updated from twelve to thirteen across all carriers (root README en/ja, llms.txt, llms-full.txt, CLAUDE.md, CODEMAPS; `docs/adr/README` en/ja extended with the intrinsic-identifier-decision paragraph). llms-full.txt gains the full ADR-0013 entry, the cluster-narrative sentence, the implementation-log mention in the empirical answer, and the "answered by ADR-0013" note on manifesto open question 4.
- `docs/empirical/README.md` "What the layer contains" gains the implementation-log entry; CODEMAPS document-role index gains the implementation-log row and notes the empirical layer's English-only convention.

## [0.5.0] - 2026-06-13

Records two ADRs since v0.4.0 — ADR-0011 (the two-channel probe
protocol, the measurement instrument ADR-0008 demanded) and ADR-0012
(link-index channel selection, the enclosure axis applied to external
listings) — plus the first ADR-0011 protocol run as the empirical
layer's probe baseline.

### Added

- v0.5.0 version DOI (for reproducibility citation only): [10.5281/zenodo.20673646](https://doi.org/10.5281/zenodo.20673646). Per ADR-0001 the concept DOI ([10.5281/zenodo.20263316](https://doi.org/10.5281/zenodo.20263316)) remains canonical for all display and citation.
- ADR-0012: Link-Index Contributions to External Collections. Applies the thesis's enclosure axis to channel selection for external curated collections (community-curated link directories, skill marketplaces, dataset registries). Contributions are link-index entries only — the canonical artifact stays in the author's repository while the host carries a hyperlink plus a short factual description; vendor-type contributions are declined by default. Every prospective host passes a four-condition pre-submission audit (corporate ownership / absence of an open license / content-vendoring structure / paid-product funnel); a host meeting all four is excluded even for link-only entries, and a listed host that later introduces paid tiers or content vendoring triggers withdrawal. Grounded in two 2026 withdrawal episodes whose shared pattern — vendored content is captured by any subsequent enclosure the host introduces — instantiates the enclosure axis at the channel-selection level. graph.jsonld gains the ADR-0012 node and its Tactics-layer instantiation.
- ADR-0011: Two-Channel Probe Protocol — Measuring Each Channel by Its Own Instrument (**experimental**). Builds the measurement instrument ADR-0008's Consequences demanded: a scheduled two-channel probe protocol interrogating frontier models with search suppressed (retrieval-suppressed naming probe, parametric channel) and search enabled (citation probe, retrieval channel — making ghost citation observable within a single answer as an owned identifier cited while the author goes unnamed in prose). Detection is deterministic string matching against a versioned lexicon over retained raw responses, never model judging; prompts are fixed single-variable templates with a negative control quantifying the confabulation noise floor; every change to prompts, models, or lexicon is a visible series break; the retrieval channel runs on a fast calendar cadence while the parametric channel is event-driven on model-generation changes (a monthly currency check — silent-swap detection, provider-catalog diff, staleness guard — replaces calendar re-probing of frozen weights); channels are never blended. The public probe log feeds the parametric channel it measures — recorded as a stated confound and an on-thesis act of diffusion. The instrument itself lives in the federation hub beside the traffic log (see Lineage).
- `docs/glossary` (en/ja): added a Retrieval-Suppressed Naming Probe entry; extended the Ghost Citation entry (now a measured rate under ADR-0011) and the Two-Channel Attribution Diffusion measurability note (ADR-0011 closes the black-box side of the gap the white-box methods leave open).
- `graph.jsonld`: ADR-0011 node (`extends` ADR-0008), `retrieval-suppressed-naming-probe` concept (downstream of two-channel-attribution-diffusion, grounded in arXiv:2602.06718 / 2604.25707 / 2603.09296), Tactics-layer instantiation.

- `docs/empirical/probe-baseline-2026-06.md`: first run of the ADR-0011 protocol (2026-06-12, four providers, probe set v1, detector v2). Records the parametric channel's over-determined zero as the pre-intervention baseline the traffic layer lacks, a clean negative-control floor, one full retrieval attribution via owned artifacts (including the AI-facing entry point), citation-selection losses on topical queries elsewhere, and the instrument shakedown notes (echo guard, reasoning-token starvation, endpoint-dependent citation metadata). Includes a pre-registered expectation (recorded 2026-06-12) for the earliest panel generation that could show a parametric transition and its expected partial-first shape, so a future transition reads as the outcome of a falsifiable prediction rather than a post-hoc reading.

### Changed

- ADR-count surfaces updated from ten to twelve across all carriers (root README en/ja, llms.txt, llms-full.txt, CLAUDE.md, CODEMAPS); `docs/adr/README` (en/ja) extended with the measurement-instrument and channel-selection paragraphs; the diffusion-mechanism cluster becomes 0008-0011. The llms.txt / llms-full.txt ADR catalogs gain the ADR-0011 and ADR-0012 entries in the same pass.
- `docs/empirical/README.md`: the single-window regurgitation-test limitation now points to ADR-0011's protocol as its structured successor; the paragraph is retained as the record of the only pre-protocol observations. "What the layer contains" gains the probe baseline.

## [0.4.0] - 2026-06-11

Records one ADR since v0.3.0 — ADR-0010 (vocabulary discipline: coin
sparingly, anchor densely) — and applies the discipline retroactively to
the existing vocabulary: the 2026 GEO and training-data-attribution
literature is cited as upstream evidence for the two-channel concepts,
Wikidata QIDs federate the author and research-line identities, and the
knowledge graph's cross-reference values are fixed to resolve as RDF
edges.

**Concept DOI (canonical): [10.5281/zenodo.20263316](https://doi.org/10.5281/zenodo.20263316)**

### Added

- ADR-0010: Vocabulary Discipline — Coin Sparingly, Anchor Densely. Defines the vocabulary discipline ADR-0008 named as the parametric-channel lever but left undefined. A coined term's power comes from its edge density, not from the count of coinages: a term is coined only when three conditions all hold (join-novelty, definitional anchoring, uncontested namespace), and every retained coinage is anchored densely — glossary definition in existing vocabulary, upstream citations where prior art exists, knowledge-graph edges, repeated work in the body. Everything else is said in existing vocabulary with the upstream source cited. The vocabulary-level enforcement of origin-claim scope discipline.
- `docs/glossary` (en/ja): added a Vocabulary Discipline entry (consolidating the term ADR-0008 introduced) and cross-referenced it from the Distinctive Terminology entry.
- `docs/glossary` (en/ja): added entries for Two-Channel Attribution Diffusion and Ghost Citation, fulfilling the glossary deferral recorded in the v0.3.0 Notes.
- `graph.jsonld`: registered GhostCite (arXiv:2602.06718), the citation-absorption GEO framework (arXiv:2604.25707), and AgentGEO (arXiv:2603.09296) as `ScholarlyArticle` nodes grounding the two-channel concepts — the program adopts the term *ghost citation* from this literature rather than coining a synonym.
- `graph.jsonld`: Wikidata QID `sameAs` cross-references for the author and the research lines, and a kanji `alternateName` on the Person node.

### Changed

- ADR-count surfaces updated from nine to ten; `docs/adr/README` (en/ja) extended with the vocabulary-discipline cluster paragraph; the diffusion-mechanism pair (0008-0009) becomes the diffusion-mechanism cluster (0008-0010).
- `docs/thesis` (en/ja): Layer 4 tactic 4 (Distinctive terminology) now states the coinage discipline — coin sparingly (join-novelty, one-sentence definability in existing vocabulary, uncontested namespace), anchor densely — with a reference to ADR-0010.
- `graph.jsonld`: added the ADR-0010 node (`extends` ADR-0008), a `vocabulary-discipline` concept (appliesTo distinctive-terminology, downstream of two-channel-attribution-diffusion and origin-claim-scope-discipline), the ADR-0010 instantiation in the Tactics layer, and the vocabulary-discipline keyword; distinctive-terminology description updated; Dataset and ResearchLine descriptions updated to ten ADRs.
- `llms.txt` / `llms-full.txt`: ADR list and cluster prose extended with ADR-0010; concept count updated to eighteen.
- `README` (en/ja), `docs/CODEMAPS/architecture`: ADR count updated to ten; ADR table extended.
- `graph.jsonld`: cited Concept Influence (arXiv:2602.14869) and Mechanistic Data Attribution (arXiv:2601.21996) as upstream **white-box** evidence for the parametric channel. Registered both as `ScholarlyArticle` nodes; linked Concept Influence to the `idea-vs-scaffold-separation` concept via `groundedIn` (an idea is retained as a parametric concept direction, not verbatim text — mechanistic grounding for the Layer-3 wager) and both papers to `two-channel-attribution-diffusion`. The framework adopts them as upstream evidence only: being white-box, they do not measure burn-in inside a closed commercial LLM and do not close the parametric-channel measurement gap ADR-0008 leaves open.
- `docs/glossary` (en/ja): added an external-evidence note to the Two-Channel Attribution Diffusion entry recording that parametric-channel measurability is taken up by 2026 training-data-attribution work, with the same white-box boundary stated.
- `CLAUDE.md`: recorded the read-only research-wiki consultation workflow and the graph registration scope decision (data siblings aggregate at the hub graph). `docs/empirical/README.md`: clarified that the four-line baseline describes the data window, not the current ecosystem size.

### Fixed

- `graph.jsonld`: `sameAs` / `isBasedOn` / `isPartOf` coerced to `@id` in the `@context` — their URL values were previously parsed as RDF string literals, not graph edges.

### Notes

- The release is itself a worked example of ADR-0010: the discipline's name reuses the phrase ADR-0008 introduced (no new coinage), and the new concept node ships with edges to existing concepts and external references.
- v0.4.0 version DOI (for reproducibility citation only): [10.5281/zenodo.20641478](https://doi.org/10.5281/zenodo.20641478). Per ADR-0001 the concept DOI ([10.5281/zenodo.20263316](https://doi.org/10.5281/zenodo.20263316)) remains canonical for all display and citation.

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
