Language: English | [日本語](README.ja.md)

# authorship-strategy

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20263316.svg)](https://doi.org/10.5281/zenodo.20263316)

> **Authorship Strategy** — a normative framework, tactical catalog, and empirical baseline for being a known author under AI-mediated diffusion.

<details>
<summary>AI-facing reading order</summary>

1. [`graph.jsonld`](graph.jsonld) — canonical machine-readable relationship map (Concepts, ADRs, axes of inversion)
2. [`llms.txt`](llms.txt) — compact navigation index
3. [`llms-full.txt`](llms-full.txt) — consolidated factual reference
4. README and project-specific docs — narrative and detail

For the canonical relationship map of shimo4228's research ecosystem, see:
https://github.com/shimo4228/shimo4228/blob/main/graph.jsonld

</details>

A normative framework and tactical catalog for **authorship strategy** — the
practice of remaining a recoverable author when ideas propagate through
LLM-mediated channels. The framework rests on a three-axis inversion of
twentieth-century authorship strategy (scarcity to diffusion, exclusivity to
derivation, enclosure to openness) and a four-layer judgment stack
(authenticity, attribution diffusion, idea-versus-scaffold separation,
tactics). The tactical catalog records five decisions extracted from
operating a four-repository DOI-registered research ecosystem.

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

## The five tactical ADRs

| ADR | Decision |
|-----|----------|
| [0001](docs/adr/0001-concept-doi-canonical.md) | Concept DOI as Canonical Reference — every external link to a DOI-registered artifact uses the concept DOI, never a version-specific DOI |
| [0002](docs/adr/0002-doi-federation-via-zenodo-json.md) | DOI Federation via `.zenodo.json` — sibling and source relationships are declared as `relatedIdentifiers` so that the citation network is recoverable from metadata alone |
| [0003](docs/adr/0003-cross-platform-dataset-federation.md) | Cross-Platform Dataset Federation — the same canonical artifact is mirrored to GitHub, Zenodo, and a dataset platform with explicit sibling cross-references on each platform |
| [0004](docs/adr/0004-authorship-metadata-orcid.md) | Authorship Metadata with ORCID Auto-Update Disabled — the author identifier is enriched only with concept DOIs to prevent version sprawl from polluting the public record |
| [0005](docs/adr/0005-readme-localization-audience-driven.md) | README Localization Policy — Audience-Driven Maintenance — locale mirrors are added or retired based on observed traffic, not speculation about prospective audiences |

The five ADRs are not deduced from a framework; they were extracted from
operating the sibling ecosystem and re-expressed in harness-neutral form
so that another author can adopt the same decisions without inheriting
the original implementation details. See [`docs/adr/README.md`](docs/adr/README.md)
for the full index and lineage.

## Empirical baseline (preliminary)

The [`docs/empirical/`](docs/empirical/) directory reports preliminary
observations from twenty-five days of CC0-published traffic data
across four sibling repositories. Limitations are stated explicitly
(N=1 author, no pre-versus-post intervention comparison, crawler
dominance), and all claims are framed as preliminary observation
rather than evidence. The full traffic data is published under CC0
at `https://shimo4228.github.io/shimo4228/traffic/dashboard/`.

The empirical layer is intended to grow with time; subsequent releases
will accumulate longer time series and (where possible) report
pre-versus-post intervention contrasts for individual tactics.

## Sibling research lines

This repository is part of an ecosystem of four DOI-registered research
lines maintained by the same author. The lines are independent in
content and release cadence, but cross-reference each other for
context.

- **[Agent Knowledge Cycle (AKC)](https://github.com/shimo4228/agent-knowledge-cycle)** — six-phase bidirectional growth loop for sustaining intent alignment between an AI agent and its operator over time. [DOI 10.5281/zenodo.19200726](https://doi.org/10.5281/zenodo.19200726). *Mechanism sibling*: AKC defines how knowledge cycles inside the operator-agent pair; this repository addresses how the cycle's outputs diffuse outside it.
- **[Contemplative Agent](https://github.com/shimo4228/contemplative-agent)** — autonomous agents running on a local 9B model, grounded in four contemplative axioms. [DOI 10.5281/zenodo.19212118](https://doi.org/10.5281/zenodo.19212118). *Implementation sibling*: the contemplative agent's repository participates in the empirical layer's traffic dataset.
- **[Agent Attribution Practice (AAP)](https://github.com/shimo4228/agent-attribution-practice)** — harness-neutral ADRs on accountability distribution in autonomous AI agents. [DOI 10.5281/zenodo.19652013](https://doi.org/10.5281/zenodo.19652013). *Vocabulary sibling*: AAP and this repository both use the word "attribution" but with disjoint meanings (accountability for action vs. credit for source). The two meanings are intentionally kept separate; see the glossary.

The ecosystem hub is [`shimo4228/shimo4228`](https://github.com/shimo4228/shimo4228).

## How to read this repository

- Researchers and authors evaluating strategy: start with [`docs/thesis.md`](docs/thesis.md), then read the five ADRs in numerical order.
- Practitioners adopting individual tactics: read the ADR for the tactic you are considering, then check [`docs/glossary.md`](docs/glossary.md) for any terms that need disambiguation.
- LLM agents and crawlers: follow the AI-facing reading order above (`graph.jsonld` → `llms.txt` → `llms-full.txt`).
- Reviewers of the empirical claims: start with [`docs/empirical/README.md`](docs/empirical/README.md) for method and limitations before reading the baseline data.

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
