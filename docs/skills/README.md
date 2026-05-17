# Component Skills

The Authorship Strategy framework ships two **component skills** as
independent DOI-registered repositories, following the Claude Code skill
convention used elsewhere in the author's ecosystem. The skills are
referenced here, not copied: a single source of truth lives in each
skill's own repository, and adopters install the skill from the
canonical repository directly.

The split is intentional. The framework's tool-agnostic principle
([Layer 4](../thesis.md)) commits the framework to a separation between
*the doctrine* (this repository) and *the implementations the doctrine
informs* (each component skill). The implementations may be ported to
different harnesses, evolve on their own release cadence, or be
adopted independently of the framework; the framework's normative claims
do not depend on any specific implementation surviving.

## The two component skills

### authorship-strategy (operational form)

The operational form of this repository's framework, packaged as a
loadable skill for LLM-based coding agents. Provides the four-layer
judgment checklist, the prohibited and encouraged actions, and the
trigger conditions for when the framework applies, in a form designed
to be loaded into an agent's rule set rather than read as prose.

- Repository: `https://github.com/shimo4228/claude-skill-authorship-strategy`
- Role: operational implementation of [`thesis.md`](../thesis.md) and the five [ADRs](../adr/README.md)
- Audience: LLM-based coding agents and their operators

### release-doi

The release runbook for DOI-registered research artifacts that follow
the framework's identifier-federation triplet ([ADR-0001](../adr/0001-concept-doi-canonical.md) /
[ADR-0002](../adr/0002-doi-federation-via-zenodo-json.md) /
[ADR-0003](../adr/0003-cross-platform-dataset-federation.md)). Sequences
the pre-release verification, tag-push, archive deposit, DOI
propagation, and cross-platform federation update steps as a single
five-phase workflow that prevents the most common release-time drift
incidents (the off-by-one canonical-reference mistake, the missed
sibling cross-reference update, the unverified empirical-layer
limitation).

- Repository: `https://github.com/shimo4228/claude-skill-release-doi`
- Role: operational instantiation of the identifier-federation triplet ADRs as a release-time workflow
- Audience: LLM-based coding agents operating a DOI-registered research repository

## Why component-skill rather than embedded copy

Embedding a copy of the skill body inside this repository was the
original implementation choice, then revised. The reasons for the
revision:

1. **Tool-agnostic principle.** The framework's Layer 4 commits the framework to keeping doctrine separable from implementation. Embedding the skill body binds the doctrine to a specific harness's skill format. Externalizing the skill keeps the doctrine harness-neutral and lets each component skill evolve on its own implementation cadence.
2. **Single source of truth.** A copy is a drift vector. Each component skill has its own canonical location; this repository references the canonical location rather than maintaining a parallel copy.
3. **Adoptability.** Skills installed from a standalone repository can be adopted independently of the framework: an author who wants only the `release-doi` workflow (without subscribing to the full normative framework) installs the skill repository directly.
4. **Consistency with the author's ecosystem.** Other reusable skills in the author's research program (e.g., `claude-skill-llms-txt-writer`, `claude-skill-jsonld-knowledge-graph`, `claude-skill-context-sync`) all follow the standalone-repository convention. The component-skill pattern is the established norm in this ecosystem.

## Installation (Claude Code)

Each component skill installs the same way as other Claude Code skills:

```bash
# authorship-strategy
git clone https://github.com/shimo4228/claude-skill-authorship-strategy
cp -r claude-skill-authorship-strategy/skills/authorship-strategy ~/.claude/skills/authorship-strategy

# release-doi
git clone https://github.com/shimo4228/claude-skill-release-doi
cp -r claude-skill-release-doi/skills/release-doi ~/.claude/skills/release-doi
```

For other harnesses, consult each skill repository's README for the
installation path appropriate to that harness.
