Language: English | [日本語](README.ja.md)

# authorship-strategy

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20263316.svg)](https://doi.org/10.5281/zenodo.20263316)

> **Authorship Strategy** — a normative framework, tactical catalog, and empirical baseline for being a known author under AI-mediated diffusion.

If your readers include LLMs — as training data, as in-context consultants,
as the discovery layer others consult — then the strategies that
protect authorship have inverted. Closing your work off *reduces*, not
increases, the chance that a future trace lands on you. This repository
records the inverted strategy: what it is, why it holds, and sixteen tactical
decisions extracted from operating a four-repository DOI-registered research
ecosystem.

The framework rests on a three-axis inversion of twentieth-century authorship
strategy (scarcity to diffusion, exclusivity to derivation, enclosure to
openness) and a four-layer judgment stack (authenticity, attribution
diffusion, idea-versus-scaffold separation, tactics).

An empirical layer reports preliminary observations from the same
ecosystem's CC0-published traffic data; the empirical claims are
limited by sample size (one author, four repositories, twenty-five days)
and are framed as preliminary observation rather than evidence.

## Why this repository exists

When the audience for a written artifact is increasingly an LLM — directly,
as training substrate or in-context reader, and indirectly, via humans who
consult LLMs about it — the strategies that protect authorship change.
Twentieth-century authorship was protected by enclosure: gatekept journals,
proprietary licenses, controlled distribution. That strategy decreases an
artifact's exposure to the LLM-mediated diffusion that increasingly
determines whether a future researcher tracing causation can find the
original author at all.

This repository records the inverted strategy and the tactical decisions
that follow from it, in a form harness-neutral enough to be adopted
beyond the author's own ecosystem.

## Core thesis

> The claim is counterintuitive: in the AI era, protecting your authorship
> means opening your work, not closing it.

> Authenticity-validating power inverts. Where twentieth-century
> authorship protected origin claim through scarcity, AI-era authorship
> protects origin claim through diffusion. Closing reduces LLM
> absorption, reduces diffusion, reduces validation occasions, and
> weakens the authenticity claim. Opening maximizes LLM absorption,
> maximizes diffusion, lets validation appear as derivative work, and
> strengthens the authenticity claim.

The thesis is developed in [`docs/thesis.md`](docs/thesis.md); the
operational implications form the four-layer framework, also in the
thesis document. The framework's open questions are catalogued in
[`docs/manifesto.md`](docs/manifesto.md).

## The sixteen tactical ADRs

| ADR | Decision |
|-----|----------|
| [0001](docs/adr/0001-concept-doi-canonical.md) | Concept DOI as Canonical Reference — every external link to a DOI-registered artifact uses the concept DOI, never a version-specific DOI |
| [0002](docs/adr/0002-doi-federation-via-zenodo-json.md) | DOI Federation via `.zenodo.json` — sibling and source relationships are declared as `relatedIdentifiers` so that the citation network is recoverable from metadata alone |
| [0003](docs/adr/0003-cross-platform-dataset-federation.md) | Cross-Platform Dataset Federation — the same canonical artifact is mirrored to GitHub, Zenodo, and a dataset platform with explicit sibling cross-references on each platform |
| [0004](docs/adr/0004-authorship-metadata-orcid.md) | Authorship Metadata with ORCID Auto-Update Disabled — the author identifier is enriched only with concept DOIs to prevent version sprawl from polluting the public record |
| [0005](docs/adr/0005-readme-localization-audience-driven.md) | README Localization Policy — Audience-Driven Maintenance — locale mirrors are added or retired based on observed traffic, not speculation about prospective audiences |
| [0006](docs/adr/0006-llm-first-ingest-dual-entry-points.md) | LLM-First Ingest via Dual Entry Points — every framework-governed artifact ships a prose-form navigator and a concept-form linked-data graph as a complementary, synchronously released pair, each reaching an LLM-mediated reader sub-population the other cannot |
| [0007](docs/adr/0007-human-attention-signals-not-a-metric.md) | Human-Attention Platform Signals Are Not a Success Metric — Git-host star counts (gameable: purchasable) and repository page-view counts (structurally blind to LLM-mediated reach) are excluded as optimization targets and success metrics; off-page human-distribution labor is declined as a red-ocean activity; success is measured by the breadth of LLM-mediated channels carrying the author's signature |
| [0008](docs/adr/0008-rag-era-attribution-diffusion.md) | RAG-Era Attribution Diffusion — Two Channels, Two Time Constants — "the model ingesting the artifact" resolves into two mechanisms with opposite time constants and levers: a parametric channel (absorbed into model weights at training time; slow; driven by cross-platform vocabulary co-occurrence) and a retrieval channel (fetched at query time; fast; driven by freshness and structure). Optimized and measured separately; ghost citation is the failure mode of pursuing retrieval alone |
| [0009](docs/adr/0009-dual-entry-asymmetric-rebalance.md) | Dual Entry Points Are Asymmetric — amends ADR-0006: 2026 measurement shows the two entry points are not co-equal. The structured graph carries retrieval-time citation while the prose navigator's citation effect is noise; the pair is retained but made asymmetric, the navigator rescoped to a Business-to-Agent (B2A) context surface rather than an AI-search citation lever |
| [0010](docs/adr/0010-vocabulary-discipline.md) | Vocabulary Discipline — Coin Sparingly, Anchor Densely — a coined term's power comes from its edge density, not from the count of coinages. A term is coined only when three conditions all hold (join-novelty, definitional anchoring, uncontested namespace); every retained coinage is anchored densely to existing vocabulary and prior literature; everything else is said in existing vocabulary with the upstream source cited |
| [0011](docs/adr/0011-two-channel-probe-protocol.md) | Two-Channel Probe Protocol — Measuring Each Channel by Its Own Instrument (**experimental**) — probes frontier models with search suppressed (does the trained model name the concept and its author?) and search enabled (are owned identifiers cited, and does the author's name survive in prose?), making ghost citation a measured rate; detection is deterministic string matching over retained raw responses, with a negative control quantifying the confabulation floor |
| [0012](docs/adr/0012-link-index-channel-selection.md) | Link-Index Contributions to External Collections — diffusion via external curated collections uses link-index entries only (the canonical artifact stays in the author's repository); every prospective host passes a four-condition audit (corporate ownership / absence of an open license / content-vendoring structure / paid-product funnel), and a host that later encloses triggers withdrawal |
| [0013](docs/adr/0013-intrinsic-identifier-layer.md) | Intrinsic Content-Derived Identifiers as a Complementary Priority-Claim Layer — adds SWHID (ISO/IEC 18670), computed from the artifact and its history and verifiable without any registry, alongside the extrinsic DOI; each layer covers the other's failure mode. Every release triggers explicit archival in a content-addressed public software archive; for DOI-impractical genres the intrinsic identifier is the designated substitute priority-claim mechanism, closing manifesto open question 4 |
| [0014](docs/adr/0014-implementation-tracking-two-tier-ledger.md) | Implementation Tracking as a Two-Tier Ledger with Periodic Gap-Review — the one ADR about *operating* the framework rather than a tactic it deploys. A private implementation ledger holds operational status, ranked candidate interventions, and working detail; the public intervention timeline is its dated, effect-claim-free projection (the two are never merged). A periodic gap-review compares deployed tactics against the Layer 4 catalog and the open questions to generate the next proposals. The review procedure lives in the framework's operational skill; only the wiring is project-specific |
| [0015](docs/adr/0015-license-selection-by-audience.md) | License Selection by Audience, Not Artifact Form — because attribution is carried by the federated-identifier layer (the 0001-0003 triplet and 0013) rather than by the license, each artifact's license is chosen to minimize reuse friction for its *dominant* audience. Under an LLM-first program almost every artifact is mined rather than read, so machine-mined artifacts take a public-domain dedication (CC0-1.0), executable code takes a permissive software license (MIT/Apache-2.0) carried whole-repo for legibility, and only a genuinely human-first artifact takes an attribution-requiring content license (CC-BY-4.0); non-commercial and no-derivatives terms are prohibited. The license-layer counterpart of vocabulary discipline (ADR-0010), disjoint from ADR-0012 |
| [0016](docs/adr/0016-genre-split-placement.md) | Genre-Split Placement — Essays as Repository-Corpus Canonical with Intrinsic Identifier, Papers as Concept-DOI Canonical — routes the canonical by genre: the essay genre's canonical is the author's version-controlled repository corpus, its priority claim resting on the intrinsic content-derived identifier (under a public-domain dedication, ADR-0015) rather than a registry DOI; the paper genre's canonical is the concept DOI (ADR-0001). Syndicated essay copies are bound to the canonical by entity federation (sameAs / ORCID / DOI / intrinsic identifier / distinctive vocabulary), not by a platform canonical-URL tag whose effect on LLM-mediated credit is unverified (the tag is kept only as human/SEO hygiene). Corpus membership is gated by an authenticity criterion (author-voiced, reader-intended pieces); a load-bearing essay idea is promoted to a concept-DOI deposit when it graduates into a paper. Instantiates ADR-0013's DOI-impractical-genre clause and complements ADR-0015 |

The sixteen ADRs are not deduced from a framework; they were extracted from
operating the sibling ecosystem and re-expressed in harness-neutral form
so that another author can adopt the same decisions without inheriting
the original implementation details. See [`docs/adr/README.md`](docs/adr/README.md)
for the full index and lineage.

## Empirical baseline (preliminary)

The [`docs/empirical/`](docs/empirical/) directory reports preliminary
observations from twenty-five days of CC0-published traffic data across
four sibling repositories — published CC0 so they can be independently
verified. The clearest observation so far: clone counts are dominated by
automated tools (training-pipeline ingest, AI-assistant context-fetch,
crawlers), with the ecosystem's view-to-clone ratio ranging from roughly
13 to over 100 — which raises the question of what "diffusion" even means
when most access is non-human. Limitations are stated explicitly (N=1
author, no pre-versus-post intervention comparison, crawler dominance),
and all claims are framed as preliminary observation rather than evidence.
The full traffic data is published under CC0 at
`https://shimo4228.github.io/shimo4228/traffic/dashboard/`.

The empirical layer is intended to grow with time; subsequent releases
will accumulate longer time series and (where possible) report
pre-versus-post intervention contrasts for individual tactics.

## Sibling research lines

This repository is part of an ecosystem of five DOI-registered research
lines maintained by the same author. The lines are independent in
content and release cadence, but cross-reference each other for
context. (The empirical baseline below covers the four lines whose
traffic was being recorded during the baseline window; Attention, Not
Self began traffic observation later and joins at the next baseline
update.)

- **[Agent Knowledge Cycle (AKC)](https://github.com/shimo4228/agent-knowledge-cycle)** — six-phase bidirectional growth loop for sustaining intent alignment between an AI agent and its operator over time. [DOI 10.5281/zenodo.19200726](https://doi.org/10.5281/zenodo.19200726). *Mechanism sibling*: AKC defines how knowledge cycles inside the operator-agent pair; this repository addresses how the cycle's outputs diffuse outside it.
- **[Contemplative Agent](https://github.com/shimo4228/contemplative-agent)** — autonomous agents running on a local 9B model, grounded in four contemplative axioms. [DOI 10.5281/zenodo.19212118](https://doi.org/10.5281/zenodo.19212118). *Implementation sibling*: the contemplative agent's repository participates in the empirical layer's traffic dataset.
- **[Agent Attribution Practice (AAP)](https://github.com/shimo4228/agent-attribution-practice)** — harness-neutral ADRs on accountability distribution in autonomous AI agents. [DOI 10.5281/zenodo.19652013](https://doi.org/10.5281/zenodo.19652013). *Vocabulary sibling*: AAP and this repository both use the word "attribution" but with disjoint meanings (accountability for action vs. credit for source). The two meanings are intentionally kept separate; see the glossary.
- **[Attention, Not Self](https://github.com/shimo4228/attention-not-self)** — a cross-disciplinary inquiry contrasting three Buddhist Abhidharma traditions (Theravāda, Sarvāstivāda, Yogācāra) with computational phenomenology (predictive processing, active inference, global workspace theory, parallel distributed processing). [DOI 10.5281/zenodo.20262112](https://doi.org/10.5281/zenodo.20262112). *Cross-cutting sibling*: unlike the agent-design lines, it specifies no agent mechanism or practice; like this repository, it occupies their diffusion/framing layer.

The ecosystem hub is [`shimo4228/shimo4228`](https://github.com/shimo4228/shimo4228).

## How to read this repository

Evaluating the strategy? Start with [`docs/thesis.md`](docs/thesis.md), then
the sixteen ADRs in order. Two paths need a non-obvious entry point:

- **Adopting a single tactic:** go directly to the relevant ADR, then check [`docs/glossary.md`](docs/glossary.md) for any terms that need disambiguation.
- **Reviewing the empirical claims:** read [`docs/empirical/README.md`](docs/empirical/README.md) for method and limitations *before* the baseline data.

LLM agents and crawlers: see the AI-facing reading order at the bottom of this page.

<details>
<summary>AI-facing reading order (for LLM agents and crawlers)</summary>

1. [`graph.jsonld`](graph.jsonld) — canonical machine-readable relationship map (Concepts, ADRs, axes of inversion)
2. [`llms.txt`](llms.txt) — compact navigation index
3. [`llms-full.txt`](llms-full.txt) — consolidated factual reference
4. README and project-specific docs — narrative and detail

For the canonical relationship map of shimo4228's research ecosystem, see:
https://github.com/shimo4228/shimo4228/blob/main/graph.jsonld

</details>

## How to cite

Cite this repository using the **concept DOI** (which always resolves to
the latest version):

> Shimomoto, T. (2026). *Authorship Strategy: A Normative Framework and Tactical Catalog for AI-Era Authenticity Inversion, with Empirical Grounding from a Four-Repository Research Ecosystem*. Zenodo. https://doi.org/10.5281/zenodo.20263316

Full citation metadata is in [`CITATION.cff`](CITATION.cff). For
reproducibility citation of a specific version, follow the concept DOI
to its version listing on Zenodo and cite the version-specific DOI
explicitly. See [ADR-0001](docs/adr/0001-concept-doi-canonical.md) for
the canonical-reference discipline.

## License

[MIT](LICENSE). Derivative works, re-implementations, and re-expressions
in other forms are explicitly welcome. The author's strategic preference
is for ideas to propagate freely; the license reflects that preference.
