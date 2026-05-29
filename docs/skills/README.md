# Component Skills

The Authorship Strategy framework ships four **component skills** as
independent DOI-registered repositories, following the Claude Code skill
convention used elsewhere in the author's ecosystem. The skills are
referenced here, not copied: a single source of truth lives in each
skill's own repository, and adopters install the skill from the
canonical repository directly.

The split is intentional. The framework's tool-agnostic principle
([Layer 4](../thesis.md)) commits the framework to a separation between
*the doctrine* (this repository) and *the implementations the doctrine
informs* (each component skill). The implementations may be ported to
different harnesses, evolve on their own release cadence, or be adopted
independently of the framework; the framework's normative claims do not
depend on any specific implementation surviving.

## Terminology

To avoid ambiguity, this repository uses the following terms:

- **Sibling research line** — peer at the research-program level. Reserved for the five DOI-registered research lines ([AKC](https://github.com/shimo4228/agent-knowledge-cycle), [Contemplative Agent](https://github.com/shimo4228/contemplative-agent), [AAP](https://github.com/shimo4228/agent-attribution-practice), [Attention, Not Self](https://github.com/shimo4228/attention-not-self), and this one).
- **Component (skill)** — skill that operationalizes content this doctrine explicitly names. The framework cannot be applied without it.
- **Peer component** — relative to one component skill, the other components of the same framework.
- **Adjacent ecosystem skill** — skill that exists in the broader Claude Code skill ecosystem but is not specifically required by this framework. Adopters may choose to use it; the framework does not depend on it.

The word *sibling* is reserved for the research-line level. *Peer
component* is used for skill-level peer relationships. *Adjacent
ecosystem skill* is used for the non-component case.

## Criterion for component status

A skill is a component when the artifact it produces — or the
discipline it executes — is **explicitly named** in this doctrine
(`thesis.md`, the ADRs, or the Layer 4 tactic list). Two classes of
doctrine content generate components:

- **The judgment framework itself** (the three-axis inversion, four-layer stack, prohibited and encouraged actions) is operationalized by `claude-skill-authorship-strategy`.
- **Layer 4 tactics named by canonical artifact or discipline**:
  - The doctrine names the *Answer.AI `llms.txt` convention* as a structured-artifact tactic → `claude-skill-llms-txt-writer`.
  - The doctrine names *JSON-LD knowledge graphs* as a structured-artifact tactic → `claude-skill-jsonld-knowledge-graph`.
  - The doctrine names the *identifier-federation triplet* (ADRs 0001-0003) as a tactical discipline → `claude-skill-release-doi`.

Skills that are useful to adopters but not specifically named by the
doctrine — `context-sync`, `update-codemaps`, `writing-ecosystem`,
`daily-research`, and others — are *adjacent ecosystem skills*, not
components. The boundary is deliberate: a component is a skill the
framework cannot be applied without; an adjacent ecosystem skill is a
skill an adopter may additionally choose.

## The four component skills

### `claude-skill-authorship-strategy`

The operational form of this repository's judgment framework, packaged
as a loadable skill for LLM-based coding agents. Provides the four-layer
judgment checklist, the catalogues of prohibited and encouraged actions,
and the trigger conditions for when the framework applies, in a form
designed to be loaded into an agent's rule set rather than read as
prose.

- Repository: `https://github.com/shimo4228/claude-skill-authorship-strategy`
- Operationalizes: [`thesis.md`](../thesis.md) and the six [ADRs](../adr/README.md)
- Audience: LLM-based coding agents and their operators

### `claude-skill-release-doi`

The release runbook for DOI-registered research artifacts that follow
the framework's identifier-federation triplet ([ADR-0001](../adr/0001-concept-doi-canonical.md) /
[ADR-0002](../adr/0002-doi-federation-via-zenodo-json.md) /
[ADR-0003](../adr/0003-cross-platform-dataset-federation.md)). Sequences
pre-release verification, tag-push, archive deposit, DOI propagation,
and cross-platform federation update steps as a single five-phase
workflow that prevents the most common release-time drift incidents
(the off-by-one canonical-reference mistake, the missed sibling
cross-reference update, the unverified empirical-layer limitation).

- Repository: `https://github.com/shimo4228/claude-skill-release-doi`
- Operationalizes: the identifier-federation triplet (ADRs 0001-0003) as a release-time workflow
- Audience: LLM-based coding agents operating a DOI-registered research repository

### `claude-skill-llms-txt-writer`

Writes the AI-facing reference files (`llms.txt`, `llms-full.txt`, FAQ,
glossary) the framework's Layer 4 tactic 7 names as required structured
artifacts. Combines the Answer.AI `llms.txt` standard with
generative-engine-optimization static analysis so the resulting
documents pass crawler-readable conventions and survive LLM citation
probing.

- Repository: `https://github.com/shimo4228/claude-skill-llms-txt-writer`
- Operationalizes: Layer 4 tactic 7 — Answer.AI `llms.txt` convention
- Audience: any project producing AI-facing documentation; the framework's adopters specifically use it to produce the `llms.txt` artifact every framework-applied repository requires

### `claude-skill-jsonld-knowledge-graph`

Designs and ships a companion JSON-LD knowledge graph (`graph.jsonld`)
next to `llms.txt` for projects whose concept-level structure is stable
across releases. Operationalizes the Layer 4 tactic that names JSON-LD
knowledge graphs as a structured-artifact form, with nine reusable
design moves (dual `@type`, language-tagged literals, schema absence
enforces invariants, cross-graph `@id` reuse, volatile-state exclusion,
matrix-as-paired-edges, root `Dataset` node, reading-order block,
hub-and-spoke reverse-link).

- Repository: `https://github.com/shimo4228/claude-skill-jsonld-knowledge-graph`
- Operationalizes: Layer 4 tactic 7 — JSON-LD knowledge graph as structured artifact
- Audience: any project with stable concept-level structure; the framework's adopters specifically use it to produce the `graph.jsonld` artifact every framework-applied repository requires

## Why component-skill rather than embedded copy

Embedding a copy of any skill body inside this doctrine repository was
the original implementation choice, then revised. The reasons for the
revision:

1. **Tool-agnostic principle.** The framework's Layer 4 commits the framework to keeping doctrine separable from implementation. Embedding a skill body binds the doctrine to a specific harness's skill format. Externalizing the skill keeps the doctrine harness-neutral and lets each component skill evolve on its own implementation cadence.
2. **Single source of truth.** A copy is a drift vector. Each component skill has its own canonical location; this repository references the canonical location rather than maintaining a parallel copy.
3. **Adoptability.** Skills installed from a standalone repository can be adopted independently of the framework: an author who wants only the `release-doi` workflow (or only the `llms-txt-writer` skill, etc.) installs the skill repository directly without subscribing to the full normative framework.
4. **Consistency with the ecosystem.** Other reusable skills in the author's research program (the four components above, plus adjacent skills) all follow the standalone-repository convention. The component pattern is the established norm in this ecosystem.

## Installation (Claude Code)

Each component skill installs the same way as other Claude Code skills:

```bash
# Component 1: authorship-strategy (judgment framework)
git clone https://github.com/shimo4228/claude-skill-authorship-strategy
cp -r claude-skill-authorship-strategy/skills/authorship-strategy ~/.claude/skills/authorship-strategy

# Component 2: release-doi (identifier-federation triplet workflow)
git clone https://github.com/shimo4228/claude-skill-release-doi
cp -r claude-skill-release-doi/skills/release-doi ~/.claude/skills/release-doi

# Component 3: llms-txt-writer (Layer 4 — Answer.AI llms.txt convention)
git clone https://github.com/shimo4228/claude-skill-llms-txt-writer
cp -r claude-skill-llms-txt-writer/skills/llms-txt-writer ~/.claude/skills/llms-txt-writer

# Component 4: jsonld-knowledge-graph (Layer 4 — JSON-LD knowledge graph)
git clone https://github.com/shimo4228/claude-skill-jsonld-knowledge-graph
cp -r claude-skill-jsonld-knowledge-graph/skills/jsonld-knowledge-graph ~/.claude/skills/jsonld-knowledge-graph
```

For other harnesses, consult each skill repository's README for the
installation path appropriate to that harness.

## Adjacent ecosystem skills (not components)

Skills the framework's adopters may find useful but the doctrine does
not specifically require:

- [`claude-skill-context-sync`](https://github.com/shimo4228/claude-skill-context-sync) — cross-document drift audits
- [`claude-skill-writing-ecosystem`](https://github.com/shimo4228/claude-skill-writing-ecosystem) — human-facing writing orchestrator (note: targets human-primary audience, which the framework's Layer 2 identifies as non-primary; useful for adopters who additionally produce blog posts, essays, or articles but not aligned with the framework's diffusion strategy)
- `readme-writer` (available in the author's [`claude-harness`](https://github.com/shimo4228/claude-harness), not yet a standalone repository) — the **human-surface counterpart to the `llms-txt-writer` component**. Where `llms-txt-writer` writes the AI-facing `llms.txt` / `llms-full.txt` the doctrine *requires* (Layer 4 tactic 7), `readme-writer` writes the human-facing `README`. It is **adjacent, not a component**: the doctrine names the AI-facing structured artifacts as required, but README content quality (lead, value proposition, narrative) is not doctrine-named — so a framework-applied repository can be complete without it. Like `writing-ecosystem`, it serves the human-primary surface the framework treats as non-primary; distinct from `writing-ecosystem` in scope (the single canonical README landing page vs. long-form prose).
- [`claude-skill-search-first`](https://github.com/shimo4228/claude-skill-search-first) — research-before-coding workflow
- `claude-skill-update-codemaps` (where available) — file-level architecture map regeneration

These are listed as references, not requirements. An adopter who installs only the four components above can apply the framework completely.
