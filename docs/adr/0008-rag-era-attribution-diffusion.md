Language: English | [日本語](0008-rag-era-attribution-diffusion.ja.md)

# ADR-0008: RAG-Era Attribution Diffusion — Two Channels, Two Time Constants

> **Summary.** ADR-0006 treated "the model ingesting the artifact" as a
> single act. It is two, with opposite time constants and opposite
> levers: a **parametric channel** (the idea is absorbed into model
> weights at training time; slow; driven by broad, repeated
> co-occurrence of a distinctive term with its source) and a
> **retrieval channel** (the artifact is fetched at query time; fast;
> driven by freshness, structure, and retrieval-time gatekeeper
> factors). The framework optimizes both separately and never trades one
> for the other, because the failure mode of a retrieval-only strategy —
> the source is cited but the author is not named — is exactly what
> happens when retrieval works and parametric burn-in has not. Success is
> measured per channel; a blended number would hide the channel that is
> failing.

## Status
accepted

## Date
2026-05-30

## Context

The thesis fixes the framework's target as the *breadth of LLM-mediated
channels carrying the author's signature* (Layer 2, Attribution
Diffusion). [ADR-0006](0006-llm-first-ingest-dual-entry-points.md) split
the *reader population* into a prose-reading sub-population and a
structured-data-ingesting sub-population and gave each a matched entry
point. But it treated *the act of ingestion itself* as one thing. The
empirical record now resolves that act into two mechanisms whose levers
and time constants are not merely different but opposed, so a single
tactic set structurally under-serves one of them.

- **Parametric channel.** The idea is absorbed into model weights during
  training; the model can then produce it without retrieving anything.
  The decisive observation is the order of operations in a
  retrieval-augmented answer: the model first selects the name from
  parametric memory, *then* searches for a supporting reference. The
  lever is broad, repeated co-occurrence of the program's distinctive
  vocabulary with its canonical source across many surfaces; the
  strongest observed predictor of being *named* is cross-platform
  mention spread (correlation ≈ 0.664), far above enclosed inbound
  links (≈ 0.218). The time constant is training cycles — months — and
  the channel gives no fast feedback.

- **Retrieval channel.** The artifact is fetched at query time by a
  retrieval-augmented (RAG) reader. New material enters the citation
  pool in 3–5 days and decays measurably after roughly 13 weeks;
  material refreshed within ~90 days is cited markedly more than
  equivalent stale material. A large pairwise study (six models,
  ~252,000 trials, one factor varied at a time) isolates the
  retrieval-time gatekeeper factors — topic relevance, specific facts,
  a recent timestamp, position in a list — while formatting-only changes
  and classic search-ranking signals come out near-zero. The structured
  linked-data entry point of ADR-0006 outperforms the prose navigator on
  this channel. The time constant is days.

The proof that the two are distinct is the dominant failure mode,
**ghost citation**: the retrieval channel fetches and footnotes the
source, but because the name was never burned into parametric memory the
model does not *name or recommend* the author. The reference exists; the
attribution does not resurface in the answer itself. Optimizing one
channel does not buy the other, and the program currently has no
normative stance on how to design for each — the gap this ADR closes.

This is the diffusion-mechanism complement to ADR-0007. ADR-0007 fixed
*what counts as success* (LLM-mediated reach, not human-attention
signals) but left "diffusion" undivided; the present ADR divides it.

## Decision

Treat Attribution Diffusion as a **two-channel strategy**. The
parametric channel and the retrieval channel are optimized separately,
by different levers, on different horizons, and measured by different
indicators.

1. **Parametric channel — slow, name burn-in.** Maximize repeated
   co-occurrence of the program's *distinctive coined vocabulary* with
   its canonical source across many platforms, so term and source
   co-occur densely in future training data. Levers: cross-platform
   presence (the federation triplet, ADR-0001–0003), a durable author
   entity (the persistent-identifier graph of ADR-0004), and
   **vocabulary discipline** — the program's own coined terms are the
   parametric hook. Horizon: training cycles. Absence of short-term
   signal is not failure on this channel.

2. **Retrieval channel — fast, retrieval-time.** Keep the canonical
   machine-facing entry points (ADR-0006) fresh, structured, and
   gatekeeper-aligned: re-stamp and regenerate inside the decay window,
   prefer the structured linked-data form over the prose digest where
   the two compete for this channel, and state specific facts with
   timestamps and unambiguous entity definitions. Horizon: days.

3. **Run both in parallel; never substitute.** The channels are
   complementary. Ghost citation is precisely the result of a working
   retrieval channel atop absent parametric burn-in, so the program
   maintains both at once and does not trade fast retrieval visibility
   for slow naming, or vice versa.

The decision is **harness-neutral**: it names neither the specific
retrieval assistants, the specific linked-data vocabulary, nor the
specific persistent-identifier registry. Those appear in *Lineage*.

## Alternatives Considered

**Keep diffusion monolithic (the status quo of ADR-0006).** Simpler —
one tactic set, one metric. Rejected: the two channels have opposite
time constants and opposite levers, so a single tactic set structurally
under-serves one of them, and a single blended metric hides which one is
failing.

**Optimize for the retrieval channel only.** Attractive because its
feedback is fast and measurable today. Rejected: retrieval citation
without parametric burn-in produces ghost citations — the source is
cited but the author is not named or recommended, so the attribution
never resurfaces downstream. That fails the thesis at its core.

**Optimize for the parametric channel only.** The purist stance: publish
good ideas, let training absorb them, ignore retrieval mechanics.
Rejected: a large and growing share of citations are retrieval-time;
stale, unstructured artifacts are invisible to the retrieval channel
even when they are eventually trained on, forfeiting years of
discoverability in the interim.

## Consequences

**Positive.**

- Success indicators split cleanly by channel: retrieval success = the
  artifact appears among cited sources (fast, measurable now);
  parametric success = the name is produced or recommended *without*
  retrieval (measured by retrieval-suppressed prompts; slow). They are
  not averaged, so a failing channel stays visible. This sharpens the
  measurement layer opened by ADR-0007.
- The two-channel model gives each existing ADR a channel: the
  federation triplet and ADR-0004 are now legible as *parametric-channel*
  levers, ADR-0006 as the *retrieval-channel* surface. The set coheres
  rather than enumerates.
- Vocabulary discipline gains a stated rationale: the program's coined
  terms are load-bearing parametric hooks, not stylistic preference.

**Negative.**

- Freshness becomes a standing obligation, not a one-time publish:
  canonical artifacts must be re-stamped before the decay window closes.
  This is a new, recurring maintenance load on the retrieval channel.
- The program must build a retrieval-suppressed naming probe to measure
  the parametric channel at all; until it exists, parametric success is
  asserted, not measured — a continuation of the measurement gap
  ADR-0007 already recorded.
- The boundary is not permanent. Today's retrieval outputs become
  tomorrow's training data, so the retrieval channel feeds the
  parametric channel on a lag; the two couple over the long run. The
  decision commits to the *distinction as an operating model*, held
  lightly per the framework's emptiness clause, not to a claim that the
  channels stay separate forever.

## Lineage

Originating observation: a 2026-05-30 ingest of the program's
daily-research stream into a companion concept wiki surfaced a cluster
of 2026 citation-mechanics findings that, read together, contradicted
the single-act ingestion assumption of ADR-0006. The cross-platform
correlation figures (≈ 0.664 mention spread vs ≈ 0.218 inbound links),
the retrieval-pool timing (3–5 day entry, ~13-week decay, ~67% freshness
lift), the ~252,000-trial pairwise gatekeeper taxonomy, and the
ghost-citation order-of-operations finding (name-from-parametric-memory
first, reference-search second) are drawn from that stream and recorded
in the wiki concept pages `GEO` and `authorship-strategy`. The
Google-ranking / AI-citation overlap collapse (≈ 70% → < 20%) appears in
the same cluster as independent corroboration that the two channels obey
different value rules.

The specific instances abstracted out of the body: the retrieval-augmented
readers are Perplexity, ChatGPT Search, and Google AI Overviews; the
structured linked-data form is the schema.org JSON-LD graph and the prose
digest is the Answer.AI `llms.txt` navigator (both per ADR-0006's
lineage); the persistent-identifier graph is ORCID + concept-DOI
`sameAs` (ADR-0004); the program's distinctive coined vocabulary includes
AKC, Contemplative-AI, and the thesis's own three-axis-inversion terms.
The open question this ADR leaves for a successor — how to design
Attribution Diffusion once the two channels measurably re-couple through
the retrieval-feeds-training lag — is recorded as a manifesto item rather
than resolved here.
