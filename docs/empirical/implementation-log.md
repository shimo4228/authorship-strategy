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
operationalize. Dates are exact author-dates recovered from each
repository's version control by scanning its git history for the first
commit that added the relevant artifact; where a tactic rolled out
across several repositories, the cell gives the first deployment and the
rollout span. An intervention dated before **2026-04-21** predates the
v0.1.0 traffic window, so the traffic baseline observes it only in
steady state; an intervention dated on or after that day is a candidate
for a future pre-versus-post contrast.

### Identifier federation (ADRs 0001–0004, 0013)

| Intervention | Date | Recorded in |
|---|---|---|
| Concept-DOI registration across the ecosystem's research lines, papers, and datasets | first release tag 2026-03-21 (contemplative-agent v0.2.0); rolled out per repository through 2026-06-05, ongoing per release; the hub carries no release tag by design | ADR-0001, CITATION.cff |
| `.zenodo.json` `relatedIdentifiers` federation between sibling deposits | first deployed 2026-05-17 (agent-knowledge-cycle, contemplative-agent, agent-attribution-practice together); rolled out through 2026-06-05; the hub carries no `.zenodo.json` by design | ADR-0002 |
| Cross-platform dataset mirroring (Git host + DOI archive + dataset platform) | first dataset-platform reference 2026-03-21 (contemplative-agent); rolled out through 2026-06-05 | ADR-0003 |
| ORCID record, auto-update disabled, concept-DOI enrichment only | first deployed 2026-03-24 (agent-knowledge-cycle and contemplative-agent, with CITATION.cff); rolled out through 2026-06-10 (hub) | ADR-0004 |
| Software Heritage archival of all public repositories; SWHID recorded as the intrinsic identifier layer | 2026-06-13 | ADR-0013 |
| Essay corpus brought under identifier governance: a Software Heritage snapshot recorded in citation metadata as its intrinsic-identifier priority claim — the substitute priority-claim mechanism for an artifact genre where DOI registration is impractical — and the corpus relicensed to a public-domain dedication for its machine-mined audience | 2026-06-25 | ADR-0016, ADR-0013, ADR-0015 |
| `codemeta.json` (schema.org-based software/dataset citation metadata) added alongside `CITATION.cff` across the ecosystem's DOI-registered repositories, read directly by the Software Heritage archival service's metadata indexer, which does not parse `CITATION.cff` | 2026-07-01 | ADR-0013 |
| Rendered-HTML archival of the ecosystem's git-hosting pages via an on-demand public web archive, complementing the git-object-level Software Heritage archival with a snapshot of the page a browser or crawler actually renders | 2026-07-01 | ADR-0013 |

### AI-facing ingest (ADRs 0006, 0009)

| Intervention | Date | Recorded in |
|---|---|---|
| `llms.txt` / `llms-full.txt` navigator pair on every governed repository | first deployed 2026-04-09 (agent-knowledge-cycle and contemplative-agent, `llms.txt`; `llms-full.txt` followed 2026-04-19); rolled out through 2026-06-05 | ADR-0006 |
| `graph.jsonld` concept-level knowledge graph alongside the navigator | first deployed 2026-05-15 (agent-knowledge-cycle, contemplative-agent, agent-attribution-practice, and the hub together); rolled out through 2026-06-05 | ADR-0006, ADR-0009 |
| Dual-entry rebalance (graph as the citation lever; navigator rescoped) | 2026-05-30 (ADR-0009 authored, amending the ADR-0006 pairing on 2026 measurement) | ADR-0009 |
| Cross-platform dataset-mirror of the graph for training-pipeline ingest | follows the graph deployment, 2026-05-15 onward (see the dataset-mirroring row above) | ADR-0003 |
| Simplified-Chinese machine-readable anchor on the concept graph (language-tagged concept labels plus a glossary term mapping; prose surfaces remain English/Japanese only) | 2026-06-13 | multilingual tactic, machine-readable layer |
| The ecosystem hub's full concept graph mirrored into a `<script type="application/ld+json">` block on the hub's traffic dashboard — an already-indexed served page — closing the gap between the graph existing as a repository file and the graph being embedded in markup a crawler actually renders | 2026-07-01 | ADR-0006, ADR-0009 |

### Citation graph and scholarly surface (ADRs 0002, 0008)

| Intervention | Date | Recorded in |
|---|---|---|
| Wikidata items for the author, repositories, and papers | 2026-06-07 | — |
| Wikidata `cites work` (P2860) edges from papers and repositories to their cited sources | 2026-06-12 | citation-graph federation tactic |
| Wikidata `Software Heritage ID` (P6138) on software-typed repository items | 2026-06-13 (dataset and scholarly-article items carry the SWHID in their own `CITATION.cff` instead, the property being software-typed) | ADR-0013 |
| Preprint cross-posting of the papers to a scholarly preprint server | 2026 (not individually dated) | — |
| Author-profile disambiguation request on a bibliographic-graph service | 2026-06 (pending) | — |
| Inclusion of all ecosystem records in an author-curated archive community | 2026-06-13 | — |
| Author-entity `sameAs` federation deepened to self-controllable external profile surfaces (academic citation graph, model hub, professional network, developer-publishing, newsletter) | 2026-06-15 | citation-graph federation tactic; manifesto open question 9 |

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

### Human-reader back-traceability (manifesto Open Questions 8–9; ADR-0007 pull-not-push)

These interventions address the *supply side* of the gap between reach and
recognition: they do not open a new channel but make an already-reachable
surface route a human reader — or a non-rendering crawler — back to the
ecosystem hub and the author's persistent identity. They are pull-only —
no outreach, posting, or notification — consistent with the
metric-rejection decision (ADR-0007).

| Intervention | Date | Recorded in |
|---|---|---|
| Human-readable ecosystem-hub back-links added to the research-line repository READMEs (English and Japanese), surfacing the hub to readers where it had been reachable only as a machine file or omitted | 2026-06-21 | manifesto OQ8 |
| `noscript` fallback exposing hub and sibling links on a JavaScript-only viewer (previously visible to non-rendering crawlers as a title only) | 2026-06-21 | manifesto OQ8 |
| Author-profile surfaces on developer-publishing and newsletter platforms edited to route readers back to the hub and ORCID, and the cross-surface author handle and display name unified to a single canonical form (complementing the 2026-06-15 machine-layer `sameAs` federation) | 2026-06-25 | citation-graph federation / entity tactic; manifesto OQ8–9 |
| Essay-corpus repository de-islanded: ecosystem-hub, author-identifier, and sibling-line back-links added at the repository surface — the human-facing READMEs (English and Japanese), the AI-facing navigator, and the citation metadata — routing a reader or non-rendering crawler from the bilingual essay corpus back to the ecosystem | 2026-06-25 | ADR-0016; manifesto OQ8 |
| Essay-corpus repository's source-hosting metadata surface edited to route discovery back to the ecosystem: the repository description rewritten to the governed-corpus framing, the website link pointed at the ecosystem hub, and the discovery topics expanded so a reader arriving through host search or topic browse reaches the hub | 2026-06-25 | manifesto OQ8 |

## What the deployment order shows

The version-control dates carry a pattern worth recording, because the
framework claims its tactics were *extracted from operating the
ecosystem* rather than designed top-down. The two oldest agent-design
lines carry the earliest deployment of nearly every tactic:
contemplative-agent (initialized 2026-03-08) holds the first release tag
and the first dataset-platform mirror (both 2026-03-21) and — tied with
agent-knowledge-cycle (initialized 2026-03-24) — the first
`CITATION.cff` / ORCID record (2026-03-24) and the first navigator pair
(2026-04-09). The later repositories inherit a fully-formed artifact set
deployed in a single initial commit: authorship-strategy, doctrine-corpus,
and existence-proof each ship `llms.txt`, `graph.jsonld`, `.zenodo.json`,
and `CITATION.cff` together on day one. The compression — from a rollout
staggered over weeks in the pioneer line to a same-day rollout in the
later ones — is the discipline hardening into a template.

Two caveats keep this from reading as a clean design narrative. README
localization is dated earliest of all (2026-02-14), but that instance is
the federation hub, where a Japanese README existed from day one as a
default rather than as a deliberate diffusion tactic. And the hub is the
one repository with no `.zenodo.json` and the last `CITATION.cff`
(2026-06-10) — a structural outlier rather than a pioneer despite being
the oldest repository. As with every entry here, this is an observation
about deployment order, not a claim about effect.

## Not yet done

Recorded here so the log is a complete picture rather than a list of
successes only.

- **Prose ingest surfaces beyond English and Japanese.** A measurement
  asymmetry is open: one of the probe protocol's frontier models is from a
  language region whose prose ingest surface is not yet served. A
  machine-readable-layer Simplified-Chinese anchor was deployed
  2026-06-13 (see *AI-facing ingest* above) as the low-cost, measurable
  slice; full prose localization (README, ADRs) remains deferred, not
  rejected.
- **Endorsed-preprint-server deposit.** Deferred until citation traces
  appear through the scholarly surfaces already in place; the endorsement
  path is approached conventionally rather than through paid or bulk
  channels.
- **A national research-community profile registry.** Application
  pending; once active it would add a human-reader registry surface in a
  language region the ecosystem already writes in, routed back to the hub
  and ORCID.

## Explicitly out of scope

- **Self-citation in open encyclopedias** — declined as a
  conflict-of-interest norm violation.
- **Attention-driven social-platform posting** — declined as targeting a
  non-primary audience and as inconsistent with the metric-rejection
  decision (ADR-0007).

## How this log is maintained

This log is a maintained projection, not a one-time snapshot. As a new
diffusion intervention is deployed it is appended here with its date; the
entries are curated to *dated interventions* and deliberately exclude the
program's operational working detail (ranked next-step proposals,
pending-request state, the host-level reasoning ADR-0012 abstracts away).
That working detail lives in a separate private ledger; this file is the
public, effect-claim-free face of it. The separation keeps this record in
its empirical-layer role — an intervention timeline, not a planning
scratchpad — while still growing as the program acts. The decision to
maintain the two layers this way is recorded in ADR-0014.

## A note on recursion

Publishing a log of one's own diffusion interventions, under a framework
whose own tactics include transparency and machine-readable openness, is
a recursive application of the framework to itself. The framework's
manifesto raises this directly as an open question (Open Question 5:
*where is the line between the framework and authorship-strategy-as-rhetoric?*).
This log does not resolve that question. It records actions and their
dates, frames nothing as an outcome, and is offered as a methods artifact
for the empirical layer — with the recursion stated rather than hidden.
