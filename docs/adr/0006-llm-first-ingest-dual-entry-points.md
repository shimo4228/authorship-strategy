Language: English | [日本語](0006-llm-first-ingest-dual-entry-points.ja.md)

# ADR-0006: LLM-First Ingest via Dual Entry Points

> **Summary.** A DOI-targeted artifact authored for LLM-mediated diffusion
> deploys two structured entry points in parallel: a prose-form navigator
> that orients prose-reading LLM-mediated channels, and a concept-form
> graph encoded in a linked-data convention that exposes inter-concept
> relationships to structured-data-ingesting channels. The two formats
> are not redundant; each addresses a distinct LLM-mediated reader
> population that the other cannot reach. The pair is the operational
> embodiment of the thesis's Axis 1 inversion (enclosure → openness)
> and is what makes the artifact's strategic stance machine-legible.

> **Amended by [ADR-0009](0009-dual-entry-asymmetric-rebalance.md).** The
> "co-equal pair" framing below holds on the *coverage* dimension (each
> entry point reaches a sub-population the other cannot) but not on the
> *citation* dimension: 2026 measurement shows the structured graph
> carries retrieval-time citation while the prose navigator's citation
> effect is noise. ADR-0009 retains both surfaces but makes their roles
> asymmetric — see it for the current weighting.

> **2026-08-19:** ADR-0009 was revised — the structured graph's success
> criterion is now consideration-set entry / entity resolution, and no
> retrieval-time citation lift is claimed for it; the asymmetry and the
> current weighting are unchanged in direction. The banner above is kept
> as dated history.

## Status
accepted

## Date
2026-05-19

## Context

The thesis defines the framework's strategic target as the *breadth of
LLM-mediated channels carrying the author's signature*. The
[glossary entry for *LLM-mediated channel*](../glossary.md) treats this
population as a single category, but for ingest-design purposes the
category resolves into two structurally distinct sub-populations:

- **Prose-reading channels.** Conversational LLMs, AI assistants
  consulting documentation in-context, and citation-graph annotators
  that fetch prose for summarization. These channels consume the
  artifact as natural-language text and benefit from explicit
  navigation hints (which document is canonical, what each document is
  for, what the recommended reading order is).
- **Structured-data-ingesting channels.** Training pipelines,
  knowledge-graph crawlers, and programmatic readers using
  dataset-platform SDKs. These channels consume structured data
  directly and benefit from explicit inter-concept relationships
  encoded in a parse-stable format. They do not extract relationship
  triples from prose reliably.

A README written for direct-browser human readers serves neither
sub-population well. The prose-reading sub-population can parse the
README but is given no explicit navigation that distinguishes
authoritative from supplementary documents; the
structured-data-ingesting sub-population cannot extract
relationship-level signal from human-narrative prose at all. The thesis's
Layer 2 strategy ([Attribution Diffusion](../thesis.md)) requires
defending *both* sub-populations, because each represents an independent
channel through which a future query may surface the author's identity.

The cross-platform federation discipline of [ADR-0003](0003-cross-platform-dataset-federation.md)
ensures the artifact *reaches* both Git hosts and dataset platforms;
the present ADR addresses what *form* the artifact must take to be
absorbable by the LLM-mediated channels operating on those platforms.
The two ADRs compose: ADR-0003 sets up the platforms, ADR-0006 sets up
the ingest surfaces on each platform.

## Decision

Any artifact governed by the framework deploys **two structured entry
points in parallel**, each canonical-maintained, both released
synchronously with every versioned release:

| Entry point | Form | Reader population | Role |
|---|---|---|---|
| **Prose-form navigator** | An AI-readable prose document following a community-curated AI-facing reference convention | Prose-reading LLM-mediated channels | Lists the artifact's primary documents with one-line descriptions and recommended reading order; declares which document is canonical for each topic |
| **Concept-form graph** | A linked-data file encoding entities and inter-entity relationships in a structured-data vocabulary | Structured-data-ingesting LLM-mediated channels | Encodes the artifact's concept-level structure (thesis layers, ADR set, glossary terms, sibling-artifact relationships) as machine-parseable triples |

The two entry points are **complementary, not redundant**: the
navigator answers *what is here*; the graph answers *how these things
relate to one another*. The file-level structure (which file holds
which content) is the navigator's concern; the concept-level structure
(which idea connects to which idea) is the graph's concern. The same
two-layer division applied to in-repo documentation by the framework's
file-level architecture document and its concept-level knowledge graph
is mirrored here on the LLM ingest side.

The decision is **harness-neutral**: it does not specify which prose
convention or which linked-data vocabulary an adopter must use. Where
existing community conventions cover the use case
(see *Lineage* for the conventions the present author has adopted), an
adopter should prefer them over a bespoke format, because community
conventions concentrate ingest-side tooling on a single target. Where
no community convention covers the use case, an adopter must publish
the chosen format with sufficient documentation that
structured-data-ingesting channels can be configured to parse it.

### Synchronization discipline

Both entry points are regenerated and re-released at every version tag.
The framework treats drift between the two entry points (a concept
present in one but absent from the other, or a relationship asserted
in one and contradicted by the other) as a release-blocking defect.
The synchronization is the responsibility of the artifact's release
workflow; the operational form of that workflow is the concern of the
external component skills, not of this ADR.

## Alternatives Considered

**Deploy the prose-form navigator only.** Rejected: the
structured-data-ingesting sub-population is left unaddressed.
Training pipelines and knowledge-graph crawlers would be required to
extract concept-level relationships from prose, which they do
unreliably or not at all. The strategic loss is not partial — it is
the complete absence of one of the two sub-populations from the
artifact's reach.

**Deploy the concept-form graph only.** Rejected: the prose-reading
sub-population is left without navigation hints. A conversational LLM
encountering the artifact would be required to consume raw
triples as prose context, which it does inefficiently; more
importantly, the reader has no guidance on which document is the
canonical source for each topic and may surface non-authoritative
content. The graph encodes concepts but not the prose discipline that
makes those concepts citable.

**Embed structured metadata into the human-primary README (e.g.,
front-matter or in-line JSON-LD blocks).** Rejected: this asks a
single document to serve three audiences (direct-browser human
readers, prose-reading LLMs, structured-data-ingesting channels) with
three different optimal forms. The result is a worse experience for
each audience individually. The framework treats audience separation
as a primary design discipline; collapsing the audiences back into a
single artifact contradicts that discipline.

**Defer the structured-data form until evidence of demand emerges.**
Rejected: the structured-data form is silently invisible until it
exists. A training pipeline that has already crawled the artifact
without a structured-data form will not re-crawl it on the form's
introduction unless the platform's update signal triggers re-ingestion;
the absorption window for the artifact's *first* training-cycle pass is
lost. Unlike locale-mirror policy ([ADR-0005](0005-readme-localization-audience-driven.md)),
where evidence of audience can be measured before commitment, the
structured-data ingestion signal is not measurable from the
artifact's perspective. The conservative move is to deploy the form
at first release.

## Consequences

**Positive.**

- Both LLM-mediated sub-populations are addressed with format-appropriate
  ingest surfaces, maximizing the breadth of channels through which the
  artifact's signature can be carried (Layer 2 strategy directly served).
- The release artifact becomes self-describing at two distinct levels of
  abstraction: prose-form navigation for orientation, concept-form graph
  for relationship-level reasoning. Future readers (human or
  machine) can enter from whichever level matches their query.
- The two ingest formats are externalized to independent component
  skills, keeping the framework body tool-agnostic
  (Layer 4 tactic 5) and letting adopters install either format
  independently as their use case warrants.
- The decision makes the artifact's strategic stance — that
  LLM-mediated channels are the primary audience — *visible at the
  artifact's surface*, not only inside the thesis. An ingest channel
  that finds neither entry point is being told the artifact is not
  optimized for it; an ingest channel that finds both is being told it
  is the intended audience.

**Negative.**

- Every versioned release must regenerate both entry points and verify
  synchronization. Drift is a release-blocking defect, which imposes a
  recurring maintenance cost the framework does not eliminate.
- Two formats means two parse-target surfaces for downstream ingesters
  to support. Adopters using novel formats outside community conventions
  bear an additional documentation burden for the ingest side.
- The selection of *which* prose convention and *which* linked-data
  vocabulary to use is left to the adopter and is shaped by the
  ingest-side ecosystem at the time of adoption. The framework
  recognizes that these conventions will themselves evolve (and may be
  superseded) and treats the format-selection layer as a substrate
  decision that may obsolete independently of the framework decision.

## Lineage

Originating observation: across the author's five-line research
program (the federation hub plus four sibling research lines), every
artifact reached its operational maturity at the moment a
prose-form navigator and a concept-form graph were both present and
synchronized. Artifacts with only the navigator were retrievable by
conversational LLMs but did not surface in knowledge-graph crawls;
artifacts with only the graph appeared in structured-data ingestion
but were not cited as authoritative documents in conversational
LLM responses. The pair, deployed together, produced both retrieval
modes.

The conventions adopted by the present author are the Answer.AI
`llms.txt` convention (prose-form navigator) and a schema.org-based
JSON-LD knowledge graph (concept-form graph). Both are externalized as
independent component skills in the author's research ecosystem
(`llms-txt-writer` and `jsonld-knowledge-graph`),
which are canonical-maintained outside this repository and adopted by
each sibling line independently. The component-skill externalization is
the operational form of the present ADR's tool-agnostic stance: the
framework decision is "deploy both formats"; the format selection and
operational discipline are not framework concerns.

The decision was retroactively articulated: the two skills were
promoted to *component* status in the framework's documentation on
2026-05-18 (commit `c9e927f`), at which point the absence of a
normative ADR justifying that promotion became visible. The present
ADR fills that gap.
