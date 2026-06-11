Language: English | [日本語](README.ja.md)

# Architecture Decision Records

Each ADR records a tactical judgment about authorship strategy under
AI-mediated diffusion — discovered through operating a four-repository
DOI-registered research ecosystem, not prescribed top-down.

## Index

| ADR | Title | Status |
|-----|-------|--------|
| [0001](0001-concept-doi-canonical.md) | Concept DOI as Canonical Reference | accepted |
| [0002](0002-doi-federation-via-zenodo-json.md) | DOI Federation via `.zenodo.json` | accepted |
| [0003](0003-cross-platform-dataset-federation.md) | Cross-Platform Dataset Federation | accepted |
| [0004](0004-authorship-metadata-orcid.md) | Authorship Metadata with ORCID Auto-Update Disabled | accepted |
| [0005](0005-readme-localization-audience-driven.md) | README Localization Policy — Audience-Driven Maintenance | accepted |
| [0006](0006-llm-first-ingest-dual-entry-points.md) | LLM-First Ingest via Dual Entry Points | accepted |
| [0007](0007-human-attention-signals-not-a-metric.md) | Human-Attention Platform Signals Are Not a Success Metric | accepted |
| [0008](0008-rag-era-attribution-diffusion.md) | RAG-Era Attribution Diffusion — Two Channels, Two Time Constants | accepted |
| [0009](0009-dual-entry-asymmetric-rebalance.md) | Dual Entry Points Are Asymmetric — Structured Graph for Citation, Prose Navigator for Agent Context | accepted |
| [0010](0010-vocabulary-discipline.md) | Vocabulary Discipline — Coin Sparingly, Anchor Densely | accepted |

The set groups into clusters, each tracking a distinct layer of the
thesis:

ADRs 0001-0003 form an **identifier-federation triplet**: ADR-0001 fixes the
canonical reference shape (concept DOI, not version DOI), ADR-0002 declares
inter-artifact relationships in archive metadata (`relatedIdentifiers`), and
ADR-0003 extends the federation to non-DOI platforms (Git hosts, dataset
platforms) so the network is discoverable independent of which platform a
reader enters from. Each ADR is independently adoptable, but the strongest
form of the discipline applies all three.

ADRs 0004-0005 are **maintenance-discipline ADRs**: ADR-0004 about who the
author *is* (ORCID enrichment policy), ADR-0005 about who the author *writes
for* (locale-mirror retirement policy). Both make the same underlying move —
maintenance cost is amortized against actual evidence, not against speculative
prospective state.

ADR-0006 is the **LLM-first ingest decision**: the artifact deploys a
prose-form navigator and a concept-form graph as a complementary pair, each
serving a distinct LLM-mediated reader sub-population that the other cannot
reach. Where the federation triplet ensures the artifact *reaches* multiple
platforms and the maintenance pair ensures it stays *coherent* across edits,
ADR-0006 specifies what *form* the artifact must take at each platform so the
LLM-mediated channels operating there can absorb it. It is the only ADR that
directly operationalizes the thesis's Axis 1 inversion (enclosure → openness)
on the ingest surface. ADR-0009 amends it: 2026 measurement shows the two
entry points are not co-equal — the structured graph carries retrieval-time
citation while the prose navigator's citation effect is noise, so the pair is
retained but made *asymmetric*, the navigator rescoped to a Business-to-Agent
(B2A) context surface rather than an AI-search citation lever.

ADR-0007 is the **metric-rejection decision**: it fixes what the framework
does *not* optimize for. Platform human-attention signals — Git-host stars
(gameable: purchasable) and page-views (blind to LLM-mediated reach) — are
excluded as success metrics, and off-page human-distribution labor is declined
as a red-ocean activity operating on a near-empty human-arrival funnel
(empirically clone:view ≈ 16:1). Where ADR-0006 specifies the *form* the
artifact takes for its LLM-mediated audience, ADR-0007 declares that this
audience — not platform human-attention — is the *measure of success*,
grounding the program's near-zero conventional engagement numbers as an
accepted consequence rather than a defect to fix. It is the metric-side
counterpart to the thesis's scarcity → diffusion inversion.

ADR-0008 is the **diffusion-mechanism decision**: it divides the single
"diffusion" that ADR-0006 and ADR-0007 left whole into a *parametric*
channel (the idea absorbed into model weights at training time — slow,
driven by cross-platform vocabulary co-occurrence) and a *retrieval*
channel (the artifact fetched at query time — fast, driven by freshness
and structure). The two have opposite time constants and opposite
levers, the failure mode of pursuing retrieval alone is ghost citation
(the source is cited but the author is not named), and so the framework
optimizes and measures each separately rather than averaging them. It
gives every prior ADR a channel — the federation triplet and ADR-0004 as
parametric levers, ADR-0006 as the retrieval surface — and sharpens the
measurement layer ADR-0007 opened.

ADR-0010 is the **vocabulary-discipline decision**: it defines the
discipline ADR-0008 named as the parametric-channel lever but left
undefined. A coined term's power comes from its edge density, not from
the count of coinages, so the program coins a term only when three
conditions all hold (join-novelty, definitional anchoring, uncontested
namespace) and anchors every retained coinage densely — glossary
definition in existing vocabulary, upstream citations, knowledge-graph
edges, repeated work in the body. Everything else is said in existing
vocabulary with the upstream source cited. It is the vocabulary-level
enforcement of the thesis's origin-claim scope discipline.

## Format

Each ADR follows: Status / Date / Context / Decision / Alternatives Considered
/ Consequences / Lineage. The intent is that the *decision* — what to do, and
why — persists across the substrate changes the thesis predicts will obsolete
specific implementations.

ADRs are written *harness-neutral*: no specific implementation, vendor, or
framework name appears in the ADR body. Where a specific vendor or framework
shaped the original decision, the lineage is recorded in the *Lineage*
section in a form a reader without access to the author's specific
implementation can still follow.

See [`../thesis.md`](../thesis.md) for the underlying thesis (three-axis
inversion + four-layer framework), [`../glossary.md`](../glossary.md) for
terminology, and [`../manifesto.md`](../manifesto.md) for the open questions
these ADRs do not attempt to answer.
