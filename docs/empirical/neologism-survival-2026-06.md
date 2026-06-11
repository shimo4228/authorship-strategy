# External Literature Note: Neologism Survival under LLM Processing (2026-06)

This note is an **external-literature observation**, a different genre
from the traffic baseline: it reports what the 2024–2026 neology-and-LLM
literature observes about when coined words survive LLM processing and
when they are degraded or replaced, and what those observations do and
do not say about the vocabulary discipline recorded in
[ADR-0010](../adr/0010-vocabulary-discipline.md). All claims follow the
empirical layer's framing: *preliminary observation*, not evidence. The
sources are external publications, not the ecosystem's own data, so the
note inherits their limitations and adds one of its own — the mapping
from their experimental settings to this framework's setting (coined
research terminology diffusing through training corpora) is an
interpretive step the sources themselves do not make.

## Sources

All bibliographic data below was verified against the primary sources
on 2026-06-12.

1. Zheng, J., Ritter, A., & Xu, W. (2024). *NEO-BENCH: Evaluating
   Robustness of Large Language Models with Neologisms.* ACL 2024.
   arXiv:2402.12261.
2. Hewitt, J., Tafjord, O., Geirhos, R., & Kim, B. (2025). *Neologism
   Learning for Controllability and Self-Verbalization.* Google
   DeepMind. arXiv:2510.08506.
3. *From 124 Million Tokens to 1,021 Neologisms: A Large-Scale Pipeline
   for Automatic Neologism Detection.* arXiv:2605.06426.
4. NeoLLM2026 — Neology and Large Language Models Workshop, co-located
   with LREC 2026, Palma de Mallorca, 2026-05-16. Proceedings not yet
   indexed in the ACL Anthology as of this note's date.

## Observation 1 — Unabsorbed novel words degrade LLM processing

NEO-BENCH reports that machine-translation performance is *nearly
halved* when a single neologism is introduced into a sentence, and that
models with later knowledge cutoffs show lower perplexity on neologisms
and better downstream performance — i.e., absorption tracks presence in
training data. (A secondary report circulating the figure "43%" for the
translation drop could not be verified against the abstract, which says
"nearly halved"; this note carries the abstract's wording.)

Read against ADR-0010, this externally supports the *premise* recorded
in its Context: a coined term that has not been absorbed is not merely
ignored — it actively degrades processing of the text around it, and
absorption is driven by training-data presence, not by the term's
intrinsic clarity. This is support for the **coin sparingly** half (the
cost model of unabsorbed coinage), not yet for the **anchor densely**
half: NEO-BENCH measures training-data *presence*, not document-level
*anchor density*. The framework's claim that dense anchoring raises
absorption probability via co-occurrence remains the framework's own
hypothesis, externally unmeasured.

## Observation 2 — Model-internal concepts need not align with human semantics

Hewitt et al. train a single new token embedding (all other parameters
frozen) to make a model express a concept, and report **machine-only
synonyms**: words that look unrelated to humans but trigger the same
behavior in the model. Their worked example: the ordinary English word
"lack" acts as a synonym for a trained brevity neologism — prompting
Gemma-3-4B-IT for "a lack answer" cuts average response length from
42.9 to 15.8 sentences, and Gemini-2.5-Flash from 37 to a median of 4.
They also report **self-verbalization**: the model can explain a
learned neologism in natural language, with questionnaire-based
verbalizations closing on average 83% of the behavioral gap (range
32–127%; synonym-based verbalizations average 39%).

Read against ADR-0010, this surfaces a tension the ADR does not
address: the anchoring obligation implicitly assumes that anchors
chosen for *human-readable* semantic proximity (glossary definitions,
upstream citations, graph edges) remain anchors at the level of the
model's *parametric* representation. Machine-only synonyms show the two
levels can dissociate. Two boundaries limit the transfer: (a) the
experimental setting — a steering token trained post-hoc with frozen
parameters — is not the pretraining-absorption setting the framework
cares about; (b) ADR-0010's anchoring obligation is justified by three
mechanisms (parametric co-occurrence, retrieval-channel reachability,
graph-edge traceability), and the latter two are untouched by this
finding. The tension is real but narrow: it qualifies one of three
rationales, in a different training regime.

## Observation 3 — The measurement field is forming, and is unstable

NeoLLM2026 marks the formation of a dedicated venue for exactly the
question this framework's vocabulary discipline depends on: when LLMs
capture, propagate, or invent lexical innovation. Its proceedings were
not yet indexed at the time of this note and should be checked at the
next empirical update. Separately, the large-scale detection pipeline
(arXiv:2605.06426) reports *substantial cross-model disagreement* about
which candidate words are neologisms (599 of 1,021 candidates, 58.7%,
confirmed by manual validation). For this framework, that disagreement
is a methodological warning: any future regurgitation-test protocol
that asks "does the model recognize this coined term?" will get
model-dependent answers, so single-model probes (a limitation already
recorded for the May 2026 regurgitation tests) cannot be cured by
simply picking a better model.

## What this note does and does not change

- **No normative change.** ADR-0010's decision stands as written. The
  literature supports its cost model for unanchored coinage and leaves
  its remedy (dense anchoring) as the framework's hypothesis.
- **One open question recorded:** *human-model anchor correspondence* —
  whether anchors selected for human-readable semantic proximity remain
  anchors in the model's parametric representation, or can silently
  dissociate the way machine-only synonyms do. This is a candidate for
  the manifesto's open-question catalog at the next normative revision.
- **One adopted boundary:** following the discipline itself, this note
  coins nothing. The phenomena are referred to by the literature's own
  terms (neologism, machine-only synonym, self-verbalization), and the
  candidate intermediate concept a secondary report proposed coining
  ("token-level survival") was evaluated against ADR-0010's three
  conditions and declined — the neology literature already owns this
  namespace.
