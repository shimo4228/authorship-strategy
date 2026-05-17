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
