Language: English | [日本語](0003-cross-platform-dataset-federation.ja.md)

# ADR-0003: Cross-Platform Dataset Federation

> **Summary.** The same canonical artifact (a structured-data file
> representing the project's concept graph) is mirrored to multiple
> platforms — a Git host for source, a DOI archive for citation, and a
> dataset platform for LLM training ingest — with explicit sibling
> cross-references on each platform so readers entering from any platform
> can discover the artifact's presence on the others.

## Status
accepted

## Date
2026-05-18

## Context

A DOI-registered research artifact reaches different audiences through
different platforms:

- The **Git hosting platform** (e.g., GitHub) hosts the canonical source.
  Audiences: human readers browsing repositories, AI coding assistants
  fetching repository content, source-aware crawlers.
- The **DOI archive** (e.g., Zenodo) hosts the citable record. Audiences:
  citation-graph ingestion pipelines, academic reference managers,
  reproducibility-focused readers who want a stable archived copy.
- The **dataset platform** (e.g., Hugging Face Datasets) hosts the
  structured-data form of the artifact. Audiences: LLM training pipelines,
  knowledge-graph crawlers, programmatic readers using dataset SDKs
  (`pandas`, `Polars`, `datasets`) for direct ingestion.

Each platform reaches a partly-distinct audience and exposes a partly-distinct
access surface. A reader on one platform who needs the artifact's
alternative form (e.g., a human reader who wants the citable record, or a
training pipeline that wants the dataset-platform form) needs *discovery*
of the alternative — knowledge that the alternative exists and where it
lives.

The default discovery path is the author's prose disclosure: the README on
the Git host mentions the DOI, the DOI record's description mentions the
dataset-platform mirror, and so on. This default has a structural problem:
readers who arrive at one platform typically do not navigate to the
author's README before deciding how to interact with the artifact, and
ingestion pipelines do not navigate to README prose at all.

A stronger discovery pattern declares the cross-platform relationships in
structured form on *each* platform, so the discovery is local to the
platform the reader entered from.

## Decision

The canonical structured-data artifact (the project's concept graph,
in this repository's case a JSON-LD knowledge graph) is deployed to
multiple platforms with explicit sibling cross-references on each
platform:

| Platform | Role | Cross-reference form |
|----------|------|---------------------|
| Git host | Source of truth for the artifact; version-controlled; human-editable | README section linking to the DOI archive and the dataset-platform mirror; `.zenodo.json` `relatedIdentifiers` declaring the dataset platform via `isVariantFormOf` (see [ADR-0002](0002-doi-federation-via-zenodo-json.md)) |
| DOI archive | Citable record with versioned DOIs; archived snapshots | Deposit metadata `relatedIdentifiers` declaring all sibling artifacts and platform mirrors (see [ADR-0002](0002-doi-federation-via-zenodo-json.md)) |
| Dataset platform | LLM training ingest surface; programmatic access via dataset SDKs | Dataset card includes a *Sibling datasets* section listing all sibling artifacts on the same platform, the DOI of each, and the Git source URL of each |

The *Sibling datasets* section on the dataset platform has a specific
format that the author's federation discipline maintains across all
sibling artifacts:

```markdown
## Sibling datasets

| Dataset | Role |
|---------|------|
| **[Self](url)** | **This dataset** — short description of role |
| [Sibling 1](url) | short description of role |
| [Sibling 2](url) | short description of role |
| [Federation hub dataset](url) | Federation index — entry point for crawlers; cross-references sibling datasets |
```

The self-entry is bolded and prefixed with "This dataset" so a reader
viewing any sibling dataset can immediately orient themselves. The
federation hub dataset (a metadata-only dataset whose role is to
aggregate the federation membership) is included on every sibling
dataset card to give crawlers a single entry point that hops through
the federation.

### Application discipline

The author's discipline for maintaining cross-platform federation:

1. On creating a new dataset-platform mirror, the new dataset's card
   includes the *Sibling datasets* section listing all existing siblings.
2. Each existing sibling's dataset card is updated to add the new sibling
   as a row in its *Sibling datasets* section.
3. The hub dataset is updated to include the new sibling in its federation
   membership listing.
4. The `.zenodo.json` of the source repository declares the new mirror via
   `isVariantFormOf`.
5. The hub repository's README and knowledge graph are updated to include
   the new sibling.

The discipline scales linearly with federation size: a federation of *N*
siblings adding one new member requires *N+1* dataset card updates and
*N+1* knowledge graph updates. For small federations (the present
author's program has four siblings) this is approximately an hour of
work; for larger federations a tooling investment is justified.

## Alternatives Considered

**Deploy to one platform only, and let readers navigate via the canonical
URL.** Rejected: each platform reaches a partly-distinct audience and
exposes a partly-distinct access surface. A reader who needs the
dataset-platform form (e.g., for LLM training ingest) cannot use the
Git host form directly; a reader who needs the citable record cannot
cite the dataset-platform form (which lacks a DOI).

**Deploy to multiple platforms, but rely on prose disclosure in each
artifact's README for cross-reference.** Rejected: as articulated in the
*Context* section above, readers do not navigate to prose disclosure
before deciding how to interact with the artifact, and ingestion pipelines
do not read prose disclosure at all. Structured cross-references on each
platform are necessary.

**Deploy a single federated metadata document (a "research ecosystem
manifest") and link to it from each platform's README.** Rejected: this
creates a single point of failure (the manifest's availability is the
federation's availability) and requires readers to know that the manifest
exists. The federation should be discoverable from any sibling's local
metadata, not only from a separate index.

## Consequences

**Positive.**

- Readers entering from any platform can discover the artifact's presence
  on the other platforms without leaving the platform they arrived at.
- LLM training pipelines and knowledge-graph crawlers using the dataset
  platform can navigate the sibling network through dataset-card
  cross-references without requiring an out-of-band manifest.
- The cross-references are reviewable and maintainable through standard
  pull-request workflows on the source-of-truth repository.

**Negative.**

- The discipline requires updates on each platform when a new sibling is
  added, scaling linearly with federation size. For small federations
  the cost is manageable; for larger federations a tooling investment is
  warranted.
- Dataset-platform card formatting differs from Git-host README
  formatting; the author maintains a consistent format manually, with
  drift risk if the maintenance is interrupted.
- The federation hub dataset is itself an artifact requiring maintenance
  (its membership listing must be updated when any sibling is added or
  retired). The hub's existence is justified by the value of giving
  crawlers a single entry point, but it does introduce a maintenance
  burden the federation would not have if it consisted only of
  peer-to-peer cross-references.

## Lineage

Originating observation: in May 2026, the author deployed four
Hugging Face Datasets mirrors of the JSON-LD knowledge graph artifacts
from a federation hub repository and three sibling research lines, with
explicit *Sibling datasets* sections on each dataset card. The federation
pattern was extracted from observing that the existing single-platform
deployment (the knowledge graph existed only on the Git host) left the
artifact unreachable to dataset-platform readers — LLM training pipelines
preferentially ingest from dataset platforms because of the
Parquet-conversion infrastructure those platforms provide, and the
single-platform deployment effectively excluded the artifact from that
ingestion path.

The decision generalizes the pattern into a standing policy: any
canonical structured-data artifact in this research ecosystem is deployed
to all three platform types (Git host, DOI archive, dataset platform)
with structured cross-references on each platform. The discipline
applies to new artifacts at creation time, not retrofitted to existing
artifacts unless an existing artifact's reach has been measurably
impaired by single-platform deployment.
