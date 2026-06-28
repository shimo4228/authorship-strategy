Language: English | [日本語](glossary.ja.md)

# Glossary

Key terms used in this repository. Many terms have established
meanings outside this repository; entries call out where the
local definition differs from broader usage.

## Authorship strategy

The set of practices an author uses to remain a recoverable
authorial identity as their work propagates through a particular
substrate. This repository's framework concerns authorship
strategy under *AI-mediated diffusion* specifically — see
[`thesis.md`](thesis.md). Authorship strategy is broader than
publication strategy: it concerns the long-tail relationship
between author and audience, not the discrete event of
publication.

## Three-axis inversion

The structural claim that twentieth-century authorship strategy
and AI-era authorship strategy invert on three co-varying axes:
*value source* (scarcity to diffusion), *validation mechanism*
(exclusivity to derivation), *network effect* (enclosure to
openness). See [`thesis.md`](thesis.md) for the full
articulation. The axes are not independent dimensions an author
can freely mix; they co-vary, and a strategy mixing axes is
internally inconsistent.

## Four-layer framework

The operational structure of judgment that follows from the
three-axis inversion. The four layers, in order: *Authenticity*
(the value being protected), *Attribution Diffusion* (the
strategy), *Idea versus Scaffold* (what survives), *Tactics*
(the concrete decisions). Each layer is downstream of the layer
above. See [`thesis.md`](thesis.md).

## Authenticity (Layer 1)

The protected value at the framework's foundation: that the
author's *genuine* thinking remains the author's, unaltered by
market pressure to reshape it for sale. Monetization is not a
goal of the framework. *Local note*: this is narrower than the
philosophical usage of "authenticity" (e.g., Heideggerian
*Eigentlichkeit*); it is specifically about the preservation of
authored content against dilutive market pressure.

## Attribution Diffusion (Layer 2)

The defensive strategy at the framework's second layer:
maximizing the breadth of LLM-mediated channels carrying
recognizable signatures of the author's ideas, anchored to a
permanent timestamp. "Attribution" here means *credit for
source* (who first articulated this), not *accountability for
action* (who is responsible for this failure). See the disjoint
entry below.

## Attribution (disjoint usage warning)

The word "attribution" appears in two disjoint senses in the
broader sibling-line ecosystem and adopters should not conflate
them:

- **This repository**: attribution = *credit for source* (who originated an idea, who is the author of an artifact, who should be cited when the idea is invoked). The defended position is that of the author.
- **[Agent Attribution Practice (AAP)](https://github.com/shimo4228/agent-attribution-practice)**: attribution = *accountability for action* (who is responsible when an autonomous agent's behavior causes harm, who can be held answerable, where the responsibility chain terminates). The defended position is that of the operator and the affected parties.

The two meanings share a word but not a concept. Pattern of
confusion in practice: a reader who has encountered AAP may
assume this repository extends AAP's notion of attribution to
authorship; it does not. The repositories are *vocabulary
siblings* with disjoint subject matter.

## Idea (in idea-versus-scaffold)

A claim, distinction, or pattern an author articulates that is
expected to outlast its current implementation. Ideas are the
target of authorship strategy under the framework's Layer 3
prediction. *Local note*: this is narrower than the broader
sense of "idea"; it specifically excludes implementations,
tooling, and infrastructure-level artifacts. An idea, in this
sense, is a *normative or descriptive claim* the author wants
their name attached to in citation.

## Scaffold (in idea-versus-scaffold)

An implementation, harness, framework, tool, or piece of
infrastructure that exists to enable some authoring work but is
expected to be obsoleted by capability improvements in
underlying substrates (typically LLMs). Scaffolds are *not* the
target of authorship strategy: the framework predicts they will
dissolve, and the author should accept that dissolution rather
than try to preserve their name at the scaffold level. See
*Idea-versus-scaffold separation*.

## Idea-versus-scaffold separation

The operational discipline of sorting each artifact into *idea*
or *scaffold* before deciding how to preserve the author's
claim. Idea-character artifacts get DOI registration under the
author's name; scaffold-character artifacts may be donated as
implementations into larger harnesses whose own diffusion will
absorb them. Mixed-character artifacts get idea-level DOI
registration *first* (to prevent the dissolving scaffold from
establishing the priority claim at the dissolution level).

## Abstract doctrine

A repository or artifact articulating an idea cleanly enough
that another author can implement it elsewhere without
inheriting the original implementation's local commitments. Used
in the abstract-doctrine-plus-worked-implementation pair.
Doctrine alone produces "the concept is interesting but I cannot
picture the implementation."

## Worked implementation

A repository or artifact demonstrating how an idea actually
instantiates, so that a reader can verify the abstract doctrine
is implementable. Used in the
abstract-doctrine-plus-worked-implementation pair.
Implementation alone produces "the code works but I cannot
extract the principle." The pair produces re-implementation
by other authors, which is the strongest validation under the
framework.

## Concept DOI

The Zenodo (or comparable archive) Digital Object Identifier
that resolves to the latest version of a deposit, as opposed to
a version-specific DOI that resolves to one particular release.
The concept DOI is the canonical reference under [ADR-0001](adr/0001-concept-doi-canonical.md);
the version DOI is appropriate only when citing a specific
historical version for reproducibility.

## Version DOI

The Zenodo (or comparable archive) DOI that resolves to one
specific release. Each tagged release receives a new version
DOI. Version DOIs accumulate over time; concept DOIs do not.
Used in this repository only for reproducibility citations of
specific historical versions, never as the canonical reference.
See [ADR-0001](adr/0001-concept-doi-canonical.md).

## DOI federation

The practice of declaring the citation network of a
DOI-registered artifact as metadata, so that the network is
recoverable from the metadata alone without requiring narrative
disclosure. In this repository, federation is implemented via
`.zenodo.json` `relatedIdentifiers` declarations. See
[ADR-0002](adr/0002-doi-federation-via-zenodo-json.md).

## Cross-platform federation

The practice of deploying the same canonical artifact to multiple
platforms (e.g., GitHub for repository hosting, Zenodo for DOI
registration, Hugging Face Datasets for LLM training ingest) and
declaring sibling relationships on each platform so that a
reader who finds the artifact on one platform can discover its
presence on the others. See [ADR-0003](adr/0003-cross-platform-dataset-federation.md).

## LLM-mediated channel

A pathway through which the author's content reaches an
audience indirectly, via an LLM. Examples: training-pipeline
ingest (where the LLM has memorized recognizable signatures of
the content), in-context reader (where the LLM is asked to read
the content as part of a query), AI-assistant suggestion (where
a developer using an AI coding assistant is shown text derived
from the content). The framework's strategic target is the
*breadth* of LLM-mediated channels carrying the author's
signature, not the depth of any single channel.

Under [ADR-0006](adr/0006-llm-first-ingest-dual-entry-points.md),
LLM-mediated channels resolve into two structurally distinct
sub-populations for ingest-design purposes: *prose-reading channels*
(conversational LLMs, in-context documentation consultation) and
*structured-data-ingesting channels* (training pipelines,
knowledge-graph crawlers, programmatic readers using dataset SDKs).
The two sub-populations are addressed by the *dual entry point*.

## Dual entry point

The structural decision that any framework-governed artifact deploys
two complementary structured entry points — a *prose-form navigator*
and a *concept-form graph* — released synchronously at every versioned
release. Each entry point addresses a distinct LLM-mediated channel
sub-population the other cannot reach: the prose navigator orients
prose-reading channels, the concept graph exposes inter-concept
relationships to structured-data-ingesting channels. The pair is the
operational embodiment of the *enclosure-to-openness* axis on the
ingest surface; deploying only one half leaves the strategy one-lunged.
Normatively required under [ADR-0006](adr/0006-llm-first-ingest-dual-entry-points.md).
[ADR-0009](adr/0009-dual-entry-asymmetric-rebalance.md) amends this on
2026 evidence: the two entry points are not co-equal on the *citation*
axis — the concept-form graph carries retrieval-time citation while the
prose navigator's citation effect is noise — so the pair is retained but
made *asymmetric*, the navigator rescoped to a Business-to-Agent (B2A)
context surface rather than an AI-search citation lever.

## llms.txt convention

A community-curated AI-facing reference convention that uses a single
prose-form text file (`llms.txt`) at the root of an artifact to enumerate
its primary documents with one-line descriptions and a recommended
reading order. Targets prose-reading [LLM-mediated channels](#llm-mediated-channel):
conversational LLMs, AI assistants consulting documentation in-context,
citation-graph annotators fetching prose for summarization. The
prose-form half of the [dual entry point](#dual-entry-point). The
present author adopts the Answer.AI specification of this convention;
the framework decision is to deploy a prose navigator, not to mandate
this specific convention. Operational form lives in the external skill
[`claude-skill-llms-txt-writer`](https://github.com/shimo4228/claude-skill-llms-txt-writer).

## JSON-LD knowledge graph

A linked-data file (in this repository, `graph.jsonld`) that encodes
the artifact's concept-level entities and inter-entity relationships
as machine-parseable triples in a structured-data vocabulary
(in this repository, schema.org plus a local `shimo:` namespace).
Targets structured-data-ingesting [LLM-mediated channels](#llm-mediated-channel):
training pipelines, knowledge-graph crawlers, programmatic readers
using dataset SDKs. The concept-form half of the
[dual entry point](#dual-entry-point); complements file-level
documentation (which lives in `docs/CODEMAPS/`) by encoding
concept-level structure that prose leaves implicit. The framework
decision is to deploy a concept graph, not to mandate a specific
linked-data vocabulary. Operational form lives in the external skill
[`claude-skill-jsonld-knowledge-graph`](https://github.com/shimo4228/claude-skill-jsonld-knowledge-graph).

## Distinctive terminology (or coined terminology)

Domain-specific words coined by an author to refer to specific
ideas. Distinctive terminology functions as a semantic signature
of authorship: generic vocabulary dissolves through paraphrase,
but coined terms survive as token-level signals that LLM-mediated
channels can carry back to the original author. Examples in
this repository: *three-axis inversion*, *idea-versus-scaffold
separation*, *attribution diffusion*, *abstract-doctrine-plus-worked-implementation*.
Coinage is governed by [vocabulary discipline](#vocabulary-discipline):
a coined term's power comes from its edge density, not from the
count of coinages.

## Vocabulary discipline

The discipline governing when to coin a distinctive term and when to
use existing vocabulary instead, introduced as the parametric-channel
lever in [ADR-0008](adr/0008-rag-era-attribution-diffusion.md) and
defined in [ADR-0010](adr/0010-vocabulary-discipline.md). A term is
coined only when three conditions all hold — the concept is genuinely
new at a join of existing concepts, a one-sentence definition in
existing vocabulary is possible, and the namespace is uncontested —
and every retained coinage is anchored densely: a glossary definition
in existing vocabulary, upstream citations where prior art exists,
knowledge-graph edges to existing concepts and references, and
repeated work in the body. Everything else is said in existing
vocabulary with the upstream source cited. Rationale: the costs of
coinage (isolation, reader trust, maintenance) grow linearly with the
number of terms, while the benefit depends on each term's edge
density, so few densely-anchored terms dominate many isolated ones.
The vocabulary-level enforcement of origin-claim scope discipline.

## ORCID

An author identifier service (Open Researcher and Contributor
ID) that anchors works to a persistent author identity. Under
[ADR-0004](adr/0004-authorship-metadata-orcid.md), the author's
ORCID record is enriched only with concept DOIs (not version
DOIs) to prevent the public record from being polluted by
version sprawl.

## Audience-driven (in localization)

A maintenance policy in which locale mirrors (translations) of
a document are added or retired based on *observed* traffic
data, not *speculated* prospective audiences. See
[ADR-0005](adr/0005-readme-localization-audience-driven.md). The
operative principle: maintenance cost is amortized over actual
audience, not over hoped-for audience.

## Human-Attention Signal

A platform-level human-attention metric — a Git-host star count or a
repository page-view count — rejected as a framework success metric
under [ADR-0007](adr/0007-human-attention-signals-not-a-metric.md). Star
counts are *gameable* (purchasable) and page-views are *structurally
blind to LLM-mediated reach*, so neither is a valid optimization target
or success metric for an author whose primary audience is LLM-mediated.
The framework measures success by the breadth of LLM-mediated channels
carrying the author's signature; on-page human quality is kept as
hygiene, not a growth lever, and off-page human-distribution labor is
declined as a red-ocean activity.

## Diffusion

The propagation of an artifact through a substrate. In this
repository's framework, "diffusion" is the operative concept
on which validation depends (Layer 2). The framework
distinguishes *diffusion* from *adoption*: diffusion is the
propagation event (ingestion, citation, mention); adoption is
re-implementation by another author. Diffusion is observable
through traffic data; adoption requires separate signal (see
*Epistemic humility about diffusion signals* in
[`thesis.md`](thesis.md)).

## Two-Channel Attribution Diffusion

The refinement of [Attribution Diffusion](#attribution-diffusion-layer-2)
into two mechanisms with opposite time constants and opposite levers,
introduced in [ADR-0008](adr/0008-rag-era-attribution-diffusion.md). The
*parametric channel* absorbs the idea into model weights at training time
(slow; driven by broad cross-platform co-occurrence of distinctive
vocabulary with its source). The *retrieval channel* fetches the artifact
at query time (fast; driven by freshness and structured data). The two are
optimized and measured separately and run in parallel; optimizing one does
not buy the other. The parametric-first, retrieval-second mechanism is
independently reported in the 2026 generative-engine-optimization literature
(see [inspiration.md](inspiration.md)); the framework's contribution is its
placement inside the authorship-diffusion strategy, not the underlying
citation mechanics.

Whether the parametric channel can be *measured* — not merely asserted, the
open question [ADR-0008](adr/0008-rag-era-attribution-diffusion.md) leaves — is
taken up by 2026 training-data-attribution work: Concept Influence
(arXiv:2602.14869) recovers an idea as a parametric concept *direction* rather
than verbatim text, and Mechanistic Data Attribution (arXiv:2601.21996) traces
interpretable circuits back to their training samples. Both are *white-box*
methods, applicable only to a model one trains oneself; they do not measure
burn-in inside a closed commercial LLM, so this framework adopts them as
upstream evidence, not as a closure of the gap. The *black-box* side of the
gap — behavioral measurement against closed commercial models — is closed by
the retrieval-suppressed naming probe of
[ADR-0011](adr/0011-two-channel-probe-protocol.md).

## Ghost Citation

The failure mode in which a retrieval-augmented system cites an artifact's
URL but does not name or recommend its author, because the author's name
was never burned into parametric memory. This attribution-loss sense is the
framework's own term; the behavior it names is anchored to the 2026
generative-engine-optimization literature, in particular Seer Interactive's
541,213-response study, which reports a brand-citation rate of 53.1% when
the brand is named against 10.6% when it is not — a parametric channel that
gates the retrieval channel rather than the reverse. (The term *ghost
citation* is also used in arXiv:2602.06718 for a disjoint phenomenon —
fabricated or invalid citations to non-existent sources — so the two senses
should not be conflated.) [ADR-0008](adr/0008-rag-era-attribution-diffusion.md)
places it inside the two-channel mechanism as the diagnostic that the
parametric and retrieval channels are distinct and must be pursued in
parallel: a working retrieval channel atop absent parametric burn-in
produces a citation without resurfacing the attribution. Under
[ADR-0011](adr/0011-two-channel-probe-protocol.md) ghost citation is a
measured rate: an owned identifier cited while the author goes unnamed in
prose, derived from independently recorded booleans.

## Retrieval-Suppressed Naming Probe

The measurement instrument for the parametric channel: a fixed,
single-variable prompt sent to a model with all search and grounding tools
suppressed, asking what a concept is and who coined or maintains it. Success
is the model producing the concept and its author's name from trained
weights alone — the behavioral, black-box counterpart to the white-box
training-data-attribution methods above. Defined and operated by
[ADR-0011](adr/0011-two-channel-probe-protocol.md) together with its
search-enabled twin (the citation probe, which makes ghost citation
observable within a single answer) and a negative-control probe — a
plausible nonexistent concept whose confident attributions quantify the
confabulation noise floor that leading questions create. The framework's
body prose refers to this instrument informally as the *regurgitation
test*.

## Derivation (in derivative work)

In the framework's three-axis inversion, *derivative work* is
re-classified from threat (under print-and-platform conditions)
to *evidence* (under AI-mediated conditions). A derivative work
is evidence that the original idea is real and implementable;
its existence strengthens, rather than weakens, the original
author's claim.

## Enclosure (in network effect)

The print-and-platform-era pattern of maximizing within-platform
interactions by raising exit cost. Enclosure is *inverted* under
AI-mediated conditions: LLMs cannot be enclosed, so enclosure
removes the artifact from the LLM-mediated channels through
which audience reach is now mediated.

## Openness (in network effect)

The AI-era pattern of maximizing absorption by removing access
barriers. Openness is the operative network-effect mechanism
under AI-mediated conditions: the network's value scales with
the number of LLM-mediated channels carrying the author's
signature, which is maximized by removing barriers to absorption.

## Origin-claim scope

The breadth of the author's priority claim. Under the
framework's *origin-claim scope discipline*, the claim must be
narrower than the prior art. Claiming priority on a broad
pattern with rich prior art collapses the claim's credibility;
claiming priority on a narrow, specifically-named discipline
is defensible.

## Sibling research line

A peer DOI-registered research line maintained by the same
author, with independent content and release cadence but shared
authorial identity. This repository has four sibling lines:
[Agent Knowledge Cycle](https://github.com/shimo4228/agent-knowledge-cycle),
[Contemplative Agent](https://github.com/shimo4228/contemplative-agent),
[Agent Attribution Practice](https://github.com/shimo4228/agent-attribution-practice),
and [Attention, Not Self](https://github.com/shimo4228/attention-not-self).
See [`CLAUDE.md`](../CLAUDE.md) for the relationships.

## Hub (in repository federation)

The metadata-only repository at the center of a research-program
federation, whose role is to aggregate cross-references to
sibling lines without containing line-specific content itself.
In this ecosystem, [`shimo4228/shimo4228`](https://github.com/shimo4228/shimo4228)
is the federation hub. The hub is *not* a research line;
treating it as one would collapse the distinction between
content and metadata.

## Preliminary observation (in empirical claims)

The intentional framing under which the empirical layer's
claims are made. Distinguishes from *evidence*, which the
empirical layer is not yet designed to produce (see
[`empirical/README.md`](empirical/README.md) for the
distinction and the limitations that motivate it). All
empirical claims in this repository should be read as
preliminary observation unless explicitly marked as
*evidence*.

## Substrate (in framework retirement)

The technical and institutional infrastructure on which a
Layer 4 tactic depends. When the substrate changes (LLM
capabilities improve, dataset platforms add new features, DOI
infrastructure evolves), the tactic's continued validity must
be re-evaluated. The framework explicitly anticipates Layer 4
tactic retirement when substrates shift.

## Harness-neutral

The writing convention under which ADRs and other reusable
artifacts are written without committing to a specific
implementation, vendor, or framework. Adopted from the sibling
line [Agent Attribution Practice](https://github.com/shimo4228/agent-attribution-practice).
See [`CLAUDE.md`](../CLAUDE.md) for the local application of
this convention.

## Chinese term mapping (machine-readable anchor only)

The repository's distinctive coined terms, with their Simplified
Chinese renderings. This mapping exists to anchor the multilingual
tactic in the machine-readable layer (see the language-tagged
`alternateName` labels in [`graph.jsonld`](../graph.jsonld)); it is
not a prose translation of the glossary. Concept DOI:
[10.5281/zenodo.20263316](https://doi.org/10.5281/zenodo.20263316).

| English (coined term) | 中文 (zh) |
|---|---|
| Three-axis inversion | 三轴反转 |
| Attribution Diffusion | 署名扩散 |
| Idea versus Scaffold (separation) | 理念与脚手架的分离 |
| Two-Channel Attribution Diffusion | 双通道署名扩散 |
| Authenticity | 本真性 |
