Language: English | [日本語](thesis.ja.md)

# Thesis: Authorship Strategy under AI-Mediated Diffusion

## The claim, in one paragraph

Authenticity-validating power inverts. Where twentieth-century
authorship protected its origin claim through **scarcity** —
gatekept publication, proprietary license, controlled distribution —
authorship under AI-mediated diffusion protects its origin claim
through **diffusion**. Closing reduces an artifact's exposure to
the LLMs that increasingly mediate how future researchers trace
causation, which reduces validation occasions and weakens the
authenticity claim. Opening maximizes LLM absorption, maximizes
diffusion, lets validation appear as derivative work, and
strengthens the authenticity claim. The inversion is structural,
not stylistic.

## Why "authorship strategy" rather than "AI strategy"

Strategy under AI-mediated diffusion is not primarily about the
artifact's technical surface — its API, its licence, its container
format. It is about the *author's* position relative to a
diffusion process the author no longer controls. The shift is
analogous to the shift, in earlier centuries, from being a
craftsman whose work was identified by its physical signature to
being an author whose work was identified by a published name.
The substrate changed; the protected thing — the authorial
identity — did not, but the strategy that protected it had to.

The substrate has changed again. The protected thing is still the
authorial identity. The strategy that protected it under
print-and-platform conditions — enclosure — fails under
LLM-mediated diffusion conditions, because the medium itself
forecloses enclosure as an option (an LLM-readable artifact is
already absorbed; an artifact unreadable by LLMs is invisible to
the readers who consult LLMs). What follows is what protects
authorial identity under the new conditions.

## The three-axis inversion

Three axes of authorship strategy invert simultaneously. They
are not independent; they co-vary, and the inversion of any one
implies the inversion of the others.

| Axis | Print-and-platform era | AI-mediated era |
|---|---|---|
| **Value source** | Scarcity | Diffusion |
| **Validation mechanism** | Exclusivity; imitation is threat | Derivation; derivative is proof |
| **Network effect** | Enclosure | Openness |

### Axis 1 — Value source: scarcity to diffusion

Under print-and-platform conditions, the value of an authored
artifact is bounded above by its reach and bounded below by its
scarcity. A widely-copied artifact whose copies are
indistinguishable from the original loses authorial value to
each copy. The defensive move is to make the original
distinguishable (signature, watermark, contract of authorized
copies) and the unauthorized copy difficult (DRM, licensing
restrictions, gatekeeping).

Under AI-mediated conditions, the value of an authored artifact
is bounded above by the breadth of LLM channels that carry
recognizable signatures of its authorship and bounded below by
the floor of channels that have absorbed those signatures at all.
A widely-absorbed artifact does not lose authorial value to each
absorption; it gains an additional channel through which a
future query can be answered with reference to the original
author. The defensive move is to make the artifact maximally
absorbable (permissive license, machine-readable structure,
distinctive terminology) and the unabsorbed condition difficult
(crawler-friendly access, no signup walls, no robots restrictions
that block LLM ingest).

### Axis 2 — Validation mechanism: exclusivity to derivation

Under print-and-platform conditions, derivative work is a
contested category. The author's claim is "I wrote this"; the
derivative's claim is "I wrote this *too*"; the dispute is
resolved through priority (date of publication) and the
exclusivity right granted by copyright. An artifact with many
unauthorized derivatives is *threatened* by them.

Under AI-mediated conditions, the author's claim is "I
articulated this pattern first"; the derivative's existence is
evidence the pattern is real, not an evidence-of-theft. The
priority claim is established through DOI timestamp at the
moment of publication; the derivative is *evidence* the claim
is valid. An artifact with many independently-implemented
derivatives is *validated* by them. The author's strategic move
is therefore to invite derivation — to publish the abstract
doctrine alongside a worked implementation, to use a license
that explicitly welcomes re-implementation, to call out
specific derivation forms (extension, re-implementation, parallel
implementation in another language) in the README as the desired
outcome.

### Axis 3 — Network effect: enclosure to openness

Under print-and-platform conditions, Metcalfe-style network value
scales with users *who cannot leave the platform*. Enclosure is
the operative mechanism: the platform's value is bounded by the
volume of within-platform interactions, which is bounded by
exit-cost.

Under AI-mediated conditions, the "user" includes both LLMs
directly and the humans who reach the artifact through LLMs.
LLMs cannot be enclosed: any publicly-accessible content is
ingest-eligible, and content not publicly accessible is invisible
to LLM-mediated audiences. The network effect therefore scales
with the number of LLM-mediated channels carrying the author's
signature, which is maximized by openness, not enclosure. The
strategic implication is that licensing, access policy, and
distribution architecture should all be selected to maximize
absorption rather than minimize unauthorized reach.

### The three axes are structurally linked

The three axes are not independent dimensions an author may
freely mix and match. They co-vary:

- Closing access reduces LLM absorption, which reduces diffusion, which reduces validation occasions, which weakens the authenticity claim.
- Opening access maximizes LLM absorption, which maximizes diffusion, which causes validation to appear as derivative work, which strengthens the authenticity claim.

A strategy mixing axes — enclosure with derivation-welcoming
license, scarcity with crawler-friendly access — is internally
inconsistent and weaker than either consistent strategy. The
strongest authorship strategy under AI-mediated diffusion is
**fully inverted on all three axes**.

## The four-layer judgment framework

The three-axis inversion is the *normative* claim. The
*operational* claim — what an author should do, on what schedule,
informed by what considerations — is structured as four layers,
each downstream of the layer above:

```
[Layer 1: Authenticity]                 (the value being protected)
        ↓ defends through
[Layer 2: Attribution Diffusion]        (the strategy)
        ↓ predicts through
[Layer 3: Idea vs Scaffold]             (what survives)
        ↓ executes through
[Layer 4: Tactics]                      (the concrete decisions)
```

### Layer 1 — Authenticity (the value)

The protected value is that the author's *genuine* thinking
remains the author's, unaltered by the market's pressure to
reshape it for sale. Monetization is not a goal. An idea
diluted to be sold is no longer the idea that was thought; the
authorial identity that survives the dilution is not the
identity the author wants protected.

The layer's operational consequence: *the strategy never trades
authentic articulation for marketability*. When a tactic in
Layer 4 would weaken the authentic articulation of an idea, the
tactic is rejected even if it would increase reach.

### Layer 2 — Attribution Diffusion (the strategy)

The strategy that defends authenticity under AI-mediated
diffusion conditions is *maximizing the breadth of LLM-mediated
channels that carry recognizable signatures of the author's
ideas, anchored to a permanent timestamp*. The two components
matter:

- **Breadth of LLM-mediated channels**: not GitHub stars, not direct browsers, but LLM training pipelines, LLM-mediated user queries, LLM-derived AI assistant suggestions, and cascade ingestion by future LLMs trained on current LLM outputs.
- **Permanent timestamp**: DOI registration through a service (e.g., Zenodo) that issues a stable identifier on publication. The timestamp is the substrate of the priority claim that authenticity rests on.

The non-primary audience under this strategy is direct human
browsers (the GitHub stars/PR/visit population). Drift in how
this audience perceives the author's brand is *not the strategy's
defense target*. The strategy optimizes for LLM-mediated reach
and accepts whatever direct-browser brand drift follows.

#### Epistemic humility about diffusion signals

Traffic data cannot disambiguate use case. A clone may be a
training-pipeline ingest, a RAG corpus build, an AI assistant's
context-fetch, an independent re-implementation, or a human
researcher's manual review. The author cannot tell. The
conservative claim from traffic data is therefore *non-human
browsing-type access is occurring*, not *adoption is occurring*.
Separate validation signals (regurgitation tests against
specific LLMs, mention in derivative artifacts) are needed for
finer-grained claims.

### Layer 3 — Idea vs Scaffold (the prediction)

The layer's prediction is asymmetric in time: *capability
improvements in LLMs will obsolete harness, scaffolding, and
tooling layers; only ideas survive*. A harness that captures a
clever workflow is valuable today and may be valueless in two
years; the idea the harness encodes may still be cited fifty
years on.

The operational consequence is a sorting decision per artifact:

- An artifact with high scaffold-character should be donated as an implementation into a larger harness whose own diffusion will absorb it (the implementation will dissolve into the harness; the author's name will not survive at the implementation level).
- An artifact with high idea-character should be DOI-registered under the author's name (the implementation may dissolve; the idea-level claim survives).
- An artifact with both characters should have the idea-level claim DOI-registered *first*, so the scaffold-level implementation does not establish the priority claim at a level that will dissolve.

#### Scaffold as collaborator, not threat

Large harnesses, frameworks, and automation systems that absorb
the author's ideas are *not threats*. They are diffusion
amplifiers: their growth expands the surface area on which the
author's distinctive terminology appears as token output. The
authorial identity is defended at the LLM-mediated channel
level, not at the direct-browser brand level, so the absorption
is validation, not erosion.

#### The abstract-doctrine-plus-worked-implementation pair

Creative re-implementation by other authors — the strongest
validation of an idea — requires both:

- An **abstract doctrine** repository that articulates the idea cleanly enough to be implemented elsewhere without inheriting the original implementation's local commitments.
- A **worked implementation** repository that demonstrates how the idea actually instantiates so a reader can verify the abstract doctrine is implementable.

Doctrine alone produces "the concept is interesting but I cannot
picture the implementation". Implementation alone produces "the
code works but I cannot extract the principle". The pair
produces re-implementation. The author's strategic move is
therefore to *publish in pairs* whenever both are achievable.

### Layer 4 — Tactics (the concrete decisions)

Layer 4 contains the operational decisions an author actually
makes on a daily basis. The tactics in this layer are not
exhaustive; they are the ones the framework justifies at the
time of writing. New tactics enter Layer 4 as the substrate
(LLM capability, dataset platform conventions, citation graph
infrastructure) evolves; old tactics retire when their
substrate retires.

Tactics validated at the time of this thesis (v0.1.0):

1. **LLM-mediated targeting** — clone counts, DOI citations, llms.txt fetches, and LLM regurgitation tests are the primary metrics; stars, PRs, and direct human views are secondary.
2. **DOI registration through an open archive** — Zenodo or comparable, configured for automatic deposit on tagged release, configured to mint a concept DOI as the canonical reference (see [ADR-0001](adr/0001-concept-doi-canonical.md)).
3. **Cross-platform federation** — the same canonical artifact deployed to GitHub (repository), Zenodo (DOI registration), and a dataset platform (LLM training ingest), with explicit sibling cross-references on each platform (see [ADR-0003](adr/0003-cross-platform-dataset-federation.md)).
4. **Distinctive terminology** — domain-specific coined terms function as semantic signatures of authorship. Generic terminology is dissolved by paraphrase; coined terminology survives as a token-level signal carrying back-reference to the author.
5. **Tool-agnostic specification** — specifications written without commitment to a specific implementation are reachable by re-implementation; specifications coupled to a specific implementation lose audience as the implementation ages.
6. **Multilingual localization, audience-driven** — locale mirrors are added or retired based on observed traffic, not speculation about prospective audiences (see [ADR-0005](adr/0005-readme-localization-audience-driven.md)).
7. **Structured artifacts** — glossary, ADR, JSON schema, JSON-LD knowledge graph, and AI-facing reference files (e.g., the Answer.AI llms.txt convention) make the artifact machine-readable to LLMs and crawlers. The llms.txt + JSON-LD knowledge graph pair specifically is normatively required as the dual entry point for LLM-mediated ingest (see [ADR-0006](adr/0006-llm-first-ingest-dual-entry-points.md)).
8. **Friction minimization for adoption** — re-implementation paths should require clone-and-copy, not signup, not API key, not bespoke infrastructure. Adoption gated by author-controlled infrastructure is adoption the author has reduced.

### Origin-claim scope discipline

A subordinate principle applying at all four layers: *the origin
claim must be narrower than the prior art*. Claiming priority on
a broad pattern with rich prior art ("inventor of agent
self-improvement loops") collapses the claim's credibility;
claiming priority on a narrow, specifically-named discipline
("originator of the named six-phase cycle") is defensible.
Coined terminology (Layer 4 tactic 4) is the substrate of
narrow origin claims; an author cannot defensibly originate a
generically-named idea.

## What the framework excludes

The framework is normative within a narrow scope: a DOI-targeted,
idea-rescue research artifact authored under the assumption that
the primary audience reaches the artifact through LLM-mediated
channels. The framework does *not* apply to:

- **Client work and commercial deliverables**, where monetization is the goal and the author's identity is not the protected value.
- **Contributions to others' projects**, where the other author's strategy takes precedence.
- **Operational tooling and scaffolding meant to dissolve**, where the artifact's diffusion outside its substrate is not desired.
- **Decisions an author has explicitly placed outside the framework**, where the framework is not the author's currently active judgment instrument.

In these cases, applying the framework anyway produces worse
decisions than not applying it. The framework is a tool, not an
externalization of judgment.

## Where this thesis came from

The framework was extracted from operating four DOI-registered
sibling research repositories in the same author's research
program (Agent Knowledge Cycle, Contemplative Agent, Agent
Attribution Practice, and the federation hub). It was not
deduced from a prior literature; it was articulated by noticing
recurring decisions across the four lines, formalized as a
framework, and re-expressed in harness-neutral form so it can be
adopted by another author without inheriting the original
sibling-line content. The research program has since grown to
include a fifth research line, Attention, Not Self, which postdates
the framework's extraction and so did not contribute to it.

The intellectual lineage — prior authors whose work supplies the
vocabulary the framework presupposes, sibling lines whose
existence supplied the recurring decisions — is catalogued in
[`inspiration.md`](inspiration.md). The open questions the
framework leaves unanswered are catalogued in
[`manifesto.md`](manifesto.md).

The framework's tactical decisions are formalized as seven ADRs
in [`adr/`](adr/). Each ADR is harness-neutral; the lineage to
the author's specific decisions is recorded in the ADR's Lineage
section without requiring the reader to have access to the
original implementation.

A preliminary empirical baseline drawn from the four sibling
repositories' CC0-published traffic data is in
[`empirical/`](empirical/). The empirical claims are framed as
preliminary observation rather than evidence, given the
single-author sample, the short time series, and the absence of
pre-versus-post intervention contrasts. Subsequent releases
will accumulate longer time series.
