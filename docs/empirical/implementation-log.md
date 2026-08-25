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
| Reciprocal-declaration completion of the deposit-metadata relation graph, following a standards review that chose completing the existing relation layer over adopting any new standard: inverse relations declared where only one side of a pair had been present, and a deposit-to-repository binding relation pointing at each artifact's own source repository added ecosystem-wide; applied to the published deposit records by metadata-only edit, without minting new versions | 2026-08-25 | ADR-0002 (dated note) |

### AI-facing ingest (ADRs 0006, 0009)

| Intervention | Date | Recorded in |
|---|---|---|
| `llms.txt` / `llms-full.txt` navigator pair on every governed repository | first deployed 2026-04-09 (agent-knowledge-cycle and contemplative-agent, `llms.txt`; `llms-full.txt` followed 2026-04-19); rolled out through 2026-06-05 | ADR-0006 |
| `graph.jsonld` concept-level knowledge graph alongside the navigator | first deployed 2026-05-15 (agent-knowledge-cycle, contemplative-agent, agent-attribution-practice, and the hub together); rolled out through 2026-06-05 | ADR-0006, ADR-0009 |
| Dual-entry rebalance (graph as the citation lever; navigator rescoped) | 2026-05-30 (ADR-0009 authored, amending the ADR-0006 pairing on 2026 measurement) | ADR-0009 |
| Cross-platform dataset-mirror of the graph for training-pipeline ingest | follows the graph deployment, 2026-05-15 onward (see the dataset-mirroring row above) | ADR-0003 |
| Simplified-Chinese machine-readable anchor on the concept graph (language-tagged concept labels plus a glossary term mapping; prose surfaces remain English/Japanese only) | 2026-06-13 | multilingual tactic, machine-readable layer |
| The ecosystem hub's full concept graph mirrored into a `<script type="application/ld+json">` block on the hub's traffic dashboard — an already-indexed served page — closing the gap between the graph existing as a repository file and the graph being embedded in markup a crawler actually renders | 2026-07-01 | ADR-0006, ADR-0009 |
| A sibling research line's served viewer page — a client-rendered concept-graph viewer whose delivered markup carries no content — extended to inject that line's canonical concept graph into the served page's head as structured data at build time; a second instance of closing the same repository-file-versus-rendered-markup gap | 2026-07-01 | ADR-0006, ADR-0009; manifesto OQ8 |

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
| Wikidata layer revoked by host governance: the account was blocked indefinitely as a promotion-only account and all self-created entries (author, repositories, papers, cited-work records, and the citation edges among them — 109 entries) were mass-deleted by the platform. Recorded as an external event terminating the Wikidata interventions above | 2026-07-16 | ADR-0021; manifesto open question 9 |
| Self-created authority-record federation retired as a tactic; all dead Wikidata identifiers purged from the ecosystem's machine-readable carriers (knowledge graphs, structured metadata, served mirrors), with dated historical records left unmodified | 2026-07-16 | ADR-0021 |
| A pure apology — explicitly framed as not an unblock request — posted to the account's own talk page | 2026-07-16 | — |

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
metric-rejection decision (ADR-0007). As of 2026-08 that decision's
scope is bounded to the doctrine layer (ADR-0022); the interventions
above remain pull-only as recorded.

| Intervention | Date | Recorded in |
|---|---|---|
| Human-readable ecosystem-hub back-links added to the research-line repository READMEs (English and Japanese), surfacing the hub to readers where it had been reachable only as a machine file or omitted | 2026-06-21 | manifesto OQ8 |
| `noscript` fallback exposing hub and sibling links on a JavaScript-only viewer (previously visible to non-rendering crawlers as a title only) | 2026-06-21 | manifesto OQ8 |
| Author-profile surfaces on developer-publishing and newsletter platforms edited to route readers back to the hub and ORCID, and the cross-surface author handle and display name unified to a single canonical form (complementing the 2026-06-15 machine-layer `sameAs` federation) | 2026-06-25 | citation-graph federation / entity tactic; manifesto OQ8–9 |
| Essay-corpus repository de-islanded: ecosystem-hub, author-identifier, and sibling-line back-links added at the repository surface — the human-facing READMEs (English and Japanese), the AI-facing navigator, and the citation metadata — routing a reader or non-rendering crawler from the bilingual essay corpus back to the ecosystem | 2026-06-25 | ADR-0016; manifesto OQ8 |
| Essay-corpus repository's source-hosting metadata surface edited to route discovery back to the ecosystem: the repository description rewritten to the governed-corpus framing, the website link pointed at the ecosystem hub, and the discovery topics expanded so a reader arriving through host search or topic browse reaches the hub | 2026-06-25 | manifesto OQ8 |
| A single coined term naming the vertical axis that runs through the whole ecosystem, together with a one-sentence author statement, raised in step across the ecosystem hub and the author's identity surfaces — the hub READMEs in both languages, the hub's AI-facing navigator, a hub-defined concept node in the hub's knowledge graph, and the author's source-host profile and persistent-researcher-identifier profile. This is a naming and identity unification, not the opening of a new channel | 2026-07-03–04 | entity federation tactic; manifesto OQ9 |

### Search-index surface (defensive query routing; ADR-0007 diagnostics-not-targets)

These interventions address the classical search-index layer that
AI-search grounding draws on. Their aim is defensive rather than
acquisitive: when a coined term or the author's name is queried — by a
human who heard the term through an LLM, or by a retrieval system
grounding an answer — the canonical source should be what resolves.
Search-console instrumentation is used as a diagnostic, never as a
target, per the metric-rejection decision (ADR-0007).

| Intervention | Date | Recorded in |
|---|---|---|
| Concept-term definition pages: one page per coined or distinctively used research term (twenty-one pages plus an index) published on the ecosystem hub's served-page surface, each carrying the bilingual definition, an origin statement, term and FAQ structured data, and links back to the canonical repository, glossary entry, and concept DOI. Origin statements follow the falsifiability discipline — adopted terms are marked adopted, and terms whose origin claim was waived say so | 2026-07-02 | ADR-0010; ADR-0018 |
| The hub's served-page root converted from an unindexed redirect into an entity landing page carrying person-entity structured data, with the cross-platform `sameAs` federation extended to the author's video channel | 2026-07-02 | entity federation tactic; manifesto OQ9 |
| Sitemap published for the hub's served pages; site ownership verified on a major search console and the sitemap submitted; a cross-engine URL-notification protocol key deployed and all served URLs submitted through it | 2026-07-02 | ADR-0007 (diagnostics, not targets) |
| Cross-language canonical correction on the developer-publishing platform: twenty-seven English translations that had been canonicalized to their Japanese originals made self-canonical, so each language surface indexes independently | 2026-07-02 | — |
| Source-hosting metadata aligned across eight ecosystem repositories: descriptions rewritten to carry the coined line names in full, discovery topics added where absent, and homepage links set — extending the 2026-06-25 essay-corpus de-islanding to the whole ecosystem | 2026-07-02 | upstream-anchoring follow-up to the synthetic-wiki drift observation (ADR-0020 Lineage) |

### Third-party AI-derived repository surfaces (ADR-0020)

A further class of surface is *derived* from a repository by a third
party rather than published by the author: a **synthetic wiki** that
paraphrases the repository behind a conversational query interface, and
a **documentation hub** that serves the repository's own
machine-readable files verbatim through a model-callable interface.
Onboarding to both types, and the per-type discipline that governs them,
is recorded in ADR-0020. The second row records that one of the two
types was later withdrawn from this ecosystem; as everywhere in this
log, it is a record of an action and its date, not a claim about what
the surface is worth to anyone else.

| Intervention | Date | Recorded in |
|---|---|---|
| Badges for both derived-surface types adopted together on the front page of every idea-bearing repository in the ecosystem, blessing the derived views rather than gating them: the synthetic wiki's index build started by a manual per-repository submission, the documentation hub requiring no configuration | 2026-06-28 | ADR-0020 |
| Documentation-hub badge withdrawn from every repository. The access counter adopted alongside it as a measurement signal returned zero on every repository and on the controls checked (the service's own repository, and large open-source projects), no inbound referral from the surface appeared in the host's referrer data, and repeated probes a month apart found the surface's semantic-search layer not operating. The synthetic-wiki badge stands | 2026-08-19 | ADR-0020 (documentation-hub type retired by measurement; see its Status note) |

### AI-native preprint platforms (agent-reviewed, agent-readable submission surfaces)

These interventions place already-deposited work into a new class of
venue: preprint platforms whose review pipeline and readership include
AI agents alongside humans, rather than the human-gated venues (a DOI
registry, a working-paper network) the identifier-federation tactic
already covers. The canonical identifier is left untouched — these
platforms do not mint their own persistent identifier — so the placement
is additive, not a new canonical location.

| Intervention | Date | Recorded in |
|---|---|---|
| Three companion-line position papers submitted, in parallel, to two AI-native preprint platforms whose reviewer and reader base includes AI agents alongside humans — a university-affiliated venue reachable through an agent-callable submission interface, and a broader AI-scientist-community venue reachable through a self-service agent-registration API — bringing the canonical concept identifiers into a corpus an AI reviewer or an agent-driven literature search reads directly | 2026-07-02 | — |
| Author-profile fields on the university-affiliated venue populated with the ecosystem-line summary and the author's persistent identifiers, extending the human-reader back-traceability tactic to a platform whose primary readership is AI agents rather than humans | 2026-07-02 | Human-reader back-traceability tactic; manifesto OQ8 |

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
- **Attention-driven social-platform posting** — declined, for the
  doctrine layer, as targeting a non-primary audience and as
  inconsistent with the metric-rejection decision (ADR-0007). Scope
  note (2026-08): under the audience-layer split (ADR-0022), publishing
  original essays to the essay layer's own contemporary human readers
  is content production accounted in its own layer, not the
  doctrine-promotion posting this exclusion declines.

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
