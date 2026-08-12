# Manifesto: Open Questions in Authorship Strategy

The thesis in [`thesis.md`](thesis.md) makes a normative claim and
proposes a four-layer judgment framework. The framework is
articulated, but it is not closed. This document catalogues the
open questions the framework leaves unanswered, the empirical
contrasts it has not yet tested, and the failure modes it
acknowledges but does not yet handle. The intent is to make the
limits of the framework explicit so adopters can decide whether
to extend it or to operate within its current scope. The questions
are asked from the framework's own stance — a maker working out
durable, traceable authorship in practice — and they are open
because practice has not yet answered them.

## Open question 1: How does the framework scale beyond a single author?

The framework was extracted from a single author's research
ecosystem (four research lines at the time of extraction; it
now comprises five, the fifth being Attention, Not Self). The extracted decisions
are, by construction, decisions one author could plausibly make
without coordination. Multi-author research ecosystems introduce
considerations the framework does not currently address:

- **Co-authored DOI registration**: when two or more authors share an idea, whose ORCID anchors the citation chain? Concept DOI registration assumes one minting account.
- **Disagreement on tactical decisions**: when one co-author wants enclosure (proprietary license, gated access) and another wants openness, the framework currently offers no resolution mechanism beyond "the strongest strategy is fully inverted on all three axes."
- **Asymmetric authorship-claim scope**: when co-authors contribute at different levels of abstraction (one at idea level, one at scaffold level), the idea-versus-scaffold separation in Layer 3 cuts across authors rather than across artifacts.

A subsequent release may incorporate explicit multi-author
adaptations. For now, the framework is *single-author normative*
and adopters with multi-author research ecosystems should treat the
decisions as guidance rather than prescription.

## Open question 2: What signal disambiguates LLM-mediated adoption from incidental traffic?

The thesis acknowledges that traffic data cannot disambiguate use
case (Layer 2, *Epistemic humility about diffusion signals*).
This is not a known-but-tolerated limitation; it is a structural
limit of the substrate. Possible disambiguators exist but each
has costs:

- **Regurgitation tests** — querying specific LLMs for the author's distinctive terminology and checking whether the author's name appears in citation. Cost: LLM behaviour drifts release-to-release, so a one-time positive result does not persist; cost of repeated re-testing is non-trivial.
- **Derivative-artifact mention search** — scraping GitHub, ArXiv, OSF, and Zenodo for mentions of the author's coined terminology in others' artifacts. Cost: search engines underindex small artifacts; coined terminology may be paraphrased away.
- **Citation network analysis** — querying OpenAlex, Scholix, or OpenCitations for incoming citations to the author's concept DOIs. Cost: citation network ingestion lags 6-18 months behind publication; small DOI ecosystems have sparse incoming citations regardless of actual reach.

The framework currently offers no resolution mechanism for this
question. Subsequent releases should test whether some
combination of the three disambiguators reliably distinguishes
adoption-type traffic from ingestion-type traffic.

A fourth candidate disambiguator comes from the generative-engine
literature, which separates the *fact* of a fetch from its
*contribution* to the answer. A citation-absorption measurement
framework distinguishes citation selection (which sources a
platform fetches) from citation absorption (how much a fetched
page actually contributes to the generated answer), so that a raw
citation count is not read as a measure of influence (arXiv:2604.25707).
The same selection-versus-absorption split is what separates
ingestion-type traffic (a page is fetched and indexed) from
adoption-type traffic (the fetched page shapes downstream output):
an influence score that measures absorption rather than mere
selection is a candidate disambiguator the framework does not
currently operationalize, and it carries the same costs the three
above do — it requires per-platform probing and is observed only
through whatever the platform exposes about its own answer
construction.

## Open question 3: What is the time-to-obsolescence of Layer 4 tactics?

Layer 4 explicitly anticipates that tactics retire when their
substrate retires. The thesis does not estimate how often this
happens. Empirical observations from the author's own ecosystem
(eighteen months of operation, two substrate shifts: Hugging
Face Datasets adding Parquet conversion, llms.txt convention
entering wider use) suggest substrate shifts on the order of
twelve to twenty-four months, but this is a single observation
in a single ecosystem.

Open questions:

- Does the framework's Layer 4 need a formal retirement schedule, or is opportunistic retirement (as substrate shifts are noticed) sufficient?
- Should retired tactics be archived in a separate document rather than removed, so adopters can see what was tried and why it stopped working?
- Are some Layer 4 tactics actually Layer 3-stable (the idea behind them survives substrate shifts) and should be promoted? The DOI registration tactic, for instance, has survived two substrate shifts (Zenodo's deposit-on-tag mechanism changed, but the underlying *register a stable identifier on publication* tactic did not).

## Open question 4: How does the framework interact with non-DOI-registrable artifacts?

The framework presupposes DOI registration as the canonical
priority-claim substrate. Many forms of authorship are not
DOI-registrable in their natural form:

- **Code packages** (npm, PyPI) have version identifiers but not stable concept-level DOIs.
- **Blog posts and essays** can be DOI-registered via Zenodo (using its general upload type) but the practice is uncommon.
- **Conversational outputs** (transcripts of public talks, tweets, podcast episodes) are rarely DOI-registered.

The framework currently advises (Layer 4 tactic 2) to use DOI
registration. It does not address what to do when DOI
registration is impractical or unconventional for the artifact's
genre. A subsequent release should articulate the substitute
priority-claim mechanism for these cases (Software Heritage
identifiers? GitHub release tags? Time-stamped public archives?)
or explicitly defer these cases to a separate framework.

> **Status (2026-06-13): answered by
> [ADR-0013](adr/0013-intrinsic-identifier-layer.md).** Of the three
> candidates named above, the software-archive identifier was adopted:
> an intrinsic, content-derived identifier (SWHID, ISO/IEC 18670) is
> the designated substitute priority-claim mechanism for
> DOI-impractical genres, and a complementary layer alongside the DOI
> for the genres the DOI already covers. Release tags and time-stamped
> page archives were considered and rejected in the ADR's Alternatives
> section. The question is retained here for the record of how it was
> posed.

## Open question 5: Where is the line between the framework and authorship-strategy-as-rhetoric?

The framework is itself an authored artifact. Promoting it under
its own tactics — DOI-registering it, federating it across
platforms, encoding it in JSON-LD, publishing under a permissive
license — is an instance of the framework applied to itself. The
recursive application has obvious appeal (the framework's claims
are tested against its own diffusion) but raises an open
question:

- When the framework recommends a tactic (e.g., distinctive terminology), and the framework's own articulation uses that tactic (e.g., it coins "three-axis inversion," "idea-versus-scaffold separation," "attribution diffusion"), is the framework demonstrating its applicability or pre-validating itself in a way that begs the question?

A subsequent release should make the recursion explicit and test
it against external adoption: do other authors, without the
framework's authorial voice, find the framework's tactics
adoptable in their own ecosystems? If they do, the recursion
is demonstrating applicability; if they do not, the framework
may have over-fit its single-author origin.

## Open question 6: How robust is the three-axis inversion to LLM substrate change?

The three-axis inversion is articulated against the substrate of
*current* LLMs (frontier models as of 2025-2026, trained on
publicly-accessible corpora, accessed through standard chat and
API interfaces). The inversion's structural claim — that
authorship strategy inverts because the substrate inverts — does
not specify which substrate features drive the inversion.
Possible substrate features that could change and invalidate the
inversion:

- **Closed-corpus training** — if frontier LLMs shift toward closed-corpus training (paid datasets, licensed content), the openness-equals-diffusion claim weakens. The framework currently assumes open-corpus training continues.
- **Author-attribution infrastructure** — if LLMs add native author-attribution to their outputs (per-token citation, retrieval-augmented generation with explicit source links), the diffusion-equals-validation claim shifts: validation becomes infrastructure-mediated rather than terminology-mediated.
- **Direct-author-to-LLM publishing** — if authors gain the ability to publish directly into LLMs' training corpora with attribution metadata, the cross-platform federation tactic (Layer 4 tactic 3) becomes redundant.

The framework should be re-evaluated as these substrate
features shift. The framework's robustness to substrate change
is itself an open empirical question.

## Open question 7: What is the role of the framework's empirical layer?

The empirical layer in [`empirical/`](empirical/) reports
preliminary observations from the author's own ecosystem. The
intent is to provide a baseline against which subsequent
releases can measure changes. The layer's role in the framework
is currently ambiguous:

- **As validation evidence** — the empirical layer would need to be designed as an experiment (pre/post intervention contrasts, controlled comparisons, multi-author replication) to function as validation. It is not currently designed this way.
- **As reference baseline** — the empirical layer would function as a reference point future readers can use to interpret their own observations. This requires only that the data be reproducible and the method be documented, which the current layer attempts.
- **As case study** — the empirical layer would function as a qualitative case study illustrating the framework's tactics in action. This requires interpretive narrative rather than raw data.

The framework currently treats the empirical layer as a hybrid
of reference baseline and case study. Whether to formalize it as
one or the other is an open question; the current ambiguity is
acknowledged and intentional, given the limited time series.

> **Status (2026-08-12): answered by
> [ADR-0023](adr/0023-empirical-layer-role.md).** The hybrid was
> formalized by structure rather than collapsed to one role:
> reference baseline is the layer's primary role and the minimum
> every artifact must satisfy; case-study narrative is a bounded
> secondary role attached to specific artifacts and marked as
> interpretation; validation evidence is a role the layer declines
> to claim unless an artifact is designed as an experiment before
> the fact and explicitly designated as such at publication. The
> deferral rationale ("given the limited time series") was found
> not to bind — the three roles differ in the strength of the
> claim the layer asserts, not in the amount of data it holds. The question
> is retained here for the record of how it was posed.

## Open question 8: What is the framework's failure mode?

The framework's strongest commitment — that the strongest
authorship strategy under AI-mediated diffusion is fully
inverted on all three axes — has not been tested against the
case where it is wrong. Possible failure modes the framework
does not currently handle:

- **The framework increases the author's reach but not the author's recognition** — the author's ideas become widely diffused but the diffusion does not carry the author's name. (Diagnostic: regurgitation tests succeed at concept level but fail at author level.) The external literature describes the underlying behavior: a large-scale study of LLM-mediated citation finds that a source's name is surfaced far more often when it is already named than when it is not — a brand-citation rate of 53.1% named against 10.6% unnamed (Seer Interactive's 541,213-response study), consistent with a parametric channel that gates the retrieval channel, so a source's URL can be cited while its author goes unnamed. The scholarly literature frames the same breakdown from the credit side: the *provenance problem*, a systematic rupture in the chain of scholarly credit when LLM-mediated text reproduces an idea without attribution, holding even where the author acts in good faith and discloses the use of AI (arXiv:2509.13365). The framework names this attribution-loss failure mode the *ghost citation* of authorship; the term is also used in the literature (arXiv:2602.06718) for a disjoint phenomenon — fabricated or invalid citations — which this open tension does not concern. This is an *open tension*, not a solved problem: the framework's strongest commitment is full inversion on all three axes, and the same openness that maximizes reach is what strips the author's name from the carried-forward content — the mechanism that produces diffusion is the mechanism that produces ghost citation. The framework records the tension without resolving it; whether a fully-inverted strategy can keep recognition coupled to reach, or whether reach-without-recognition is its structural price, is left open here.
- **The framework induces over-publication** — the author publishes ideas earlier than they would have under enclosure-style strategy, capturing priority but at lower quality. (Diagnostic: the author's DOI-registered artifacts include multiple superseded versions of the same idea.)
- **The framework induces under-investment in worked implementation** — the abstract-doctrine-plus-worked-implementation pair (Layer 3) requires investment in implementation, but the framework's tactical layer emphasizes doctrine artifacts (specs, ADRs, glossaries). (Diagnostic: the author's DOI portfolio is doctrine-heavy and implementation-light.)

A subsequent release should articulate diagnostic signals for
each failure mode and the recovery strategy for each.

*Worked instance (2026-08):* the recognition half of the first
failure mode acquired an accounting response, not a resolution.
[ADR-0022](adr/0022-audience-layer-split.md) routes contemporary
human readers to the essay layer as that layer's primary audience,
so the program now carries one layer in which recognition is
contemporaneously observable — while ghost citation in the doctrine
layer stands exactly as recorded here. The same decision surfaced a
second-order failure mode of this list itself: an unqualified
demotion of human audiences had let every stagnant human-attention
signal be re-read as purity, an unfalsifiable consolation the
accounting split is designed to remove. Whether the split is stable
is open question 11.

## Open question 9: Does entity grounding gate the diffusion strategy by prior authority?

The framework's Layer 4 structured-artifact tactic — the JSON-LD
knowledge graph and the `sameAs` edges that federate its entities to
external authority records (ORCID for the author, Wikidata for
concepts and artifacts, the wider linked-data substrate) — assumes the
author can ground the artifact's entities in resolvable external
identifiers. The 2026 structured-data-efficacy literature suggests
this grounding, not structured-data presence alone, is what earns
AI-retrieval citation: attribute-rich, entity-anchored markup is cited
materially more than generic markup, and generic markup no more than
none (arXiv:2603.10700; SSRN 6284518). But the entity-grounding chain
that supplies those anchors — a Wikidata item, the third-party
mentions that justify it, the notability those mentions establish — is
itself gated by prior authority. An established entity has external
records to point `sameAs` at; a newly coined concept, or an author
entering the citation graph for the first time, has none.

This surfaces a tension internal to the framework. The framework's
foundational claim is the scarcity-to-diffusion inversion: openness,
not gatekept scarcity, grounds authorial value under AI mediation. Yet
the structured-artifact tactic that operationalizes diffusion appears
to re-introduce a gate — not the old scarcity of publication, but a
scarcity of *prior entity authority*. The framework's own knowledge
graph shows the tension concretely: its doctrine-concept nodes carry
no `sameAs` edges, because they are new coinages with no external
entity to resolve to, while its DOI-registered artifacts and its
author entity do. The grounding the literature rewards is exactly the
grounding a first-mover idea cannot yet supply.

Open questions:

- Does the diffusion strategy's reliance on entity grounding
  reintroduce, at the substrate level, the authority-gating the
  three-axis inversion claims to escape — so that the inversion holds
  for already-recognized authors but weakens for the idea-rescue
  individual the framework is written for?
- Is the self-controllable subset of entity grounding — the profiles
  an author owns and can populate (repository host, author-identifier
  record, self-published surfaces) — sufficient to clear the citation
  threshold, or does the lift require third-party-conferred authority
  (encyclopedic notability, earned-media mention) the author cannot
  manufacture?
- This is the reach-without-recognition tension of Open Question 8
  viewed from the supply side: ghost citation asks why diffusion fails
  to carry the author's name; this asks whether the instruments that
  would carry it are available to the author at all. It is also the
  asymmetric-authorship-claim-scope problem of Open Question 1 at
  single-author scale — claim scope gated by pre-existing authority
  rather than by contribution.

The framework records the tension without resolving it. Whether entity
grounding is a democratizing instrument (any author can federate the
identifiers they own) or a re-enclosure (citation rewards authority the
author must already possess) is left open here.

*Worked instance (2026-07):* the second bullet received a partial
empirical answer from the sharp end. The program's attempt to
manufacture the third-party-conferred portion of the grounding —
self-created entries in a community-governed authority record — was
revoked by the host's governance as promotional at the account level,
and every entry was mass-deleted. Self-manufactured third-party
authority is not merely insufficient; it is revocable with sanction.
[ADR-0021](adr/0021-self-sovereign-entity-grounding.md) records the
resulting retirement and the revocation-control classification of
grounding surfaces. Whether the self-controllable subset alone clears
the citation threshold remains open.

## Open question 10: Is a deposit under the author's own account a self-sovereign layer?

[ADR-0021](adr/0021-self-sovereign-entity-grounding.md) answered the
revocation half of open question 9 by classifying grounding surfaces
by revocation control, and placed *registry deposits under the
author's account* on the self-sovereign side — alongside the
repository, the author-identifier record, and the intrinsic
content-derived identifier layer. That classification is what lets
[ADR-0001](adr/0001-concept-doi-canonical.md) keep the concept DOI as
the canonical priority-claim mechanism after the third-party authority
layer was retired. The framework's entire origin claim now rests on
identifiers minted by a registry, held in an account, under that
registry's governance.

The assumption inside the classification is that an account the author
holds is an account the author keeps. In 2026 that assumption acquired
a visible failure mode. Registries began publishing depositor policies
on generative-AI provenance, requiring that a deposit have a
verifiable connection to research conducted by humans and treating
work where the model is the *source* rather than a *tool* as
unsuitable content. Enforcement of such a policy has been observed to
run through account-level action: an account suspended, several
hundred DOI-bearing records withdrawn without prior notice, the
depositor disputing the classification, and the host acknowledging
that moderation at volume — automated and manual alike — can err,
with the dispute unresolved at the time of writing. This records a
structural similarity in how the risk is shaped; it is not a
prediction that any particular deposit will be actioned, and a
contested case is not an established error.

The tension is that the retirement decided in ADR-0021 moved the
origin claim *toward* the layer this failure mode reaches. Withdrawing
from a third-party-governed authority record to registry deposits
looks like a move from revocable to self-sovereign ground, but if both
layers are ultimately account-scoped and host-adjudicated, the move
did not distribute governance risk — it concentrated it on the
canonical layer, where the blast radius is larger. A supplementary
citation graph can be lost and rebuilt; the priority claim cannot.

Open questions:

- Is a registry deposit under the author's own account *self-sovereign*
  in the sense ADR-0021 requires, or only self-*administered* — the
  author controls what the deposit says while the host controls
  whether it continues to resolve? If the latter, the classification
  needs a third category between self-sovereign and third-party-
  governed, and the decisions that rest on it need re-reading.
- Does the intrinsic identifier layer ([ADR-0013](adr/0013-intrinsic-identifier-layer.md))
  *substitute* for a revoked canonical layer or merely *complement*
  it? By its own terms it proves what content existed when and carries
  no authorship semantics. A program that survived total loss of its
  extrinsic identifiers would retain provenance and lose credit —
  which is the reach-without-recognition failure mode of open question
  8 arriving through the identifier layer rather than through
  diffusion.
- Where a provenance policy asks the author to *evidence* human
  direction, the framework already holds the evidence: the decision
  records carry a Lineage section naming the observation each decision
  came from. But the author controls only whether the deposit's
  metadata makes that trail reachable; whether it reads as sufficient
  belongs to the host. Accurate self-description is necessary and may
  not be sufficient — and the framework has no answer for the gap
  between the two.
- Open question 9 asks whether the grounding can be *acquired*. This
  asks whether it can be *kept*. Both are the same authority-gating
  seen at opposite ends of an artifact's life, which raises whether
  the three-axis inversion — openness grounds authorial value — holds
  when the surfaces that carry the openness are themselves granted
  rather than owned.

The framework records the tension without resolving it. Unlike open
question 9, this one has not yet been tested against the program's own
practice; it is recorded here before the fact rather than after it.

## Open question 11: Can a two-layer motivation portfolio resist cross-layer contamination?

[ADR-0022](adr/0022-audience-layer-split.md) split the strategy's
accounting into two audience layers with different time constants:
the doctrine layer (LLM-mediated primary audience, months to years)
and the essay layer (contemporary human readers, days to weeks,
where reception signals are legitimate to observe and steer by).
The split answers an accounting defect — the author's
recognition-seeking motive had no layer in which its rewards were
observable — but it installs a boundary that must now be held by a
single practitioner, and the boundary can fail in either direction:

- **Fast contaminates slow** — essay-layer numbers seep into
  doctrine-layer judgment: a release timed to reception, a deposit
  shaped by what scored, the failure-mode diagnostics of
  [ADR-0017](adr/0017-failure-mode-diagnostics.md) quietly promoted
  to targets. The boundary clauses of ADR-0022 prohibit this flow,
  but a prohibition held by the same person who watches the numbers
  is a discipline, not a mechanism.
- **Slow re-annexes fast** — the contemplative reading that
  ADR-0022 bounded to the doctrine layer generalizes again, the
  essay layer's signals are re-classified as vanity, and the
  accounting defect returns under a new description. The pattern
  has one precedent already: an unqualified audience demotion was
  read at its widest for months before the split named it.
- **The layers compete for the same hours** — a portfolio assigns
  motives, but production time is one pool. Whether reception-fed
  essay work crowds out the slow doctrine work (or the reverse) is
  an allocation question the split does not answer.

Whether one practitioner can hold both postures over years — a
layer where numbers are allowed to matter and a layer where they
are refused — is untested, and the nearest evidence (the months in
which the unsplit accounting quietly failed) argues that
self-reports will lag the failure. The framework records the
tension without resolving it.

---

The list of open questions is itself an open question. Adopters
are invited to extend it. The framework is improved by
articulating the questions it cannot yet answer, not by
suppressing them.
