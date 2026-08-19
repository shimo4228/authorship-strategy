Language: English | [日本語](0011-two-channel-probe-protocol.ja.md)

# ADR-0011: Two-Channel Probe Protocol — Measuring Each Channel by Its Own Instrument

> **Summary.** ADR-0008 split Attribution Diffusion into a parametric
> channel and a retrieval channel and conceded, in its own Consequences,
> that parametric success was *asserted, not measured*. This ADR builds
> the missing instrument: a scheduled probe protocol that interrogates
> frontier models on two settings — search suppressed (does the trained
> model name the concept and its author?) and search enabled (are the
> program's identifiers cited, and does the author's name survive
> alongside the citation?). Detection is deterministic string matching
> over retained raw responses, never model judging; probe prompts are
> fixed single-variable templates with a negative control; every change
> to prompts, models, or detection lexicon is a visible series break.
> The instrument is public, which means it feeds the very channel it
> measures — a confound the protocol states rather than hides.

## Status
**experimental** — adopted for operation; to be confirmed as `accepted`
after the protocol survives three scheduled runs without revision to its
core rules. Annex A (2026-08-19) adds calibration *reading rules* on
top of those core rules without revising them.

## Date
2026-06-12

## Context

ADR-0007 fixed what counts as success — LLM-mediated reach, not
human-attention signals — and recorded that the program had no
instrument for it. ADR-0008 divided that reach into two channels with
opposite time constants and ended with the same admission, now sharper:
retrieval success is observable today (the artifact appears among cited
sources), but parametric success requires a *retrieval-suppressed naming
probe* that did not exist. Until it exists, the framework's central
claim — that openness drives name burn-in — floats free of measurement.

The empirical layer's only standing instrument has been the traffic log:
daily snapshots of clone and view counts. Those are exactly the
human-attention-adjacent signals ADR-0007 demoted, kept because they are
free and continuous, not because they answer the question. The one
direct measurement to date — three ad-hoc regurgitation tests against
three assistants in one week of May 2026 — was a single-window, single-run
observation with no fixed prompts, no controls, and no repetition: an
anecdote, not a series.

Meanwhile the 2026 measurement literature converged on the missing
pieces. Large-scale citation-validity studies quantified how often
models fabricate or strip attribution; a cross-platform measurement
framework separated *citation selection* (which sources a platform
fetches) from *citation absorption* (how much a fetched source shapes
the answer), using controlled prompt sets in the hundreds; and the
practitioner literature gave the failure mode a name and a mechanism —
ghost citation: the answer cites the page while the parametric memory
that would have named its author was never formed. These designs are
reproducible at individual-author scale: fixed prompt templates varying
a single term, independent boolean outcomes, derived rates.

What remained was a protocol decision: what exactly to ask, how to
detect an answer's verdict without introducing a second model's
judgment, how to store observations so that detection mistakes are
recoverable, and how to keep a public instrument honest about the fact
that it contaminates its own object of measurement.

## Decision

Operate a **two-channel probe protocol** as the program's primary
measurement instrument. One probe run interrogates several frontier
models (currently five providers) through a unified model-API client,
on two settings that are never blended:

1. **Parametric arm — search suppressed.** No search or grounding tool
   is offered. Success on this arm is the model producing the concept
   and the author's name from weights alone. This is the
   retrieval-suppressed naming probe ADR-0008 called for.

2. **Retrieval arm — search enabled.** The provider's server-side
   search tool is enabled. Prompts request URLs *and author names*, so
   that ghost citation is observable within a single answer: an owned
   identifier cited while the author goes unnamed.

3. **Same prompts, both arms (A/B).** Every probe runs on both settings
   with an identical prompt, so the per-question delta between arms
   isolates what retrieval adds with the question held fixed — the
   measurement most users' actual usage corresponds to is the
   search-enabled arm, and the search-suppressed arm is its control.
   The crossing also yields two derived controls for free: a
   citation-eliciting prompt on the suppressed arm measures
   citations-from-memory (hallucinated-citation floor), and the
   negative-control prompt on the enabled arm measures grounded
   confabulation.

The protocol's internal rules, each load-bearing:

- **Deterministic detection.** Verdicts are produced by string and
  regular-expression matching against a versioned lexicon of author
  aliases, owned identifiers, and project terms — never by asking a
  second model to judge the first. An auditable false positive is worth
  more than an unexplainable true one.
- **Independent booleans, derived rates.** *Author named*, *project
  named*, and *owned identifier cited* are recorded independently;
  *ghost citation* is derived (`cited && !author-named`) and therefore
  always re-derivable. Naming counts only in prose: an author handle
  visible solely inside a cited URL is the ghost-citation scenario, not
  attribution.
- **Raw retention.** The full response text is stored with every
  verdict, so a revised lexicon can re-score all history. The detector
  version travels with each record.
- **Controlled prompts with a negative control.** Templates are fixed
  and vary a single term per probe. One parametric probe asks about a
  plausible concept that does not exist; any confident attribution it
  elicits is the confabulation noise floor against which true-positive
  rates are read.
- **Visible series breaks.** Prompt set, pinned model identifiers, and
  detection lexicon are versioned; the version travels with every
  record, and the model identifier the provider actually served is
  recorded beside the one requested. Nothing about the instrument
  changes silently.
- **Channel-matched scheduling.** The retrieval probe runs on a fast
  calendar cadence (weekly), matching the days-scale entry and decay
  dynamics of the retrieval pool. The parametric probe is
  *event-driven*, not calendar-driven: a frozen model's weights cannot
  change between runs, so re-probing the same model measures only
  response variance, and the parametric signal of interest lives across
  model generations. The full parametric set fires when a model enters
  the panel or is observed to have changed, with a small number of
  repetitions per event to estimate within-model variance. What runs on
  the calendar instead is a monthly *currency check* — three automated
  detectors of change events: a minimal call per provider comparing the
  served model identity against the last observation (silent swaps
  behind non-dated aliases), a provider-catalog diff surfacing newly
  published models (detection automated; panel adoption stays a human
  judgment, since which model is the widely-served default tier is a
  product-side fact no API reports), and a staleness guard flagging when
  the panel's default-tier verification has aged past its window.
  Because a parametric arm is frozen per model snapshot, one parametric
  measurement pairs validly with every retrieval run of the same
  snapshot — the A/B delta does not require the two arms to share a
  calendar. Scheduling begins after the protocol survives manual
  prototype runs.
- **Public log.** The probe data is published under a public-domain
  dedication beside the traffic log, in the same append-only time-series
  form, consistent with the openness axis of the thesis.

## Alternatives Considered

**Keep the status quo: ad-hoc regurgitation tests.** Zero build cost.
Rejected: single-window tests with unfixed prompts cannot distinguish
model drift from prompt drift from chance, and the empirical layer had
already flagged them as its weakest observation. The gap they leave is
the one ADR-0008 documented.

**Model-judged detection.** Ask a second model whether the response
names the author. More tolerant of paraphrase and indirection than
string matching. Rejected: it stacks a second, unversioned source of
drift on top of the first, makes verdicts unauditable, and quietly
re-introduces the measured system as the measuring system. The
deterministic lexicon misses paraphrase — accepted as a known,
inspectable bias, mitigated by retaining raw responses for re-scoring.

**Third-party visibility-monitoring services.** A commercial sector now
sells AI-visibility tracking. Rejected: the services are
retrieval-channel only (no search-suppressed mode, hence blind to
exactly the channel the program cannot otherwise see), closed about
their probe construction, and vendor-coupled in a way the framework's
tool-agnosticism rejects.

**A single blended visibility score.** Average the channels into one
number for legibility. Rejected outright by ADR-0008: a blended metric
hides which channel is failing, and the channels' time constants differ
by orders of magnitude.

## Consequences

**Positive.**

- The measurement gap that ADR-0007 opened and ADR-0008 sharpened is
  closed by an operating instrument: parametric success becomes a
  measured rate rather than an assertion, and ghost citation becomes a
  number with a time series.
- The negative control converts the protocol's worst systematic error —
  models confabulating agreeably about concepts a leading question
  presupposes — into a measured noise floor instead of an unknown.
- Raw retention plus versioned detection makes the instrument
  self-correcting: a detection bug is a re-scoring, not a lost year of
  observations.
- The public log extends the program's existing observation discipline
  (the traffic log) to the metric layer ADR-0007 actually endorses, and
  gives any adopting author a reference protocol to replicate at their
  own scale.

**Negative.**

- **Self-contamination.** The published probe log contains the coined
  terms, the owned identifiers, and the author's name; future training
  runs may ingest it, so the instrument feeds the parametric channel it
  measures. This is a real confound — and simultaneously an on-thesis
  act of diffusion. The protocol states it in the data's own
  documentation rather than hiding it, and holds the distinction between
  *instrument* and *intervention* lightly, per the framework's emptiness
  clause, as ADR-0008 already holds the channel boundary itself.
- **Leading-question bias.** Concept-recognition prompts presuppose the
  concept's existence. The negative control measures but does not remove
  this; rates are read against the floor, not as absolutes.
- **Provider drift.** Models are pinned but providers retire and
  redirect them; every model change is a series break, and the series
  will accumulate breaks. The protocol records drift rather than
  preventing it.
- **A new standing cost.** Scheduled runs, per-search fees, lexicon
  maintenance, and prompt-set curation are a permanent, if small,
  operational load — the price of the program having a measurement
  layer at all. A per-run cost ceiling bounds the worst case.
- N=1 remains N=1: one author's ecosystem, a handful of probes, a few
  providers. The protocol produces preliminary observations under the
  empirical layer's standing limitations, not generalizable findings.

## Lineage

Originating demand: ADR-0008's Consequences ("the program must build a
retrieval-suppressed naming probe to measure the parametric channel at
all"), itself downstream of the measurement layer ADR-0007 opened.
Immediate trigger: a 2026-05-31/2026-06-10 ingest cluster in the
companion concept wiki covering the 2026 measurement literature — the
large-scale citation-validity study (GhostCite, arXiv:2602.06718), the
selection/absorption measurement framework and its 602-prompt controlled
design (arXiv:2604.25707, reference implementation `geo-citation-lab`),
the citation-failure diagnosis work (arXiv:2603.09296), and the
practitioner ghost-citation analyses (Seer Interactive; Growth Memo).
The independent-boolean recording rule and single-variable templates are
adapted from the 2604.25707 design.

Specific instances abstracted out of the body: the instrument lives in
the hub repository's `probes/` directory beside `traffic/`; the unified
model-API client is litellm; the five providers are Anthropic (Claude),
OpenAI (GPT), Google (Gemini), xAI (Grok), and Alibaba (Qwen via
DashScope; added 2026-06-12 as the panel's first entry event — May 2026
pre-protocol test continuity, a non-Western training corpus, and the
only open-weight family, to which white-box training-data-attribution
methods could later apply), with retrieval enabled via each provider's
server-side search tool (Anthropic/OpenAI web search, Google grounding,
xAI agent tools, DashScope search); scheduling is local calendar
automation on the author's workstation (launchd), chosen over the hub's
CI automation because the probes fetch nothing from the code host,
hosted cron is best-effort, and the credentials stay local; the
public-domain dedication is CC0 1.0. The prototype gate (manual runs with a cost ceiling before
scheduling) follows the harness's prototype-before-scale rule. The open
question this ADR leaves for the empirical layer — whether
prose-only naming is too strict a criterion once assistants render
citations as rich author cards — is recorded in the probe data's
documentation rather than resolved here.

## Annex A — Calibration of the probe readings (added 2026-08-19)

This annex fixes how the protocol's outputs are *read*. It adds reading
rules, not success criteria: **every rule below is a diagnostic
calibration, never a success metric — the ADR-0007 bound that governs
the body of this ADR governs the annex without exception.** None of the
rules changes the prompt templates and their single-variable rule, the
deterministic detection, raw retention, how series breaks are marked, or
when runs fire — the Decision's core rules; they add how the existing
outputs are grouped, ordered, and read. Where recording a reading rule's
output (a declared probe format, a per-run floor, a reversal record)
extends the record schema, that extension travels with the versioned
prompt set as a visible series break — the Decision's own mechanism
applied, not revised. Readings published before this date stay as
published; re-reading them under these rules is a re-scoring over
retained raw responses, not a revision of the record. Numbers from the
grounding literature are quarantined in
[`docs/inspiration.md`](../inspiration.md); the annex carries mechanism
and reading consequence only.

### A.1 Stratify readings by model family; report no single cross-model threshold

- The panel already spans several model families; stratify its
  readings by family. Report within-family consistency *alongside* the
  cross-family comparison; do not collapse the two into one threshold
  that every model is read against.
- Grounding. A cross-family memorization comparison finds that
  memorization *statistics* follow regularities shared across families
  while the internal placement of memorization is family-specific and
  shaped by each family's training recipe — the shared statistics are
  what make cross-model probing meaningful at all, and the
  family-specific internals are why the reading is per family.
  Independently, a memory-score study across many models finds that
  pairwise agreement is higher within a provider's model series than
  across providers, and that the choice of model substantially moves
  the correlation the study reports between its memory score and
  citation counts — a spread across models, not a reliability figure.
  This protocol therefore treats a single-model reading as not
  externally valid for the panel.
- Generation changes. A generation change is always recorded as a
  series break (Decision: visible series breaks); that rule is
  untouched. What the annex adds is how readings are carried *across*
  the break: do not presume the family's memorization structure reset —
  in one openly documented series it was observed to carry across
  generations — and do not presume it persisted. Re-baseline the
  family's readings on the new generation and compare them with the
  old; continuity or discontinuity is verified, not assumed.
- Boundary of this protocol. The internal (white-box) family analysis
  in the grounding literature presupposes open weights and disclosed
  pre-training data. This program's panel is mostly closed-weight, so
  family calibration here is behavioral by construction — an
  approximation the protocol states as its own, not a finding it
  attributes to the literature.

### A.2 Measure the negative control first and read against it as the working noise floor

- In every run, before any true-term rate is read, measure the
  confabulation rate on the fabricated-term negative control for the
  arm that the run fires, and record it as that run's working noise
  floor — per model and per arm, since the floor differs between
  search-suppressed and search-enabled settings (the
  grounded-confabulation control of Decision item 3). Scheduling is
  unchanged: a parametric-arm floor is measured when the parametric set
  fires and carries with that model snapshot to every retrieval run
  paired with it (channel-matched scheduling).
- Read the program's own terms as distance above that floor, never as
  absolutes. A true-term rate indistinguishable from the floor is read
  as *no signal*, not as a weak signal — where "indistinguishable" is a
  judgment recorded with each reading, not a computed test.
- The Decision already installs the negative control as a prompt-design
  rule; this annex fixes its place in the reading order and its scope
  (per run, per model, per arm). The floor is a reading aid, not a pass
  line.

### A.3 Read the A/B delta knowing the two override directions carry unequal error risk

- White-box evidence on knowledge attribution finds the two error
  directions unequal: when a task needs parametric knowledge and the
  model instead leans on misleading context, error risk rises far more
  than in the reverse case, where the model defaults to memory in a
  setting that context should govern.
- Reading consequence. The retrieval arm's gains over the parametric arm
  and its losses are not symmetric. A retrieval-arm answer that names
  the author where the parametric arm did not is the expected direction
  (context supplied what weights lacked); a retrieval-arm answer that
  *loses* a name the parametric arm produced is the more diagnostic
  event — fetched context displaced whatever the weights had produced,
  which the negative control reminds us may itself have been a
  confabulation. Record such reversals separately from the aggregate
  delta and read them as a direction of displacement, not as proof
  that a correct memory was overwritten.
- Boundary. The grounding measure is a relative risk — the increase in
  error risk when attribution and task are mismatched — not an error
  rate, and it was measured on small open-weight models with short,
  supplied contexts, not on a search-enabled frontier assistant whose
  fetched context need not be misleading. The annex imports the
  *direction*, not the magnitude.

### A.4 Declare each probe as recognition or recall; pool no rates across the two

- Every probe declares its format: *recognition* — the model chooses
  among supplied candidates — or *recall* — the model produces the
  concept or the author's name from a cue, with no candidates supplied.
  Rates from the two formats are recorded separately and never pooled.
  (A cue that presupposes the concept's existence is the leading-question
  bias the negative control measures; it does not make a probe
  recognition.)
- The protocol's current probes are cued recall throughout (a concept
  is named, the author must be produced); none is multiple-choice. The
  grounding memory-score study implements recognition only and records
  open-ended recall as future work, so the two formats are not yet
  comparable in the literature — a reason to declare, not to convert.
  The same study finds its probe types differ in discriminative power,
  with author recognition the strongest — an ordering across its own
  probe types, consistent with (not the reason for) the Decision's
  existing separation of *author named* and *project named*, which are
  read separately here.

### Confounds carried into every reading, and the bound

- **Prestige and visibility.** What a model retains about a source
  reflects exposure — author prominence, institutional visibility, topic
  popularity — and not only the source's content. The grounding
  memory-score study treats these as part of the exposure process it
  measures and asks for fairness-aware interpretation rather than a
  correction; this protocol does the same and introduces no correction
  term. For an author without institutional backing a low reading is
  therefore ambiguous between *not diffused* and *diffused but not
  prominent*, and is read as ambiguous.
- **Self-contamination** (Consequences) applies to the annex as it
  applies to the body: the published rules are themselves part of what
  future models ingest.
- **Added load and thinner cells.** The negative-control calls Decision
  item 3 already permits become standing per fired arm; a reversal
  record is kept beside the aggregate delta; and rates split into
  recognition and recall cells that are never pooled — more calls under
  the per-run cost ceiling (Consequences: a new standing cost) and fewer
  observations per cell for a program that is already N=1.
- **Relation to ADR-0017.** The reach-without-recognition detector of
  ADR-0017 reads this protocol's naming probe; the detector is
  unchanged, but its reading is now floor-relative, per family, and
  ambiguous under the prestige confound above — the signal can fire for
  a reason other than the failure mode, and is read with that in mind.
- **Bound.** These are diagnostic reading rules for an experimental
  instrument, not a success metric and not a threshold for any claim
  (ADR-0007). They produce preliminary observations under the empirical
  layer's standing limitations, in the role ADR-0023 assigns that layer.
  Revisit them when a grounding preprint is revised or withdrawn, or
  when the panel gains an open-weight family that makes the behavioral
  boundary of A.1 partial rather than total.

Grounding, named here per the Lineage convention: the cross-family
memorization comparison (arXiv:2603.21658), the multi-model memory-score
study (arXiv:2605.22176), and the white-box knowledge-attribution probe
(arXiv:2602.22787). All three were unreviewed preprints when read
(2026-08); figures from all three are quarantined in
`docs/inspiration.md`.
