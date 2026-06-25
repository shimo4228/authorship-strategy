Language: English | [日本語](0018-claim-falsifiability-criterion.ja.md)

# ADR-0018: Origin-Claim Falsifiability — Test a Priority Claim Against Prior Art Before Publishing It in a Durable Artifact

> **Summary.** The framework already practices an origin-claim scope
> discipline informally (see [`glossary.md`](../glossary.md)): it keeps a
> priority claim narrower than the prior art — "convergence, not
> derivation," "first to record X" rather than "the originator of X." What
> it never wrote down is the *procedure* that enforces the discipline. An
> external agentic novelty-assessment system independently implemented the
> verification logic the discipline assumes: it judges a submission's
> novelty by grounding every assessment in retrieved real prior work —
> extracting contribution claims, retrieving prior art, building a
> taxonomy, comparing against cited evidence — rather than letting a model
> pronounce novelty unaided. This ADR codifies the informal habit into a
> check any author can run: before publishing an origin claim in a durable
> artifact, run a semantic / retrieval search for prior work that would
> *refute* the claim; a claim that survives only because it was never
> tested — one that is not refutable, or one already anticipated by located
> prior work — is rescoped to its narrowest defensible form (from
> "originator" to "first to record," from "invented" to "re-articulated in
> a new substrate"). The criterion is falsifiability: an origin claim worth
> making is one that a prior-art search could in principle refute and did
> not. Stating it as a written procedure makes a private habit adoptable.
> The procedure only ever narrows a claim; it is a humility instrument
> consistent with Layer 1 authenticity and the vocabulary discipline
> ([ADR-0010](0010-vocabulary-discipline.md)), and the framework claims no
> priority over the external system — it internalizes the check, it does
> not claim to have originated it.

## Status
accepted

## Date
2026-06-26

## Context

The framework's identifier and vocabulary layers protect a priority claim
*structurally* — a content-derived stamp of when it was made
([ADR-0013](0013-intrinsic-identifier-layer.md)), a registered canonical
([ADR-0001](0001-concept-doi-canonical.md)), a distinctive vocabulary that
survives paraphrase ([ADR-0010](0010-vocabulary-discipline.md)). But the
*content* of a priority claim — how broad it is — has been governed only by
an informal habit. The framework calls this habit the **origin-claim scope
discipline** (see [`glossary.md`](../glossary.md)): the claim is kept
narrower than the prior art. It is practiced everywhere in the program's
own artifacts — the openness axis is recorded as "convergence, not
derivation" against an independently-arrived-at policy and licensing
convergence; coinage is anchored densely against prior art rather than
asserted as invention ([ADR-0010](0010-vocabulary-discipline.md)); claims
are written as "first to record" rather than "originator."

The discipline assumes a verification step it never specified. To keep a
claim narrower than the prior art, the author must *know* the prior art —
must have searched for the work that would refute the claim. Left informal,
that step is performed by memory and good intention, both of which drift
and neither of which is adoptable by another author. An unwritten habit
cannot be run by anyone else, and cannot be a check the author is held to.

An external strand made the verification mechanism concrete. An agentic
novelty-assessment system judges a submission's novelty by grounding every
assessment in retrieved real prior work — extracting contribution claims,
retrieving prior art, building a taxonomy, and comparing against it with
cited evidence — rather than letting a model pronounce novelty unaided (see
the citation-mechanics section of [`inspiration.md`](../inspiration.md)).
It demonstrates that an externally-computed, evidence-grounded novelty
check is *feasible*. Two caveats bound what it grounds. First, the system
concerns peer-review novelty assessment and does *not* itself state this
discipline — the discipline is the framework's own reading of it; the
system is cited only as grounding that an evidence-grounded check can be
built, not as authority for the framework's procedure. Second, its reported
deployment is a scale figure, not a measured accuracy result, so it is
cited for feasibility, never for any accuracy number.

A durable artifact raises the stakes and makes the verification
load-bearing. A priority claim placed in a citable record
([ADR-0001](0001-concept-doi-canonical.md)) or carried by the intrinsic
identifier ([ADR-0013](0013-intrinsic-identifier-layer.md)) is costly to
retract once it has diffused; an over-broad claim that enters such a record
and is later refuted damages the very authenticity (Layer 1) the framework
rests on. The manifesto names the adjacent risk directly: a framework that
promotes itself under its own tactics can beg the question
([manifesto open question 5](../manifesto.md)). An untested origin claim is
exactly that — a claim pre-validated by its author rather than tested
against the world.

## Decision

Codify the informal origin-claim scope discipline into a **falsifiability
procedure** run before any origin claim enters a durable artifact.

1. **Search for refutation, not confirmation.** Before publishing an origin
   claim in a durable artifact, run a semantic / retrieval search for prior
   work that would make the claim false or already-anticipated. The
   question is "what located prior work refutes this," not "what supports
   it" — the search targets the claim's defeaters.

2. **Apply the falsifiability criterion.** An origin claim worth publishing
   is one that a prior-art search could in principle refute and did not. A
   claim that survives only because it was never tested fails the
   criterion: either it is not refutable even in principle (an unfalsifiable
   claim), or the search surfaces prior work that already anticipates it.

3. **Rescope, do not delete.** A failing claim is downgraded to its
   narrowest defensible form, not dropped: from "originator" to "first to
   record," from "invented" to "re-articulated in a new substrate," from
   "derivation" to "convergence." The procedure only ever *narrows* a
   claim; it never licenses a broader one. This is the same humility the
   vocabulary discipline ([ADR-0010](0010-vocabulary-discipline.md))
   applies to coinage, now applied to priority.

4. **A binary check feeding a human rescope, not a score.** The criterion
   is a pass / fail defensibility judgment that the author acts on by
   rescoping — not a ranking, threshold, or numeric novelty gate. Stating
   it as a written procedure is what makes a private habit adoptable:
   another author can run the same check in their own ecosystem, and the
   author can be held to it.

The framework claims no priority over the external system that demonstrated
the verification mechanism. It internalizes the check the system makes
feasible; it does not claim to have originated the check. Applying the
procedure to itself, the framework's own claim here is the narrow one — it
codifies an existing discipline into a stated procedure, it does not claim
to have invented evidence-grounded novelty checking.

## Alternatives Considered

**Keep the discipline informal.** Continue scoping claims by the author's
memory of the prior art, as the program has done. Rejected: an unwritten
habit is not adoptable — no other author can run it — and it drifts, since
nothing records what was searched or held the author to a refutation step.
Codifying the habit into a stated procedure turns a private intention into
a check others can run and the author can be measured against, which is the
framework's own creative-reuse-over-investigation preference applied to its
discipline.

**Adopt an automated novelty-scoring gate that blocks publication below a
threshold.** Let an evidence-grounded system emit a novelty score and
refuse to publish claims that score too low. Rejected: a score becomes a
target, and an authorship strategy that optimizes a novelty number collides
with the metric-rejection commitment
([ADR-0007](0007-human-attention-signals-not-a-metric.md)) — the framework
treats authenticity as a value, not a number to maximize. The criterion is
deliberately a binary defensibility check feeding a human rescope decision,
not a score; the search informs the author, it does not adjudicate.

**Assert priority broadly and let challenges narrow it post hoc.** Publish
the strongest claim and rely on readers or reviewers to contest it,
narrowing only when challenged. Rejected: this inverts the burden of proof
and risks an unfalsifiable or over-broad claim entering a durable,
citable record where retraction is costly and the diffused copies already
carry the over-broad claim. The framework's authenticity layer cannot rest
on claims that were never tested before they became expensive to withdraw.

## Consequences

**Positive.**

- The origin-claim scope discipline graduates from a private habit to an
  adoptable check: a written procedure another author can run in their own
  ecosystem, and one the present author can be held to — consistent with
  the framework's preference for creative reuse over private investigation.
- Origin claims entering durable, citable records are tested before they
  are costly to retract, protecting the Layer 1 authenticity the framework
  rests on against over-broad self-validation.
- The procedure operationalizes the framework's answer to the
  begging-the-question risk ([manifesto open question 5](../manifesto.md)):
  the recursive application of the framework to itself is kept honest by
  requiring every origin claim — including the framework's own — to survive
  a prior-art refutation search rather than to pre-validate itself.
- It composes with the vocabulary discipline
  ([ADR-0010](0010-vocabulary-discipline.md)): coinage anchored densely
  against prior art and claims scoped narrower than prior art are the same
  humility applied to terms and to priority, so an adopter learns one
  posture, not two.

**Negative.**

- The refutation search depends on what is findable. Prior art that is
  unindexed, paraphrased away, or in a language the search did not cover
  can escape it, so a claim can pass and still be anticipated by work the
  search could not surface. The check lowers the risk of an over-broad
  claim; it does not eliminate it.
- "Narrowest defensible form" is a human judgment with no mechanical test.
  An over-cautious author under-claims genuine priority; an over-confident
  one rescopes too little. The procedure relocates the judgment, it does
  not remove it.
- Running a refutation search before every durable origin claim is a
  standing cost. The procedure is justified only where the claim enters a
  durable, citable record — where retraction is expensive — not for
  ephemeral statements where withdrawal is free; applying it everywhere
  would tax low-stakes writing for no priority at risk.

## Lineage

Originating trigger: the framework had practiced an origin-claim scope
discipline informally across its own artifacts — keeping priority claims
narrower than the prior art ("convergence, not derivation" against an
independently-arrived-at openness convergence; "first to record" rather
than "originator") — but had never written down the verification step the
discipline assumes. An external agentic novelty-assessment system,
encountered while surveying the citation-mechanics literature, supplied the
missing mechanism: it grounds every novelty judgment in retrieved prior
work rather than letting a model pronounce novelty unaided, demonstrating
that an evidence-grounded novelty check is feasible. This ADR records the
codification of the informal habit into a falsifiability procedure,
prompted by that demonstration.

Specific instances abstracted out of the body per repository convention:
the external system is an agentic peer-review novelty-assessment system
published as a 2026 preprint and recorded in
[`inspiration.md`](../inspiration.md); it concerns peer-review novelty
assessment and does not itself state this discipline, and its reported
deployment is a scale figure, not a measured accuracy result — it is cited
for the feasibility of an evidence-grounded check, never for an accuracy
number. The durable-artifact substrates abstracted here are the registered
concept-DOI canonical ([ADR-0001](0001-concept-doi-canonical.md)) and the
intrinsic content-derived identifier
([ADR-0013](0013-intrinsic-identifier-layer.md)). This decision extends
[ADR-0010](0010-vocabulary-discipline.md) (the vocabulary discipline whose
origin-claim scope clause it operationalizes), rests on Layer 1
authenticity, complements
[ADR-0007](0007-human-attention-signals-not-a-metric.md) (the
metric-rejection commitment that keeps the criterion binary rather than
scored), and is anchored to the manifesto's
[open question 5](../manifesto.md) (the begging-the-question risk the
procedure guards against) and [open question 9](../manifesto.md) (the
prior-authority gating that is the adjacent supply-side tension), with the
external grounding recorded in [`inspiration.md`](../inspiration.md) and the
discipline defined in [`glossary.md`](../glossary.md).
