Language: English | [日本語](0004-authorship-metadata-orcid.ja.md)

# ADR-0004: Authorship Metadata with ORCID Auto-Update Disabled

> **Summary.** The author's persistent identifier record is enriched with
> concept DOIs only, never with version DOIs, and the archive service's
> *Auto-Update* feature (which would automatically push every newly
> published version DOI into the author record as a separate work) is
> explicitly disabled. The author record retains a clean three-line (or
> small-N-line) presentation that mirrors the research program's
> structure, rather than an accumulating version-DOI ledger.

## Status
accepted

## Date
2026-05-18

## Context

An author working in a DOI-registered research program typically holds a
persistent author identifier (an ORCID iD, or an equivalent identifier
on a similar service). The identifier acts as the anchor under which the
author's published works are aggregated: a query against the identifier
returns a *Works* listing that downstream services (citation graphs,
search engines, institutional registries) use as the canonical author
record.

Most DOI registration services that link to ORCID offer an
*Auto-Update* mechanism: when the author publishes a new version of an
existing artifact, the new version DOI is automatically added to the
ORCID Works listing as a separate entry. The mechanism is convenient —
it removes a manual step from the publication workflow — but it interacts
badly with the *concept DOI as canonical reference* discipline of
[ADR-0001](0001-concept-doi-canonical.md).

The interaction is as follows. Under [ADR-0001](0001-concept-doi-canonical.md),
the canonical reference for an artifact is its concept DOI, which
resolves to the latest version. Version DOIs exist for reproducibility
citations but are not the public-facing identifier of the artifact.
Under Auto-Update, however, every published version DOI is pushed into
the ORCID Works listing as a *separate work* — the listing does not
dedupe across versions of the same conceptual artifact, because the
concept DOI and the version DOI are distinct DOIs to the listing.

For a research program with a moderate release cadence (say, four
artifacts × four versions per year = sixteen entries per year), the
Auto-Update mechanism produces an ORCID record that, within a year, has
multiple entries per conceptual artifact and the entries are not
visibly aggregated. After two or three years the record contains
several dozen entries for what is conceptually a small number of
research lines, and the *structure of the research program* — three or
four lines, each with its own concept — is no longer visible in the
record. The record presents as a long, undifferentiated ledger of
version DOIs.

This dilution conflicts with the framework's authenticity layer
([Layer 1](../thesis.md)): the author's *genuine articulation* is at
the concept level (three or four research lines, each with its own
identity); a record that presents as a long ledger of version DOIs
obscures the articulation in favor of the more administrative
release-event-level identifier.

## Decision

The author's ORCID record (or equivalent persistent author identifier)
is maintained as follows:

1. The *Works* listing contains **concept DOIs only**, one per
   conceptual research line.
2. The archive-to-ORCID *Auto-Update* feature is **disabled**. New
   version DOIs are not automatically added.
3. The archive-to-ORCID *Link Works to ORCID* feature is **enabled**.
   This retains the author's ability to manually push a specific work to
   ORCID if needed (e.g., when a new conceptual research line is
   created and its concept DOI needs to be added).
4. When a new conceptual research line is added, the author manually
   pushes the new line's concept DOI to ORCID. The manual push is a
   per-line operation (not per-version), so its frequency matches the
   research program's structural cadence (zero to a few per year for
   most authors), not its release cadence (potentially several per
   year).
5. The author's biographical text on the persistent-identifier profile
   describes the research program at the concept level (e.g., "three
   research lines on ..."), with the count reflecting the number of
   concept DOIs in the Works listing. The biographical text does not
   list DOIs directly; the Works listing serves that purpose.

### Application discipline

The author's discipline for maintaining the persistent author record:

1. On adding a new research line, after the first deposit is published
   and the concept DOI is known, the author opens the citation-graph
   service's author-anchored Works view (e.g., DataCite Commons for an
   ORCID iD) and uses the *Add to ORCID Record* action on the new
   concept DOI's record page.
2. The biographical text on the ORCID profile is updated to reflect the
   incremented count of research lines.
3. The author verifies that Auto-Update remains disabled (the setting
   may be reset by service-side changes).

## Alternatives Considered

**Enable Auto-Update for convenience.** Rejected: the convenience saves
a per-line manual step at the cost of polluting the public record with
release-event-level identifiers that conflict with the framework's
authenticity layer. The manual step is infrequent (zero to a few per
year) and the cost-benefit favors authenticity preservation.

**Use a separate professional profile (a personal website, an
institutional page) as the canonical author record, and leave ORCID as
a secondary mirror.** Rejected: ORCID and equivalent persistent author
identifiers are increasingly the substrate that downstream citation
graphs, search engines, and institutional registries query. The
canonical author record needs to be where downstream services look,
not where the author would prefer them to look.

**Periodically clean up the ORCID record by removing version DOIs.**
Rejected: the cleanup is a recurring maintenance burden that scales
with the Auto-Update churn rate; preventing the churn at the source
(disabling Auto-Update) is structurally simpler.

## Consequences

**Positive.**

- The author's persistent-identifier record presents at the conceptual
  level appropriate to the research program's structure, rather than at
  the administrative level of individual release events.
- Downstream citation graphs and search engines that query the
  persistent identifier surface the research program's structure (a
  small number of clearly-distinguished lines) rather than a long
  undifferentiated ledger.
- The manual push step occurs only at conceptual-research-line
  cadence (rare), not at release cadence (frequent).

**Negative.**

- The author must remember to push new concept DOIs manually after
  each new conceptual research line is created. The frequency is low
  enough that the step is easy to forget; the framework documents the
  step in this ADR and in the per-line creation checklist.
- Version DOIs do not appear in the persistent-identifier record. Readers
  who want to cite a specific historical version must follow the concept
  DOI to its version listing rather than finding the version DOI in the
  Works record directly. This is consistent with the framework's
  treatment of version DOIs as reproducibility-citation exceptions
  rather than canonical identifiers.
- The author depends on the manual-push capability remaining available
  in the citation-graph service's user interface. If the service deprecates
  manual push in favor of Auto-Update-only, the discipline becomes harder
  to maintain.

## Lineage

Originating observation: in May 2026, the author enriched a personal
ORCID record (iD `0009-0002-6168-4162`) with three concept DOIs for
three sibling research lines, then deliberately set Auto-Update to OFF
in the corresponding citation-graph service's profile (DataCite
Profiles), retaining Link Works to ORCID in the enabled state. The
choice was documented at the time with the rationale that enabling
Auto-Update would, given the research program's release cadence,
inflate the ORCID record to several dozen entries within a year,
obscuring the three-line structure that the framework's authenticity
layer commits to presenting.

A secondary observation from the same operation: a hypothesis raised
during the work — that the citation-graph service's author search would
not surface concept DOIs at all (i.e., that the concept DOI's creator
metadata might not propagate from the archive to the citation-graph
service) — turned out to be incorrect. The archive service registers
creator metadata on both the concept DOI and each version DOI; the
citation-graph service's author search surfaces both. The discipline of
*adding concept DOIs only* is therefore an authorial choice, not a
technical workaround. The next author following the same workflow
should not be misled by the same false hypothesis.

The decision generalizes the corrective action into a standing
maintenance policy: the persistent author record is curated at the
conceptual level the research program operates at, and the administrative
churn of release-level identifiers is excluded from that record by
design.
