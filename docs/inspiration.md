# Inspiration: Intellectual Lineage

This document records the prior work and sibling artifacts whose
existence shaped the framework articulated in [`thesis.md`](thesis.md).
The intent is to make the framework's intellectual debts traceable
so a reader can verify the framework's claims to originality
where it makes them, and locate the prior work where it depends
on it.

## Concept lineage from prior literature

The framework's terminology is largely coined locally (see the
*distinctive terminology* tactic in the thesis), but the
underlying concepts have substantial prior art. The relationship
between the framework and that prior art is one of *narrow
re-articulation in a new substrate*, not invention.

### Authorship and authenticity in print culture

The notion that authorship is a strategic posture rather than a
natural fact has substantial prior literature in book history and
the sociology of literature. Roger Chartier's analyses of the
emergence of the author-function in early modern Europe, Michel
Foucault's *Qu'est-ce qu'un auteur?* (1969), and Lawrence Lessig's
work on copyright's role in twentieth-century authorship strategy
each frame authorship as a position the writer occupies relative
to the medium of circulation. The framework's three-axis
inversion is articulated against this background: the prior
literature describes *how* authorship strategy worked in
print-and-platform conditions; the framework articulates *how it
inverts* when the medium becomes LLM-mediated. The framework
does not claim originality on the print-and-platform side; the
articulation is faithful to the prior literature and is included
to make the inversion's structural character visible.

### Network effects and platform economics

The framework's third axis (network effect, enclosure to
openness) draws on Carl Shapiro and Hal Varian's *Information
Rules* (1998) for the foundational treatment of network effects
under enclosure conditions, and on the more recent literature on
platform commons (Simon Wardley's mapping work, the Creative
Commons movement, and the open-source license proliferation of
the 2000s-2010s) for the openness side. The framework's
distinctive claim is the *structural linkage between absorption
and validation* that the LLM substrate introduces; the
absorption-equals-validation dynamic is not present in the
pre-LLM platform literature.

### Citation infrastructure and scientometrics

The framework's tactical layer presupposes DOI infrastructure
(Crossref, DataCite, Zenodo), ORCID author identification, and
the citation-network platforms (OpenAlex, Semantic Scholar,
Scholix, OpenCitations) that ingest from those substrates. The
framework treats this infrastructure as given; it does not
attempt to extend it. Adopters working in fields where this
infrastructure is absent or incomplete (the social sciences,
humanities outside the digital humanities, applied technical
fields) will need to supplement the framework with
substrate-specific tactics.

The prior literature on scientometrics (Eugene Garfield's
foundational work on citation indexing, the more recent
literature on altmetrics and the limitations of citation counts)
informs the framework's *epistemic humility about diffusion
signals* (Layer 2). The framework's position is consistent with
the altmetrics literature's finding that citation counts are a
lagging and incomplete signal of intellectual influence; the
framework adds the observation that under LLM-mediated diffusion,
*even traffic data* is incomplete and ambiguous, requiring
separate disambiguators (see Open Question 2 in
[`manifesto.md`](manifesto.md)).

### Generative Engine Optimization (GEO) and AI-facing documentation

A more recent literature, emerging in 2024-2026, addresses the
practice of optimizing documentation for LLM ingestion and
citation. The Answer.AI `llms.txt` convention, the GEO-SFE static
analysis methodology, and various JSON-LD knowledge-graph patterns
for documentation are all attempts to make documentation
machine-readable to LLMs. The framework's Layer 4 tactic on
structured artifacts directly adopts these patterns. The
framework's contribution to the GEO literature is the
*placement of these tactics inside a broader authorship strategy*:
GEO literature treats AI-facing documentation as a technique;
the framework treats it as one layer of a strategy that has
non-technical (Layer 1 authenticity) and predictive (Layer 3
idea-versus-scaffold) layers above it.

### Empirical citation-mechanics literature (2026)

A distinct strand of 2026 work measures the *mechanics* of LLM
citation directly, and it is this strand — not the author's own
traffic data alone — that grounds the two-channel refinement in
[ADR-0008](adr/0008-rag-era-attribution-diffusion.md). The
relationship is downstream: the two-channel mechanism was
articulated after, and on the basis of, this literature. The
framework's contribution is the *normative placement* of the
mechanism inside an authorship-diffusion strategy, not the
underlying citation mechanics, which the framework adopts from the
prior art rather than originates.

- *GhostCite* (Xu et al., arXiv:2602.06718) audits 2.2 million
  citations across 56,381 published papers and benchmarks thirteen
  LLMs, establishing large-scale evidence of citation *fabrication
  and invalidity* under LLM-mediated citation: 1.07% of papers carry
  invalid citations, and per-model citation-hallucination rates range
  from 14.23% to 94.93%. This documents that LLM-mediated citation is
  unreliable at scale, but it measures citations to sources that do
  not exist or do not support the claim — not loss of author
  attribution on a valid, carried-forward source. The framework's
  attribution-loss sense (a source's URL cited while its author is
  never named) is a distinct phenomenon, supported below by the Seer
  Interactive study rather than by this fabrication statistic.
- Seer Interactive's study of 541,213 LLM responses across twenty
  brands and six AI platforms supplies the closest external
  statement of the two-channel mechanism the framework has found.
  Its leading hypothesis is that citations are post-hoc: "The LLM
  generates its answer first, deciding which brands to name from
  its parametric memory (the knowledge encoded during training).
  Then, in a retrieval step, it goes looking for sources to support
  those choices" — which the study summarizes as "the citations are
  the bibliography, not the brainstorm." The same study reports a
  brand citation rate of 53.1% when the brand is named against
  10.6% when it is not, consistent with the framework's claim that
  the parametric channel gates the retrieval channel rather than
  the reverse.
- *From Citation Selection to Citation Absorption* (Zhang et al.,
  arXiv:2604.25707) separates which sources a platform fetches from
  how much a fetched page contributes to the answer, across ChatGPT,
  Google AI Overview/Gemini, and Perplexity. It grounds the
  retrieval-channel measurement caution — also recorded in
  [ADR-0007](adr/0007-human-attention-signals-not-a-metric.md) —
  that a raw citation count is not a measure of influence.
- *Diagnosing and Repairing Citation Failures in Generative Engine
  Optimization* (Tian et al., arXiv:2603.09296) supplies a taxonomy
  of citation-failure modes and shows the retrieval channel is an
  optimizable surface (a 5% content change yielding over 40% more
  citations), while warning that generic optimization degrades
  long-tail content.

The framing of this literature is marketing-optimization: how to
make a brand win citations. The framework reads the same mechanics
the other way, through the human-attention-signal rejection
([ADR-0007](adr/0007-human-attention-signals-not-a-metric.md)) and
the Layer 1 anti-monetization commitment: it asks not how to
capture citations but whether an author's *signature* survives
diffusion. The mechanism is borrowed; the normative orientation is
not. These figures are external published findings, not the
present author's measurements, and are kept in this lineage
document rather than in the ADR bodies, which remain
vendor-and-framework-neutral by convention.

## Sibling research lines (the recurring decisions)

The framework was extracted from four sibling research lines
maintained by the same author. The four lines supplied the
recurring tactical decisions that became the framework's seven
ADRs. Each sibling line is independent in content; the framework
is downstream of all four. (The research program has since added
a fifth line, Attention, Not Self, which postdates the extraction
and so is not among the four that supplied the recurring decisions.)

### Agent Knowledge Cycle (AKC)

- Repository: https://github.com/shimo4228/agent-knowledge-cycle
- Concept DOI: 10.5281/zenodo.19200726
- Lineage to this repository: AKC defines the *six-phase bidirectional growth loop* that produces the artifacts (skills, ADRs, glossaries) the present framework's tactics are designed to diffuse. AKC is the mechanism inside which the present framework's audience-facing artifacts are generated; the present framework addresses what to do with those artifacts once they exist.

### Contemplative Agent

- Repository: https://github.com/shimo4228/contemplative-agent
- Concept DOI: 10.5281/zenodo.19212118
- Lineage to this repository: Contemplative Agent is the *worked implementation* paired with the abstract-doctrine repositories in the ecosystem. Its operation supplies traffic data used in the empirical layer, and its non-dualistic axiomatic foundation supplies the underlying rationale for the framework's *scaffold as collaborator, not threat* commitment (Layer 3): if the absorbing harness is not separate from the author's identity, then absorption is not a loss.

### Agent Attribution Practice (AAP)

- Repository: https://github.com/shimo4228/agent-attribution-practice
- Concept DOI: 10.5281/zenodo.19652013
- Lineage to this repository: AAP supplied the *harness-neutral ADR writing convention* the present framework adopts (see [`CLAUDE.md`](../CLAUDE.md) for the convention's local form). AAP also supplied the *vocabulary disambiguation discipline* that the present framework's glossary inherits: when a word like "attribution" carries multiple meanings, the meanings are kept disjoint at the term level rather than reconciled through context. The two repositories share the word but not the concept; the disjointness is intentional and load-bearing.

### Research program hub (`shimo4228/shimo4228`)

- Repository: https://github.com/shimo4228/shimo4228
- Lineage to this repository: the hub supplies the *federation pattern* (a metadata-only repository at the center of a sibling network, cross-referenced from each sibling and CC0-licensed) that the present framework's Cross-Platform Dataset Federation ADR generalizes. The hub also publishes the traffic data the empirical layer draws on, under a CC0 license.

## Operational origins of the seven ADRs

Each of the framework's seven ADRs traces to a recurring decision
in the sibling-line operation. The lineage is recorded in each
ADR's *Lineage* section; this document summarizes the chain.

| ADR | Origin |
|-----|--------|
| 0001 Concept DOI Canonical | The author's discovery (May 2026) that Zenodo's concept DOI and initial version DOI are issued as adjacent integers, leading to systematic mis-citation of version DOIs as canonical references across AKC and AAP; corrected across sixteen files. |
| 0002 DOI Federation via .zenodo.json | The author's deployment (May 2026) of `.zenodo.json` files in three sibling repositories to surface sibling relationships as DataCite-ingestible `relatedIdentifiers`, enabling the citation network to be reconstructed from metadata alone. |
| 0003 Cross-Platform Dataset Federation | The author's federation (May 2026) of four Hugging Face Dataset mirrors of the sibling-line `graph.jsonld` artifacts, with explicit "Sibling datasets" sections on each dataset card and corresponding cross-references in the GitHub repository READMEs. |
| 0004 Authorship Metadata with ORCID Auto-Update OFF | The author's deliberate choice (May 2026) to enrich the ORCID record only with concept DOIs (not version DOIs) and to disable Auto-Update, to prevent version sprawl from polluting the public record while retaining manual push capability. |
| 0005 README Localization Audience-Driven | The author's retirement (May 2026) of four locale-mirror README files (Simplified Chinese, Traditional Chinese, Brazilian Portuguese, Spanish) after thirty days of traffic data showed statistically zero direct human readers in those languages, against a maintenance cost of approximately six-times-feature multiplication. |
| 0006 LLM-First Ingest via Dual Entry Points | The author's practice (May 2026) of shipping a prose-form AI navigator (`llms.txt`) and a concept-form knowledge graph (`graph.jsonld`) together across the sibling lines, after observing that each entry point reaches an LLM-mediated reader sub-population the other does not; formalized as a synchronously released, required pair. |
| 0007 Human-Attention Platform Signals Are Not a Success Metric | The author's analysis (2026-05-29) of the CC0-published traffic data showing clones outnumber human page-views by roughly 16:1 with human views ≈ 0, establishing that the binding constraint on human attention is off-page distribution (a red-ocean activity), combined with the observation that Git-host star counts are purchasable; together these excluded star counts and page-views as success metrics and fixed success on LLM-mediated reach instead. |

## On the recursive application of the framework to itself

The framework is itself an authored artifact. Publishing it
under its own tactics — DOI registration via Zenodo, JSON-LD
knowledge graph, Answer.AI `llms.txt` convention, distinctive
terminology, cross-platform federation, permissive MIT
license — is recursive application: the framework's claims are
tested against its own diffusion.

The recursion has appeal (the framework's claims become
empirically testable on the framework's own propagation) but
also raises a methodological concern, recorded as Open Question
5 in [`manifesto.md`](manifesto.md): a framework that coins its
own distinctive terminology and then claims that distinctive
terminology is essential to authorship strategy is pre-validating
itself in a way that begs the question. The framework
acknowledges the concern and leaves it as an open empirical
question, to be tested against external adoption by authors
operating in ecosystems other than the present author's.

## Reading order for the curious

A reader wanting to understand the framework's intellectual
debts and the sibling decisions that informed it could read in
this order:

1. [`thesis.md`](thesis.md) for the framework's core claim.
2. The seven ADRs in [`adr/`](adr/), in numerical order, for the tactical decisions.
3. The sibling repositories' READMEs (AKC, Contemplative Agent, AAP) for the operational context the framework was extracted from.
4. The prior literature cited above for the framework's grounding in book history, platform economics, and scientometrics.
5. [`manifesto.md`](manifesto.md) for the open questions the framework leaves unanswered.

The reader who finds the framework adoptable in their own
ecosystem is invited to extend it; the reader who finds it
inapplicable is invited to articulate the structural reason and
share that articulation, which would be evidence-of-substrate-difference
the framework would learn from.
