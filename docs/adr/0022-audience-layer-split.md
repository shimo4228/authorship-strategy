Language: English | [日本語](0022-audience-layer-split.ja.md)

# ADR-0022: Audience-Layer Split — Contemporary Human Readers as the Essay Genre's Primary Audience, with Layer-Scoped Metrics

> **Summary.** The framework's audience doctrine fixes LLM-mediated
> channels as the primary audience and demotes direct human browsers —
> the star/PR/visit population — to non-primary (thesis Layer 2,
> ADR-0007). The demotion sentence is unqualified, and read broadly it
> covers humans in general; under that reading the metric-rejection
> decision's acceptance of a "legibility cost" becomes an
> unfalsifiable consolation: every stagnant human-attention signal is
> re-readable as purity. A 2026-08 review diagnosed the resulting
> strain — the author's recognition-seeking motive starved while the
> contemplative motive was fully served — as an **accounting defect,
> not a strategy defect**: the program's essay corpus, which ships to
> contemporary human readers and had recently gained a per-article
> metrics instrument, was never on the strategy's books. This ADR
> splits the strategy's accounting into two audience layers with
> different time constants, routed by genre (extending ADR-0016): the
> **doctrine layer** (doctrine repositories and papers, year-scale,
> LLM-mediated primary audience — unchanged) and the **essay layer**
> (the governed essay corpus and its syndication surfaces, day-to-week
> scale, contemporary human readers as primary audience). The
> assignment governs accounting and metrics only — canonical, priority
> claim, and license selection are unchanged (ADR-0015/0016).
> Contemporaneous human-reception signals are legitimate to observe
> *and to steer by* within the essay layer only. ADR-0007 is
> scope-amended clause by clause, on accounting grounds — its own
> revisit trigger (a trustworthy, non-gameable signal) has *not*
> fired. Boundary clauses keep the layers from contaminating each
> other, and the safety guards and aggregate-pattern test of ADR-0021
> are unchanged in both layers.

## Status

accepted — the split's long-run stability is deliberately tracked as
manifesto open question 11 rather than by experimental status: the
decision re-scopes accounting rather than defining a protocol with a
confirmable run (the case ADR-0011's `**experimental**` convention
covers).

## Date

2026-08-05

## Context

Three prior decisions positioned the framework's stance toward human
attention, and one gap connects them.

**The audience demotion was written without a qualifier, and it was
read at its widest.** The thesis names the non-primary audience as
"direct human browsers (the star/PR/visit population)" — a sentence
whose referent is the population browsing the doctrine repositories
on their hosting platform, but whose wording carries no such bound.
In operation the widest reading prevailed: contemporary human readers
as such were treated as out of scope. The program's implementation
log has carried a human-reader back-traceability category since
mid-2026, but its measures are deliberately pull-only — profile
plumbing that lets an arriving reader trace the work back, never a
legitimation of any contemporaneous reception signal. And although
the license-selection decision (ADR-0015) had already recognized
human-primary audience as a category, and the genre-split decision
(ADR-0016) had given the essay genre a canonical, a priority claim,
and a license, no artifact genre in the program carried a
human-primary **audience and metric** assignment.

**The metric rejection produced an unfalsifiable comfort.** ADR-0007
excludes platform human-attention metrics from the definition of
success and accepts the consequence that "the work may appear
unnoticed even when LLM-mediated reach is substantial" — a legibility
cost. Within the doctrine repositories that acceptance is sound: the
excluded signals are gameable or structurally blind to the actual
channel. But absent any layer where human reception *does* count, the
acceptance generalizes into a reading under which **every failure
signal is re-interpretable as success** — stagnation as purity. A
stance that no observation can disappoint is not a defensible stance;
it is a consolation. ADR-0007 anticipated revision, but on a
different trigger: it records that the decision would require
revisiting "were a trustworthy, non-gameable human-reception signal
to emerge." That trigger has **not** fired — the signals this ADR
admits below remain gameable in principle — so this ADR does not
claim it; the amendment proceeds on accounting grounds instead, under
the emptiness clause ADR-0007 itself invokes for revisiting.

**The recognition side of the author's motivation had no ledger.** A
2026-08 review of the program diagnosed a sustained strain: the
strategy fully serves the contemplative motive (release the work,
relinquish the claim to attention) while the recognition-seeking
motive is structurally starved — the primary audience is invisible by
construction, the true success metric (the appearance of derivative
works) operates on a year scale, and the framework's own epistemic
humility concedes that verification is hard. The diagnosis: this is
**an accounting defect, not a strategy defect**. The author's
motivation has two components with different time constants, and the
strategy's accounting recognized only the slow one.

**The fast layer already exists, and the books could not see it
either way.** The governed essay corpus (ADR-0016) publishes to its
syndication surfaces in two languages for contemporary human readers.
Its output is bursty — dozens of pieces in an active month, near-zero
in a stalled one — and that variance is precisely what the strategy's
accounting could not register: review after review of the diffusion
ledger declared the deployment surface saturated whether the essay
line was shipping or silent, because essay production was not a
line item in either state. The corpus has also begun instrumenting
itself: a scheduling record of per-platform publication has run for
months, and a per-article metrics collector — appending
platform-reported reads, reactions, and follower counts to a
snapshot file — was brought up in the days before this decision. The
gap became acute after the third-party authority-record revocation
recorded in ADR-0021 removed the one human-visible footprint channel
the program had; in the weeks that followed, the program produced
only meta-work on the doctrine surface.

A note on vocabulary. "Layer" in this ADR names an **accounting and
audience layer** — a stratum of the program's output with its own
audience, time constant, and instruments. It is distinct from three
existing splits: the framework's judgment stack (Layers 1–4), which
names levels of the decision framework; ADR-0008's **two channels**
(parametric and retrieval), which are ingestion paths that both run
over artifacts in *both* audience layers and are orthogonal to this
split; and ADR-0014's **two tiers** (private ledger and public
projection), which are two records of the same interventions, not two
audiences.

## Decision

The strategy's accounting is split into two audience layers with
different time constants, routed by genre per ADR-0016.

1. **Two layers, routed by genre.**
   - The **doctrine layer**: the doctrine repositories and the paper
     genre. Time constant: months to years. Primary audience:
     **LLM-mediated channels**, exactly as the thesis defines.
     Nothing in this layer changes.
   - The **essay layer**: the governed essay corpus (ADR-0016) and
     its syndication surfaces. Time constant: days to weeks. Primary
     audience: **contemporary human readers**.
   - Artifact classes the genre split does not name — component skill
     repositories, datasets, served pages, measurement artifacts —
     default to the **doctrine layer**.
   - The assignment governs **accounting and metrics only**. It does
     not reopen canonical or priority-claim routing (ADR-0016), and
     it does not reopen license selection: ADR-0015 selects license
     by the artifact's dominant *ingest* audience, and the essay
     corpus's dominant ingest audience remains machine mining, so its
     public-domain dedication stands. Reader-facing accounting and
     ingest-side licensing answer different questions about the same
     corpus.
2. **Layer-scoped metrics, each layer by its own instrument.**
   Extending the instrument-per-channel discipline of ADR-0011 one
   level up: the doctrine layer keeps its existing measures
   (programmatic ingestion, citation, regurgitation probes,
   derivative works); the essay layer's measures are the
   contemporaneous human-reception signals its own per-article
   instrument reports — reads, reactions, and follower counts.
   Mentions of the work in others' writing currently have **no
   instrument**; the framework records this as a measurement gap, as
   ADR-0007 did for LLM-mediated reach before ADR-0011 closed it,
   rather than pretending the account is complete. Within the essay
   layer these signals are legitimate **both to observe and to steer
   by**: choosing topics, cadence, and language placement in response
   to reception is the ordinary craft of essay writing, not a
   strategy violation.
3. **Scope amendment of ADR-0007, clause by clause.**
   - Clause 1 (platform human-attention metrics are not optimization
     targets) and the legibility-cost acceptance are scoped to the
     **doctrine layer**. There the excluded signals remain excluded,
     on ADR-0007's unchanged grounds.
   - Clause 2 (off-page human-distribution labor is not a strategic
     activity) **stands in both layers** as regards promotion of the
     program's artifacts: no backlink campaigns, no self-promotion
     posting. Publishing an original essay to its own audience is
     content production in the essay genre, not off-page distribution
     labor for the doctrine artifacts; the two are not exchangeable.
   - Clause 3 (the success metric remains LLM-mediated reach) is
     restated per layer: it remains the doctrine layer's success
     measure; the program's overall accounting is now read layer by
     layer.
   - Clause 4 (on-page human quality as hygiene) is unchanged.
   - What this amendment removes is the generalized reading:
     stagnant human-attention signals may no longer be re-read as
     evidence of purification for the program as a whole, because the
     essay layer now carries the program's human accounting and its
     signals are allowed to disappoint.
4. **Audience-stance re-adjudication.** The thesis's demotion
   sentence is unqualified as written; this ADR **narrows it
   explicitly** — a change, recorded as such, not a restoration of an
   original scope. The demotion of direct human browsers is
   re-scoped to the doctrine repositories, where its grounds hold,
   and the qualifier is carried into the thesis text. Contemporary
   human readers are primary where the program actually meets them:
   the essay layer. The re-audit thus resolves not by promoting
   humans to co-primary audience of the whole strategy but by routing
   audience by genre.
5. **Boundary clauses.** The layers are kept from contaminating each
   other:
   - Essay-layer signals do not flow into doctrine-layer decisions:
     no release, deposit, or federation choice is steered by reads or
     reactions, and the failure-mode diagnostics of ADR-0017 remain
     detectors, not metrics, in the doctrine layer.
   - The content-authenticity bound of ADR-0019 applies in **both**
     layers: steering selects what to write and where to place it; it
     never deforms content for numbers. One honest caveat: inside the
     essay layer, ADR-0019's reinforcing support from ADR-0007
     ("there is no legitimate target that deforming the content could
     serve") no longer holds, because this ADR creates such a target.
     There the rule stands on its Layer 1 ground alone — authenticity
     as the non-optimizable value — and is therefore leaned on
     harder, not less.
   - Essay-layer platforms are third-party-governed surfaces under
     ADR-0021's classification: they are never load-bearing for the
     origin claim, the canonical and priority claim stay on the
     corpus and its intrinsic identifier (ADR-0016), and the layer
     must survive total platform loss.
   - The safety guards (no self-created entries on community-governed
     authority records; no burst writing against rate limits; no
     sanction circumvention) are unchanged in both layers — and
     ADR-0021's **aggregate-pattern test** applies with particular
     force to the essay layer, which is exactly its case: a
     high-volume, single-author footprint on third-party-governed
     platforms, now openly reception-steered. Before any change in
     posting behavior, ask how the account's cumulative pattern reads
     to the host's governance.
6. **Accounting integration.** The essay layer's production record
   and metrics snapshots become formal inputs to the strategy's
   periodic next-move review — the review instrument of ADR-0014, as
   re-wired to inquiry-first operation in 2026-08 — as the standing
   account of the program's two production-side diffusion sources:
   new content, and mention earned from others (earned in ADR-0021's
   sense: unprompted, third-party). Within ADR-0014's two-tier
   ledger, the private tier holds the layer-level status and points
   to the corpus's own records as the per-article source of truth; it
   does not duplicate them.

## Alternatives Considered

**Promote contemporary human readers to co-primary audience of the
entire strategy.** Rewrites the thesis's defense-target definition
outright. Rejected: inside the doctrine layer ADR-0007's grounds are
untouched — the platform signals there remain gameable or
structurally blind, and steering doctrine releases by them would
re-import the Goodhart vector. The observed production reality is
genre-shaped; the genre routing achieves the correction with a far
narrower amendment and no conflict with the standing metric
rejection.

**Keep single-layer accounting and treat the recognition hunger as a
discipline problem.** On this view the contemplative stance should
dissolve the hunger, and no revision is needed. Rejected: the
strategy's books could not even register the difference between a
shipping month and a silent month on the essay line, so whatever the
practice did, the accounting returned the same verdict — that is a
defect of the books, not of the practitioner. Reclassifying a
structural accounting gap as a personal failing is one more instance
of the unfalsifiable-consolation pattern this ADR exists to remove,
and it prices the strategy's sustainability at the practitioner's
expense.

**Legitimize essay-layer signals for observation only, not
steering.** A more conservative amendment: the author may look at the
numbers without strategy violation, but writing decisions must not
respond to them. Rejected: responding to reception is the ordinary
craft of the essay genre, and the corpus's own governance already
operates a post-publication evaluation loop; withholding steering
would rebuild the same defect at smaller scale — a signal that exists
but is forbidden to inform anything. The meaningful line is not
observe-versus-steer but steer-versus-deform, and ADR-0019 already
draws it.

**Declare the essay corpus outside the framework's scope.** The
thesis maintains an explicit exclusion list; adding the essay genre
to it would dissolve the accounting complaint without touching
ADR-0007. Rejected: the corpus is already inside — ADR-0016 spent a
decision making it a governed artifact with a priority claim, a
reconciled license, and entity federation, and its essay-to-paper
promotion clause makes the corpus the seedbed from which load-bearing
ideas graduate into the doctrine layer. Exiling the program's most
active production line would sever that promotion path, strip the
corpus of the governance it just gained, and leave the
recognition-side motive unaccounted by the very framework whose
operation produces the strain.

**Supersede ADR-0007 outright under its own revisit clause.** Retire
the metric rejection and write a successor. Rejected: the revisit
trigger ADR-0007 actually names — a trustworthy, non-gameable
human-reception signal — has not fired, and the decision's grounds
remain valid where they were argued, the doctrine repositories.
Wholesale supersession would discard a sound decision to fix what is
only a scoping error; the narrow amendment keeps ADR-0007's
protection exactly where it protects.

## Consequences

**Positive.**

- The author's motivation is held as a portfolio matched to the
  work's actual time constants: a fast loop (days to weeks) where
  contemporary reception is visible and allowed to matter, and a slow
  loop (months to years) where the contemplative stance and the
  diffusion thesis operate undisturbed.
- Failure becomes falsifiable per layer. Essay-layer numbers can
  genuinely disappoint, and doctrine-layer stagnation can no longer
  borrow the purification reading on behalf of the whole program —
  the consolation clause is bounded to the layer where its grounds
  actually hold.
- The periodic review's inputs now include the essay line in both of
  its states — shipping and stalled — closing the blind spot in which
  the deployment surface was declared saturated while production went
  uncounted.
- The audience doctrine becomes more precise, not more permissive:
  the demotion of direct browsers is explicitly bounded to the
  doctrine repositories, and the human-primary category that ADR-0015
  already recognized gains its genre — without reopening the
  license or canonical questions, which turn on ingest, not
  readership.

**Negative.**

- Two accounting regimes create a standing contamination risk in both
  directions: essay-layer numbers seeping into doctrine-layer
  judgment, or the contemplative reading re-annexing the essay layer
  and voiding its accounting again. The boundary clauses address this
  structurally, but whether a single practitioner can hold both
  postures over time is untested — the framework records it as
  manifesto open question 11 rather than asserting the split is
  stable.
- The split legitimizes a Goodhart pressure *inside* the essay layer:
  reception-steered selection of topics and cadence can drift the
  corpus toward what scores, and the only brakes are ADR-0016's
  authenticity membership criterion and ADR-0019's
  steer-versus-deform line — judgment calls, not mechanical tests.
- Essay-layer signals are platform-reported and inherit the
  weaknesses ADR-0007 names — gameable in principle, lossy in
  practice — and the mention account currently has no instrument at
  all. The layer accepts this because it is not load-bearing: nothing
  in the origin claim or the identifier federation rests on
  essay-layer reception.
- The essay layer's platforms are third-party-governed, so the
  layer's visible accounting can be revoked wholesale, as the
  ADR-0021 event demonstrated for a different surface. The corpus
  canonical and intrinsic identifier survive such loss; the
  contemporaneous signal does not, and the motivation portfolio must
  tolerate that outage mode.
- Reversal is cheap operationally but expensive motivationally: if
  open question 11 resolves against the split, unwinding means
  removing the essay inputs from the review and restoring ADR-0007's
  unscoped reading — at which point the accounting defect this ADR
  names returns undiminished. The exit exists; it leads back to the
  problem.

## Lineage

Originating diagnosis: a 2026-08-05 review loop over the program's
charter, which named the strain "the hunger for recognition is an
accounting defect, not a strategy defect" and proposed assigning the
two motives to two layers with different time constants. Antecedent:
a 2026-06 human-reader discovery proposal (retained in the program's
working notes) that identified contemporary human readers as the
supply-side answer to the manifesto's open questions 8 and 9 but
stopped at pull-only traceability measures, short of legitimizing any
contemporaneous signal; this ADR takes the step that proposal
deferred. The essay layer's instrumentation partly predates the
decision: the corpus repository's scheduling record of per-platform
publication has run for months, while its per-article metrics script
— polling two publishing platforms' APIs into an append-only snapshot
file — was brought up in the days before this decision, alongside the
corpus's own post-publication evaluation loop.

Specific instances abstracted out of the body per repository
convention: the essay corpus is the public articles repository of
ADR-0016, syndicated to a Japanese technical-publishing platform and
an English developer-publishing platform with a newsletter mirror and
an occasional general-audience mirror; the metrics collector polls
the two platforms' public and authenticated APIs. The revocation
event referenced in Context is the community-governed
authority-record loss recorded in ADR-0021. This decision **amends
the scope of ADR-0007** clause by clause as stated in Decision 3,
extends ADR-0016 (genre routing, from canonical and license to
audience and metrics) and ADR-0011 (instrument-per-channel, applied
one level up), leaves ADR-0015's ingest-side license selection and
ADR-0016's canonical routing untouched, integrates with ADR-0014's
two-tier ledger and its periodic review (renamed from gap-review to
next-move review in the 2026-08 inquiry-first re-wiring), inherits
its boundaries from ADR-0017 (detectors, not metrics), ADR-0019
(content authenticity under structural optimization, with the caveat
stated in Decision 5), and ADR-0021 (revocation-control
classification, safety guards, aggregate-pattern test), applies the
falsifiability discipline of ADR-0018 to the framework's own
consolation clause, and connects to the manifesto's open question 8
(reach-without-recognition, whose supply side the essay layer now
carries) while opening the new open question 11 (whether a two-layer
motivation portfolio resists cross-layer contamination).
