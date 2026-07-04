# Adoption: Applying the Framework to Your Own Idea-Rescue Work

This is a reimplementation guide. It describes how an author other
than the original one applies the [thesis](thesis.md)'s framework to
their own idea-rescue work — how to go from reading the doctrine to
running it. It is the action path that turns the abstract framework
into the steps a second author can follow.

The guide answers two of the manifesto's open questions by being
written at all. [Open question 5](manifesto.md#open-question-5-where-is-the-line-between-the-framework-and-authorship-strategy-as-rhetoric)
asks whether other authors, without the framework's authorial voice,
find its tactics adoptable in their own ecosystems; this guide is the
artifact against which that question can be tested. [Open question 1](manifesto.md#open-question-1-how-does-the-framework-scale-beyond-a-single-author)
asks how the framework scales beyond a single author; this guide
inherits that question's unresolved status (see the caveat below) and
does not pretend to settle it.

## Who this is for

This guide is for an author who maintains, or intends to maintain, one
or more **idea-rescue** artifacts — work whose value is the idea it
articulates rather than the running code it ships, and whose primary
audience reaches it through [LLM-mediated channels](glossary.md#llm-mediated-channel)
rather than through direct human browsing. If that description fits
your work, the framework's tactics are intended to be portable to it.

The framework explicitly does *not* apply to client work, commercial
deliverables, contributions to others' projects, or operational
tooling meant to dissolve into a larger system. Those exclusions are
listed in the thesis under [*What the framework excludes*](thesis.md#what-the-framework-excludes);
read them first to confirm your work is in scope.

### The single-author-normative caveat

The framework was extracted from a single author's research ecosystem
and is, in the manifesto's term, **single-author normative**. Every
tactic below was a decision one author could make without coordinating
with co-authors. If your work has multiple authors, the
framework's open questions about co-authored identifier registration,
disagreement on tactical decisions, and authorship-claim scope across
abstraction levels are unresolved — see
[manifesto open question 1](manifesto.md#open-question-1-how-does-the-framework-scale-beyond-a-single-author).
Treat the steps below as guidance to adapt, not prescription to
follow, when more than one author is involved. The honest state of the
framework is that multi-author adaptation has not been worked out, and
adopting it in that setting is itself an extension of the framework you
would be contributing.

## The action path

The path has five steps. The first two are judgment; the remaining
three are execution. Each execution step maps to one or more of the
framework's [Architecture Decision Records](adr/), which carry the
reasoning and the rejected alternatives. Read the ADR before deploying
the tactic it records: the ADR is where the *why* lives, and the *why*
is what survives a substrate change that retires the *how*.

### Step 1 — Identify your idea-rescue artifacts

Inventory the artifacts you author. For each, ask the
[idea-versus-scaffold separation](glossary.md#idea-versus-scaffold-separation)
question from Layer 3: is its value the **idea** it articulates, or
the **scaffold** it provides? An artifact whose value is the idea is a
candidate for the framework. An artifact whose value is the running
scaffold — a harness, a tooling layer, a workflow automation — is, by
the framework's own prediction, destined to be obsoleted by substrate
improvement, and is better donated into a larger absorbing system than
DOI-registered under your name.

The sorting is per artifact, not per author. An artifact with both
characters has its idea-level claim registered first, so the scaffold
implementation does not establish a priority claim at a level that
will dissolve (thesis, [Layer 3](thesis.md#layer-3--idea-vs-scaffold-the-prediction)).

The output of this step is a short list: the artifacts you will run the
framework on.

### Step 2 — Run the four-layer judgment

For each artifact on the list, walk the
[four-layer framework](thesis.md#the-four-layer-judgment-framework)
top-down:

- **Layer 1 — [Authenticity](glossary.md#authenticity-layer-1).** Confirm the value you are protecting is your genuine thinking — the articulation you would keep unchanged even with nothing to sell. If a later tactic would weaken the authentic articulation to widen reach, the framework rejects that tactic. If what you want protected for this artifact is a revenue stream, the artifact is out of scope.
- **Layer 2 — [Attribution Diffusion](glossary.md#attribution-diffusion-layer-2).** Confirm your strategy is to maximize the breadth of LLM-mediated channels carrying your signature, anchored to a permanent timestamp — not to maximize direct-browser attention signals. The thesis is explicit that traffic data cannot tell adoption from incidental access ([*Epistemic humility about diffusion signals*](thesis.md#epistemic-humility-about-diffusion-signals)); your strategy optimizes for channel breadth and accepts that the signal is ambiguous.
- **Layer 3 — Idea versus Scaffold.** You completed this in Step 1; carry the sorting forward.
- **Layer 4 — Tactics.** Proceed to Steps 3–5, which deploy the concrete decisions.

This step produces no artifact. It produces a decision: this artifact
is in scope, and these are the layers' commitments you are accepting.

### Step 3 — Deploy the Layer 4 tactics

Layer 4 is the operational layer. The tactics below are the ones the
framework justifies at the time of writing; they retire as their
substrate retires, so treat the list as current rather than permanent
(thesis, [Layer 4](thesis.md#layer-4--tactics-the-concrete-decisions)).
Each is anchored to the ADR that records its reasoning.

1. **Register a stable identifier.** Mint a stable, citable identifier for each in-scope artifact through an open archive — a [DOI minting service](glossary.md#concept-doi) configured to deposit on tagged release. Reference the artifact by its **concept identifier** (the one that resolves to the latest version), never a version-specific one, so downstream citation graphs are not pinned to your first release ([ADR-0001](adr/0001-concept-doi-canonical.md)). Enrich your persistent-identifier record (e.g. ORCID) with concept identifiers only, and disable auto-update so version sprawl does not pollute the public record ([ADR-0004](adr/0004-authorship-metadata-orcid.md)).

2. **Add the intrinsic-identifier archival layer.** Complement the registry-bound identifier with an **intrinsic, content-derived identifier** — one computed from the artifact's own content and version history, verifiable without any registry, granular to a single line. On each release, trigger an explicit archival request to a content-addressed public software archive and record the snapshot identifier alongside the registry identifier ([ADR-0013](adr/0013-intrinsic-identifier-layer.md)). The two layers cover each other's failure modes: the registry identifier carries authorship semantics it cannot verify against content; the intrinsic identifier verifies content it carries no authorship semantics for. For artifact genres where registry registration is impractical, the intrinsic identifier is the substitute priority-claim mechanism (this is the resolution the framework adopted for [manifesto open question 4](manifesto.md#open-question-4-how-does-the-framework-interact-with-non-doi-registrable-artifacts)).

3. **Ship the AI-facing ingest pair.** Publish each artifact with two synchronously-released entry points: a prose-form navigator (the [`llms.txt` convention](glossary.md#llmstxt-convention)) and a concept-form [JSON-LD knowledge graph](glossary.md#json-ld-knowledge-graph). This is the framework's one normatively-required tactic ([ADR-0006](adr/0006-llm-first-ingest-dual-entry-points.md)): it realizes the openness you committed to on the network-effect axis as machine-readable structure, not merely a permissive license. The two entry points are not co-equal — 2026 measurement found the graph carries retrieval-time citation while the navigator's citation effect is noise-level, so the navigator is rescoped to a context surface for agents rather than a citation lever ([ADR-0009](adr/0009-dual-entry-asymmetric-rebalance.md)). Ship both; weight your effort toward the graph.

4. **Federate the citation graph.** Do not stop at prose mentions of the work you build on. Declare sibling and source relationships as machine-readable related-identifier metadata in your archive deposit, so the citation network is recoverable from metadata alone ([ADR-0002](adr/0002-doi-federation-via-zenodo-json.md)), and mirror the same canonical artifact across your git host, your archive, and a dataset platform with explicit cross-references on each ([ADR-0003](adr/0003-cross-platform-dataset-federation.md)). When you cite an external work, give it a machine-readable edge — in your deposit metadata, in your knowledge graph, and in a public author-and-paper authority record — not only a sentence. This makes you discoverable from the cited author's side, which is where derivation-as-validation begins.

5. **Stand up two-channel measurement.** The single "diffusion" you are optimizing is two mechanisms with opposite time constants: a **parametric channel** (your idea absorbed into model weights at training time — slow, driven by cross-platform vocabulary co-occurrence) and a **retrieval channel** (your artifact fetched at query time — fast, driven by freshness and structure) ([ADR-0008](adr/0008-rag-era-attribution-diffusion.md)). Measure them separately with the [two-channel probe protocol](glossary.md#two-channel-attribution-diffusion): probe frontier models with search suppressed (does the trained model name your concept *and* you, from weights alone — the [retrieval-suppressed naming probe](glossary.md#retrieval-suppressed-naming-probe)) and with search enabled (are your identifiers cited, and does your name survive in prose, or is the concept cited with your name stripped — the [ghost-citation](glossary.md#ghost-citation) failure mode). Detect verdicts by deterministic string matching against a versioned lexicon over retained raw responses, never by model judging, and quantify the confabulation floor with a negative-control probe ([ADR-0011](adr/0011-two-channel-probe-protocol.md)).

Two further Layer 4 disciplines apply across all of the above:

- **Vocabulary discipline.** Coin a term only when the concept is genuinely new, definable in one sentence of existing vocabulary, and the namespace is uncontested; anchor every coinage densely to existing vocabulary and prior literature; say everything else in existing vocabulary with the upstream source cited ([ADR-0010](adr/0010-vocabulary-discipline.md)). A coined term's power is its edge density, not the count of coinages.

- **Channel selection for external collections.** When you list an artifact in an external curated collection, contribute a link-index entry only — the canonical artifact stays in your repository while the host carries a hyperlink and a short factual description. Pass every prospective host through a four-condition audit before submitting, and withdraw if a listed host later encloses ([ADR-0012](adr/0012-link-index-channel-selection.md)).

### Step 4 — Map each ADR to its adopter action

The table consolidates the mapping for reference. Read it as: *to
deploy the framework, do the action; to understand why, read the ADR.*

| ADR | Adopter action |
|---|---|
| [ADR-0001](adr/0001-concept-doi-canonical.md) | Reference every artifact by its concept (latest-version) identifier, never a version-pinned one. |
| [ADR-0002](adr/0002-doi-federation-via-zenodo-json.md) | Declare sibling and source relationships as related-identifier metadata in your deposit. |
| [ADR-0003](adr/0003-cross-platform-dataset-federation.md) | Mirror the canonical artifact across git host, archive, and dataset platform with cross-references. |
| [ADR-0004](adr/0004-authorship-metadata-orcid.md) | Enrich your identity record with concept identifiers only; disable auto-update. |
| [ADR-0005](adr/0005-readme-localization-audience-driven.md) | Add or retire locale mirrors on observed traffic, not on speculation about audiences. |
| [ADR-0006](adr/0006-llm-first-ingest-dual-entry-points.md) | Ship the prose navigator and the JSON-LD graph as a synchronously-released pair. |
| [ADR-0007](adr/0007-human-attention-signals-not-a-metric.md) | Do not optimize star counts or page views; measure LLM-mediated channel breadth instead. |
| [ADR-0008](adr/0008-rag-era-attribution-diffusion.md) | Optimize and measure the parametric and retrieval channels separately. |
| [ADR-0009](adr/0009-dual-entry-asymmetric-rebalance.md) | Weight effort toward the graph; keep the navigator as an agent context surface. |
| [ADR-0010](adr/0010-vocabulary-discipline.md) | Coin sparingly; anchor densely; cite upstream for everything else. |
| [ADR-0011](adr/0011-two-channel-probe-protocol.md) | Run the scheduled two-channel probe; detect deterministically; keep a public CC0 log. |
| [ADR-0012](adr/0012-link-index-channel-selection.md) | Contribute link-index entries only; audit hosts; withdraw on enclosure. |
| [ADR-0013](adr/0013-intrinsic-identifier-layer.md) | Archive to a content-addressed software archive each release; record the intrinsic identifier. |
| [ADR-0014](adr/0014-implementation-tracking-two-tier-ledger.md) | Keep a private planning ledger and a public, effect-claim-free intervention timeline, never merged; run a periodic gap-review. |

The original author's worked implementation of this entire path is the
research ecosystem the [empirical layer](empirical/README.md) observes —
the framework's own
[abstract-doctrine-plus-worked-implementation pair](glossary.md#worked-implementation).
The doctrine is this repository; the worked implementation is the
author's ecosystem, including the
[implementation log](empirical/implementation-log.md) that timestamps
which tactic was deployed when. When the abstract steps above are
underdetermined, the worked implementation is where you can see one
concrete instantiation — not as the only correct instantiation, but as
an existence proof that the doctrine is implementable.

## What to expect, and what not to expect

The framework is normative, not predictive. It tells you what a
consistent strategy looks like; it does not promise an outcome. The
empirical layer is explicit that it reports
[preliminary observation](glossary.md#preliminary-observation-in-empirical-claims),
not evidence, and that no causal claim about the tactics is supported
by its data. Carry that honesty into your own expectations.

**Expect to be able to run the framework.** The action path is
designed to require clone-and-copy, not signup, API keys, or bespoke
infrastructure. The tactics are author-controllable: nothing in the
path depends on another party granting you access.

**Expect the signal to be ambiguous.** Traffic to your artifacts will
not tell you whether a clone is a training-pipeline ingest, a
retrieval-time fetch, a re-implementer's review, or a human reader. The
framework treats this ambiguity as structural, not as a measurement
gap to close (thesis, *Epistemic humility about diffusion signals*).
The two-channel probe narrows the question but does not eliminate the
ambiguity.

**Do not expect a documented effect size.** The framework's own
empirical layer carries load-bearing limitations you should read
before forming expectations: a single-author sample, no
pre-versus-post intervention comparison, automation dominance in the
clone signal, and single-window probe tests. Those limitations are
catalogued in the [empirical README](empirical/README.md#limitations).
No release of this framework claims a percentage lift from any tactic,
and an adopter should not expect to be able to claim one either —
only to be able to observe, over time, whether their own concept and
name appear in LLM outputs.

**Do not expect multi-author guarantees.** As stated in the caveat,
the framework is single-author normative. If you adopt it across a
team, you are extending it into territory it has not worked out.

**Expect derivation to be the success signal, not a threat.** If
another author re-implements your idea, paraphrases your terminology,
or absorbs your artifact into a larger system, that is the validation
mechanism working as designed (thesis,
[Axis 2](thesis.md#axis-2--validation-mechanism-exclusivity-to-derivation)).
The framework welcomes derivatives; treating them as theft inverts the
strategy back to the print-and-platform posture the thesis argues is
weaker under LLM-mediated diffusion.

## Where to go next

- **[`conformance.md`](conformance.md)** — a self-check for whether an
  adopter is operating the framework consistently across all
  three axes (a strategy mixing axes is, by the thesis, internally
  inconsistent).
- **[`implementations.md`](implementations.md)** — the registry of
  known applications of the framework. The original author's ecosystem
  is the reference implementation; third-party adoptions and
  derivatives are listed there and are welcome. If you apply the
  framework, you are invited to add yours.

These two documents are the companions to this guide: this guide is the
*path*, conformance is the *check*, and implementations is the
*registry*.
