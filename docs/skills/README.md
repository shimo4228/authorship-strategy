# Authorship Strategy — Ecosystem

The framework's operational form ships as standalone, independently installable
repositories — never copied into this doctrine repository, so each has a single
source of truth and can be adopted on its own. The table below is this line's
ecosystem: the four **component skills** the doctrine names, the always-loaded
**rule**, and the **complements** that accompany the framework.

## The ecosystem

| Repository | Role | Type |
|---|---|---|
| [`authorship-strategy-skill`](https://github.com/shimo4228/authorship-strategy-skill) | The four-layer judgment stack as a loadable, on-demand skill for LLM-based coding agents | **Component** |
| [`release-doi`](https://github.com/shimo4228/release-doi) | Identifier-federation release workflow for DOI-registered research repositories (ADRs 0001–0003) | **Component** |
| [`llms-txt-writer`](https://github.com/shimo4228/llms-txt-writer) | AI-facing document writer for `llms.txt` / `llms-full.txt` / FAQ / glossary surfaces (Layer 4 tactic 7) | **Component** |
| [`jsonld-knowledge-graph`](https://github.com/shimo4228/jsonld-knowledge-graph) | Companion JSON-LD knowledge-graph writer for stable concept-level structure (Layer 4 tactic 7) | **Component** |
| [`authorship-strategy-rules`](https://github.com/shimo4228/authorship-strategy-rules) | The framework as a single always-loaded rule — the deterministic counterpart to the skill | **Rule** |
| [`readme-writer`](https://github.com/shimo4228/readme-writer) | Human-facing README writer and review workflow (the human-surface counterpart to `llms-txt-writer`) | Adjacent |
| [`wikidata-federation`](https://github.com/shimo4228/wikidata-federation) | Wikidata federation for researchers, papers, repositories, ORCID, DOI, and graph links | Adjacent |
| [`doctrine-corpus`](https://github.com/shimo4228/doctrine-corpus) | Bilingual judgment-eliciting Q&A corpus across the sibling research lines ([DOI 10.5281/zenodo.20337008](https://doi.org/10.5281/zenodo.20337008)) | Data sibling |
| [`existence-proof`](https://github.com/shimo4228/existence-proof) | Pre-line complement: verifiable institution-grade artifacts by credential-less creators ([DOI 10.5281/zenodo.20558800](https://doi.org/10.5281/zenodo.20558800)) | Complement |
| [`einstein-arena`](https://github.com/shimo4228/einstein-arena) | A worked instance of the Existence Proof Format, anchored to a public repository and an external arena | Complement |

**Component** = a skill or rule the doctrine explicitly names; the framework cannot be applied without it. **Adjacent** = useful to adopters but not doctrine-required. **Data sibling / complement** = an artifact that carries or extends the framework's tactics rather than executing them.

## What makes a skill a component

A skill (or rule) is a **component** when the artifact it produces — or the
discipline it executes — is explicitly named in the doctrine (`thesis.md`, the
ADRs, or the Layer 4 tactic list):

- The **judgment framework itself** (three-axis inversion, four-layer stack, prohibited/encouraged actions) → [`authorship-strategy-skill`](https://github.com/shimo4228/authorship-strategy-skill), with its always-loaded counterpart [`authorship-strategy-rules`](https://github.com/shimo4228/authorship-strategy-rules).
- The **identifier-federation triplet** (ADRs [0001](../adr/0001-concept-doi-canonical.md)–[0003](../adr/0003-cross-platform-dataset-federation.md)) → [`release-doi`](https://github.com/shimo4228/release-doi).
- The **`llms.txt` convention** (Layer 4 tactic 7) → [`llms-txt-writer`](https://github.com/shimo4228/llms-txt-writer).
- **JSON-LD knowledge graphs** (Layer 4 tactic 7) → [`jsonld-knowledge-graph`](https://github.com/shimo4228/jsonld-knowledge-graph).

`readme-writer` and `wikidata-federation` are **adjacent**, not components: README quality and Wikidata federation are useful but not doctrine-named, so a framework-applied repository is complete without them.

## Skill vs. rule

The judgment framework ships in two loading modes. The **skill**
([`authorship-strategy-skill`](https://github.com/shimo4228/authorship-strategy-skill))
is triggered probabilistically and read on demand — the deeper judgment
reference. The **rule**
([`authorship-strategy-rules`](https://github.com/shimo4228/authorship-strategy-rules))
is loaded every session and applies the framework deterministically within its
trigger scope — the always-on trigger plus a compact summary. They are a pair;
install the rule for always-on framing, add the skill for full reasoning.

## Installation (Claude Code)

Each skill installs like any other Claude Code skill; the rule installs into your rules directory:

```bash
# Component skills
git clone https://github.com/shimo4228/authorship-strategy-skill && cp -r authorship-strategy-skill/skills/authorship-strategy ~/.claude/skills/authorship-strategy
git clone https://github.com/shimo4228/release-doi && cp -r release-doi/skills/release-doi ~/.claude/skills/release-doi
git clone https://github.com/shimo4228/llms-txt-writer && cp -r llms-txt-writer/skills/llms-txt-writer ~/.claude/skills/llms-txt-writer
git clone https://github.com/shimo4228/jsonld-knowledge-graph && cp -r jsonld-knowledge-graph/skills/jsonld-knowledge-graph ~/.claude/skills/jsonld-knowledge-graph

# Always-loaded rule (deterministic counterpart to the skill)
git clone https://github.com/shimo4228/authorship-strategy-rules && cp authorship-strategy-rules/rules/common/authorship-strategy.md ~/.claude/rules/common/authorship-strategy.md
```

For other harnesses, consult each repository's README for the appropriate install path.

## Why standalone repositories, not embedded copies

Embedding a skill body inside this doctrine repository was the original choice, then revised:

1. **Tool-agnostic principle.** Layer 4 keeps doctrine separable from implementation; externalizing each skill keeps the doctrine harness-neutral and lets each evolve on its own cadence.
2. **Single source of truth.** A copy is a drift vector; each repository is canonical for itself, referenced here rather than duplicated.
3. **Adoptability.** An author who wants only `release-doi` (or only the rule, etc.) installs that repository directly, without subscribing to the whole framework.

## The broader ecosystem

The table above is the Authorship Strategy line's own ecosystem. The full,
cross-line inventory of the author's research program — the other research
lines, their cycle skills and extensions, datasets, and probe surfaces — lives
in the hub's machine-readable surfaces, not duplicated here:

- Repository inventory → the hub [`graph.jsonld`](https://github.com/shimo4228/shimo4228/blob/main/graph.jsonld) (also mirrored to Hugging Face Datasets)
- Coined-term definitions → the [concept index](https://shimo4228.github.io/shimo4228/concepts/)

## Terminology

- **Sibling research line** — a peer at the research-program level; reserved for the five DOI-registered lines ([AKC](https://github.com/shimo4228/agent-knowledge-cycle), [Contemplative Agent](https://github.com/shimo4228/contemplative-agent), [AAP](https://github.com/shimo4228/agent-attribution-practice), [Attention, Not Self](https://github.com/shimo4228/attention-not-self), and this one).
- **Component** — a skill or rule the doctrine explicitly names; the framework cannot be applied without it.
- **Peer component** — relative to one component, the other components of the same framework.
- **Adjacent ecosystem skill** — a skill that exists in the broader ecosystem but is not doctrine-required; an adopter installing only the components can apply the framework completely.
