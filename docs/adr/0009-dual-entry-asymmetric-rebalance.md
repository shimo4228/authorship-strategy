Language: English | [日本語](0009-dual-entry-asymmetric-rebalance.ja.md)

# ADR-0009: Dual Entry Points Are Asymmetric — Structured Graph Carries Citation, Prose Navigator Carries Agent Context

> **Summary.** ADR-0006 deployed the prose-form navigator and the
> concept-form structured graph as a *co-equal* complementary pair, each
> serving a distinct LLM-mediated reader sub-population. 2026 empirics
> break the symmetry: the prose navigator has near-zero effect on
> AI-search citation (single-digit adoption, ~0.1% of agent crawls
> request it, citation counts indistinguishable with and without it),
> while the structured graph materially lifts retrieval-time inclusion
> and machine extraction accuracy. This ADR amends ADR-0006: the two
> entry points are retained, but their roles are now **asymmetric** — the
> structured graph is the primary lever for retrieval-time citation (the
> retrieval channel of ADR-0008), and the prose navigator is reframed as
> a Business-to-Agent (B2A) context surface (agent navigation,
> token-efficient context retrieval), not an AI-search citation lever.

## Status
accepted

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

The 2026 empirical record breaks the symmetry on the dimension that
matters for Layer 2 (Attribution Diffusion) — retrieval-time citation.

- **The prose navigator does not move AI-search citation.** Large-scale
  measurement converges: adoption sits in the low-single-digit percent
  of surveyed domains; of the most-cited domains in AI answers, almost
  none ship one; across tens of thousands of bot visits the navigator
  file is requested on the order of 0.1% of the time; and a
  matched-domain comparison finds citation counts statistically
  indistinguishable with and without it. A major search vendor has
  publicly declined to support the convention. On the citation axis its
  effect is noise.

- **The structured graph does move it.** Pages carrying valid structured
  data are included in AI answer surfaces at materially higher rates, and
  models extract facts from structured fields far more accurately than
  from prose. The author-entity portion of the graph also functions as
  an experience/expertise signal — the parametric-channel lever of
  ADR-0008.

- **But the prose navigator retains genuine value in a different
  context.** Where an agent fetches context on a user's behalf or selects
  a tool — the Business-to-Agent (B2A) execution context — a
  token-efficient prose digest is a useful navigation entry point. That
  value is real but forward-looking, tied to agent-ecosystem maturity
  rather than to today's citation counts.

So ADR-0006's "co-equal pair" is empirically wrong on the citation axis
and incomplete on the context axis. The pair should persist; the *equal
weighting* should not.

## Decision

Amend ADR-0006: the dual entry points are retained but **asymmetric in
role**.

1. **The structured graph is the primary entry point for retrieval-time
   citation.** It carries the ingest/citation weight and is the
   retrieval-channel lever named in [ADR-0008](0008-rag-era-attribution-diffusion.md).
   Maintenance and freshness effort is allocated here first.

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
contradicted by direct measurement on the citation axis. Treating the
prose navigator as a co-equal citation lever misallocates synchronization
and freshness effort toward a surface with noise-level citation effect.

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

## Consequences

**Positive.**

- Maintenance and freshness effort is concentrated on the load-bearing
  surface (the structured graph), which is also ADR-0008's retrieval
  lever — the two ADRs now point the same way.
- The program's stance becomes legible: the structured graph is *for
  citation*, the prose navigator is *for agents acting on a user's
  behalf*. A reader no longer has to infer which surface does what.
- It records, against an explicit prior decision, that the framework
  updates on evidence — the emptiness clause exercised, not just
  asserted.

**Negative.**

- The symmetry that made ADR-0006 elegant is gone; the dual-entry story
  is now "two surfaces, two different jobs," which is harder to state in
  one breath.
- The retained value of the prose navigator is a **forward-looking bet**
  on B2A-context growth, not a present-tense measured return. If the
  agent-execution context does not mature as expected, the navigator's
  retention will look like sunk maintenance. Held lightly per the
  emptiness clause.
- Amends, and is read alongside, ADR-0006; depends on ADR-0008 for the
  channel vocabulary (the graph as retrieval-channel lever).

## Lineage

Originating observation: the same 2026-05-30 daily-research ingest that
produced ADR-0008 surfaced a second cluster, on entry-point efficacy,
that contradicted ADR-0006's co-equal framing. The adoption figure
(~10% of ~300,000 surveyed domains; ~1 of the top-50 AI-cited domains),
the agent-crawl request rate (~84 of ~62,100 bot visits ≈ 0.1%), the
matched-domain null result (~6.8 vs ~6.7 citations across ~37,894
domains), the structured-data inclusion lift (~2.3×), and the extraction
accuracy lift (16% → 54%) are drawn from that cluster and recorded in
the wiki concept pages `GEO` and `authorship-strategy`.

The specific instances abstracted out of the body: the prose navigator
is the Answer.AI `llms.txt` convention and the structured graph is the
schema.org JSON-LD knowledge graph (both per ADR-0006's lineage); the
author-entity signal is the Person schema with `sameAs` to ORCID and the
concept-DOI (ADR-0004); the vendor that publicly declined to support the
prose convention, and the survey/measurement firms behind the figures,
are recorded in the source cluster rather than named here. The B2A
(Business-to-Agent) context is the agent-execution surface the program
expects to meet as the agent ecosystem matures; its weighting is a bet
this ADR makes explicit rather than hides.
