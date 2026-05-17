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
program (four sibling research lines). The extracted decisions
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

- **The framework increases the author's reach but not the author's recognition** — the author's ideas become widely diffused but the diffusion does not carry the author's name. (Diagnostic: regurgitation tests succeed at concept level but fail at author level.)
- **The framework induces over-publication** — the author publishes ideas earlier than they would have under enclosure-style strategy, capturing priority but at lower quality. (Diagnostic: the author's DOI-registered artifacts include multiple superseded versions of the same idea.)
- **The framework induces under-investment in worked implementation** — the abstract-doctrine-plus-worked-implementation pair (Layer 3) requires investment in implementation, but the framework's tactical layer emphasizes doctrine artifacts (specs, ADRs, glossaries). (Diagnostic: the author's DOI portfolio is doctrine-heavy and implementation-light.)

A subsequent release should articulate diagnostic signals for
each failure mode and the recovery strategy for each.

---

The list of open questions is itself an open question. Adopters
are invited to extend it. The framework is improved by
articulating the questions it cannot yet answer, not by
suppressing them.
