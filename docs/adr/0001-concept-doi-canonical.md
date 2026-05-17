Language: English | [日本語](0001-concept-doi-canonical.ja.md)

# ADR-0001: Concept DOI as Canonical Reference

> **Summary.** Every external link to a DOI-registered artifact uses the
> concept DOI — the identifier that resolves to the latest version — and
> never a version-specific DOI. Version-specific DOIs are used only for
> reproducibility citations of specific historical versions.

## Status
accepted

## Date
2026-05-18

## Context

A DOI registration service that supports versioned deposits issues, for each
artifact, two kinds of persistent identifier:

- A **concept DOI** (sometimes called *parent DOI*, *aggregate DOI*, or
  *latest-version DOI*) that resolves to the most recently published version
  of the artifact.
- A **version DOI** that resolves to one specific version of the artifact.

Both are persistent and citable. The two are typically issued as adjacent
integers when an artifact is first deposited — the concept DOI is assigned
first, the initial version DOI second. Users who interact with the artifact
via the user interface after publication often see the version DOI
prominently displayed (in the citation snippet for the just-published
version) and copy it as the canonical reference.

This produces a systematic failure mode. When the version DOI is used as
the canonical reference (in READMEs, citation files, badge URLs, knowledge
graphs, ORCID profiles, and downstream citation networks), the reference
freezes at the initial version. Subsequent releases mint new version DOIs,
which the downstream citation graph never sees, and the artifact's published
citation count remains pinned to the initial version even after the artifact
has been updated multiple times.

The failure is hard to notice from the author's side: every external link
*resolves correctly* (the version DOI is valid and points to a real
artifact). The problem is that the link resolves to the *wrong* artifact —
an out-of-date version rather than the current one. Downstream citation
ingestion pipelines (DataCite, OpenAlex, Scholix, Crossref) propagate the
version DOI through their networks and the citation graph develops a
time-frozen view of the work.

The author of this framework discovered the failure mode by inspecting
sixteen files across two sibling repositories where version DOIs had been
used as canonical references in error; the off-by-one between concept DOI
and initial version DOI made the original mistake easy to make.

## Decision

Every external link to a DOI-registered artifact uses the **concept DOI**.
Version DOIs are used only in two narrow contexts:

1. **Historical citations** — when a paper, README, or external artifact
   needs to cite *exactly the version current at the time of writing* for
   reproducibility, the version DOI is appropriate and the canonical-reference
   discipline does not apply.
2. **Changelog and history records** — `CHANGELOG.md` entries, archived
   release notes, and explicit historical archives may record version DOIs
   for their respective versions. These records must not be retroactively
   "corrected" to concept DOIs; doing so destroys the historical accuracy
   the records exist to preserve.

In all other contexts — including README badges, README prose, CITATION.cff
`doi` and `url` fields, `.zenodo.json` `related_identifiers`, knowledge graph
`sameAs` triples, ORCID *Works* entries, AI-facing reference files
(`llms.txt`, `llms-full.txt`), social media bios, and external blog mentions —
the concept DOI is the canonical reference.

### Concrete authorial discipline

The author's discipline for maintaining this decision:

1. After the first deposit completes, identify both DOIs from the deposit
   record. The concept DOI is labeled as the *cite-all-versions* DOI in
   most archive interfaces; the version DOI is labeled with the specific
   version number.
2. Record both DOIs in a private note alongside the deposit, with explicit
   labels, so subsequent confusion is avoided.
3. Use the concept DOI in every artifact that the next paragraph would
   normally inhabit.
4. Verify periodically with a search-tool query for the version DOI across
   the author's repositories: any occurrence outside the two narrow
   contexts above is a drift incident to be corrected.

## Alternatives Considered

**Use the version DOI throughout, and re-issue references on every release.**
Rejected: this generates churn proportional to release frequency and is
fragile (a single missed reference produces drift); the concept DOI exists
precisely to avoid this work.

**Use the version DOI for "stable" reference and the concept DOI for
"latest" reference, depending on the context.** Rejected: the boundary
between the two contexts is judgment-laden and varies across artifacts,
which produces inconsistent application; the concept DOI is the
right-by-default choice and the small set of exceptions (reproducibility
citations) is more easily managed as exceptions than as one half of a
contested rule.

**Use only the GitHub release URL or the canonical repository URL, avoiding
DOIs entirely.** Rejected: this gives up the priority claim DOIs are
designed to anchor and removes the artifact from the citation graphs
ingest pipelines populate. The framework's Layer 4 explicitly identifies
DOI registration as the substrate of the priority claim; a strategy that
discards DOIs cannot operate Layer 4.

## Consequences

**Positive.**

- Citation networks ingest the canonical reference, which always resolves to
  the latest version; downstream citation counts and version sprawl do not
  pin the artifact to a single historical version.
- The author's external surface is invariant under release cadence; the
  concept DOI is set once and does not need maintenance.
- Drift detection becomes a mechanical operation (search for the version DOI
  in places it should not appear).

**Negative.**

- The discipline must be applied immediately at deposit time; the off-by-one
  between concept DOI and initial version DOI makes the first-time mistake
  easy. The discipline tolerates the mistake at the first deposit (the
  recovery is mechanical) but compounds the cost the longer the mistake
  remains uncorrected.
- Reproducibility citations require an explicit override; readers who treat
  every DOI link as the canonical reference will not realize that some links
  are intentionally version-specific.

**Tradeoff acknowledged.**

The framework treats the *latest version* of an artifact as the canonical
target of citation. Authors who prefer historical precision (each version
cited at its publication time) should adapt the policy: in their context,
the version DOI may be the right canonical reference and the concept DOI is
the exception. The framework's preference reflects the LLM-mediated
diffusion context, where readers typically want the current articulation
rather than a historical snapshot.

## Lineage

Originating observation: in May 2026, the author audited two sibling
repositories' DOI references and found that initial version DOIs had been
used as canonical references in sixteen files, propagating into ORCID
records, citation files, knowledge graphs, and AI-facing reference files.
The drift had not been detected by either ingestion-side correctness checks
(every URL resolved) or external citation queries (the version DOI is
valid and was being cited correctly by downstream consumers, just citing
the wrong artifact). The recovery was mechanical: a search-tool query for
the version DOI located all sixteen occurrences for systematic correction.

The decision generalizes the corrective action into a standing policy:
canonical-reference shape is *always* concept DOI, the substrate of citation
graphs treats it as such, and version DOIs are reserved for historical
contexts where they are unambiguously appropriate.
