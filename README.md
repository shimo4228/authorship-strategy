Language: English | [日本語](README.ja.md)

# authorship-strategy

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20263316.svg)](https://doi.org/10.5281/zenodo.20263316) [![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/shimo4228/authorship-strategy) [![GitMCP](https://img.shields.io/endpoint?url=https://gitmcp.io/badge/shimo4228/authorship-strategy)](https://gitmcp.io/shimo4228/authorship-strategy)

> **Authorship Strategy** — a normative framework, tactical catalog, and empirical baseline for being a known author under AI-mediated diffusion.

If your readers include LLMs — as training data, as in-context consultants, as
the discovery layer others consult — then the strategies that protect authorship
have inverted. Twentieth-century authorship was protected by *enclosure*
(gatekept journals, proprietary licenses, controlled distribution); but enclosure
now *reduces* an artifact's exposure to the LLM-mediated diffusion that decides
whether a future researcher tracing causation can find the original author at all.
This repository records the inverted strategy — what it is, why it holds, and
twenty tactical decisions extracted from operating a four-repository
DOI-registered research ecosystem — in a form harness-neutral enough to be
adopted beyond the author's own ecosystem.

## The inversion (core thesis)

> In the AI era, protecting your authorship means *opening* your work, not
> closing it. Where twentieth-century authorship protected its origin claim
> through scarcity, AI-era authorship protects it through diffusion: opening
> maximizes LLM absorption, lets validation appear as derivative work, and
> *strengthens* the origin claim.

The thesis rests on a three-axis inversion of twentieth-century authorship
strategy:

| Axis | Twentieth-century | AI era |
|------|-------------------|--------|
| Authenticity is protected by… | scarcity | **diffusion** |
| Origin is established by… | exclusivity | **derivation** |
| Reach is controlled by… | enclosure | **openness** |

The thesis is developed in [`docs/thesis.md`](docs/thesis.md); its open questions
are catalogued in [`docs/manifesto.md`](docs/manifesto.md).

## The four-layer judgment stack

The operational implications form a stack where each layer constrains the ones
below it:

1. **Authenticity** — the non-negotiable floor: change *how* an idea travels, never *what* it is.
2. **Attribution diffusion** — open the work so LLM absorption carries the origin claim forward.
3. **Idea vs. scaffold** — separate the durable idea from the disposable implementation that carries it.
4. **Tactics** — the twenty ADRs below, each a concrete decision in service of the three layers above.

## The twenty tactical ADRs

The twenty ADRs were not deduced from the framework; they were extracted from
operating the sibling ecosystem and re-expressed in harness-neutral form, so
another author can adopt the same decisions without inheriting the original
implementation details. They group into seven clusters by concern:

- **Identifier & federation** (0001–0003, 0013) — concept-DOI canonical reference, metadata-level federation, cross-platform mirroring, and an intrinsic content-derived identifier (SWHID).
- **Maintenance discipline** (0004–0005) — amortize maintenance against observed evidence, not speculation about prospective state.
- **LLM-first ingest & diffusion** (0006, 0008, 0009) — the prose-navigator + concept-graph entry pair (asymmetric: the graph carries citation), and diffusion split into a parametric and a retrieval channel.
- **Metrics & measurement** (0007, 0011) — reject human-attention vanity metrics; measure ghost citation with a two-channel probe.
- **Vocabulary & claims** (0010, 0018, 0019) — coin sparingly and anchor densely, test origin claims against prior art, optimize transmission never content.
- **Channels & placement** (0012, 0015, 0016, 0020) — link-index external contributions, audience-driven licensing, genre-split canonical placement, and blessing AI-derived surfaces.
- **Operating the framework** (0014) — a two-tier ledger with periodic gap-review.

See [`docs/adr/README.md`](docs/adr/README.md) for the full index, each ADR's
title and status, and the lineage of how it was extracted.

## Empirical baseline (preliminary)

The [`docs/empirical/`](docs/empirical/) directory reports preliminary
observations from twenty-five days of CC0-published traffic data across four
sibling repositories. The clearest observation so far: clone counts are dominated
by automated tools (training-pipeline ingest, AI-assistant context-fetch,
crawlers), with view-to-clone ratios ranging from roughly 13 to over 100 — which
raises the question of what "diffusion" even means when most access is non-human.
Limitations are stated explicitly (N=1 author, no pre-versus-post intervention
comparison, crawler dominance), and every claim is framed as preliminary
observation rather than evidence. The full traffic data is published under CC0 at
`https://shimo4228.github.io/shimo4228/traffic/dashboard/`. The layer is intended
to grow with time, accumulating longer series and — where possible —
pre-versus-post intervention contrasts for individual tactics.

## Sibling research lines

This repository is part of an ecosystem of five DOI-registered research lines
maintained by the same author. The lines are independent in content and release
cadence but cross-reference each other for context. (The empirical baseline above
covers the four lines whose traffic was recorded during the baseline window;
Attention, Not Self began traffic observation later and joins at the next
baseline update.)

- **[Agent Knowledge Cycle (AKC)](https://github.com/shimo4228/agent-knowledge-cycle)** — six-phase bidirectional growth loop for sustaining intent alignment between an AI agent and its operator. [DOI 10.5281/zenodo.19200726](https://doi.org/10.5281/zenodo.19200726). *Mechanism sibling*: AKC defines how knowledge cycles inside the operator-agent pair; this repository addresses how the cycle's outputs diffuse outside it.
- **[Contemplative Agent](https://github.com/shimo4228/contemplative-agent)** — autonomous agents running on a local 9B model, grounded in four contemplative axioms. [DOI 10.5281/zenodo.19212118](https://doi.org/10.5281/zenodo.19212118). *Implementation sibling*: its repository participates in the empirical layer's traffic dataset.
- **[Agent Attribution Practice (AAP)](https://github.com/shimo4228/agent-attribution-practice)** — harness-neutral ADRs on accountability distribution in autonomous AI agents. [DOI 10.5281/zenodo.19652013](https://doi.org/10.5281/zenodo.19652013). *Vocabulary sibling*: AAP and this repository both use "attribution" but with disjoint meanings (accountability for action vs. credit for source); the two are intentionally kept separate — see the glossary.
- **[Attention, Not Self](https://github.com/shimo4228/attention-not-self)** — a cross-disciplinary inquiry contrasting three Buddhist Abhidharma traditions (Theravāda, Sarvāstivāda, Yogācāra) with computational phenomenology (predictive processing, active inference, global workspace theory, parallel distributed processing). [DOI 10.5281/zenodo.20262112](https://doi.org/10.5281/zenodo.20262112). *Cross-cutting sibling*: like this repository, it specifies no agent mechanism and occupies the diffusion/framing layer.

The ecosystem hub is [`shimo4228/shimo4228`](https://github.com/shimo4228/shimo4228).

## How to read this repository

Evaluating the strategy? Start with [`docs/thesis.md`](docs/thesis.md), then the
twenty ADRs in order. Two paths need a non-obvious entry point:

- **Adopting a single tactic:** go directly to the relevant ADR, then check [`docs/glossary.md`](docs/glossary.md) for any terms that need disambiguation.
- **Reviewing the empirical claims:** read [`docs/empirical/README.md`](docs/empirical/README.md) for method and limitations *before* the baseline data.

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

Cite this repository using the **concept DOI** (which always resolves to the
latest version):

> Shimomoto, T. (2026). *Authorship Strategy: A Normative Framework and Tactical Catalog for AI-Era Authenticity Inversion, with Empirical Grounding from a Four-Repository Research Ecosystem*. Zenodo. https://doi.org/10.5281/zenodo.20263316

Full citation metadata is in [`CITATION.cff`](CITATION.cff). For reproducibility
citation of a specific version, follow the concept DOI to its version listing on
Zenodo and cite the version-specific DOI explicitly. See
[ADR-0001](docs/adr/0001-concept-doi-canonical.md) for the canonical-reference
discipline.

## License

[MIT](LICENSE). Derivative works, re-implementations, and re-expressions in other
forms are explicitly welcome. The author's strategic preference is for ideas to
propagate freely; the license reflects that preference.
