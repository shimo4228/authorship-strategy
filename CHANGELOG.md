# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- `.zenodo.json` completes the ADR-0002 reciprocal-declaration
  discipline after a four-standard review (DataCite relation graph,
  w3id.org permanent URIs, PROV-O provenance export, RAiD project
  identifiers) concluded that completing the existing relation layer
  beats adopting any new one: inverse relations added where only one
  side of a pair was declared (`isReferencedBy` → Attention, Not Self;
  `hasPart` → doctrine-corpus; `isSupplementedBy` → existence-proof),
  and `isSupplementTo` → this repository's source URL added as the
  deposit-to-repository binding (rolled out ecosystem-wide in the same
  change set). ADR-0002 (EN/JA) gains a dated note recording the review
  and the April 2026 decommissioning of open-web citation-event
  crawling, which strengthens the deposit-metadata channel this ADR
  chose. Relations propagate to the registry at the next tagged
  release.
- All twenty `Concept` nodes in `graph.jsonld` migrated from
  repo-fragment `@id`s to the program's served vocabulary namespace
  (`…/vocab#concept/<slug>` for hub-shared concepts,
  `…/vocab#as/concept/<slug>` for line-local ones), closing the
  conformance gap with the four sibling research lines — this graph
  was the last line still minting repo-fragment concept URIs. Each
  node is additionally typed `DefinedTerm`, keeps its former
  repo-fragment `@id` as `sameAs` so previously crawled identifiers
  stay resolvable, deep-links its glossary definition via
  `recordedIn`, and links its hub concept page via `subjectOf` where
  one exists. The `definesConcept` registry now covers all twenty
  concepts (two omissions fixed), the `idea-vs-scaffold-separation`
  slug is normalized to the hub-canonical
  `idea-versus-scaffold-separation`, and the informal alias
  *regurgitation test* is recorded as an `alternateName` of the
  Retrieval-Suppressed Naming Probe. Glossary and ADR files are
  unchanged; the glossary remains the definitional source of truth.

## [1.1.0] - 2026-07-16

Retires an entire tactical layer after an external governance event and
records the retirement as the framework's first ADR extracted from an
operational failure. On 2026-07-16 the Wikidata account operating the
entity-grounding tactic was blocked indefinitely as a promotion-only
account and all 109 self-created entries — the author entity, repository
and paper items, bibliographic records of cited works, and the citation
edges among them — were mass-deleted by the platform in a single action.
ADR-0021 classifies grounding surfaces by *revocation control*: only
self-sovereign layers (this repository and its knowledge graph, registry
deposits under the author's account, the author-identifier record,
intrinsic content-derived identifiers) may be load-bearing for the origin
claim; third-party-governed grounding is admitted only when *earned* —
created unprompted by uninvolved parties — never self-manufactured.
Circumvention of the revocation (a new account, anonymous editing,
proxy creation) is prohibited outright. The release also carries the
citation-layer synchronization work that immediately preceded the
revocation, a scope correction to the thesis's Layer 3 prediction, and
a wiki-harvest hardening pass over the knowledge graph.

### Sunset

- Self-created authority-record federation is permanently retired as a
  Layer 4 tactic ([ADR-0021](docs/adr/0021-self-sovereign-entity-grounding.md)).
  All revoked Wikidata `sameAs` edges are purged from `graph.jsonld`
  (including the nineteen `ExternalReference` QIDs injected earlier the
  same week), and the retired `wikidata-federation` component is marked
  as such in `docs/skills/README.md`. Dated historical records (this
  CHANGELOG, the implementation log, prior commit history) are preserved
  unmodified per the ADR's purge discipline.

### Added

- v1.1.0 version DOI (for reproducibility citation only): [10.5281/zenodo.21399530](https://doi.org/10.5281/zenodo.21399530). Per ADR-0001 the concept DOI ([10.5281/zenodo.20263316](https://doi.org/10.5281/zenodo.20263316)) remains canonical for all display and citation.
- ADR-0021 "Self-Sovereign Entity Grounding — Community-Governed
  Authority Records Are a Revocable Layer, Not a Foundation" (EN + JA),
  bringing the tactical catalog to twenty-one decisions. The first ADR
  in the catalog extracted from an operational failure rather than a
  design choice.
- A worked-instance note on manifesto open question 9: authority a
  first-mover cannot yet supply also cannot be self-manufactured — the
  attempt is not merely ineffective but sanctioned. The question stays
  open and is now a live experiment: whether the self-controllable
  identifier subset alone can cross the citation threshold.
- Three dated implementation-log entries projecting the revocation, the
  retirement-and-purge, and the talk-page apology (effect-claim-free,
  per ADR-0014).
- Thirteen primary-verified external references synchronized down from
  the knowledge graph into the documentation citation layer and
  `.zenodo.json` `related_identifiers`, plus a docs-layer citation gap
  closed for the earned-media GEO preprint (arXiv:2509.08919).

### Changed

- The thesis's Layer 3 prediction is scoped to prevailing training
  regimes rather than stated unconditionally (`docs/thesis.md` /
  `docs/thesis.ja.md`).
- Twelve `graph.jsonld` concept nodes hardened in a wiki-harvest
  reinforcement pass (definitions tightened, primary sources attached).
- Post-v1.0.0 README review fixes: Japanese link localization, entity
  anchoring, and empirical-section detail (`README.md` / `README.ja.md`).

### Fixed

- `graph.jsonld`: the misspelled `covaresWith` relation key is renamed
  to `covariesWith`, and unused context declarations are dropped.
- `llms.txt`: the ADR-0020 entry missing since v1.0.0 (pre-existing
  drift discovered during the ADR-0021 back-propagation) is restored.

### Notes

- `scripts/verify-counts.sh` confirms every carrier agrees with the
  filesystem (ADR total 21, open questions 9). `graph.jsonld` holds 86
  top-level nodes with zero remaining Wikidata references.

## [1.0.0] - 2026-07-04

Reframes the doctrine from a maker's and practitioner's stance. The author is
recast from a researcher into a practitioner working out, in practice, what good
work looks like in the AI era — making things, becoming known for them, and
leaving work durable and traceable enough to be found again — with the academic
apparatus (DOI, SWHID, citation graphs, papers) recast as *tooling* for
citability, durability, and traceability rather than an identity or a
destination. The audience is stated to follow from that stance: developers,
practitioners, learners, and creative reusers across languages who meet the
ideas through LLM-mediated channels, with academic citation one channel among
several. This is a framing change that touches every human and AI surface, so it
takes the major version. No new tactic is added; the ADR count stays at twenty.
The release also adds a `codemeta.json` software-metadata surface, projects three
already-deployed diffusion-intervention batches into the public implementation
log, and installs a machine guard against numeric-count drift. It also
rebuilds the framework's operational-surface discovery path after the ecosystem
hub was slimmed: the README is rewritten for scannability with the ecosystem and
the always-on rule surfaced up front, `docs/skills/README.md` is restored to a
full ecosystem table, a new `authorship-strategy-rules` repository gives the
framework an always-loaded rule install target beside the skill, and the
operational forms are de-staled to their canonical repository names across every
carrier.

### Added

- v1.0.0 version DOI (for reproducibility citation only): [10.5281/zenodo.21186682](https://doi.org/10.5281/zenodo.21186682). Per ADR-0001 the concept DOI ([10.5281/zenodo.20263316](https://doi.org/10.5281/zenodo.20263316)) remains canonical for all display and citation.
- `codemeta.json`: schema.org / CodeMeta software metadata alongside `CITATION.cff`, the format the Software Heritage metadata indexer reads directly (the indexer does not read `CITATION.cff`). A derived artifact — regenerated from `CITATION.cff`, never hand-edited.
- `scripts/verify-counts.sh`: a release-time guard that derives the ADR total and the manifesto open-question total from the filesystem and fails if any prose carrier states a contradicting number. Installs the CLAUDE.md numeric-claim rule's second clause (machine-verifiable doc↔reality correspondence is fixed with a check, not prose) as the single enforcement point, recorded as a new CODEMAPS invariant. It exists because a stale "seven ADRs" claim survived to this release in `docs/inspiration.md` despite manual review.
- Public implementation-log projections for three diffusion-intervention batches already deployed and tracked in the private ledger: the `codemeta.json` / Wayback-archival / hub-graph-mirror batch, the search-index surface interventions (concept pages, an entity page, sitemap/IndexNow, a canonical correction, repository metadata), and the AI-native preprint-platform placements. Dated intervention rows only, no effect claims (ADR-0014).
- A companion [`authorship-strategy-rules`](https://github.com/shimo4228/authorship-strategy-rules) repository: the four-layer framework as a single always-loaded behavioral rule — the deterministic counterpart to the `authorship-strategy-skill`, generalized so any adopter can install it. A distribution mirror with no own DOI, referencing the parent concept DOI.
- A "Using / adopting the framework" section in `README.md` / `README.ja.md` routing to the operational surface (the ecosystem index, the always-on rule, `docs/adoption.md`, `docs/conformance.md`), plus a four-layer-stack diagram and a five-line ecosystem diagram.

### Changed

- The maker's-and-practitioner's stance is foregrounded across every carrier: a new "The stance this is written from" section in `README.md` / `README.ja.md`, a stance paragraph in `docs/thesis.md`, the manifesto's framing of its open questions, the `graph.jsonld` project description, the `CITATION.cff` abstract, and the `CLAUDE.md` / `AGENTS.md` self-description (from "a DOI-targeted research project" to "a doctrine repository (DOI-registered)").
- Layer 1 authenticity is restated as a positive success criterion — the idea surviving diffusion as thought, with revenue outside the success criteria — replacing the earlier "monetization is not a goal" phrasing across `docs/thesis.md`, `docs/glossary.md`, `docs/adoption.md`, and `docs/inspiration.md`. The commitment is unchanged; the framing is now what the framework protects rather than what it forbids.
- "Future researcher" is corrected to "future reader" where the framework means anyone tracing causation through LLM-mediated channels, not only academics (`README.md`, `README.ja.md`, `docs/thesis.md`).
- `README.md` / `README.ja.md` rewritten for human scannability (~155 → ~100 lines): the lead is consolidated, two Mermaid diagrams replace prose, and deep rationale is delegated to `docs/`, while the LLM-read floor is preserved. "Four-repository" in the lead is corrected to the five-line ecosystem (the empirical baseline's distinct four-line window is kept).
- `docs/skills/README.md` is restored to reproduce this line's ecosystem as a table (four component skills + the always-loaded rule + adjacent skills and complements), recovered from the ecosystem hub's pre-simplification inventory; the phantom `update-codemaps` link is removed and `readme-writer` is corrected to a standalone repository.
- The operational forms are de-staled from the old `claude-skill-*` names to their canonical bare names (`authorship-strategy-skill`, `release-doi`, `llms-txt-writer`, `jsonld-knowledge-graph`) across `llms.txt`, `llms-full.txt`, `graph.jsonld`, `CLAUDE.md`, and `docs/glossary.md`; `graph.jsonld` gains a node for the new `authorship-strategy-rules` repository.

### Fixed

- `docs/inspiration.md` numeric drift: four "seven ADRs" claims left over from a seven-ADR era. The "Operational origins" section is reframed as the *founding* ADRs (0001–0007) — a stable historical set — with the total count and the full list delegated to the canonical ADR index (`docs/adr/README.md`), so the section no longer restates a drift-prone current total.

### Notes

- The empirical baseline window and all aggregate counts are unchanged; `scripts/verify-counts.sh` confirms every carrier agrees with the filesystem (ADR total 20, open questions 9).

## [0.9.0] - 2026-06-30

Records ADR-0020 — onboarding idea-bearing repositories to two third-party
AI-derived surfaces (a paraphrasing synthetic wiki used as a regurgitation-test
diagnostic, and a verbatim documentation hub whose access-count badge is a
measurement signal not a metric) as the derivation-axis counterpart to the
enclosure-axis channel rule (ADR-0012). The release also adds the operational
surfaces these tactics imply — AI-derived-wiki and documentation-hub badges, a
cross-tool `AGENTS.md` — and overhauls the README for human scannability while
preserving the LLM-read floor. ADR count 19 → 20 across all carriers.

### Added

- v0.9.0 version DOI (for reproducibility citation only): [10.5281/zenodo.21047491](https://doi.org/10.5281/zenodo.21047491). Per ADR-0001 the concept DOI ([10.5281/zenodo.20263316](https://doi.org/10.5281/zenodo.20263316)) remains canonical for all display and citation.
- ADR-0020: Onboarding to Third-Party AI-Derived Repository Surfaces — Synthetic Wikis and Documentation Hubs. Onboards idea-bearing public repositories to two derivation-type surfaces a third party builds from the repository and serves to LLM assistants: a synthetic wiki that paraphrases the repository behind a conversational query interface (drift risk; the paraphrase doubles as a regurgitation-test diagnostic answered upstream by dense anchoring, ADR-0010/0011, never on the derived surface) and a documentation hub that serves the repository's own machine-readable documents verbatim through a model-callable interface (no drift; an access-count badge read as a measurement signal, never a success metric, ADR-0007). Both derived views are blessed rather than gated; an index-only catalog keyed to installable code libraries is declined as an artifact-type mismatch, and self-hosted query infrastructure as friction the framework does not take on. The derivation-axis counterpart to ADR-0012's enclosure-axis channel rule; extends ADR-0006. ADR count 19 → 20 across all carriers.
- AI-derived-wiki and documentation-hub badges across the repository README, the operational form of ADR-0020's two derivation surfaces (Layer 4 tactic).
- `AGENTS.md`: a cross-tool mirror of `CLAUDE.md` (harness paths adapted) so non-Claude coding agents read the same project doctrine.
- `regurgitation test` alias in the glossary (English and Japanese), naming the synthetic-wiki paraphrase-fidelity diagnostic of ADR-0020.

### Changed

- README.md / README.ja.md overhauled for human scannability: the per-ADR full-paragraph table is collapsed to a seven-cluster summary pointing to the canonical ADR index, the thrice-restated lead is merged into a single identity paragraph plus one thesis blockquote, and the three-axis inversion is surfaced as a table — while preserving the LLM-read floor (all seven core concepts, every tactic cluster, DOI, citation, sibling lines, empirical numbers). README body roughly halved.
- The empirical section now represents both instruments the ecosystem hub runs for this project — daily traffic snapshots and the ADR-0011 two-channel naming probe — each pointed at its canonical CC0 raw data under the hub (`traffic/` and `probes/`), matching what `docs/empirical/README.md` already cites.
- Empirical-baseline window aligned to its canonical 24-day count (2026-04-21 to 2026-05-14) across `CLAUDE.md`, `AGENTS.md`, `CITATION.cff`, and `.zenodo.json`, with `docs/empirical/README.md` as the single source of truth; the `.zenodo.json` deposit description, stale at "five decisions," is refreshed to the current twenty-decision catalog.

### Notes

- A Google Code Wiki badge was added and then reverted after a hands-on check found its synthetic-wiki generation and refresh are popularity-gated and not author-controllable (a worked instance of manifesto open question 9); the net change for this release is zero.

## [0.8.0] - 2026-06-26

Records four ADRs since v0.7.0 — ADR-0016 (genre-split placement, routing
the canonical by genre: essays on a repository-corpus intrinsic identifier,
papers on the concept DOI) and the doctrine-hardening cluster ADR-0017 /
ADR-0018 / ADR-0019, three decisions that add no new tactic surface but
tighten the framework's existing commitments against its own deferred
homework and the 2026 literature that made the homework answerable. The
citation-graph layer deepens with a doctrine-layer citation harvest, and
the framework reframes its author as a practitioner exploring the strategy
rather than a researcher. ADR count 15 → 19 across all carriers.

### Added

- v0.8.0 version DOI (for reproducibility citation only): [10.5281/zenodo.20849864](https://doi.org/10.5281/zenodo.20849864). Per ADR-0001 the concept DOI ([10.5281/zenodo.20263316](https://doi.org/10.5281/zenodo.20263316)) remains canonical for all display and citation.
- ADR-0016: Genre-Split Placement — Essays as Repository-Corpus Canonical with Intrinsic Identifier, Papers as Concept-DOI Canonical. Records which genre takes which canonical, a routing the identifier ADRs (0001, 0013) left open: the essay genre's canonical is the author's version-controlled repository corpus, its priority claim resting on the intrinsic content-derived identifier under a public-domain dedication (ADR-0015); the paper genre's canonical is the concept DOI (ADR-0001). Syndicated essay copies are bound by entity federation, not by a platform canonical-URL tag whose effect on LLM-mediated credit is unverified. Corpus membership is gated by an authenticity criterion (Layer 1); a load-bearing essay idea is promoted to a concept-DOI deposit when it graduates into a paper (Layer 3). Instantiates ADR-0013's DOI-impractical-genre clause and complements ADR-0015. ADR count 15 → 16 across all carriers.
- ADR-0017: Failure-Mode Diagnostics — A Detector and Recovery Strategy for Each of the Three Acknowledged Failure Modes. Operationalizes manifesto open question 8 by pairing each acknowledged failure mode with a diagnostic signal and a recovery strategy: reach without recognition (detected when the naming probe carries the concept but not the author; recovered by anchoring vocabulary densely, narrowing the origin claim, and accepting it may be a structural price), over-publication (detected from an identifier portfolio carrying superseded versions of one idea; recovered by the concept-DOI + version discipline, ADR-0001/0004), and under-investment in worked implementation (detected from a doctrine-heavy, implementation-light portfolio; recovered by closing the Layer 3 doctrine-plus-implementation pair). A load-bearing caveat: a diagnostic is a failure-*detector*, never a success metric, so it cannot collide with ADR-0007's metric rejection.
- ADR-0018: Origin-Claim Falsifiability — Test a Priority Claim Against Prior Art Before Publishing It. Codifies the framework's informal origin-claim-scope discipline (the scope side of ADR-0010) into a procedure: before publishing an origin claim in a durable artifact, search prior art for work that would refute it, and rescope any claim that survives only because it was never tested — one that is unfalsifiable or already anticipated — to its narrowest defensible form. The criterion is falsifiability; the check is binary, feeding a human rescope rather than a score, and only ever narrows a claim. A humility instrument consistent with Layer 1, internalizing a verification an external evidence-grounded novelty-assessment system demonstrated feasible, claiming no priority over it.
- ADR-0019: Structural Optimization versus Content Authenticity — Optimize the Transmission Path, Never the Content. Draws the boundary the 2026 structured-data efficacy literature forces: optimizing the transmission path (document architecture, entity anchoring, dense vocabulary anchoring; ADR-0009, ADR-0010) is legitimate because it changes how an idea travels, while deforming the content to win citations (padded attribute-richness, keyword-stuffing, claims shaped to a channel's reward function) is prohibited because it changes what the idea is. Content deformation is a Layer 1 violation reinforced by ADR-0007 (citation and visibility are not success metrics). ADR-0017–0019 form the doctrine-hardening cluster; ADR count 16 → 19 across all carriers; graph.jsonld gains three ADR nodes (extends / groundedIn edges) + Tactics-layer instantiations.
- Doctrine-layer citation harvest: the backlog of 2026 papers the framework cites is federated across all four citation layers (graph.jsonld ExternalReference / `.zenodo.json` `references` / Wikidata `cites work` / concept `groundedIn`). New primary sources include a white-box knowledge-attribution probe (arXiv:2602.22787), a memorization-versus-generalization metric (arXiv:2602.18733), a factual-recall-scaling result (arXiv:2605.18732), GEO structural-feature work (arXiv:2604.19113, arXiv:2603.29979), an authorial-stylometry result (arXiv:2603.23219), an agentic novelty-assessment system (arXiv:2601.01576), and a coauthor-recall-bias study (arXiv:2511.00476); two new Wikidata paper items federate the last two via `cites work`. Each empirical figure was verified against an open mirror before entering a durable artifact; all numeric findings are kept in `docs/inspiration.md`, not in the vendor-neutral ADR bodies.
- `docs/inspiration.md`: subsections grounding the new ADRs — a mechanistic-grounding strand for the two channels and the idea-versus-scaffold bet, an authorial-fingerprint citation (held as a tension, not a tactic), and an "Openness as policy and industry convergence (2026)" subsection citing the G7 AI-openness spectrum and the Linux Foundation OpenMDW-1.1 license as external resonance for the enclosure-to-openness axis (framed as convergence, not priority).

### Changed

- The framework's author is reframed throughout as a *practitioner exploring the strategy of being a known author under AI-mediated diffusion*, not as a researcher; the research lines are the means, not the purpose. Proposal scope is no longer narrowed to academic channels.
- Research-line abbreviations (AKC, AAP) are made referenceable across the carriers.
- `docs/empirical/implementation-log.md`: a new *Human-reader back-traceability* category projects the 2026-06-21 and 2026-06-25 supply-side interventions (ecosystem-hub back-links on the research-line READMEs, a `noscript` viewer fallback, cross-surface author-identity unification, and the essay-corpus repository de-islanding) — pull-only, effect-claim-free, consistent with ADR-0007; plus the v0.7.0 Simplified-Chinese machine-readable anchor.
- `CLAUDE.md`: the diffusion-tracking review trigger is routed to the gap-review skill, and the sibling-line cross-references record the now-live Attention, Not Self Hugging Face dataset mirror.

## [0.7.0] - 2026-06-17

Records two ADRs since v0.6.0 — ADR-0014 (the two-tier implementation
ledger with periodic gap-review, the one ADR about *operating* the
framework over time) and ADR-0015 (license selection by an artifact's
dominant audience rather than its surface form) — and turns the
framework outward with a set of creative-reuse artifacts: a
reimplementation guide (`adoption.md`), a deployment-conformance
checklist (`conformance.md`), and a derivative-welcoming implementations
registry (`implementations.md`), each lowering the cost of the derivation
the second axis reclassifies from threat to evidence. The empirical layer
gains its first two-channel probe baseline; the citation-graph layer
deepens with the 2026 structured-data efficacy literature, a nine-way
author `sameAs` federation, and a Simplified-Chinese machine-readable
anchor.

### Added

- v0.7.0 version DOI (for reproducibility citation only): [10.5281/zenodo.20733514](https://doi.org/10.5281/zenodo.20733514). Per ADR-0001 the concept DOI ([10.5281/zenodo.20263316](https://doi.org/10.5281/zenodo.20263316)) remains canonical for all display and citation.
- ADR-0015: License Selection by Audience, Not Artifact Form. Fixes which permissive instrument an artifact takes, on an axis the framework had named but never recorded. The rule selects by the artifact's *dominant audience*, not its surface form: because attribution is carried by the federated-identifier layer (the 0001-0003 triplet and 0013) rather than by the license, the license is chosen to minimize reuse friction. Under an LLM-first program (ADR-0007) almost every artifact — prose essays as much as datasets — is mined rather than read, so machine-mined artifacts take a public-domain dedication (CC0-1.0), executable code takes a permissive software license (MIT/Apache-2.0) carried whole-repo for legibility, and only a genuinely human-first artifact takes an attribution-requiring content license (CC-BY-4.0); non-commercial and no-derivatives terms are prohibited. The license-layer counterpart of vocabulary discipline (ADR-0010), disjoint from ADR-0012 (which governs the license a prospective external host must extend, not the license the author applies). Triggered by a 2026-06-17 cross-repository license audit. ADR count 14 → 15 across all carriers; graph.jsonld gains the ADR-0015 node + Tactics-layer instantiation.
- ADR-0014: Implementation Tracking as a Two-Tier Ledger with Periodic Gap-Review. The one ADR about *operating* the framework over time rather than a tactic it deploys. Implementation tracking splits into a private implementation ledger (operational status, ranked candidate interventions, working detail) and the public intervention timeline (`docs/empirical/implementation-log.md`) as its dated, effect-claim-free projection — never merged, since the timeline's empirical-layer conventions (no effect claims, ADR-0012 host abstraction, normative/empirical separation) bar it from doubling as a planning surface. A periodic gap-review compares deployed tactics against the Layer 4 catalog and the manifesto's open questions to generate the next proposals, each run through the judgment checklist — a self-application of the framework. The generic review procedure lives in the framework's operational skill; only the project-specific wiring lives in the project's context file. ADR count 13 → 14 across all carriers; graph.jsonld gains the ADR-0014 node + Tactics-layer instantiation.
- `docs/empirical/implementation-log.md`: a "How this log is maintained" note recording that the log is a maintained projection of a private working ledger, curated to dated interventions without operational detail (cross-references ADR-0014).
- `manifesto.md` open question 9 (*Does entity grounding gate the diffusion strategy by prior authority?*): the structured-artifact tactic's reliance on `sameAs` federation to external authority records (ORCID, Wikidata) appears to re-introduce an authority gate the scarcity-to-diffusion inversion claims to escape — an established entity has external records to anchor to, a newly coined concept or first-time author entity does not. Recorded as an open tension, connected to open questions 8 (reach without recognition) and 1 (asymmetric claim scope); the framework's own concept nodes lacking `sameAs` edges is the tension made concrete.
- `docs/inspiration.md`: a "Structured-data efficacy literature (2026)" subsection citing the 2026 evidence that both grounds and qualifies the JSON-LD knowledge graph tactic — structured linked data as a retrieval memory layer (+29.6% / +29.8% accuracy; arXiv:2603.10700), against the counter-evidence that schema *presence* alone does not predict AI citation once organic ranking is controlled, the lift attaching to attribute-rich, entity-anchored markup (61.7% vs 41.6%; Fischman, SSRN 6284518; an industry 1,885-page before/after audit, Ahrefs 2026).
- `graph.jsonld`: two ExternalReference / ScholarlyArticle nodes — *Structured Linked Data as a Memory Layer for Agent-Orchestrated Retrieval* (arXiv:2603.10700) and *Does Schema Markup Predict AI Citation?* (SSRN 6284518, the first non-arXiv primary source admitted to the graph, on the strength of its controlled design and resolvable DOI) — both `groundedIn` the `jsonld-knowledge-graph` concept as a support/qualification pair; `.zenodo.json` gains the matching `references` related-identifiers.
- `graph.jsonld` author Person node: `sameAs` deepened from three to nine federated identities — Google Scholar, Hugging Face, LinkedIn, Zenn, DEV Community, and Substack added to the existing GitHub / ORCID / Wikidata edges. Operationalizes the deep-`sameAs`-array finding of the 2026 structured-data literature on the most grounding-critical node (author-name preservation, the signal ADR-0011 probes); identity federation rather than an engagement metric, so consistent with ADR-0007. The set is the *self-controllable* subset of entity grounding — profiles the author owns and can populate — which is exactly the slice available to an individual under the supply-side tension of manifesto open question 9; OpenAlex remains deferred pending name-disambiguation.
- `docs/adoption.md`: a reimplementation guide describing how a second author applies the framework to their own idea-rescue work — the action path from reading the doctrine to running it. Written at all, it becomes the artifact against which manifesto open questions 5 (framework-versus-rhetoric) and 1 (scaling beyond a single author) can be tested; it inherits open question 1's unresolved status rather than claiming to close it. A creative-reuse artifact: it lowers the cost of the derivation the framework's second axis reclassifies from threat to evidence.
- `docs/conformance.md`: a tiered deployment-conformance checklist (minimal / federated / measured) an adopter — or the adopter's LLM agent — runs to verify that a finished artifact exhibits the structures the framework prescribes (crawler-open permissive access, a stable version-independent identifier, the AI-facing navigator+graph pair, machine-readable citation-graph federation, a standing two-channel measurement instrument, vocabulary discipline). Distinct from the operational skill's per-decision judgment checklist: it audits a finished artifact from outside rather than guiding authoring, and asserts no effect.
- `docs/implementations.md`: a neutral, derivative-welcoming registry of artifacts that apply, reimplement, extend, cite, or diverge from the framework. Operationalizes the second axis (derivative work reclassified from threat to evidence): a registry records that a derivative exists, carries no ranking, and treats listing as evidence the pattern is implementable rather than as endorsement.
- `docs/empirical/probe-baseline-2026-06.md`: the first structured run of the ADR-0011 two-channel probe protocol, recording the parametric channel's pre-intervention zero baseline (over-determined by training cutoffs), a clean negative-control floor, and the first per-provider retrieval observations (one full attribution via owned artifacts including the AI-facing entry point; citation-selection losses elsewhere). All claims framed as preliminary observation; raw data lives CC0 in the federation hub. The note pre-registers a fortnightly probe cadence with a weekly autumn window ahead of the next model-generation turnover.
- `graph.jsonld` concept nodes + `docs/glossary.md`: a Simplified-Chinese machine-readable anchor — language-tagged (`zh`) `alternateName` labels on the coined-term concept nodes, mirrored by a "Chinese term mapping (machine-readable anchor only)" glossary table. Operationalizes the multilingual tactic in the machine-readable layer (not a prose translation), extending parametric-channel reach toward Chinese-served model families; an instrument for the Qwen-family arm of the ADR-0011 probe.
- `docs/glossary.md` Ghost Citation entry extended with the 2026 generative-engine-optimization evidence (Seer Interactive's 541,213-response study: 53.1% brand-citation when the brand is named against 10.6% when it is not — a parametric channel gating the retrieval channel), with an explicit note that arXiv:2602.06718 uses *ghost citation* for a disjoint phenomenon (fabricated citations to non-existent sources) so the two senses are not conflated.

### Changed

- `docs/empirical/implementation-log.md` intervention dates backfilled from git history: the "pre-baseline" cells in the identifier-federation and AI-facing-ingest sections were replaced with exact author-dates recovered by scanning each ecosystem repository's git history (first-add commit per artifact), the intro reframed around the 2026-04-21 traffic-window boundary, and a "What the deployment order shows" note added (the contemplative-agent / AKC pioneer order supports the extracted-from-operating-the-ecosystem claim, with the hub localization / `.zenodo.json` anomalies recorded honestly).
- ADR-0010 (vocabulary discipline, en/ja) *Lineage*: a paragraph recording the 2026 schema-efficacy literature (Fischman SSRN 6284518; Ahrefs 1,885-page audit) as external resonance for *anchor densely* — richness and entity-anchoring, not structured-data presence, are what carry signal — which in the same move qualifies ADR-0009's structured-graph citation claim and opens the supply-side question recorded as manifesto open question 9.
- `docs/empirical/implementation-log.md`: appended the 2026-06-15 author-entity `sameAs` federation intervention to the citation-graph / scholarly-surface section, abstracted to profile-surface types per the empirical layer's host-abstraction convention.

## [0.6.0] - 2026-06-13

Records ADR-0013 (the intrinsic content-derived identifier layer that
complements the extrinsic DOI and closes manifesto open question 4) and
the empirical layer's implementation log — an intervention timeline
timestamping which diffusion tactics were deployed on the ecosystem and
when, the methods companion the *no pre-versus-post intervention
comparison* limitation calls for.

### Added

- v0.6.0 version DOI (for reproducibility citation only): [10.5281/zenodo.20674469](https://doi.org/10.5281/zenodo.20674469). Per ADR-0001 the concept DOI ([10.5281/zenodo.20263316](https://doi.org/10.5281/zenodo.20263316)) remains canonical for all display and citation.
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
