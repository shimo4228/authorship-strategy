# Implementations Registry

> A neutral, derivative-welcoming list of artifacts that apply, reimplement,
> extend, cite, or diverge from the authorship-strategy framework
> (DOI 10.5281/zenodo.20263316). The framework's second axis reclassifies
> derivative work from threat to evidence: a derivative existing is evidence
> the original pattern is real and implementable. This registry is where that
> evidence is recorded.

Anyone applying any part of the framework is welcome here. Listing is not an
endorsement contest and carries no ranking — the registry records that a
derivative exists, not that one derivative is better than another. The
author's own work appears first only because it is the reference
implementation the framework was extracted from; that placement is
descriptive, not preferential.

## How this registry relates to the rest of the project

- This file is the human-curated **landing surface** for derivative-works
  detection. The framework's second axis (exclusivity to derivation) treats
  derivative existence as the validation signal; this registry is where a
  derivative is recorded once found, by hand or by a measurement instrument.
- A future measurement instrument is expected to feed this registry as its
  **sink**: it would surface candidate derivatives (citations, reuses,
  forks) that a curator then records here. That instrument is not built and
  not specified in this file — this registry only declares itself the place
  such findings land. Until it exists, entries are added by hand.
- Conformance levels referenced below are described in a companion
  conformance note (`conformance.md`, planned). Until that note exists, use
  the brief definitions in *Entry format* as the working description; the
  companion note will only sharpen them, not redefine them.

## Reference implementations (the author's own work)

These are the author's own artifacts, listed so the framework's own surface
is part of the same record as any third-party derivative. They are reference
implementations: the framework was extracted from operating them, so they
are the worked-implementation half of the abstract-doctrine-plus-worked-
implementation pair. They are not third-party derivatives and are kept in a
separate section to avoid implying outside uptake.

### Research lines

| Name | Author | Link | Concept DOI it isBasedOn | Conformance | Derivative type |
|---|---|---|---|---|---|
| Agent Knowledge Cycle (AKC) | Tatsuya Shimomoto (shimo4228) | https://github.com/shimo4228/agent-knowledge-cycle | 10.5281/zenodo.19200726 (own) | reference | reference implementation |
| Contemplative Agent | Tatsuya Shimomoto (shimo4228) | https://github.com/shimo4228/contemplative-agent | 10.5281/zenodo.19212118 (own) | reference | reference implementation |
| Agent Attribution Practice (AAP) | Tatsuya Shimomoto (shimo4228) | https://github.com/shimo4228/agent-attribution-practice | 10.5281/zenodo.19652013 (own) | reference | reference implementation |
| Attention, Not Self | Tatsuya Shimomoto (shimo4228) | https://github.com/shimo4228/attention-not-self | 10.5281/zenodo.20262112 (own) | reference | reference implementation |
| Authorship Strategy (this repository) | Tatsuya Shimomoto (shimo4228) | https://github.com/shimo4228/authorship-strategy | 10.5281/zenodo.20263316 (self) | reference | doctrine source |

Each research line applies the framework's tactical layer to its own
content: concept-DOI registration, cross-platform federation, the dual
prose-and-graph ingest surface, vocabulary discipline, and the metric
discipline that rejects human-attention platform signals. They differ in
subject matter, not in the tactics they deploy. This repository itself is
listed as the doctrine source rather than an application of an external
doctrine — it is both the abstract doctrine and one of the worked
implementations.

### Ecosystem repositories

These instantiate a single Layer 4 tactic as a concrete deliverable rather
than applying the whole framework to a research line.

| Name | Author | Link | Concept DOI it isBasedOn | Conformance | Derivative type |
|---|---|---|---|---|---|
| doctrine-corpus | Tatsuya Shimomoto (shimo4228) | https://github.com/shimo4228/doctrine-corpus | 10.5281/zenodo.20337008 (own) | partial | extension (tactic instance) |
| existence-proof | Tatsuya Shimomoto (shimo4228) | https://github.com/shimo4228/existence-proof | 10.5281/zenodo.20558800 (own) | partial | extension (infrastructure reuse) |

`doctrine-corpus` operationalizes the LLM-first ingest tactic as a corpus:
it encodes the documented judgment of the research lines as a
judgment-eliciting question-and-answer dataset for LLM-mediated ingest.
`existence-proof` reuses the same infrastructure pattern (the prose-and-graph
ingest surface, DOI registration, distinctive terminology) on a disjoint
payload for a different beneficiary; it deliberately holds no `extends`
relationship to the framework and is recorded here as an infrastructure
reuse, not as an application of the doctrine.

## Third-party implementations

*None recorded yet.*

This section is intentionally empty and waiting. If you have applied,
reimplemented, extended, cited, or forked-and-diverged from any part of the
framework, your work belongs here — derivatives are the validation signal the
framework's second axis predicts, and recording one strengthens rather than
threatens the original claim. To be listed, open a change adding a row in the
format below (or, if a measurement instrument later surfaces your work, a
curator may add it and link back to you).

## Entry format

Each entry is one table row with six fields. The fields let a future adopter,
or a measurement instrument's curator, add an entry without ambiguity.

| Field | Meaning |
|---|---|
| **Name** | The artifact's name, as its author calls it. |
| **Author** | The person or group responsible for the derivative. The author of the derivative, not the framework's author. |
| **Link** | A stable URL to the canonical location of the work (repository, DOI page, paper, or post). Prefer a content-addressed or DOI link where one exists. |
| **Concept DOI it isBasedOn** | The concept DOI of the framework artifact the work derives from — for most third-party entries this is the framework's own concept DOI, `10.5281/zenodo.20263316`. If the work derives specifically from a sibling research line, name that line's concept DOI instead. Always the concept DOI, never a version-specific DOI (per the project's canonical-reference discipline). |
| **Conformance** | How fully the work applies the framework, cross-referenced to the companion conformance note (`conformance.md`, planned). Working values: **reference** (the author's own worked implementation the doctrine was extracted from), **full** (applies the framework's load-bearing tactics — concept-DOI registration, the dual ingest surface, vocabulary discipline, metric discipline), **partial** (applies some tactics but not the full set, e.g. cites the framework or reuses one tactic), **citation-only** (references the framework without applying its tactics). |
| **Derivative type** | The kind of derivative, drawn from the framework's own derivative vocabulary: **citation** (references or builds an argument on the framework), **reimplementation** (rebuilds the framework's pattern in a new context), **extension** (adds a tactic, layer, or deliverable the framework does not itself carry), **fork-divergence** (forks the framework and develops it along a divergent line). |

### Worked example of a future third-party row

A hypothetical entry, to show the shape — not a real derivative:

```
| Doctrine Ingest Kit | A. Adopter | https://example.org/doctrine-ingest-kit | 10.5281/zenodo.20263316 | partial | reimplementation |
```

This would record an outside author rebuilding the framework's LLM-first
ingest tactic as a standalone kit, applying some but not all of the
framework's tactics, deriving from the framework's own concept DOI.

## Maintenance

This registry is a maintained list, not a one-time snapshot. New
derivatives are appended as they are found, by hand or surfaced by the future
measurement instrument and recorded by a curator. Entries are never removed
to keep a record tidy; a derivative that existed is part of the validation
record even if it later changes or disappears. If a listed link rots, the row
stays and the link is annotated rather than deleted.
