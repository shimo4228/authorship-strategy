<!-- Generated: 2026-06-17 | Files scanned: project root + docs/ tree | Token estimate: ~1500 -->
# Document Architecture

Authorship Strategy is a **judgment-artifact repository**, not a code
repository. There are no source files; the architecture is the structure
of normative claims, tactical ADRs, and an empirical baseline, plus the
cross-references that bind them. This codemap exists so an LLM-mediated
reader (the primary audience) can route to the canonical document for a
given question without scanning the whole tree.

## Top-Level Layout

```
authorship-strategy/
├── README.md / README.ja.md             human + LLM landing (English primary, Japanese mirror)
├── CLAUDE.md                            agent / contributor instructions (cold-start context)
├── CITATION.cff                         Zenodo DOI metadata
├── .zenodo.json                         deposit metadata + relatedIdentifiers (DOI federation)
├── LICENSE                              MIT
├── CHANGELOG.md                         release history (concept DOI vs version DOI discipline applied)
├── llms.txt                             AI navigator (Answer.AI llms.txt standard)
├── llms-full.txt                        AI self-contained Q&A reference
├── graph.jsonld                         canonical machine-readable relationship map (schema.org JSON-LD)
└── docs/
    ├── thesis.md / thesis.ja.md         one-page core argument (three-axis inversion + four-layer framework)
    ├── manifesto.md                     eight open questions the framework leaves unanswered
    ├── glossary.md / glossary.ja.md     key terms, with disjoint-attribution warning vs. AAP
    ├── inspiration.md                   prior literature + sibling-line lineage + ADR origin
    ├── adr/                             16 ADRs (English) + 16 mirrors (.ja.md) + README + README.ja
    ├── empirical/                       preliminary observation layer (method + 2026-05 traffic baseline + 2026-06 external-literature note + 2026-06 probe baseline + implementation-log intervention timeline; English-only by convention)
    ├── skills/                          component-skill reference index (external skill repos, no body copy)
    └── CODEMAPS/                        this directory
```

## Document Role Index

| Role | Canonical document | Notes |
|------|---------------------|-------|
| Core thesis | `docs/thesis.md` | Three-axis inversion + four-layer framework. English primary. |
| Open questions | `docs/manifesto.md` | Eight items. Adopters invited to extend. |
| Vocabulary | `docs/glossary.md` | Includes load-bearing disjoint-attribution disambiguation vs. AAP. |
| Lineage | `docs/inspiration.md` | Prior literature (Foucault, Chartier, Shapiro & Varian, Lessig, scientometrics, GEO); sibling-line origins of the ADRs. |
| ADR index | `docs/adr/README.md` | Nineteen ADRs grouped: identifier-federation triplet (0001-0003) + maintenance-discipline pair (0004-0005) + LLM-first ingest decision (0006) + metric-rejection decision (0007) + diffusion-mechanism cluster (0008-0011; 0009 amending 0006, 0010 defining the vocabulary discipline 0008 names, 0011 building the measurement instrument 0008 demands) + channel-selection decision (0012, applying the enclosure axis to external listings: link-index entries only, four-condition host audit) + intrinsic-identifier decision (0013, adding a content-derived SWHID layer that complements the DOI layer and closes manifesto open question 4) + implementation-tracking decision (0014, the two-tier ledger + periodic gap-review for operating the framework over time) + license-selection decision (0015, selecting an artifact's license by its dominant audience: a public-domain dedication for machine-mined artifacts, a permissive software license for code, prohibiting non-commercial and no-derivatives terms) + genre-split-placement decision (0016, routing the canonical by genre: the essay genre's canonical is the version-controlled repository corpus on an intrinsic content-derived identifier, the paper genre's on the concept DOI, with syndicated copies bound by entity federation rather than canonical-URL tags; instantiates 0013's DOI-impractical-genre clause and complements 0015) + doctrine-hardening cluster (0017-0019, adding no new tactic surface but tightening existing commitments: 0017 collects manifesto open question 8 — a diagnostic signal and recovery for each of the three acknowledged failure modes, under a diagnostic-is-a-detector-not-a-metric caveat; 0018 procedurizes origin-claim falsifiability — test a priority claim against prior art before publishing and rescope to its narrowest defensible form; 0019 draws the structural-optimization-versus-content-authenticity boundary — optimize the transmission path, never the content, content deformation being a Layer 1 violation reinforced by 0007). |
| Tactical decisions | `docs/adr/000N-*.md` | Each ADR: Status / Date / Context / Decision / Alternatives / Consequences / Lineage. Harness-neutral body, lineage records the implementation-specific origin. |
| Empirical method | `docs/empirical/README.md` | Method, limitations, preliminary-observation framing. |
| Empirical baseline | `docs/empirical/traffic-baseline-2026-05.md` | 24-day cumulative per-repository traffic for the four sibling lines + two supporting repositories. |
| External-literature note | `docs/empirical/neologism-survival-2026-06.md` | 2024–2026 neology-and-LLM literature read against ADR-0010; records the human-model anchor-correspondence open question. |
| Probe baseline | `docs/empirical/probe-baseline-2026-06.md` | First ADR-0011 protocol run: parametric zero pre-baseline, negative-control floor, per-provider retrieval observations. Raw data in the hub's `probes/` (CC0). |
| Implementation log | `docs/empirical/implementation-log.md` | Intervention timeline: which diffusion tactics were deployed and when, grouped by framework layer. Methods companion supplying the intervention dates the no-pre/post-comparison limitation needs. No effect claims; states manifesto OQ5 (recursive self-application). |
| Component skills index | `docs/skills/README.md` | Reference index pointing to four external component skill repositories (`claude-skill-authorship-strategy`, `claude-skill-release-doi`, `claude-skill-llms-txt-writer`, `claude-skill-jsonld-knowledge-graph`) plus an adjacent-ecosystem-skills section. Skill bodies are NOT copied into this repository; each component skill maintains its own canonical source. The component-status criterion (the skill operationalizes content the doctrine explicitly names) is documented in the file itself. |
| AI landing | `llms.txt` | Answer.AI convention. Compact navigator + canonical reading order. |
| AI reference | `llms-full.txt` | Self-contained Q&A. |
| AI relationship map | `graph.jsonld` | schema.org JSON-LD. Three axes + four layers + nineteen ADRs + sibling lines + disjoint-vocabulary edge to AAP. |
| Citation metadata | `CITATION.cff` | Concept DOI populated post-Zenodo. |
| Deposit metadata | `.zenodo.json` | `relatedIdentifiers` declare the DOI federation. |

## Citation Dependency Graph (intra-repository)

The intra-repository citation graph is shallow by design. Documents
reference upstream documents (more abstract) but rarely reference
downstream documents (more concrete). The thesis is upstream of all ADRs;
the empirical layer is downstream of all ADRs and references them only
to disclaim that the observations do not validate the ADRs.

```
thesis.md ──────► (cited by) ─► all 16 ADRs
              ─► manifesto.md (uses thesis vocabulary)
              ─► glossary.md (defines thesis terminology)

adr/000N-*.md ─► thesis.md  (every ADR cites thesis for normative grounding)
              ─► adr/000M-*.md (within clusters: 0002 extends 0001, 0003 extends 0002; 0008 extends 0006, 0009 amends 0006, 0010 extends 0008, 0011 extends 0008; 0013 extends 0003)

empirical/*.md ─► thesis.md (observation context)
               ─► adr/*.md  (observation consistent with vs. not evidence for)

inspiration.md ─► thesis.md, adr/*.md (records origin of each)

glossary.md   ─► thesis.md (term provenance), all ADRs (term usage)

llms.txt      ─► all of the above (navigator)
llms-full.txt ─► all of the above (Q&A)
graph.jsonld  ─► all entities (machine-readable cross-reference of all)
```

## Invariants

The following structural invariants are load-bearing and must not be
violated by routine maintenance:

- **English primary, Japanese mirror.** Every `*.md` document with a `*.ja.md` mirror must be kept in structural sync (same sections, same H2/H3 headings, same number of substantive paragraphs). The English document is canonical when the two disagree.
- **Harness-neutral ADR bodies.** ADR bodies do not name specific vendors, frameworks, or harness implementations. Implementation-specific origin is recorded in the *Lineage* section, where the reader without access to the author's implementation can still follow the chain.
- **Concept DOI as canonical reference.** Every external DOI link uses the concept DOI ([ADR-0001](../adr/0001-concept-doi-canonical.md) applied to this repository's own DOI as well). Version DOIs appear only in `CHANGELOG.md` historical entries and in explicit reproducibility citations.
- **Disjoint attribution vocabulary.** The word "attribution" in this repository means *credit for source*. The word "attribution" in [Agent Attribution Practice (AAP)](https://github.com/shimo4228/agent-attribution-practice) means *accountability for action*. The two meanings are intentionally kept separate; the glossary's disjoint-vocabulary entry is load-bearing.
- **Preliminary-observation tone in empirical layer.** Empirical claims use phrasing like "consistent with" or "preliminary observation"; not "evidence" or "validation". The empirical layer is a case study with explicit limitations, not an experiment.
- **CODEMAPS file-level / graph.jsonld concept-level.** This file describes the repository at the *file* level (where does X live as a file); `graph.jsonld` describes the repository at the *concept* level (what is X, how does it relate to Y). The two never duplicate each other; new ADRs, new Concepts, new EcosystemRepo entries must update both.
- **Hub back-propagation.** New ADRs, new Concepts, or large thesis revisions trigger updates to the federation hub (`/Users/shimomoto_tatsuya/MyAI_Lab/shimo4228/`): its `graph.jsonld` adds the new entities; its README cross-references the new content. Routine in-repository ADR refinements do not require hub updates.
- **Sibling `.zenodo.json` cross-reference.** When this repository receives its concept DOI, the four sibling research lines' `.zenodo.json` files are updated to add `references` or `isReferencedBy` entries pointing to it, so the citation network is recoverable from any sibling's deposit metadata.

## What lives where (FAQ for new contributors)

- *I want to understand the framework's core claim.* → `docs/thesis.md`.
- *I want to adopt a specific tactic.* → `docs/adr/000N-*.md`; read the matching ADR.
- *I want to use a term from the framework and want the canonical definition.* → `docs/glossary.md`.
- *I want to know what the framework does not yet handle.* → `docs/manifesto.md`.
- *I want to see if the framework is empirically supported.* → `docs/empirical/README.md` first (for the load-bearing limitations), then `docs/empirical/traffic-baseline-2026-05.md`.
- *I want to extend the framework with a new ADR.* → Read `docs/adr/README.md` for the format conventions; draft the ADR; update `graph.jsonld` to add the new ADR node and the `instantiatedBy` edge from the Tactics layer; update `CHANGELOG.md`.
- *I want to add a new sibling research line to the ecosystem.* → This is a hub-level operation; see `/Users/shimomoto_tatsuya/MyAI_Lab/shimo4228/CLAUDE.md` for the hub's editing triggers.
- *I want to refer to the framework in another author's work.* → Cite the repository's concept DOI (populated in `CITATION.cff` post-Zenodo deposit).
