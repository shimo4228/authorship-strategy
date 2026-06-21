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
| [0011](0011-two-channel-probe-protocol.md) | Two-Channel Probe Protocol — Measuring Each Channel by Its Own Instrument | **experimental** |
| [0012](0012-link-index-channel-selection.md) | Link-Index Contributions to External Collections | accepted |
| [0013](0013-intrinsic-identifier-layer.md) | Intrinsic Content-Derived Identifiers as a Complementary Priority-Claim Layer | accepted |
| [0014](0014-implementation-tracking-two-tier-ledger.md) | Implementation Tracking as a Two-Tier Ledger with Periodic Gap-Review | accepted |
| [0015](0015-license-selection-by-audience.md) | License Selection by Audience, Not Artifact Form | accepted |

The set groups into clusters, each tracking a distinct layer of the
thesis:

ADRs 0001-0003 form an **identifier-federation triplet**: ADR-0001 fixes the
canonical reference shape (concept DOI, not version DOI), ADR-0002 declares
inter-artifact relationships in archive metadata (`relatedIdentifiers`), and
ADR-0003 extends the federation to non-DOI platforms (Git hosts, dataset
platforms) so the network is discoverable independent of which platform a
reader enters from. Each ADR is independently adoptable, but the strongest
form of the discipline applies all three.

ADRs 0004-0005 are **maintenance-discipline ADRs**: ADR-0004 about how the
author's public record is *presented* (ORCID enrichment policy), ADR-0005 about who the author *writes
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

ADR-0011 is the **measurement-instrument decision**: it builds what
ADR-0008's own Consequences demanded — until a retrieval-suppressed
naming probe exists, parametric success is asserted, not measured. The
protocol probes frontier models on two settings that are never blended
(search suppressed for the parametric channel, search enabled for the
retrieval channel, the latter making ghost citation observable within a
single answer), detects verdicts by deterministic string matching over
retained raw responses rather than model judging, and reads
true-positive rates against a negative-control probe's confabulation
floor. With it the cluster closes a loop: ADR-0007 fixed what success
is, ADR-0008 divided the mechanism, ADR-0010 defined the
parametric-channel lever, and ADR-0011 makes all three measurable.

ADR-0012 is the **channel-selection decision**: it applies the thesis's
enclosure axis to the act of listing artifacts in external curated
collections (community-curated link directories, skill marketplaces,
dataset registries). Contributions are link-index entries only — the
canonical artifact stays in the author's repository and the host carries
a hyperlink plus a short factual description — and every prospective
host passes a four-condition audit (corporate ownership / absence of an
open license / content-vendoring structure / paid-product funnel) before
submission, with a standing withdrawal rule if a host later encloses.
Where ADR-0006 specifies the form the artifact takes on its own ingest
surface, ADR-0012 governs which *external* surfaces the artifact may
appear on, and in what form: vendored copies are drift vectors that a
host's later enclosure captures; a link leaves the canonical source
outside the host's control.

ADR-0013 is the **intrinsic-identifier decision**: it adds a second,
content-derived identifier layer — SWHID (ISO/IEC 18670) — to the
federation the 0001-0003 triplet built around the DOI. A DOI is
extrinsic: an opaque name bound to a metadata record by a registry,
unverifiable against the content it covers and dependent on the
registry's survival. The intrinsic layer is its complement — computed
from the artifact and its history, verifiable without any registry,
granular down to a single line — so each layer covers the other's
failure mode. Every release now also triggers an explicit archival
request to a content-addressed public software archive, whose snapshot
identifier is recorded alongside the DOI; for artifact genres where DOI
registration is impractical, the intrinsic identifier is the designated
substitute priority-claim mechanism, closing the manifesto's open
question 4. Archival there also opens a second parametric-channel
ingest surface (code-focused training corpora source from the archive)
at zero marginal authoring cost.

ADR-0014 is the **implementation-tracking decision**: it is the only
ADR about *operating* the framework rather than a tactic the framework
deploys. The program already publishes a dated intervention timeline in
the empirical layer, but that timeline's conventions (no effect claims,
the ADR-0012 host abstraction, normative/empirical separation) bar it
from doubling as a planning surface. So tracking splits into two tiers:
a private implementation ledger carries operational status, ranked
candidate interventions, and working detail; the public timeline is its
dated, effect-claim-free projection. A periodic gap-review compares
deployed tactics against the Layer 4 catalog and the manifesto's open
questions to generate the next proposals — a self-application of the
framework that bears on the open questions about the empirical layer's
role and the framework's recursive application to itself. The review
procedure lives in the framework's operational skill; only the wiring
(which artifacts are this program's ledger and timeline) is project-specific.

ADR-0015 is the **license-selection decision**: it fixes which
permissive instrument an artifact takes, on an axis the framework had
named but never recorded. Permissive licensing spans a public-domain
dedication, an attribution-requiring content license, and a permissive
software license; a cross-repository audit found all but the last in
simultaneous use plus a non-commercial clause contradicting the
framework outright. The rule selects by the artifact's *dominant
audience*, not its form: because attribution is carried by the
federated-identifier layer (the 0001-0003 triplet and 0013) rather than
by the license, the license is chosen to minimize reuse friction. Under
an LLM-first program (ADR-0007) almost every artifact — prose essays as
much as datasets — is mined rather than read, so machine-mined artifacts
take a public-domain dedication while only executable code takes a
software license (carried whole-repo on a code-bearing repository for
legibility) and only a genuinely human-first artifact takes a content
license; non-commercial and no-derivatives terms are prohibited as the
enclosure the thesis predicts weakens the origin claim. It is the
license-layer counterpart of the vocabulary discipline (ADR-0010): both
choose the artifact's form to maximize absorption while leaving the
origin claim recoverable through the identifier layer rather than
through enforcement, and it is disjoint from ADR-0012 — that ADR governs
the license a prospective external host must extend, this one the
license the author applies.

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
