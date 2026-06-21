Language: English | [日本語](0002-doi-federation-via-zenodo-json.ja.md)

# ADR-0002: DOI Federation via `.zenodo.json`

> **Summary.** Sibling, source, and platform-mirror relationships between
> DOI-registered artifacts are declared as `relatedIdentifiers` in the
> archive deposit metadata, so that the inter-artifact citation network is
> recoverable from the metadata alone, without requiring readers to follow
> prose disclosures.

## Status
accepted

## Date
2026-05-18

## Context

A DOI-registered artifact that is part of a larger research ecosystem has
relationships with other artifacts: sibling research lines, source
artifacts it derives from, archived versions of its predecessors,
cross-platform mirrors of itself. Readers and citation-graph ingestion
pipelines need to discover these relationships in order to navigate the
research ecosystem coherently. Three discovery channels are available:

1. **Prose disclosure in the artifact's README and documentation** —
   relationships are mentioned in human-readable form. This channel reaches
   readers who land on the artifact and read its documentation; it does not
   reach automated ingestion pipelines and is poorly suited to LLM-mediated
   reference resolution.
2. **External catalog and registry entries** — relationships are declared
   in a separate catalog (a research-program manifest, an institutional
   research output registry). This channel requires the reader to know the
   catalog exists and to query it explicitly; the catalog itself becomes
   a maintenance burden and a single point of failure.
3. **Archive deposit metadata** — relationships are declared in the
   structured metadata that accompanies the archive deposit. Modern open
   archive services (e.g., Zenodo) support a `relatedIdentifiers` field
   in deposit metadata that carries through to downstream citation ingestion
   (DataCite, OpenAlex, Scholix, OpenCitations). Relationships declared
   here propagate into the citation graph automatically.

The third channel is structurally strongest. Relationships declared in
deposit metadata appear in the citation graph as edges, are queryable by
citation-graph APIs, are surfaced by some catalog UIs, and are durable
across changes to README content or external catalog availability.

The practical mechanism for declaring relationships in deposit metadata
depends on the archive service. For services that auto-deposit on tag
push from a Git hosting platform (Zenodo is the reference example), a
configuration file in the repository (`.zenodo.json` or comparable) is
read at deposit time and its contents become the deposit metadata. The
file persists in the repository, is version-controlled, and is editable
through the same workflow that produces the artifact itself.

## Decision

Inter-artifact relationships for each DOI-registered artifact in this
research ecosystem are declared in a `.zenodo.json` file at the repository
root, as entries in the `related_identifiers` array. The following
relations are used:

| Relation | When to use |
|----------|-------------|
| `references` | The artifact intellectually references a sibling research line whose contribution shaped this one. Reciprocal: declared once per pair, in both directions if appropriate. |
| `isDerivedFrom` | The artifact was extracted from a specific predecessor artifact (e.g., re-expressed from a sibling line, ported from an archived version). |
| `isSourceOf` | The artifact is the upstream source of one or more downstream artifacts. Use sparingly: only when the upstream-downstream relationship is intentional and the downstream artifact would not exist without it. |
| `isPartOf` | The artifact is a member of a larger federation (e.g., a hub repository's federation membership). |
| `isVariantFormOf` | The artifact is mirrored to a non-DOI platform whose canonical URL is given (e.g., a Hugging Face Dataset mirror). |
| `isDocumentedBy` | The artifact has an external canonical documentation source (e.g., a JSON-LD knowledge graph file in the hub repository) that supplements its own README. |

Relations should be declared symmetrically across paired artifacts:
when artifact A declares `references` to artifact B, artifact B's
`.zenodo.json` should declare a corresponding relation back (usually
`isReferencedBy`, or in some pairs `references` reciprocally).
Symmetry is declared per release; the relations propagate into the
citation graph on the next tagged release of each artifact.

### Application discipline

The author's discipline for maintaining federation:

1. On adding a new sibling artifact to the research ecosystem, the new
   artifact's `.zenodo.json` declares relations to all existing siblings
   it references or is referenced by.
2. Each existing sibling's `.zenodo.json` is updated to declare the
   reciprocal relation to the new artifact, in the same change set if
   possible.
3. Cross-platform mirrors are declared via `isVariantFormOf` with the
   mirror's canonical URL as the identifier.
4. The hub repository (a federation-membership-only artifact) is
   declared via `isPartOf`.
5. Documentation artifacts that supplement the README (e.g., a hub-level
   knowledge graph in JSON-LD form) are declared via `isDocumentedBy`.

For records published before this ADR's discipline was adopted, the
existing deposit metadata can be edited through the archive's
administrative interface to add the missing relations *without minting
a new version*. This is a one-time retrofit operation and is documented
in [`../skills/`](../skills/) for the author's own reference.

## Alternatives Considered

**Declare relationships only in the README prose.** Rejected: prose
disclosure does not propagate into citation graphs and is invisible to
ingestion pipelines that drive most downstream discovery. Readers who
find the artifact through a citation query lose access to the federation
context.

**Maintain a separate research-program manifest file in the hub
repository.** Rejected (or rather, used in conjunction with this ADR
through a JSON-LD knowledge graph): a separate manifest creates a single
point of failure and requires the reader to know about it. The federation
should be discoverable from any sibling artifact's deposit metadata, not
only from the hub.

**Use only Crossref-style citation metadata via CITATION.cff `references`
fields.** Rejected: CITATION.cff `references` are propagated into some
citation graphs but not all; archive-deposit metadata
`relatedIdentifiers` reaches a broader ingestion network and uses the
DataCite relation vocabulary, which is more expressive than CITATION.cff's
simple references list. Both can coexist (and do, in this repository's
implementation) but archive-deposit metadata is the primary surface.

## Consequences

**Positive.**

- Citation graphs ingest the inter-artifact network automatically; readers
  who arrive via a citation query can navigate to siblings, source
  artifacts, and cross-platform mirrors through the graph.
- The network is version-controlled in each artifact's repository,
  reviewable through standard pull-request workflows, and auditable
  through repository history.
- Adding a new sibling to a federation requires editing each existing
  sibling's `.zenodo.json` — a manageable maintenance burden that scales
  linearly with federation size and is concentrated at the moment of
  addition.

**Negative.**

- The maintenance burden at sibling-addition time is real: a federation
  of *N* siblings adding one new member requires *N* edits, not one. For
  small federations (the present author's program has four siblings)
  this is a half-hour of work; for larger federations the work scales
  linearly and a tooling investment may be warranted.
- The reciprocal-declaration discipline depends on each sibling's release
  cadence: the reciprocal edge becomes visible in the citation graph
  only after each sibling's next tagged release. For federations with
  long release cadences, the citation graph develops the new edge in
  staggered fashion.
- Records published before the discipline was adopted require a one-time
  retrofit through the archive's administrative interface. The operation
  is mechanical but cannot be automated by repository-side tooling alone.

## Lineage

Originating observation: in May 2026, the author deployed `.zenodo.json`
files in three sibling repositories (Agent Knowledge Cycle, Contemplative
Agent, Agent Attribution Practice), with cross-references encoding the
research ecosystem's inter-artifact relationships. The federation pattern
was extracted from observing that the existing prose-disclosure approach
(relationships mentioned only in READMEs) left the citation graph empty
of any inter-artifact edges, even though the relationships were
substantial and well-articulated in the prose. The retrofit operation
(editing three existing deposit records to add the missing relations
without minting new versions) was approximately thirty minutes of
administrative-interface work.

The decision generalizes the approach: relationships go in deposit
metadata so the citation graph carries them, prose disclosure retains
its place in the README for readers landing on the artifact, and both
are kept in sync through the same release-time workflow that updates
the artifact itself.
