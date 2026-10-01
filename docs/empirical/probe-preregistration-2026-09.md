# Pre-registration — Parametric Transition Contrast, Autumn 2026 Window

*Role: baseline data (designed contrast, recorded before the data).*
This document fixes, before any eligible model exists in the probe
panel, what would count as the first parametric-channel transition,
how it will be read, and what would count against the framework's
claim. It is the pre-specified contrast that
[ADR-0023](../adr/0023-empirical-layer-role.md) Decision 3 requires
before an observation may be read as validation evidence. It satisfies
the first of that decision's two conditions (designed before the
fact). The second — explicit designation as validation evidence at
publication — is **deferred**: the results artifact will declare its
own role when it is published, and may still decline the designation
if the window closes with a reading this document did not anticipate.

Recorded 2026-09-07. The commit that adds this file is its timestamp;
the file is not amended in place. Any later change is a dated addendum
at the end, under *Amendments*, so that a reader can see what was fixed
before the data and what was changed after.

## What is already pre-registered elsewhere

Two blocks recorded earlier bind this contrast and are not restated:

- **Sampling cadence** (recorded 2026-06-14,
  [`probe-baseline-2026-06.md`](probe-baseline-2026-06.md#sampling-cadence-pre-registered-recorded-2026-06-14)):
  retrieval runs weekly from 2026-09-01 to 2026-11-30. The parametric
  channel is event-driven and unaffected.
- **Expectation** (recorded 2026-06-12,
  [`probe-baseline-2026-06.md`](probe-baseline-2026-06.md#1-parametric-channel-zero-everywhere)
  Observation 1): the earliest generation that could show a transition
  is one released from roughly autumn 2026; if a transition occurs it
  should appear partially first — concept recognized without the
  author named. This document turns that expectation into decision
  rules.

The reading rules of [ADR-0011 Annex A](../adr/0011-two-channel-probe-protocol.md#annex-a--calibration-of-the-probe-readings-added-2026-08-19)
(family stratification, negative control as floor, override-direction
asymmetry, recognition versus recall) apply as written.

## The claim under test

One normative claim, narrowed so that it can fail:

> Cross-platform co-occurrence of the ecosystem's coined vocabulary
> with its identifiers, deployed by the Layer 4 tactics from 2026-04
> onward, is sufficient for a model trained after that deployment to
> recognize at least one of the ecosystem's concepts when cued — and
> concept recognition precedes author naming.

This is the parametric half of the two-channel claim
([ADR-0008](../adr/0008-rag-era-attribution-diffusion.md); thesis
Layer 2). It is an *existence* claim about reachability plus an
*ordering* claim. It is not a claim about magnitude, about which tactic
did the work, or about the retrieval channel.

## Eligibility: what counts as an "eligible model"

A panel model is **eligible** for this contrast when all of the
following hold, determined from the provider's published model
documentation at the time the model enters the panel and recorded in
the hub's model catalog:

1. Its stated training-data cutoff is **on or after 2026-06-01**. The
   ecosystem's public window opened around 2026-04; a cutoff two months
   later is the minimum for the co-occurrence to have been crawlable.
   A model with no published cutoff is *not eligible* and is recorded
   as such, not guessed at.
2. It is the provider's widely served default-tier model, per the
   protocol's panel rule, so that it replaces a prior-generation model
   of the same family already in the panel.
3. Its prior-generation counterpart in the same family has a recorded
   parametric zero baseline (all panel families do as of 2026-07-12).

Eligibility is decided per model, before its event run, and written to
the run record. A model found eligible only after its run is excluded
from this contrast and reported separately.

## The contrast

**Unit.** One eligible model versus its own family's prior generation
(within-family, per Annex A.1). Cross-family results are reported side
by side and never pooled.

**Instrument.** The current probe set at the time of the event run
(v7 as of this writing; a later version is a recorded series break,
and the concept probes must keep their single-variable templates). The
concept probes are the five `concept-*` probes; the author probe
(`author-identity`) is read as recognition, separately; the negative
control (`control-fake`) is run in the same event run and read first
(Annex A.2). Three repetitions per (probe × model) cell, search
suppressed, temperature as fixed in the config.

**Outcome variables** are the detector's independent booleans per
response — `project_named`, `author_named` — and the derived
`ghost_citation`. The detector version is recorded; a detector change
between the baseline and the event run triggers a re-score of the
baseline's retained raw responses under the new version before any
comparison.

**Cell reading.** A (probe × model) cell is *positive* on a boolean
when at least two of three repetitions carry it. A cell is
*uninterpretable* when the same model's `control-fake` cell is positive
on `project_named` in the same run — the confabulation floor has risen
to the reading, and the concept cells of that model are set aside for
that run (Annex A.2), not counted for or against.

## Decision rules (fixed now)

- **R1 — Reachability supported.** At least one eligible model has at
  least one concept cell positive on `project_named`, with that model's
  control cell negative in the same run, and the same probe's cell on
  the family's prior generation negative. The result is stated per
  family; one family suffices for the existence claim.
- **R2 — Ordering supported.** For every eligible model that has any
  positive concept cell, the *first* event run showing positivity has
  `project_named` positive and `author_named` negative on that cell.
- **Counts against the claim.** Either of: (a) an eligible model's
  first positive concept cell is positive on `author_named` — whether
  with or without `project_named` — so that naming did not follow
  recognition (R2 fails, and the 2026-06-12 expectation is
  contradicted as it said it would be); (b) two eligible generations
  from different families, each with a clean control, both show no
  positive concept cell across all five concept probes by
  **2027-03-31**. Condition (b) is the reachability claim failing on
  its own terms; one eligible model at zero is *not* (b) and is
  reported as "no transition observed", because a single generation
  and a single cutoff cannot separate "unreachable" from "not yet".
- **Neither.** No eligible model enters the panel by 2026-11-30: the
  window closes empty. This is reported as such and the contrast rolls
  forward unchanged to the next eligible entry; the rules are not
  loosened to fit the data that did arrive.

Readings that satisfy R1 without R2, or R2 with a cell later reversing
to negative on a subsequent run, are reported as what they are —
reversals are recorded, not averaged away (Annex A.3).

## Confounds declared, not corrected

- **Cued recall, not free recall.** Every concept probe names the
  concept in the prompt (Annex A.4). A positive reading shows the
  model can complete from the cue; it does not show the concept is
  offered unprompted. No correction is applied.
- **Prestige and visibility.** A model may name a concept because a
  more visible source restated it. The probe cannot separate the
  ecosystem's own carriers from third-party restatement; the reading
  says the concept was reachable, not by which path.
- **Vocabulary collision.** Some of the five concept names are
  ordinary English phrases. The detector requires the project-specific form;
  a match on the generic phrase alone is not `project_named`, and the
  echo guard excludes prompt echo. Residual collision is a false
  positive risk the control cell partly bounds and the reading states.
- **Cutoff self-report.** Eligibility rests on provider-stated
  cutoffs, which are approximate and occasionally revised. The stated
  value at panel entry is the one used; a later revision is recorded
  and, if it moves the model across the 2026-06-01 line, the model's
  reading is flagged, not re-classified.

## Data and provenance

- Raw responses, detector output, model requested and model returned,
  prompt hashes: the hub's `probes/data/parametric.jsonl` (CC0). Panel
  composition per month: `probes/data/model-catalog.jsonl`.
- Baseline as of this writing: 226 parametric records, 2026-06-12 to
  2026-07-12, six panel models in five families; last event run
  2026-07-12. Under the echo-guarded detector (v2 onward) every concept
  and author cell is negative on both booleans. The 2026-06-12
  shakedown rows scored by the pre-guard detector carry positives that
  the baseline note already discounts as prompt echo; they are retained
  raw and are not the comparison baseline.
- A retrieval-channel gap on one provider (2026-08-23, permanent, key
  revocation) does not touch the parametric channel and is noted only
  so it is not mistaken for a parametric series break.
- Event runs are triggered by panel entry, detected by the monthly
  currency check and the default-tier web check; the trigger date is
  recorded with the run.

## Analysis and reporting

Analysis begins after the later of 2026-11-30 and the first eligible
model's event run, and is published as a new empirical artifact with
its own declared role by **2026-12-31** — or, if no eligible model has
entered by then, a short dated note saying so. The results artifact
reports every eligible model, every family, every cell, including the
uninterpretable ones, and states which of R1 / R2 / against / neither
obtained. It may designate itself validation evidence only if the
reading falls within the rules above; a reading the rules did not
anticipate is reported as baseline data and the rules are amended
below for the next window.

## Amendments

### 2026-10-01 — retrieval schedule ended; qwen family withdrawn

Recorded before any eligible model's event run, so none of these
changes was made after seeing contrast data. The only parametric event
run since this document was recorded is the 2026-09-20 qwen
substitution, and that model was not eligible (see below). Every cell
in that run was negative on both booleans. Panel config: hub
`probes/config/probes-v10.yaml`.

- **Retrieval cadence block no longer holds.** The weekly retrieval
  runs pre-registered for 2026-09-01 to 2026-11-30 stopped after
  2026-09-27, by author decision. Weekly samples were adding little
  information: panel swaps (v7 to v9) broke the series faster than it
  accumulated. The retrieval series 2026-06-12 to 2026-09-27 stays
  public as an archived record. As the block itself states, the
  parametric channel is unaffected, and this contrast never read
  retrieval data.
- **Panel is four families.** The qwen family is withdrawn from the
  panel. Its API was too opaque to keep the column on the panel
  selection criterion: a per-model free-quota expiry surfaced only as
  call failures and forced an off-criterion substitution on 2026-09-20.
  The qwen column therefore could not supply an eligible model, which
  needs the default-tier condition (Eligibility 2). Its parametric
  records (2026-06-12, 2026-09-20) stay in the data and in the baseline
  description above, but it can no longer contribute an eligible model.
  Condition (b) of *Counts against* is unchanged in wording. It now
  draws on four families instead of five, which makes (b) slightly
  harder to reach by 2027-03-31; this is stated, not compensated.
- Decision rules, eligibility, cell reading and reporting deadlines are
  unchanged.
