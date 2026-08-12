Language: English | [日本語](0023-empirical-layer-role.ja.md)

# ADR-0023: Empirical-Layer Role — Reference Baseline as Primary Role, Case-Study Narrative Bounded, Validation Evidence Only by Explicit Design

> **Summary.** The manifesto's open question 7 asks which of three
> roles the framework's empirical layer plays — validation evidence,
> reference baseline, or case study — and records the current state
> as an intentional hybrid of the latter two, held open "given the
> limited time series." This ADR closes the question by structuring
> the hybrid rather than collapsing it. The three candidate roles
> differ less in content than in the strength of the claim the
> layer would assert, and the cost of the ambiguity is that no
> artifact declared how strong a claim it was making. The decision:
> **reference baseline** is the layer's primary role and the
> minimum every artifact must satisfy (reproducible data or a dated
> record, a documented method, stated limitations); **case-study
> narrative** is a bounded secondary role — interpretive notes
> attached to specific artifacts and marked as interpretation,
> never elevated into effect claims; **validation evidence** is a
> role the layer declines to claim — no artifact is read as
> validating the framework's normative claims unless it was
> designed as an experiment before the fact and is explicitly
> designated as validation evidence at publication, a role upgrade
> that is never silent. Declining the validation role does not
> weaken the standing rule that empirical observation may trigger
> revision of normative decisions: prompting a revision requires
> only a preliminary observation — the strength the layer already
> provides — while validating the framework would require evidence
> from an artifact designed as an experiment, which the layer does
> not claim to hold. The preliminary-observation tone remains the
> floor under everything the layer asserts.

## Status

accepted

## Date

2026-08-12

## Context

The manifesto's [open question 7](../manifesto.md) names three roles
the empirical layer could play and observes that each demands a
different design: *validation evidence* requires the layer to be
designed as an experiment (pre-versus-post contrasts, controlled
comparisons, replication); *reference baseline* requires only that
the data be reproducible and the method documented; *case study*
requires interpretive narrative rather than raw data. It records the
current state as a hybrid of reference baseline and case study, and
defers formalization as "acknowledged and intentional, given the
limited time series."

Two developments since the question was posed changed what the
deferral costs.

**The layer grew genres the hybrid does not place.** At the time the
question was written, the layer held a single traffic baseline. It
now holds four artifact genres: the traffic baseline (data with
interpretive notes), a probe baseline (the first output of the
measurement instrument of
[ADR-0011](0011-two-channel-probe-protocol.md)), an
external-literature note (readings of others' published findings
against the framework's premises), and an intervention timeline (the
public projection of
[ADR-0014](0014-implementation-tracking-two-tier-ledger.md)'s
ledger). Each genre entered the layer by negotiating its own framing
ad hoc in the layer's index
([`empirical/README.md`](../empirical/README.md)) — "a different
genre," the index says twice — because the layer had no recorded
rule for what role a new artifact takes. Meanwhile the layer's
outputs became load-bearing elsewhere: the failure-mode diagnostics
of [ADR-0017](0017-failure-mode-diagnostics.md) read against the
layer's instruments, and the accounting split of
[ADR-0022](0022-audience-layer-split.md) defaults measurement
artifacts into its doctrine layer — the accounting layer that holds
the doctrine repositories and papers, as distinct from the essay
layer. A layer other decisions read from should say what strength
of claim it makes.

**The deferral rationale turns out not to bind.** The question was
held open pending a longer time series, but the three roles differ
in the strength of the claim the layer asserts, not in the amount of
data it holds. A longer series would sharpen the baseline; it would
not, by itself, entitle the layer to a stronger role. Only a change
of design — an artifact built as an experiment before the fact —
would do that. The role question is therefore answerable now, and
leaving it open has a live cost: an artifact that does not declare
how strong a claim it makes can be over-read, and the most likely
over-reading is the one the layer must never invite — an
interpretive note mistaken for validation evidence.

Two standing conventions bound any answer and are treated here as
fixed premises, not as matters open for decision. First, every claim
the layer makes is framed as **preliminary observation** — the tone
convention is the floor under all of the layer's assertions. Second,
the framework maintains that **evidence may revise principles**: when
an empirical observation contradicts a normative decision, the
decision record is revised rather than the observation suppressed.
Any role assignment that would cut that flow — or that would inflate
observations past the tone floor — is out of bounds by construction.

## Decision

The empirical layer's role is formalized as a structured hybrid:

1. **Reference baseline is the primary role, and the minimum bar.**
   The layer exists so that subsequent releases and adopting authors
   can interpret their own observations against a documented
   reference point. Every artifact in the layer must satisfy the
   baseline minimum: reproducible data or a dated record, a
   documented method, and stated limitations — the third condition
   added by this ADR from the layer's own standing practice, beyond
   the two the manifesto's question names. An artifact that cannot
   meet this bar does not enter the layer as an artifact of its own.
   An observation short of the bar is not thereby pushed into
   undocumented channels: it is recorded inside an existing
   artifact's stated limitations — as the layer already records its
   pre-protocol single-window tests — or it waits in the program's
   working records until it can meet the bar.

2. **Case-study narrative is a bounded secondary role.** Interpretive
   narrative is admitted — it is what makes a baseline usable, by
   recording which patterns the author found noteworthy — but it is
   attached to specific artifacts, marked as interpretation, and
   never elevated into an effect claim. The layer as a whole is not
   reframed as a qualitative case study; the narrative serves the
   baseline, not the reverse. This narrows the index's standing
   whole-layer reading instruction — that the layer be read "as a
   case study with explicit limitations" — to the per-artifact
   form; the index sentence is revised in the same change that
   records this decision.

3. **Validation evidence is a role the layer declines to claim.** No
   artifact in the layer is read as validating the framework's
   normative claims unless both of the following hold: the artifact
   was *designed as an experiment before the fact* (a pre-specified
   contrast or a pre-registered protocol testing a stated claim),
   and it is *explicitly designated* as validation evidence at
   publication. The designation rule is the role-level analog of
   ADR-0011's visible series break: a role upgrade is never silent.
   A pre-specified measurement instrument is not by itself a
   pre-specified contrast: the probe protocol of ADR-0011 fixes its
   prompts, controls, and detection rules in advance, which
   disciplines the measurement, but no test of a normative claim was
   specified before the data — its outputs therefore enter the layer
   as baseline data, not as validation evidence. Until an artifact
   meets both conditions, everything the layer asserts stays at
   preliminary-observation strength.

4. **Each artifact's role is declared in the layer's index.** The
   index declares, for every artifact, which role it serves —
   baseline data, interpretive note, intervention record, or
   external-literature note — so that a reader meets the strength of
   the claim before the content. The index is revised to carry these
   declarations in the same change that records this decision, and
   it is reconciled against this ADR whenever an artifact enters the
   layer and at each release. The ad hoc per-genre negotiation ends;
   a new artifact enters by declaring its role against this ADR.

5. **The two genres outside the original triad are placed.** The
   intervention timeline is the baseline's *methods companion*: it
   supplies the intervention dates a future designed contrast would
   need, which makes it infrastructure for a possible
   validation-evidence artifact while claiming no validation role
   itself. The external-literature note reports *others'* evidence
   at the strength the cited literature itself claims, attributed;
   it contextualizes the framework's premises and never raises the
   strength of the layer's own observations.

6. **The revision flow is unchanged.** Declining the validation role
   does not weaken the standing rule that empirical observation may
   trigger revision of normative decisions. The two uses of the
   layer demand different strengths: *prompting* a revision requires
   only a preliminary observation — the strength ADR-0017's
   diagnostics already run on — while *validating* the framework
   would require evidence from an artifact designed as an
   experiment. A preliminary observation that contradicts a
   normative decision is exactly as actionable after this ADR as
   before it.

## Alternatives Considered

**Formalize the layer as validation evidence.** Redesign the layer as
an experiment so its observations can support effect claims.
Rejected: the contrasts an experiment needs were foreclosed before
observation began — the layer's own limitations record that the
tactics were deployed before the data window opened, so
pre-versus-post comparison cannot be reconstructed retroactively —
and a single-author ecosystem cannot supply controlled comparison or
replication on its own. Worse, committing the layer to producing
validation would create standing pressure to find effects, which is
the posture the framework's metric discipline
([ADR-0007](0007-human-attention-signals-not-a-metric.md),
ADR-0017) exists to refuse. The honest availability of this role is
by *design upgrade* (Decision 3), not by reframing existing data.

**Formalize the layer as a pure reference baseline and expel
interpretation.** Strip the interpretive notes so the layer carries
only data and method. Rejected: the notes are what make the baseline
usable to an adopting author — data without a record of which
patterns the author found noteworthy pushes the interpretation into
undocumented channels, where nothing bounds how strongly it reads.
The existing artifacts already interleave data and reading; the
workable discipline is marking the boundary, not policing it out.

**Formalize the layer as a case study.** Accept that N=1 observation
is qualitative and reframe the layer as interpretive narrative.
Rejected: it demotes the layer's most load-bearing content — the
reproducible traffic series and the probe protocol's append-only
record — to illustration. A case-study framing invites the reading
that the data was selected to illustrate the framework, which is
precisely backwards: the layer's value to an adopting author is that
the data is collected by a documented method regardless of what it
shows, including the near-zero human-arrival numbers the framework
publishes even though they cut against its own legibility.

**Keep the intentional hybrid unformalized.** Leave open question 7
open, as the manifesto does. Rejected: the deferral rationale does
not bind (a longer time series changes what the data shows, not what
role the layer may claim), and the ambiguity's cost has grown with
the layer — four genres negotiating their framing ad hoc, and
downstream decisions reading from a layer that never fixed how
strong its claims are. The manifesto holds that the framework is
improved by articulating its open questions, not by suppressing
them; the same discipline requires closing a question once it is
answerable.

## Consequences

**Positive.**

- How strong a claim each artifact makes is declared before its
  content is read: each artifact's role is stated in the layer's
  index, so an interpretive note cannot be mistaken for validation
  evidence by a reader who follows the layer's own signage.
- New artifacts have an entry procedure instead of an ad hoc
  negotiation: meet the baseline minimum, mark interpretation, and
  claim the validation role only by prior design plus explicit
  designation.
- The upgrade path is explicit rather than foreclosed: the layer can
  come to hold validation evidence, but only by before-the-fact
  design — the role's availability is priced, not denied.
- The revision flow is protected in writing: a preliminary
  observation remains sufficient to trigger normative revision, so
  formalizing the layer's modesty cannot be used to insulate the
  framework from its own evidence.
- Open question 7 is closed by a recorded decision, completing the
  pattern set by the manifesto's fourth and eighth
  [open questions](../manifesto.md) — deferred homework collected by
  a later decision record.

**Negative.**

- The framework continues to hold its central claims unvalidated by
  its own empirical layer, and this ADR makes that legible rather
  than fixing it. An evidence-minded reader will find the layer's
  strongest artifact is still a baseline. The framework accepts this
  as an honesty cost: the alternative was asserting a strength the
  design cannot carry.
- Per-artifact role declaration is a small standing editorial
  obligation, and a lapse reintroduces locally the ambiguity this
  ADR removes globally. The reconciliation trigger (Decision 4)
  bounds the lapse window; it does not eliminate it.
- The entry bar can displace: an observation that cannot meet it is
  carried in an existing artifact's limitations or held back in
  working records, and holding it back trades documentation for
  discipline — a narrower version of the displacement cost the
  pure-baseline alternative was rejected for, reduced but not zero.
- The boundary between an interpretive note and an effect claim is a
  judgment call, not a mechanical test — the same shape of
  discipline ADR-0017 accepts for its detector thresholds. A
  mis-read in either direction (over-hedging genuine signal, or
  letting narrative drift into causation) remains possible.
- Declining the validation role may read, to an adopter seeking
  proof, as the framework insulating itself against test. The
  response is the explicit upgrade path and the unchanged revision
  flow, not a softer claim — but the reading is a real legibility
  cost, of the same kind ADR-0007 accepted.

## Lineage

Originating demand: the manifesto's open question 7, which names the
three candidate roles, records the reference-baseline-plus-case-study
hybrid as intentional, and leaves formalization open. The question
was taken up in 2026-08, when a review of the framework's remaining
deferred questions found the deferral rationale no longer binding
and the ambiguity's cost grown with the layer; this ADR is the
decision that followed. The implementation-tracking decision's own
record (ADR-0014, and the decision-index narrative describing it)
noted that its review "bears on the open questions about the
empirical layer's role"; that forward reference is settled here.

The decision draws its premises from the layer's own
self-description — the empirical index
([`empirical/README.md`](../empirical/README.md)) already states the
preliminary-observation tone, the reference-baseline intent, and a
"case study with explicit limitations" reading instruction — and
formalizes the first two as the layer's recorded role while
narrowing the third from a whole-layer instruction to per-artifact
interpretive notes (Decision 2). The framing of the roles by the
strength of claim they assert follows the instrument discipline of
ADR-0011 (whose visible-series-break rule is the model for the
never-silent role upgrade), the detector-not-metric caveat of
ADR-0017 (whose diagnostics run at exactly the
preliminary-observation strength this ADR preserves for the
revision flow), the two-tier ledger of ADR-0014 (whose public
projection is the intervention-record genre placed by Decision 5),
and the layer-scoped accounting of ADR-0022 (which defaults
measurement artifacts into the doctrine layer this ADR governs).

This decision closes the manifesto's open question 7. It changes the
empirical layer's recorded role and revises its index accordingly —
the whole-layer reading instruction narrowed by Decision 2, the
per-artifact role declarations added by Decision 4 — while no
existing artifact is reclassified out of the layer, and the tone
convention and revision flow it rests on are premises it preserves,
not rules it introduces.
