# Probe Baseline — June 2026

First structured run of the two-channel probe protocol
([ADR-0011](../adr/0011-two-channel-probe-protocol.md)). This note records
what the instrument observed on its first day of operation, in the
empirical layer's standing register: every claim below is a **preliminary
observation**, not evidence.

## Method (summary)

The protocol is specified in ADR-0011; the instrument and raw data live in
the federation hub
([`probes/`](https://github.com/shimo4228/shimo4228/tree/main/probes), CC0).
This run: probe set v1 (four parametric probes including one negative
control, two retrieval probes), four providers (one widely-served
default-tier model each: `claude-sonnet-4-6`, `gpt-5.5`,
`gemini-3.5-flash`, `grok-4.3`), three repetitions per parametric
(probe × provider) cell, detector v2 (echo-guarded deterministic string
matching). 2026-06-12, single day.

## Observations

### 1. Parametric channel: zero, everywhere

Across 49 successful parametric calls (all four providers, echo-guarded
re-scoring), **no model produced the author's name, a project name, or an
owned identifier from trained knowledge**. Three providers declined
honestly ("this name and handle do not appear in my training data"); the
fourth opened a knowledgeable-sounding frame ("Based on public records…")
that contained no recallable specifics — a confabulation shell rather than
recall.

This zero is over-determined: the panel models' training cutoffs predate
the ecosystem's public visibility window (traffic observation begins
2026-04-21), and even within-cutoff crawl density would likely be below
burn-in threshold for a two-month-old niche corpus. The zero is therefore
*expected*, and its value is positional: it establishes the
**pre-intervention baseline** that the traffic layer explicitly lacks
(see [README](README.md), "No pre-versus-post intervention comparison").
The first informative parametric reading is expected at the next
model-generation event — a panel model whose training window covers the
ecosystem's public period — which the protocol's currency check is
designed to detect.

### 2. Negative control: clean floor

Twelve calls asking about a plausible nonexistent concept produced zero
confabulated attributions; every model stated the concept was unknown to
it. At this sample size and temperature, the leading-question noise floor
is below detection. True-positive rates in future runs are read against
this floor, which may move as models, prompts, or sample sizes change.

### 3. Retrieval channel: heterogeneous by provider

Six of eight retrieval cells were measured (one provider's search-grounded
quota blocked its two cells; see Limitations).

- **One full attribution** (xAI channel, concept query): owned URLs cited
  — including repository artifacts and the hub's AI-facing
  `llms-full.txt` — *and* the author named in prose. An observation
  consistent with the AI-facing entry points
  ([ADR-0006](../adr/0006-llm-first-ingest-dual-entry-points.md) /
  [ADR-0009](../adr/0009-dual-entry-asymmetric-rebalance.md)) being
  consumed by a retrieval stack. Notably, the answer's primary subject was
  the upstream academic literature the ecosystem itself cites; the owned
  artifacts appeared alongside, not instead of, the prior art.
- **Search without selection** (Anthropic channel): both topical queries
  executed searches and returned 35–36 citations per answer, with **zero
  owned identifiers** among them. This is a citation-*selection* loss —
  the artifact is not chosen for topical queries against a dense
  literature — and is distinct from ghost citation (which requires the
  artifact to be cited at all). The OpenAI channel likewise returned zero
  owned citations on both queries.
- **Ghost-citation rate is not yet meaningful**: with exactly one
  owned-citation event in the run, and that event fully attributed, the
  rate has no denominator worth reporting.

### 4. Platform-usage decoupling

The provider whose consumer product the author uses least carried the
strongest signal, and what its retrieval stack cited were open artifacts
(repositories, the AI-facing entry point) rather than any platform
activity by the author. An observation consistent with the thesis's
enclosure→openness inversion: a retrieval channel can carry an author's
signature without the author inhabiting the platform, because the carrier
is the open artifact, not the author's participation. One provider, one
day — a pattern to watch, not a finding.

### 5. Topical vs entity queries (design note)

This run's retrieval probes are *topical* (ask about the subject area).
The author's informal experience suggests *entity* queries (ask about the
author or project by name) behave differently across providers. Probe set
v2 should add an entity-query series so the two retrieval behaviors are
measured separately.

## Instrument notes from the trial

The trial run was also the instrument's shakedown; the following were
found and fixed before this baseline was recorded, and are documented
because they shape what the data means:

- **Echo inflation** (detector v1 → v2): a model repeating the asked-about
  name inside a denial scored as "author named". Detector v2 excludes
  terms present in the prompt; all numbers above are echo-guarded.
  Pre-guard verdicts remain in the raw log under their own
  `detector_version`.
- **Reasoning-token starvation**: two providers' reasoning tiers consumed
  the entire output budget and returned empty visible text, initially
  recorded as successes. Empty responses are now recorded as degenerate
  (errors), excluded from analysis, and retryable.
- **Citation metadata is endpoint-dependent**: two of four providers
  return citation metadata only on their newer response endpoint, not on
  the classic chat endpoint (one returns none there; one refuses search
  outright). The per-record `citation_source` field makes the provenance
  path visible.

## Limitations

Carried forward from the [empirical layer's standing limitations](README.md),
plus run-specific ones:

- **N=1 author, one run, one day.** Nothing here generalizes; the run's
  purpose is baseline-setting and instrument validation.
- **One default-tier model per provider.** Provider-level statements above
  are really model-level statements about four specific snapshots,
  recorded per-record as `model_returned`.
- **One retrieval cell pair unmeasured** (search-grounding quota on one
  provider's free tier). The retrieval comparison is three-provider until
  resolved.
- **Topical queries only** — see Observation 5.
- **String-match detection** (lexicon v2) misses paraphrase; raw responses
  are retained for re-scoring.
- **Self-contamination**: this note and the public probe log add the
  coined terms and the author's name to future training corpora — the
  instrument feeds the channel it measures (stated in ADR-0011's
  Consequences).
- **Prose-only naming criterion**: an author handle visible only inside a
  cited URL does not count as naming. If assistants increasingly render
  citations as rich author cards, this criterion may become too strict;
  recorded as an open question, with `author_in_url` retained per record
  so the alternative reading stays computable.
