# Layer 4 Tactic Lifecycle — Onboard and Retire Dates

*Role: baseline data.* A dated record of when each Layer 4 tactic was
adopted in the author's ecosystem and, where it happened, when and why
it was retired or amended. It exists because the manifesto's
[Open Question 3](../manifesto.md#open-question-3-what-is-the-time-to-obsolescence-of-layer-4-tactics)
asks how fast Layer 4 tactics obsolesce and, at the time of asking, had
one observation to go on. This file is the observation set that question
now has. It is preliminary observation: a handful of dated events from a
single ecosystem, not a lifetime estimate.

The onboarding dates are the same version-control dates the
[implementation log](implementation-log.md) records; the retirement
rows add the retiring event and its cause. The log remains the record of
*what was done*; this file re-cuts it by tactic so that lifetime is
readable per row.

## Reading rules

- **A retirement cause is classified, not narrated.** Three classes are
  used: *substrate shift* (the platform or convention the tactic rode on
  changed under it), *host governance* (a third party revoked or
  sanctioned the surface), and *own measurement* (the ecosystem's own
  instrument returned nothing and the tactic was withdrawn). The classes
  are the ones the thesis anticipates ("tactics retire when their
  substrate retires") plus the two it did not.
- **Amended is not retired.** A tactic whose mechanism was rescoped but
  whose surface stayed live is recorded as *amended*, with the date, and
  counts as surviving.
- **No lifetime statistic is drawn.** With this few rows, a mean or a
  range would be a number without a distribution behind it. The
  [Limitations](#limitations) section says what a reader may and may not
  take from the table.

## Tactics with a retirement or amendment event

| Tactic | Onboarded | Retired / amended | Cause class | Elapsed | Recorded in |
|---|---|---|---|---|---|
| Self-created authority-record federation (author, repository, paper and citation-edge entries on a community-governed knowledge base) | 2026-06-07 | retired 2026-07-16 | host governance — account blocked as promotion-only, all self-created entries deleted | 39 days | [ADR-0021](../adr/0021-self-sovereign-entity-grounding.md); log, citation-graph section |
| Documentation-hub badge (third-party model-callable surface serving the repository's own machine-readable files) | 2026-06-28 | retired 2026-08-19 | own measurement — access counter returned zero on every repository and on the controls; no inbound referral | 52 days | [ADR-0020](../adr/0020-derivation-surface-onboarding.md) Status; log, derived-surfaces section |
| A third derived-surface badge, adopted before the surface's generation mechanism had been checked | 2026-06-28 | withdrawn 2026-06-28 | own measurement — the surface was found to generate on the host's request queue, not from the badge; badge-first was premature | same day | not separately logged; the withdrawal precedes the ADR-0020 onboarding record |
| Multilingual README mirrors (locale copies beyond English and Japanese) | not individually dated (before 2026-05-18) | retired 2026-05-18 | own measurement — no measurable direct human audience per mirror | not computable | [ADR-0005](../adr/0005-readme-localization-audience-driven.md) |
| Navigator-file / concept-graph pairing as co-equal ingest entry points | 2026-04-09 | amended 2026-05-30 (graph made the citation lever, navigator rescoped; both surfaces still live) | own measurement | 51 days to amendment | [ADR-0009](../adr/0009-dual-entry-asymmetric-rebalance.md) |
| One community-directory listing (link-index entry) | 2026-06 | withdrawn 2026-06, same day | own measurement — the author's host audit found the listing failed one of the four host conditions | same day | [ADR-0012](../adr/0012-link-index-channel-selection.md) Lineage |

## Tactics with no retirement event as of 2026-09-07

| Tactic | Onboarded | Substrate shifts survived | Recorded in |
|---|---|---|---|
| Concept-DOI registration on release | 2026-03-21 | the deposit-on-tag mechanism of the registry changed; the registry's 2026 generative-AI depositor policy is a pending shift (manifesto OQ10) | [ADR-0001](../adr/0001-concept-doi-canonical.md) |
| Deposit-metadata relation federation between sibling deposits | 2026-05-17 | — | [ADR-0002](../adr/0002-doi-federation-via-zenodo-json.md) |
| Cross-platform dataset mirroring | 2026-03-21 | dataset platform added automatic columnar conversion (a shift the tactic absorbed without change) | [ADR-0003](../adr/0003-cross-platform-dataset-federation.md) |
| Author-identifier record with concept-DOI enrichment | 2026-03-24 | — | [ADR-0004](../adr/0004-authorship-metadata-orcid.md) |
| AI-facing navigator files | 2026-04-09 | the convention entered wider use after adoption (a shift in the tactic's favor); rescoped 2026-05-30, see above | [ADR-0006](../adr/0006-llm-first-ingest-dual-entry-points.md) |
| Concept-level knowledge graph | 2026-05-15 | — | [ADR-0006](../adr/0006-llm-first-ingest-dual-entry-points.md), [ADR-0009](../adr/0009-dual-entry-asymmetric-rebalance.md) |
| Intrinsic content-derived identifier layer (software-archive snapshot IDs) | 2026-06-13 | — | [ADR-0013](../adr/0013-intrinsic-identifier-layer.md) |
| Community-directory listings that passed the host audit | 2026-06 | — | [ADR-0012](../adr/0012-link-index-channel-selection.md) |
| Two-channel probe protocol (measurement) | 2026-06-12 | pinned-model turnover forces a visible series break roughly every one to two months (recorded per break in the probe data, not a retirement) | [ADR-0011](../adr/0011-two-channel-probe-protocol.md) |
| Synthetic-wiki derived surface (type a of ADR-0020) | 2026-06-28 | — | [ADR-0020](../adr/0020-derivation-surface-onboarding.md) |
| Human-reader back-traceability edits on owned profile surfaces | 2026-06-21 | — | log, back-traceability section |
| Search-index surface (served concept-term pages, sitemap, engine notification) | 2026-07-02 | — | log, search-index section |
| Essay layer under the audience split | 2026-08-05 | — | [ADR-0022](../adr/0022-audience-layer-split.md) |

## What the rows are consistent with

Stated as preliminary observation, at the strength a few dated events
support:

- **The thesis's retirement model is incomplete.** The thesis anticipates
  one cause — the substrate retires. Of the six retirement or amendment
  events above, none was of that class. Five were the ecosystem's own
  measurement or audit finding the tactic wanting, one was a third
  party's governance acting on the account. Substrate shifts did occur (columnar
  conversion, the navigator convention's spread, the registry's
  mechanism change) and every tactic that met one survived it.
- **Retirements clustered early.** Every dated retirement event fell
  within about two months of the tactic's onboarding. Tactics that passed that
  span have no retirement event yet. Whether this is a property of the
  tactics or of the observation window (the ecosystem is under a year
  old, and the survivors are simply not old enough to have retired) is
  not decidable from this table.
- **The identifier layer has not retired.** The tactics the thesis
  suggests may be Layer-3-stable (OQ3's third bullet) — register a
  stable identifier on publication, and the metadata that federates
  it — are the oldest rows and carry the only survived substrate shifts.
  This is consistent with the promotion the question proposes; it is
  not evidence for it.

## Limitations

- **Single ecosystem, single author, under one year.** The general
  limitations in the [empirical README](README.md#limitations) apply.
- **Right-censoring.** The surviving rows have no retirement date
  because none has happened yet, not because they will not. Any
  lifetime read off this table is a lower bound on the survivors.
- **Selection by recording.** Only tactics that reached an ADR or the
  implementation log appear. Tactics tried and dropped before either
  record (an early same-day badge withdrawal is the one such case the
  author could reconstruct) are under-counted; the true early-retirement
  rate is therefore, if anything, higher than shown.
- **Cause classes are the author's.** A third party might read a
  "host governance" retirement as the author's own misjudgment of the
  host's norms — ADR-0021 records both readings; the table keeps the
  class that names the actor who ended the tactic.

## Maintenance

Add a row when a tactic is onboarded (the same event that adds a row to
the implementation log) and fill the retirement columns when a tactic is
retired or amended by ADR. Dates come from version control, as the
implementation log's method states. Do not add a lifetime estimate until
the retirement rows outnumber the survivor rows; until then the table
reports events.
