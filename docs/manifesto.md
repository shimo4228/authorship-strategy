# Manifesto: Open Questions in Authorship Strategy

The thesis in [`thesis.md`](thesis.md) makes a normative claim and
proposes a four-layer judgment framework. The framework is
articulated, but it is not closed. This document catalogues the
open questions the framework leaves unanswered, the empirical
contrasts it has not yet tested, and the failure modes it
acknowledges but does not yet handle. The intent is to make the
limits of the framework explicit so adopters can decide whether
to extend it or to operate within its current scope.

## Open question 1: How does the framework scale beyond a single author?

The framework was extracted from a single author's research
program (four research lines at the time of extraction; the
program now comprises five, the fifth being Attention, Not Self). The extracted decisions
are, by construction, decisions one author could plausibly make
without coordination. Multi-author research programs introduce
considerations the framework does not currently address:

- **Co-authored DOI registration**: when two or more authors share an idea, whose ORCID anchors the citation chain? Concept DOI registration assumes one minting account.
- **Disagreement on tactical decisions**: when one co-author wants enclosure (proprietary license, gated access) and another wants openness, the framework currently offers no resolution mechanism beyond "the strongest strategy is fully inverted on all three axes."
- **Asymmetric authorship-claim scope**: when co-authors contribute at different levels of abstraction (one at idea level, one at scaffold level), the idea-versus-scaffold separation in Layer 3 cuts across authors rather than across artifacts.

A subsequent release may incorporate explicit multi-author
adaptations. For now, the framework is *single-author normative*
and adopters with multi-author research programs should treat the
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

---

The list of open questions is itself an open question. Adopters
are invited to extend it. The framework is improved by
articulating the questions it cannot yet answer, not by
suppressing them.
