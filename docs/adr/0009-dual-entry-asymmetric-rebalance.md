Language: English | [日本語](0009-dual-entry-asymmetric-rebalance.ja.md)

# ADR-0009: Dual Entry Points Are Asymmetric — Structured Graph Carries Entity Resolution, Prose Navigator Carries Agent Context

> **Summary.** ADR-0006 deployed the prose-form navigator and the
> concept-form structured graph as a *co-equal* complementary pair, each
> serving a distinct LLM-mediated reader sub-population. 2026 empirics
> break the symmetry — but not where this ADR first located the break.
> The prose navigator has near-zero effect on AI-search citation
> (adoption around one in ten surveyed domains, ~0.1% of agent crawls
> request it, citation counts indistinguishable with and without it). The structured graph, on
> the 2026 controlled evidence, does **not** deliver a near-term citation
> lift either: matched-control studies of pages already inside an AI
> answer system's consideration set find no uplift from adding structured
> markup, and the major search operator's own guidance says no special
> markup is required. What those studies cannot measure — and what the
> structured graph is retained for — is the layer *before* citation:
> whether an artifact, its concepts and its author enter the set of things
> an AI answer system crawls, indexes and resolves as entities at all.
> This ADR amends ADR-0006: the two entry points are retained, but their
> roles are **asymmetric** — the structured graph is the registration
> surface for consideration-set entry and entity resolution (the
> retrieval-channel surface of ADR-0008, with no citation-lift expectation
> attached), and the prose navigator is reframed as a Business-to-Agent
> (B2A) context surface (agent navigation, token-efficient context
> retrieval), not an AI-search citation lever.

## Status
accepted — revised 2026-08-19: the success criterion applied to the
structured graph moved from *retrieval-time citation lift* to
*consideration-set entry / entity resolution*; the effort allocation in
the Decision is unchanged and only its stated reason is corrected; two
figures the original Lineage carried that did not resolve to a primary
source were removed (see Lineage). The Date below remains the decision
date.

## Date
2026-05-30

## Context

[ADR-0006](0006-llm-first-ingest-dual-entry-points.md) deployed two
structured entry points "in parallel, each canonical-maintained" — a
prose-form navigator for prose-reading channels and a concept-form
structured graph for structured-data-ingesting channels — and treated
them as **complementary, not redundant**: the navigator answers *what is
here*, the graph answers *how these things relate*. The framing was
symmetric: two co-equal surfaces, each indispensable to its
sub-population, drift between them a release-blocking defect.

The 2026 empirical record breaks the symmetry. Re-read on 2026-08-19,
it also corrects where this ADR first located the structured graph's
effect; the second and third bullets below are that re-reading, and the
sources they rest on are dated in *Lineage*. The dimension that
matters for Layer 2 (Attribution Diffusion) is whether an artifact
reaches an AI answer system's consideration set and is resolved there as
an entity; retrieval-time citation is an outcome downstream of that, not
the place where the structured graph acts.

- **The prose navigator does not move AI-search citation.** Large-scale
  measurement converges: adoption sits around one in ten surveyed
  domains; of the most-cited domains in AI answers, almost
  none ship one; across tens of thousands of bot visits the navigator
  file is requested on the order of 0.1% of the time; and a
  matched-domain comparison finds citation counts statistically
  indistinguishable with and without it. A major search vendor has
  publicly declined to support the convention. On the citation axis its
  effect is noise.

- **The structured graph does not deliver a near-term citation lift
  either — and the original version of this ADR said it did**
  (2026-08-19 revision). As first
  written, this bullet asserted that pages carrying valid structured data
  are included in AI answer surfaces at materially higher rates and that
  models extract facts from structured fields far more accurately than
  from prose. On re-verification the two figures behind those sentences
  did not resolve to any primary source, and the sentences are withdrawn.
  What the primary record shows instead: a matched-control
  difference-in-differences study of pages that added structured markup
  finds citation changes statistically indistinguishable from zero on two
  AI answer surfaces and a small, unexplained decline on a third; a
  cross-platform study finds markup *presence* does not predict citation
  once organic ranking is controlled; a retrieval-pipeline study finds
  markup alone yields only modest gains; the major search operator's
  published guidance states that structured data is not required for
  generative AI search and that no special markup need be added; and a
  2026 survey of the field finds no reviewed technique with a stable,
  longitudinal, cross-platform causal effect on discoverability.
  Cross-sectionally, AI-cited pages are far more likely to carry
  structured markup than uncited pages — a correlation the same study
  explicitly declines to read as cause.

- **What the controlled evidence cannot reach is the layer the graph is
  kept for** (2026-08-19 revision). The matched-control study's population is pages already
  cited heavily by AI systems — already inside the consideration set,
  already crawled and surfaced — and its authors state that it cannot
  speak to whether markup helps pages AI systems are not seeing at all
  get crawled, parsed or indexed in the first place. Whether a new author
  entity or a newly coined concept becomes machine-resolvable in a
  knowledge graph for the first time is a different function, operating
  at index time rather than query time, on a different measurement
  window. For this program's artifacts — a first-time author entity,
  concepts with no prior external record — that is the relevant question,
  and the structured graph is the surface on which it is asked. It is a
  registration surface and an access floor (statically served, readable
  by agents that execute no page scripts), not a citation lever.

- **But the prose navigator retains genuine value in a different
  context.** Where an agent fetches context on a user's behalf or selects
  a tool — the Business-to-Agent (B2A) execution context — a
  token-efficient prose digest is a useful navigation entry point. That
  value is real but forward-looking, tied to agent-ecosystem maturity
  rather than to today's citation counts.

So ADR-0006's "co-equal pair" is wrong on the citation axis in both
directions — neither surface is a near-term citation lever — and
incomplete on the context axis. The pair should persist; the *equal
weighting* should not, because the two surfaces do different jobs: one
registers the artifact and its entities where AI systems build their
consideration set, the other serves agents that already know the
artifact.

## Decision

Amend ADR-0006: the dual entry points are retained but **asymmetric in
role**.

1. **The structured graph is the primary entry point for
   consideration-set entry and entity resolution.** It is the surface on
   which the artifact, its concepts and its author entity are registered
   for AI answer systems' crawling, indexing and entity resolution — the
   retrieval-channel surface named in
   [ADR-0008](0008-rag-era-attribution-diffusion.md) — and the program's
   access floor for agents that read only statically served structure.
   Maintenance and freshness effort is allocated here first. No near-term
   citation lift is expected from it, and none is claimed: the asymmetry
   rests on the prose navigator's measured null on the citation axis and
   on the structured graph's registration role, not on any citation
   efficacy of the graph. (Revised 2026-08-19; the original text named
   retrieval-time citation as the criterion.)

2. **The prose navigator is retained but reframed as a B2A context
   surface.** It is no longer maintained as an AI-search citation lever;
   its job is agent navigation and token-efficient context retrieval in
   the agent-execution context. It remains canonical-maintained and
   synchronized with the graph (ADR-0006's drift-is-a-defect discipline
   still binds whatever ships), but it is not optimized for, or measured
   against, citation outcomes.

3. **The synchronization discipline of ADR-0006 survives unchanged.**
   Whatever both surfaces assert must stay mutually consistent. What
   changes is only the *weighting of effort and the success criterion
   applied to each*, not the requirement that they not contradict.

The decision is **harness-neutral**: it names neither the specific prose
convention, the specific linked-data vocabulary, nor the vendors and
studies behind the empirics. Those appear in *Lineage*.

## Alternatives Considered

**Keep the co-equal framing (ADR-0006 unchanged).** Rejected: it is
contradicted by direct measurement on the citation axis for the prose
navigator, and it allocates equal synchronization and freshness effort to
two surfaces that do different jobs — one registers the artifact where AI
systems build their consideration set, the other serves agents that
already know it.

**Drop the prose navigator entirely.** Tempting given its citation
effect is noise. Rejected: it retains genuine, distinct value in the B2A
execution context, where a token-efficient digest is a useful agent
navigation surface. Removing it forfeits that channel — a channel the
program will meet *more*, not less, as the agent ecosystem matures. The
right move is to rescope it, not delete it.

**Retain the prose navigator but stop maintaining it.** Rejected: an
unmaintained navigator drifts from the graph, and ADR-0006 classes drift
as a release-blocking defect. A surface that is kept must stay
synchronized; "retain but neglect" is not an available state.

**Keep the original criterion — the structured graph as the retrieval-time
citation lever (this ADR as first written).** Rejected on re-verification
(2026-08-19): the two figures that carried the claim did not resolve to a
primary source, and the controlled 2026 evidence runs the other way. An
effort allocation justified by a claim the record does not support is
not an honest allocation, even when the allocation itself is right.

**Retract the structured-graph efficacy claim and rest the asymmetry on
the prose navigator's null alone.** Rejected: that leaves the graph's
first-priority effort without a stated positive reason. The
registration / entity-resolution role is what the effort is *for*, and it
is precisely the layer the controlled studies declare out of their
scope — stating it is more honest than leaving the allocation
unexplained.

**Supersede this ADR with a new one recording that neither entry point
is a near-term citation lever.** Rejected: the decision — retain both
surfaces, allocate effort asymmetrically, keep the synchronization
discipline — is unchanged. Only the success criterion and the stated
reason move. A dated revision in place keeps one decision's history
legible in one file; a supersession would split it across two for a
change of reason rather than a change of decision.

## Consequences

**Positive.**

- Maintenance and freshness effort is concentrated on the structured
  graph, which is the registration surface of ADR-0008's retrieval
  channel — the two ADRs point the same way.
- The program's stance becomes legible: the structured graph is *for
  being found and resolved* (consideration-set entry, entity
  resolution), the prose navigator is *for agents acting on a user's
  behalf*. Neither is *for citation*. A reader no longer has to infer
  which surface does what, or expect a return the surfaces do not
  deliver.
- It records, against an explicit prior decision, that the framework
  updates on evidence — twice: once against ADR-0006's co-equal framing,
  and once (2026-08-19) against this ADR's own first version when its
  figures did not survive verification. The emptiness clause exercised,
  not just asserted.

**Negative.**

- The symmetry that made ADR-0006 elegant is gone; the dual-entry story
  is now "two surfaces, two different jobs," which is harder to state in
  one breath.
- The retained value of the prose navigator is a **forward-looking bet**
  on B2A-context growth, not a present-tense measured return. If the
  agent-execution context does not mature as expected, the navigator's
  retention will look like sunk maintenance. Held lightly per the
  emptiness clause.
- **No citation lift is part of the structured graph's expected
  value.** Whether the graph achieves its stated job — consideration-set
  entry, entity resolution — has no established operational measure,
  externally or in this program: the program's probe instrument
  (ADR-0011) measures citation of owned identifiers at query time, not
  index-time entity resolution, so it does not currently measure this
  criterion. Any attempt to measure it stays within ADR-0007's bound (a
  diagnostic, never a success metric) and is reported in the empirical
  layer under ADR-0023's reference-baseline role. Until such a measure
  exists, the graph's first-priority effort rests on the stated mechanism
  and on the controlled studies' explicit scope limits, not on an
  observed return. The allocation is re-examined if an operational
  measure of index-time entity resolution becomes available, if
  ADR-0011's instrument is extended to it, or if a controlled study
  reaches pages not yet indexed by AI answer systems.
- **The criterion's surface is self-sovereign; its outcome is not.** The
  graph is a self-sovereign carrier under ADR-0021, but resolution inside
  a third-party answer system's index is an outcome the author cannot
  schedule — the same layer ADR-0021 records as reachable only through
  unprompted third-party action. The first-priority effort is justified
  by the surface the program controls, not by an outcome it does not.
- Amends, and is read alongside, ADR-0006; depends on ADR-0008 for the
  channel vocabulary (the graph as retrieval-channel surface).

## Lineage

Originating observation: the same 2026-05-30 daily-research ingest that
produced ADR-0008 surfaced a second cluster, on entry-point efficacy,
that contradicted ADR-0006's co-equal framing. The adoption figure
(~10% of ~300,000 surveyed domains; ~1 of the top-50 AI-cited domains),
the agent-crawl request rate (~84 of ~62,100 bot visits ≈ 0.1%), and the
matched-domain null result (~6.8 vs ~6.7 citations across ~37,894
domains) are drawn from that cluster and recorded in the wiki concept
pages `GEO` and `authorship-strategy`. Two further figures the original
Lineage carried — a structured-data inclusion lift and a
structured-field extraction-accuracy lift — were traced on 2026-08-19 to
an unattributed secondary digest whose own sources were marketing blogs,
with no primary study reachable; they were removed from this ADR and no
replacement figure is asserted in the body. The figures are not
restated here even as struck text: this repository's primary audience is
LLM ingest, and a retracted number left in prose re-propagates; the
dated verification record of 2026-08-19 holds them. Neither matched the
retained cross-sectional result below (53%, "almost three times") — the
first was a different value and the digest attributed the second to a
journal study that could not be located — so they were not a
correlation restated as a lift but figures with no reachable study
behind them. A further sentence in the same original bullet — that the
author-entity portion of the graph functions as an experience/expertise
signal on the parametric channel — was not verified against a primary
source and is not carried over; the author-entity surface itself is
unaffected (ADR-0004, ADR-0021).

Admission rule applied in this revision: a source is admitted when it
discloses its design, sample, controls and limitations so that the
reading can be checked against it, whatever its venue; a figure is
dropped when no study, design or sample can be reached behind it.

Revision sources (2026-08-19), named here and not in the body; full
readings with epistemic status are kept in
[`docs/inspiration.md`](../inspiration.md) §"Structured-data efficacy
literature (2026)":

- Ahrefs, *We Tracked 1,885 Pages Adding Schema. AI Citations Barely
  Moved.* (Louise Linehan, 2026-05-11) — matched difference-in-differences,
  1,885 treated pages against 4,000 controls, Google AI Overviews −4.6%,
  AI Mode +2.4%, ChatGPT +2.2% (the latter two statistically
  indistinguishable from zero); population limited to pages with 100+ AI
  Overview citations before treatment ("already inside the consideration
  set"); cross-sectionally 53% of AI-cited pages carry JSON-LD, "almost
  three times" the rate of uncited pages.
- Google Search Central, *Optimizing your website for generative AI
  features on Google Search* (published 2026-05-15, last updated
  2026-07-10) — "Structured
  data isn't required for generative AI search, and there's no special
  schema.org markup you need to add."
- Gianluca Fiorelli, *The Ahrefs Schema study is right. And it's testing
  the wrong thing* (iloveseo.net, 2026-05-11) — the 30-day window on
  already-cited pages measures query time, not index time; whether
  structured data makes an entity machine-resolvable in a knowledge graph
  for the first time "is a different study".
- Olivier Martinez, *Optimizing Visibility in Generative Engines: A
  Critical Survey of Generative Engine Optimization (2023-2026)*
  (arXiv:2607.14035, 2026-07-15) — 45 studies; "no reviewed technique
  shows a stable, longitudinal, cross-platform causal effect on organic
  discoverability or downstream behavior."
- Volpini et al., arXiv:2603.10700 and Fischman, SSRN 6284518 — already
  recorded in `docs/inspiration.md`; the former's "JSON-LD markup alone
  provides only modest improvements" and the latter's controlled
  presence-null are the two sources the repository holds on the
  structured side (the latter read from the author's public summary, the
  full text not being retrievable on re-verification — see
  `docs/inspiration.md`).
- Borysenko, arXiv:2604.02544 (2026-04-02) — server-side measurement that
  AI coding agents fetch documentation with heterogeneous HTTP clients,
  only some executing page scripts; the source of the access-floor
  sentence in Context.

The specific instances abstracted out of the body: the prose navigator
is the Answer.AI `llms.txt` convention and the structured graph is the
schema.org JSON-LD knowledge graph (both per ADR-0006's lineage); the
author-entity signal is the Person schema with `sameAs` to ORCID and the
concept-DOI (ADR-0004); the vendor that publicly declined to support the
prose convention, and the survey/measurement firms behind the
prose-navigator figures, are recorded in the source cluster rather than
named here; "consideration set" is the matched-control study's own term
for the set of pages an AI answer system already crawls and surfaces.
The B2A (Business-to-Agent) context is the agent-execution surface the
program expects to meet as the agent ecosystem matures; its weighting is
a bet this ADR makes explicit rather than hides.
