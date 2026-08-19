Language: English | [日本語](0019-structural-optimization-vs-content-authenticity.ja.md)

# ADR-0019: Structural Optimization versus Content Authenticity — The Structured-Artifact Tactic Optimizes the Transmission Path, Never the Content

> **Summary.** The 2026 structured-data efficacy literature shows that
> AI-retrieval citation lift attaches to a document's *structure* and to
> attribute-rich, entity-anchored markup — not to surface text and not to
> the mere presence of markup. That finding both justifies the framework's
> structured-artifact tactic (Layer 4) and creates a standing pressure to
> optimize aggressively for citation. But the literature is written in a
> marketing-optimization frame whose goal is to *win* citations, and the
> framework borrows the mechanism without that orientation
> ([inspiration.md](../inspiration.md)). This ADR is the explicit guard
> that keeps the borrowed tactic from importing the orientation. It draws
> the boundary at the **object of optimization**: optimizing the
> transmission path — document architecture and information hierarchy,
> entity anchoring and structured markup, dense anchoring of distinctive
> vocabulary (ADR-0009, ADR-0010) — is legitimate, because it optimizes
> *how* the idea travels. Transforming the content to win citations —
> fabricated or padded attribute-richness, keyword-stuffing, claims shaped
> to a channel's reward function rather than to the idea — is prohibited,
> because it deforms *what* the idea is. The one-line rule: optimize how
> the idea travels, never what the idea is. Content deformation is a Layer
> 1 authenticity violation, reinforced by ADR-0007's commitment that
> citation and visibility are not success metrics to be maximized.

## Status
accepted — see [ADR-0022](0022-audience-layer-split.md): within the
essay layer the reinforcing support from ADR-0007 ("no legitimate
target that deforming the content could serve") no longer holds; the
rule there stands on its Layer 1 authenticity ground alone, and
continues to bind in both layers.

## Date
2026-06-26

## Context

The framework's tactical layer ships a structured, machine-readable
companion artifact whose entities and relationships are encoded for the
retrieval channel — consideration-set entry and entity resolution, per
ADR-0009 as revised 2026-08-19. The 2026 structured-data efficacy
literature — the strand recorded in
[inspiration.md](../inspiration.md) — measures whether that kind of
artifact actually earns AI-retrieval citation, and its answer is
two-sided in a way that matters here. Citation lift does not attach to
the surface text of an artifact, nor to the *mere presence* of structured
markup; it attaches to the artifact's **structure** — its document
architecture and information hierarchy — and to **attribute-rich,
entity-anchored** markup over generic, sparsely-populated markup. The same
edge-density asymmetry the anchor-densely discipline records for coinage
(ADR-0010) reappears on the structural side: presence is not the lever,
density and external anchoring are.

This is the evidence that grounds the framework's structured-artifact
tactic, and it is also a hazard. A finding that *structure earns citation*
is a standing invitation to optimize structure ever more aggressively, and
the literature that supplies the finding is written in a
marketing-optimization frame: its question is how to make a brand *win*
citations. The framework reads the same mechanics the other way — through
the metric-rejection commitment (ADR-0007) and the Layer 1
anti-monetization stance — asking not how to capture citations but whether
an author's signature survives diffusion. inspiration.md already records
that the mechanism is borrowed while the orientation is not. What it does
not record is *where the borrowing stops*: at what point optimizing for
citation stops being a legitimate diffusion tactic and starts corroding
the Layer 1 authenticity the whole stack sits beneath. The research
context flagged the optimization-versus-authenticity relation as
unresolved, and under strong citation-lift pressure an unstated boundary
erodes. This ADR draws the line.

The boundary is adjacent to, but distinct from, the supply-side tension of
[open question 9](../manifesto.md): that question asks whether the external
entity anchoring the lift rewards is *available* to a first-mover author at
all; this ADR asks, given that an author can invest in anchoring, *what
kind of investment stays inside the authenticity commitment*. The two share
the entity-grounding mechanism and reach it from opposite sides — one a
question of access, the other a question of legitimacy.

## Decision

Draw the boundary at the **object of optimization**. The framework
optimizes the path an idea travels; it never optimizes the idea itself to
score.

1. **Legitimate — optimizing the transmission path (Layer 4 tactic).**
   Investment in *how the idea travels* is encouraged: document
   architecture and information hierarchy, entity anchoring and structured
   machine-readable markup, and the dense anchoring of distinctive
   vocabulary to the surrounding work and the upstream literature (ADR-0009,
   ADR-0010). This is the structural investment the efficacy literature
   shows the citation lift attaches to, and it leaves the content of the
   idea untouched — it changes the carrier, not the cargo.

2. **Prohibited — deforming the content to win citations.**
   Transforming *what the idea is* in order to score is forbidden:
   fabricated or padded attribute-richness, keyword-stuffing, claims shaped
   to a retrieval channel's reward function rather than to the idea, and any
   content bent to maximize a citation signal. This deforms the idea to fit
   the instrument, which is exactly the inversion the framework refuses —
   the idea is the protected thing; the channel is not allowed to author it.

3. **The boundary rule.** *Optimize how the idea travels, never what the
   idea is.* Structural investment is encouraged; content deformation is a
   Layer 1 authenticity violation. The rule is reinforced by ADR-0007:
   because citation and visibility are not success metrics to be maximized,
   there is no legitimate target that deforming the content could serve — it
   optimizes a number the framework has already declined to chase.

The boundary is drawn at the object, not the intensity, of optimization.
There is no threshold of "too much" structural work; arbitrarily heavy
investment in architecture, hierarchy, and anchoring stays on the
legitimate side as long as it leaves the idea's content as authored. The
moment optimization reaches across the line and reshapes the content to
score, it crosses into prohibition regardless of how small the change is.

## Alternatives Considered

**Adopt the citation-optimization literature's optimize-to-win framing
wholesale.** Treat the structured-artifact tactic as a pure
citation-maximization technique, applying the literature's marketing frame
without modification. Rejected: it makes citation a target, colliding
head-on with ADR-0007 (citation and visibility are not metrics to
maximize) and with the Layer 1 authenticity commitment. Adopting the frame
would license content deformation by construction — once winning citations is
the goal, deforming content to win them is just effective optimization.
The framework borrows the literature's mechanism precisely because it can
separate the mechanism from that orientation; this ADR is what performs the
separation.

**Reject structural optimization entirely to foreclose any risk of content
deformation.** Refuse the structured-artifact tactic altogether so that no
optimization pressure can ever reach the content. Rejected: this forfeits a legitimate,
doctrine-grounded diffusion tactic — the structured-artifact tactic the
framework already ships (ADR-0009) — over a risk the boundary rule already
contains. The efficacy literature shows the structural investment is what
carries the idea into AI-retrieval channels at all; abandoning it would
trade the framework's diffusion reach for a purity the object-of-
optimization boundary secures without that cost. The right response to that
risk is to draw the line, not to abandon the field on the far side
of it.

**Leave the boundary implicit.** Trust that the metric-rejection
commitment (ADR-0007) and the Layer 1 authenticity value implicitly rule
out content deformation, without a recorded rule naming the line. Rejected:
under the strong, literature-backed citation-lift pressure this ADR
responds to, an implicit boundary erodes — each incremental optimization
looks locally reasonable, and without a stated object-level line there is
no point at which an adopter can see the tactic has drifted from
path-optimization into content deformation. An adopter applying the
structured-artifact tactic needs the line drawn to apply it without
drifting; an unstated boundary is a boundary that the optimization
pressure will quietly relocate.

## Consequences

**Positive.**

- The structured-artifact tactic gets an explicit safety rail: an adopter
  can invest as heavily as they like in transmission-path structure while
  knowing exactly where the investment would cross into a Layer 1
  violation, so the tactic can be applied at full strength without drifting
  into content deformation.
- The framework's borrowing from the citation-optimization literature is
  made principled rather than ad hoc. inspiration.md states that the
  mechanism is borrowed and the orientation is not; this ADR records *the
  rule that enforces the separation*, so the borrowing has a stated stopping
  point rather than a tonal disclaimer.
- The boundary connects the structural side and the vocabulary side of the
  same discipline: dense structural anchoring (this ADR) and dense
  vocabulary anchoring (ADR-0010) are the same legitimate move — investing
  in the carrier — read on two surfaces, while their content-deforming
  counterparts (padded markup, keyword-stuffing) are the same violation.
- Tying the prohibition to ADR-0007 closes a would-be loophole: because the
  framework has already declined citation and visibility as success metrics,
  deforming content to score has no legitimate objective to point to — it optimizes a
  target the framework does not recognize.

**Negative.**

- The line between attribute-rich anchoring (legitimate) and padded
  attribute-richness (content deformation) is a judgment call at the margin, not a
  mechanical test. Enriching an entity description with genuine, accurate
  attributes is path-optimization; inflating it with attributes shaped to a
  channel's reward function is content deformation, and the two can look similar
  on the surface. The rule names the distinguishing question — does the
  change leave the idea as authored, or reshape it to score — but the
  application still requires authorial honesty.
- The boundary inherits the efficacy literature's present empirical frame.
  If a future substrate rewards a different optimization surface, the
  *legitimate* side of the line (today: structure and anchoring) may shift
  while the principle (optimize the path, not the content) holds; the ADR
  fixes the principle and will need re-reading of which concrete
  optimizations fall on the legitimate side as the substrate moves
  (manifesto open question 3 on Layer 4 tactic obsolescence).
- The prohibition forgoes whatever short-term citation gain content deformation
  might produce. This is a deliberate cost: the framework accepts lower
  measured citation if the alternative is an idea deformed to score, because
  a diffused-but-deformed idea no longer carries the author's actual
  thought — which is the only thing the strategy exists to diffuse.

## Lineage

Originating trigger: the 2026 structured-data efficacy literature
(recorded in [inspiration.md](../inspiration.md)) established that
AI-retrieval citation lift attaches to a document's structure and to
attribute-rich, entity-anchored markup rather than to surface text or to
the presence of markup alone — at once grounding the framework's
structured-artifact tactic and creating a standing pressure to optimize
for citation. The research context had flagged the relation between that
optimization pressure and the Layer 1 authenticity commitment as
unresolved. inspiration.md already recorded that the framework borrows the
literature's mechanism but not its marketing-optimization orientation;
what was missing was the rule that says where the borrowing stops. This ADR
supplies it by locating the boundary at the object of optimization rather
than its intensity.

Specific instances abstracted out of the body per repository convention:
the structured artifact is the framework's machine-readable companion
graph; the citation-optimization literature is the
generative-engine-optimization strand summarized in inspiration.md's
structured-data efficacy section, whose reported figures (citation-rate
differences between attribute-rich and generic markup, retrieval-accuracy
lifts, the single-factor null results) are external published findings kept
in that lineage document, not in this body. The object-of-optimization
boundary and the optimize-the-path-not-the-content rule are the normative
content; the specific literature and the specific structured artifact are
current instances. This decision extends ADR-0009 (the structured graph as
the entry point this tactic optimizes — for consideration-set entry and
entity resolution, per its 2026-08-19 revision, not for citation lift),
ADR-0010 (anchor-densely as the
vocabulary-side form of the same legitimate move), and ADR-0007 (citation
and visibility are not success metrics, which is what makes deforming
content to score goalless), and sits beneath Layer 1 (authenticity, the value the boundary
protects). It is adjacent to manifesto open question 9 (entity grounding
viewed from the supply side, where this ADR views it from the legitimacy
side) and is read against manifesto open question 3 (Layer 4 tactic
obsolescence, which governs how the legitimate side of the line is re-read
as the substrate shifts).
