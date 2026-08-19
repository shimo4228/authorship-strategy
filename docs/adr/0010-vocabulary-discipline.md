Language: English | [日本語](0010-vocabulary-discipline.ja.md)

# ADR-0010: Vocabulary Discipline — Coin Sparingly, Anchor Densely

> **Summary.** ADR-0008 named *vocabulary discipline* as the
> parametric-channel lever — the program's coined terms are the
> parametric hook — but did not define the discipline itself: when to
> coin a term and when not to. This ADR defines it. A coined term's
> power comes not from the count of coinages but from each term's
> **edge density** — how densely it is anchored to existing vocabulary
> and prior literature. The program therefore coins a term only when
> three conditions all hold (the concept is genuinely new at a join of
> existing concepts; a one-sentence definition in existing vocabulary
> is possible; the namespace is uncontested) and anchors every retained
> coinage densely: a glossary definition written in existing
> vocabulary, upstream citations where prior art exists, knowledge-graph
> edges to existing concepts and external references, and repeated work
> in the body. Everything else is said in existing vocabulary, with the
> upstream source cited.

## Status
accepted

## Date
2026-06-11

## Context

The thesis (Layer 4, tactic 4) establishes distinctive terminology as
a semantic signature of authorship: generic vocabulary dissolves
through paraphrase, coined terms survive as token-level signals
carrying back-reference to the author.
[ADR-0008](0008-rag-era-attribution-diffusion.md) gave that tactic a
mechanism — the program's coined terms are the load-bearing hook of
the parametric channel — and named the practice *vocabulary
discipline*. But neither document states the discipline's content. An
author applying tactic 4 without a coinage criterion drifts toward
coining freely, since every new term feels like a new signature.

The two-channel mechanics of ADR-0008 cut against free coinage:

- **The parametric channel is co-occurrence-driven.** A term is
  absorbed into model weights when it co-occurs broadly with its
  source — which requires other authors to use it, and other authors
  use a term when it names a gap they already feel in existing
  vocabulary. An isolated coinage with no connective tissue to the
  existing literature is, to a training pipeline, low-frequency noise:
  it is paraphrased away exactly as generic vocabulary is. The
  unconnected coined term meets the fate tactic 4 coined it to escape.

- **The retrieval channel is queried in existing vocabulary.** Readers
  cannot search for a term they have never seen. Queries arrive
  phrased in established vocabulary; an artifact whose prose bridges
  its coined terms to that vocabulary has retrieval surface, and an
  artifact written purely in its own idiolect has none.

- **Tracing back to origin travels along graph edges.** The
  framework's wager — that future factor analysis recovers the author
  — assumes the coined term is a *unique handle on known structure*,
  reachable through citation and knowledge-graph edges, not a free-
  floating token discovered in isolation.

Two further costs scale with the count of coinages, not with their
quality. Every new term spends reader trust — a document dense in
private vocabulary reads as a private language to machine readers and
as crankery to human ones — and every retained term carries a standing
maintenance load: a glossary entry, a locale mirror, a graph node, and
a consistency check across all living surfaces.

The asymmetry that decides the matter: the costs of coinage grow
linearly with the *number* of terms, while the benefit of coinage
depends on each term's *edge density* and adoption. A few densely
anchored terms therefore dominate many isolated ones.

## Decision

Vocabulary discipline has two halves: a gate on coining and an
anchoring obligation on every term that passes the gate.

1. **The coinage test.** Coin a new term only when all three
   conditions hold:

   - **Join-novelty** — the concept is a genuine novelty standing at a
     join of existing concepts, and no existing term covers it.
   - **Definitional anchoring** — a one-sentence definition using only
     existing vocabulary is possible.
   - **Uncontested namespace** — the term does not collide with an
     established usage it would have to displace.

   When any condition fails, use the existing vocabulary and cite the
   upstream source. Adopting an established term from the literature
   is the default, not a concession.

2. **The anchoring obligation.** Every coined term the program
   retains must carry:

   - a glossary definition written in existing vocabulary;
   - upstream citations wherever prior art exists, so the term's
     origin claim stays narrower than the prior art;
   - a knowledge-graph node with edges to existing concepts and
     external references — a coinage with no edges is unreachable;
   - repeated work in the body. A term that does not recur reverts to
     plain phrasing.

3. **Scope.** The discipline governs the program's normative surfaces
   — thesis, ADRs, glossary, knowledge graph — at naming time, not
   merely at editorial review. It is the vocabulary-level enforcement
   of the origin-claim scope discipline: a narrow origin claim needs a
   specifically-named concept, and a defensibly-named concept needs
   visible anchoring to what it does not claim.

The decision is **harness-neutral**: it names neither the specific
knowledge-graph vocabulary, the specific review tooling, nor the
specific glossary format. Those appear in *Lineage*.

## Alternatives Considered

**Coin freely (maximize signatures).** Every concept gets its own
named handle; more signatures, more hooks. Rejected: the parametric
channel does not carry isolated terms — without co-occurrence and
connective tissue they are paraphrased away like generic vocabulary —
and the trust and maintenance costs grow linearly with term count.
Free coinage spends the budget that makes the few load-bearing terms
credible.

**Coin nothing (existing vocabulary only).** The conservative stance:
write everything in established terms and rely on citation alone.
Rejected: the semantic signature dissolves — paraphrase erases
unnamed ideas, an author cannot be recovered as the origin of a
generically-named pattern in a crowded namespace, and in a fast-moving
field the naming war is won by whoever names first; declining to name
cedes the program's own concepts to someone else's token.

**Leave it to editorial review.** Keep coinage unconstrained at
writing time and let a review-stage coined-term budget catch overuse.
Rejected as the sole mechanism: review catches overuse after the
vocabulary has already shaped the document, and the discipline is
load-bearing for the parametric channel (ADR-0008), not a style
preference. The review-stage budget remains as the downstream check;
this ADR moves the same test upstream to naming time.

## Consequences

**Positive.**

- Each retained coined term gains a higher per-term chance of
  parametric absorption: the program's co-occurrence effort
  concentrates on a few terms instead of diluting across many.
- The retrieval surface widens: prose that bridges coined terms to
  existing vocabulary matches queries phrased in that vocabulary.
- The knowledge graph grows denser by construction, since every new
  term arrives with mandatory edges; the graph's value as a
  factor-analysis substrate compounds.
- Origin claims stay narrow by default. Citing upstream at naming
  time enforces the origin-claim scope discipline structurally rather
  than by recollection.
- The coinage test gives tactic 4 an operational form: "distinctive
  terminology" stops meaning *more terms* and starts meaning *better-
  anchored terms*.

**Negative.**

- Naming wars can be lost. Verifying the three conditions takes time,
  and in a fast-moving field a competitor's term may take the
  namespace first. Accepted: attaching to the winning term with a
  clear upstream citation still preserves attribution at the
  refinement layer, which is the defensible scope anyway.
- The test requires a literature check at naming time — a new standing
  cost on every prospective coinage.
- Borderline calls remain judgment. "No existing term covers it" is
  not mechanically decidable; the discipline narrows the judgment but
  does not eliminate it.

## Lineage

This ADR defines the phrase *vocabulary discipline* that ADR-0008
introduced as a parametric-channel lever and used without definition.
Originating exchange: a 2026-06-11 review of the program's coinage
practice, prompted by the question whether connecting existing
vocabulary and coining only when necessary builds reference relations
to other knowledge systems that free coinage cannot — answered in the
affirmative by the edge-density asymmetry recorded in *Context*.

The program had already been practicing the discipline before naming
it, and those instances are its worked examples. The term *ghost
citation* was adopted from the 2026 citation-validity literature
rather than coined as a synonym — the program's knowledge graph
records "this research line adopts the term rather than coining it."
The two-channel and ghost-citation concepts were retroactively
anchored to the 2026 generative-engine-optimization literature, and
the parametric-measurability question to the 2026
training-data-attribution literature (Concept Influence, Mechanistic
Data Attribution), narrowing the program's origin claim to the
framework-placement layer in each case.

A 2026 strand of schema-efficacy measurement bears on the discipline
from an unexpected direction. Studies of whether structured-data
markup predicts AI-search citation — a controlled cross-platform study
(Fischman, SSRN 6284518) and an industry audit of roughly 1,885
schema-added pages (Ahrefs) — find that schema *presence* alone does
not move citation once organic ranking is controlled (generic markup
performs no better than none) and that the citation lift attaches
specifically to attribute-rich, entity-anchored markup (cited at 61.7%
versus 41.6% for generic). This is the structured-data analogue of the
edge-density asymmetry this ADR records for coinage: richness and
anchoring, not mere presence, are what carry signal. The finding is
read as external resonance rather than as the source of the principle
— the discipline was articulated from the parametric and retrieval
mechanics of ADR-0008, not from the schema literature — and it bears
on [ADR-0009](0009-dual-entry-asymmetric-rebalance.md) in the same
move: as revised on 2026-08-19, ADR-0009 claims no citation lift from
the knowledge graph's presence (its criterion is consideration-set
entry and entity resolution), and whatever citation effect structured
data carries attaches to dense anchoring, not to mere presence. The same literature
opens the supply-side question of who can supply that anchoring,
recorded as Open Question 9 in [`manifesto.md`](../manifesto.md).

The specific instances abstracted out of the body: the knowledge
graph is the schema.org JSON-LD graph with `isBasedOn` / `citation`
edges (per ADR-0006's lineage); the glossary locale mirror is the
English/Japanese pair; the downstream editorial check is a
clarity-review agent in the author's LLM-based writing pipeline,
whose coined-term budget applies an existing-vocabulary one-sentence
test and a roughly-three-occurrence recurrence threshold — the same
tests this ADR moves upstream to naming time.
