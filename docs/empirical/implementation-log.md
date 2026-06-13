# Implementation Log — Diffusion-Channel Interventions

> This file is part of the empirical layer. It records *which* of the
> framework's tactics were deployed on the author's own ecosystem and
> *when* — not whether they worked. All dates are interventions, not
> outcomes.

## Why this log exists

The empirical layer's largest stated limitation is that it offers **no
pre-versus-post intervention comparison**: several tactics were already
in place when traffic collection began, so the traffic baseline observes
a steady state rather than a contrast (see
[`README.md`](README.md) → *No pre-versus-post intervention comparison*).
A contrast requires knowing the date each channel was opened. This log
records those dates so that a future release — or an adopting author
running the same tactics — can align an observed change in traffic or
in probe results against the intervention that may have preceded it.

The log is therefore a **methods companion** to the traffic baseline and
the [two-channel probe protocol](../adr/0011-two-channel-probe-protocol.md),
not an independent results claim. It makes no statement of the form
"intervention X changed metric Y." It records only that X was done, and
when.

## Intervention timeline

Interventions are grouped by the layer of the framework they
operationalize. "Pre-baseline" means the intervention was already in
place before the v0.1.0 traffic window opened (2026-04-21); precise
deployment dates for those predate systematic logging and are recorded
only as *pre-baseline*.

### Identifier federation (ADRs 0001–0004, 0013)

| Intervention | Date | Recorded in |
|---|---|---|
| Concept-DOI registration across the ecosystem's research lines, papers, and datasets | pre-baseline → ongoing per release | ADR-0001, CITATION.cff |
| `.zenodo.json` `relatedIdentifiers` federation between sibling deposits | pre-baseline → ongoing | ADR-0002 |
| Cross-platform dataset mirroring (Git host + DOI archive + dataset platform) | pre-baseline | ADR-0003 |
| ORCID record, auto-update disabled, concept-DOI enrichment only | pre-baseline | ADR-0004 |
| Software Heritage archival of all public repositories; SWHID recorded as the intrinsic identifier layer | 2026-06-13 | ADR-0013 |

### AI-facing ingest (ADRs 0006, 0009)

| Intervention | Date | Recorded in |
|---|---|---|
| `llms.txt` / `llms-full.txt` navigator pair on every governed repository | pre-baseline | ADR-0006 |
| `graph.jsonld` concept-level knowledge graph alongside the navigator | pre-baseline | ADR-0006, ADR-0009 |
| Dual-entry rebalance (graph as the citation lever; navigator rescoped) | pre-baseline | ADR-0009 |
| Cross-platform dataset-mirror of the graph for training-pipeline ingest | pre-baseline | ADR-0003 |

### Citation graph and scholarly surface (ADRs 0002, 0008)

| Intervention | Date | Recorded in |
|---|---|---|
| Wikidata items for the author, repositories, and papers | 2026-06-07 | — |
| Wikidata `cites work` (P2860) edges from papers and repositories to their cited sources | 2026-06-12 | citation-graph federation tactic |
| Wikidata `Software Heritage ID` (P6138) on archived repository items | 2026-06-13 (partial — repositories still archiving are pending) | ADR-0013 |
| Preprint cross-posting of the papers to a scholarly preprint server | 2026 (not individually dated) | — |
| Author-profile disambiguation request on a bibliographic-graph service | 2026-06 (pending) | — |
| Inclusion of all ecosystem records in an author-curated archive community | 2026-06-13 | — |

### External collections (ADR-0012)

| Intervention | Date | Recorded in |
|---|---|---|
| Listings in community-curated directories, link-index entries only, four-condition host audit | 2026-06 | ADR-0012 |
| One listing withdrawn the same day after the host audit | 2026-06 | ADR-0012 (Lineage) |

The specific hosts, and the reasoning behind the withdrawal, are held at
the abstraction level ADR-0012 sets; this log does not re-expose them.

### Measurement (ADR-0011)

| Intervention | Date | Recorded in |
|---|---|---|
| First run of the two-channel probe protocol (parametric zero baseline, negative-control floor, first retrieval observations) | 2026-06-12 | ADR-0011, probe-baseline-2026-06.md |

## Not yet done

Recorded here so the log is a complete picture rather than a list of
successes only.

- **Additional-language ingest surfaces beyond English and Japanese.** A
  measurement asymmetry is open: one of the probe protocol's frontier
  models is from a language region whose ingest surface is not yet
  served. Deferred, not rejected.
- **Endorsed-preprint-server deposit.** Deferred until citation traces
  appear through the scholarly surfaces already in place; the endorsement
  path is approached conventionally rather than through paid or bulk
  channels.

## Explicitly out of scope

- **Self-citation in open encyclopedias** — declined as a
  conflict-of-interest norm violation.
- **Attention-driven social-platform posting** — declined as targeting a
  non-primary audience and as inconsistent with the metric-rejection
  decision (ADR-0007).

## A note on recursion

Publishing a log of one's own diffusion interventions, under a framework
whose own tactics include transparency and machine-readable openness, is
a recursive application of the framework to itself. The framework's
manifesto raises this directly as an open question (Open Question 5:
*where is the line between the framework and authorship-strategy-as-rhetoric?*).
This log does not resolve that question. It records actions and their
dates, frames nothing as an outcome, and is offered as a methods artifact
for the empirical layer — with the recursion stated rather than hidden.
