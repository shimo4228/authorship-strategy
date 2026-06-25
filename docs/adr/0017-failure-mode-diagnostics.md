Language: English | [日本語](0017-failure-mode-diagnostics.ja.md)

# ADR-0017: Failure-Mode Diagnostics — A Detector and Recovery Strategy for Each of the Three Acknowledged Failure Modes

> **Summary.** The manifesto's open question 8 names three failure
> modes the framework acknowledges but does not yet handle —
> reach without recognition (ideas diffuse but the diffusion does
> not carry the author's name), over-publication (priority captured
> early but at lower quality, with superseded versions accumulating),
> and under-investment in worked implementation (the
> doctrine-heavy, implementation-light imbalance) — and explicitly
> defers their diagnosis and recovery to a subsequent release. This
> ADR is that subsequent release. For each failure mode it records a
> diagnostic *signal* and a recovery *strategy*: reach without
> recognition is detected when the naming probe (ADR-0011) carries
> the concept but not the author, an outcome the 2026 citation
> literature makes interpretable rather than surprising — the
> parametric channel gates the retrieval channel, factual recall is
> foreseeable at design time, and recall reads back prior authority
> unequally — and is recovered by anchoring distinctive vocabulary
> densely (ADR-0010), keeping the origin claim narrow, and accepting
> that under full inversion it may be a structural price rather than a
> defect to chase; over-publication is detected from the author's own
> identifier portfolio carrying multiple superseded versions of one
> idea, and recovered by the concept-DOI-plus-version discipline
> (ADR-0001, ADR-0004); under-investment is detected from a
> doctrine-heavy, implementation-light portfolio, and recovered by
> rebalancing toward the paired worked implementation Layer 3 requires.
> A load-bearing caveat governs all three: a diagnostic is a
> *failure-detector, not a success metric*. It does not become an
> optimization target, on pain of colliding with the framework's
> rejection of attention signals as metrics (ADR-0007); honestly
> articulating one's own failure modes is itself an act of the Layer 1
> authenticity commitment, not a KPI dashboard.

## Status
accepted

## Date
2026-06-26

## Context

The framework states a strong commitment — that the strongest
authorship strategy under AI-mediated diffusion is fully inverted on
all three axes (scarcity to diffusion, exclusivity to derivation,
enclosure to openness) — and the manifesto records, as
[open question 8](../manifesto.md), three ways that commitment could
be wrong. It names the three failure modes and their bare diagnostic
intuitions, then defers the work: "A subsequent release should
articulate diagnostic signals for each failure mode and the recovery
strategy for each." Nothing in the framework has yet collected that
homework, so each acknowledged failure mode remains un-diagnosable —
the author cannot tell whether a mode has set in, and has no recorded
response if it has.

The three modes pull on different parts of the stack:

- **Reach without recognition** is the attribution-loss tension the
  manifesto calls the ghost citation *of authorship*: the ideas
  diffuse but the diffusion does not carry the author's name. This is
  the most load-bearing of the three, because it is produced by the
  very mechanism the framework relies on — the same openness that
  maximizes reach is what strips the author's name from the
  carried-forward content. The 2026 citation-mechanics and
  interpretability literature, recorded numbers-free in
  [`inspiration.md`](../inspiration.md) (the *empirical
  citation-mechanics* and *mechanistic grounding* sections), supplies
  the mechanism that makes a probe result interpretable rather than
  surprising: the parametric channel gates the retrieval channel, so a
  source's address can be cited while its author goes unnamed (the
  provenance problem); factual recall is foreseeable at design time,
  so the parametric channel's success is predictable rather than
  accidental; and recall reads back prior *authority* unequally rather
  than presence neutrally — the supply-side connection to
  [open question 9](../manifesto.md).
- **Over-publication** is the cost of the diffusion axis run too eager:
  publishing ideas earlier than an enclosure-style author would,
  capturing priority but at lower quality, so that superseded versions
  of one idea accumulate in the public record.
- **Under-investment in worked implementation** is the doctrine-heavy,
  implementation-light imbalance: the tactical layer emphasizes
  doctrine artifacts (specs, decision records, glossaries), but
  Layer 3's idea-versus-scaffold bet requires the
  abstract-doctrine-plus-worked-implementation *pair*, and a doctrine
  artifact without its paired implementation is a half-kept bet.

A diagnostic for any of these is structurally close to a *metric*, and
the framework has already ruled that a class of metrics is forbidden:
human-attention platform signals are not a success metric (ADR-0007),
because they are purchasable, off-page-gated, and orthogonal to
LLM-mediated reach. A diagnostic that quietly became a number the
author optimizes toward — author-naming rate as a target — would both
re-import the rejected metric posture and walk straight into the
reach-chasing the framework prohibits. The context that makes this ADR
safe to write is therefore the same one that constrains it: a detector
is admissible only if it stays a detector.

## Decision

Record, for each of the three failure modes open question 8 names, a
diagnostic *signal* that detects whether the mode has set in and a
recovery *strategy* for when it has — and bind all three with the
caveat that a diagnostic is a failure-detector, never a success metric.

1. **Reach without recognition.**
   - *Signal.* The naming / regurgitation probe (ADR-0011) succeeds at
     the **concept** level but fails at the **author** level: a
     distinctive coinage is reproduced while the author's name is not
     carried with it. The literature in [`inspiration.md`](../inspiration.md)
     makes this signal interpretable rather than alarming — the
     parametric channel gates the retrieval channel (so the
     concept-without-author pattern is the expected shape of a
     provenance break, not an anomaly), factual recall is foreseeable
     at design time (so a coinage's low representation places it at the
     harsh end of the recall floor by construction), and recall reads
     back authority unequally (so a first-mover idea is *expected* to
     be under-named relative to its reach). The signal is read against
     this baseline, not against an assumption that reach should carry
     the name for free.
   - *Recovery.* Anchor the distinctive vocabulary densely (ADR-0010)
     so the coinage that does survive paraphrase is bound to its
     origin everywhere it can be; keep the origin claim narrow so what
     is claimed is exactly what is genuinely new; and accept that under
     full three-axis inversion, reach without recognition may be a
     *structural price* rather than a defect to be metric-chased. The
     recovery strengthens the carriers of attribution; it does not set
     author-naming as a target to be maximized.

2. **Over-publication.**
   - *Signal.* The author's own concept-DOI and version-DOI portfolio
     carries multiple superseded versions of the same idea. This is
     self-computable from the author's identifier records; no external
     instrument is required.
   - *Recovery.* Lean on the discipline that already guards version
     sprawl: the concept-DOI canonical with version discipline
     (ADR-0001, ADR-0004), which fixes the durable claim at the concept
     level and keeps superseded versions from polluting the public
     record. Prefer fewer, durable claims over many provisional ones —
     the recovery is restraint at deposit time, not retroactive
     deletion.

3. **Under-investment in worked implementation.**
   - *Signal.* The author's DOI portfolio is doctrine-heavy and
     implementation-light — load-bearing doctrine artifacts outnumber
     their paired worked implementations. This too is self-computable
     from the portfolio; Layer 3 supplies the criterion (the
     abstract-doctrine-plus-worked-implementation pair) against which
     the imbalance is read.
   - *Recovery.* Rebalance toward worked implementation so that each
     load-bearing doctrine artifact has its paired implementation
     (Layer 3, idea-versus-scaffold separation). The recovery is to
     close pairs, not to stop writing doctrine.

4. **The load-bearing caveat: a detector, not a metric.** Each
   diagnostic above is a **failure-detector**, not a **success
   metric**. None of the three becomes an optimization target. The
   framework continues to refuse author-naming as a KPI (ADR-0007):
   the naming probe detects *when reach has decoupled from
   recognition*, it does not become a number the author pushes upward;
   the portfolio counts detect *when version sprawl or
   doctrine-implementation imbalance has set in*, they do not become
   dashboards optimized for their own sake. Promoting any of these to
   a target would re-import the purchasable, off-page metric posture
   ADR-0007 rejects and would re-create the reach-chasing the framework
   prohibits (Goodhart: a measure optimized as a target ceases to
   measure). Honestly articulating one's own failure modes is itself
   consistent with the Layer 1 authenticity commitment — naming where
   the strategy can fail is an authenticity act, not a performance
   indicator.

## Alternatives Considered

**Leave the failure modes in the manifesto un-operationalized.** Keep
open question 8 as a recorded acknowledgement and add no diagnostics or
recoveries. Rejected: the manifesto itself defers the modes to a
subsequent release rather than treating acknowledgement as sufficient,
and leaving them un-diagnosable forfeits the recursive self-application
that is the framework's own test — a framework that records its failure
modes but cannot tell when one has set in has not yet applied its
diffusion discipline to its own operation. The whole value of naming a
failure mode is lost if no signal can detect it.

**Turn the diagnostics into a scored dashboard / success metric.**
Aggregate the three signals into a standing score the author tracks and
optimizes. Rejected: this collides directly with ADR-0007's rejection
of attention signals as success metrics and with the Layer 1
anti-monetization commitment. A recovery-triggering detector that
becomes an optimization target stops detecting and starts being gamed —
author-naming rate optimized as a goal is exactly the reach-chasing the
framework forbids. The detector must remain a tripwire, read
occasionally to ask "has a failure mode set in?", not a number whose
upward movement is the objective.

**Treat reach without recognition as a bug to be fixed by pushing
author-naming harder.** Respond to the ghost-citation signal by
aggressively promoting the author's name into every diffusion surface
until the naming probe carries it. Rejected: that is the
monetization-adjacent reach-chasing the framework prohibits, and open
question 8 explicitly leaves open whether reach without recognition is
even fixable under full inversion — it may be the structural price of
the openness that produces the reach, not a defect with a fix. The
admissible response strengthens the *carriers* of attribution
(anchor-densely, narrow origin claim) and otherwise accepts the
tension the framework records but does not resolve.

## Consequences

**Positive.**

- Each acknowledged failure mode now has a recorded detector and a
  recorded recovery, so the framework can answer "has this mode set
  in, and what is the response" rather than merely listing the modes it
  fears. Open question 8's deferred homework is collected.
- The recursive self-application the framework stakes its credibility
  on is extended to its own failure surface: the framework now applies
  its diffusion discipline to detecting where that discipline fails,
  not only to propagating where it succeeds.
- Two of the three signals are self-computable from the author's own
  identifier portfolio, needing no external instrument; only the
  reach-without-recognition signal needs the probe (ADR-0011), and that
  instrument already exists. The diagnostics add no new measurement
  apparatus.
- The detector-not-metric caveat keeps the diagnostics inside the
  framework's existing metric discipline (ADR-0007) rather than
  re-opening the attention-signal question the framework already
  closed.

**Negative.**

- The reach-without-recognition signal inherits the unresolved tension
  of open question 8: detecting that reach has decoupled from
  recognition does not tell the author whether the decoupling is
  fixable or structural, and the recovery deliberately stops at
  strengthening the carriers — an adopter wanting a guarantee that the
  name will be carried will not find one here, because the framework
  does not have one.
- The detector-not-metric boundary is a discipline, not a mechanism:
  nothing structurally prevents an author from quietly optimizing a
  detector into a target. The caveat states the line; holding it is a
  standing act of judgment, and a lapse re-imports exactly the metric
  posture ADR-0007 rejects.
- The over-publication and under-investment recoveries are restraint
  and rebalancing — judgment calls without mechanical thresholds. "How
  many superseded versions is too many" and "how doctrine-heavy is too
  doctrine-heavy" are read against Layer 3 and the version discipline,
  not against a number, so a mis-read in either direction (over-pruning
  durable claims, or tolerating real sprawl) is possible.

## Lineage

Originating trigger: the manifesto's [open question 8](../manifesto.md)
explicitly defers, to a subsequent release, the articulation of a
diagnostic signal and a recovery strategy for each of the three failure
modes it names — reach without recognition, over-publication, and
under-investment in worked implementation. This ADR is that subsequent
release, collecting the deferred homework rather than introducing a new
decision: it pairs each named mode with a detector and a recovery drawn
from instruments and disciplines the framework already holds.

The reach-without-recognition signal reuses the naming / regurgitation
probe of ADR-0011 and is read against the mechanism the 2026 citation
and interpretability literature supplies — kept numbers-free in the
body and recorded with its external findings in
[`inspiration.md`](../inspiration.md) (the *empirical
citation-mechanics* and *mechanistic grounding* sections): a parametric
channel that gates the retrieval channel, factual recall that is
foreseeable at design time, and recall that reads back prior authority
unequally, the last connecting to the supply-side
[open question 9](../manifesto.md). Specific instances abstracted out
of the body per repository convention: the probe is run against named
frontier chat models; the identifier portfolio is the author's set of
concept and version DOIs minted by the program's DOI service and
mirrored on a scholarly identifier record; the external mechanism
findings are published studies cited by their identifiers in the
lineage document, never in this body. The diagnostics are normative;
the instruments that realize them are current instances.

This decision anchors to ADR-0007 (the metric distinction that keeps a
detector from becoming a success metric), ADR-0011 (the two-channel
probe that supplies the reach-without-recognition signal), ADR-0001 and
ADR-0004 (the concept-DOI canonical and version discipline that guard
over-publication), ADR-0010 (anchor-densely, the recovery for the
attribution carriers), and Layer 3 (the idea-versus-scaffold pair
against which under-investment is read and recovered). It collects the
homework the manifesto's open question 8 defers and connects, through
the unequal-recall mechanism, to open question 9.
