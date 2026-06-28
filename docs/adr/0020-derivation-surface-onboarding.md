Language: English | [日本語](0020-derivation-surface-onboarding.ja.md)

# ADR-0020: Onboarding to Third-Party AI-Derived Repository Surfaces — Synthetic Wikis and Documentation Hubs

> **Summary.** A class of third-party services derives an LLM-consumable
> surface from a public repository — either a **synthetic wiki** (a
> model-paraphrased view of the codebase with a conversational query
> interface) or a **documentation hub** (the repository's own
> machine-readable documents served verbatim through a model-callable
> interface) — and attaches an adoptable badge to the repository's front
> page. Both are derivation-type diffusion surfaces in the thesis's sense,
> sitting directly on the framework's primary audience: the developer or
> practitioner who investigates through an LLM assistant. This ADR onboards
> idea-bearing public repositories to both surface types and blesses the
> derived views rather than gating them, under a per-type discipline. The
> synthetic wiki's paraphrase is used as a regurgitation-test drift
> diagnostic and defended by upstream anchoring, not corrected on the
> derived surface; the documentation hub's access-count badge is read as a
> measurement signal of the LLM-mediated channel, explicitly not as a
> success metric. It declines the index-only catalog whose artifact model
> is the installable code library (an artifact-type mismatch) and declines
> self-hosted query infrastructure (friction-minimization), and it keeps
> the origin claim fixed on the identifier-federation layer rather than on
> any derived surface.

## Status
accepted

## Date
2026-06-28

## Context

A class of third-party services reads a public repository and republishes
it as a surface optimized for LLM consumption. Two structurally different
surface types are in common use. In the **synthetic-wiki** type, the
service runs the repository through a model that paraphrases it into a
generated wiki — overview, architecture summary, navigable sections —
fronted by a conversational query interface through which any LLM
assistant can ask a question and receive a synthesized answer about the
codebase. In the **documentation-hub** type, the service exposes the
repository's *own* machine-readable documents — its LLM-facing navigator
and front-page document — through a model-callable interface at query
time, serving the author's text verbatim rather than a paraphrase. Both
types can attach an adoptable badge to the repository's front page, and
both are derivation-type surfaces in the thesis's sense: the canonical
artifact stays in the repository, and the third-party surface is a derived
view that an independent operator generates and hosts.

These surfaces sit on the framework's primary audience directly. Layer 2
identifies the developer or practitioner who investigates through an LLM
assistant as a primary reader; a model-callable surface over the
repository is exactly the channel that reader's assistant reaches at query
time. The surfaces cost nothing, require no infrastructure the author
maintains, and operate only over public repositories — they are
crawler-open, permissive-compatible, derivation-type diffusion by
construction. The open question is which of them to onboard to, and under
what discipline, given that one type paraphrases the source — and can
dilute the distinctive vocabulary that carries the origin claim — while
the other does not, and given that one type's badge can be read as the
kind of human-attention vanity signal the framework has already rejected.

A third surface type was surveyed and excluded: the index-only catalog
whose artifact model is the installable code library, retrieving by
library name and serving version-specific interface documentation. A
doctrine or specification repository has no installable interface surface,
so an entry there is a low-relevance one — an artifact-type mismatch
rather than a diffusion gain.

## Decision

Onboard idea-bearing public repositories to **both** derivation-surface
types as a standing Layer 4 tactic, and **bless the derived views** rather
than gating or correcting them. Apply a per-type discipline.

**Synthetic-wiki surfaces.** Trigger the initial generation — these
surfaces index on an explicit request, not on a passing visit, and the
request may carry personal data such as a notification address, so the
author performs it. Attach the surface's refresh badge to the repository
front page so the derived view tracks subsequent commits. Use the
generated wiki as a **regurgitation-test diagnostic**: ask it about the
repository's distinctive concepts and observe whether the coined
vocabulary survives the model's paraphrase. Drift detected here is *not*
corrected on the derived surface — the defense is upstream: anchor the
diluted term more densely at the source. The synthetic wiki is a
paraphrase by design and will dilute weakly-anchored signature; that is
accepted and converted into a diagnostic signal rather than fought.

**Documentation-hub surfaces.** Onboard with no configuration — any public
repository is immediately live — and attach the access-count badge.
Because the hub serves the repository's own documents verbatim, there is
no paraphrase and no signature drift, and the regurgitation-test
diagnostic does not apply (there is nothing to diagnose). The badge counts
LLM-mediated accesses to the repository's documentation; it is read as a
**measurement signal of the LLM-mediated channel** — the same population
the framework optimizes for — and explicitly not as a success metric to
maximize.

**Index-only code-library catalogs.** Do not onboard. The artifact-type
mismatch — a doctrine or specification repository against a catalog keyed
to installable libraries with interface documentation — makes the entry
low-relevance with uncertain discovery payoff.

**Self-hosted query infrastructure.** Do not build it. Riding third-party
surfaces satisfies friction-minimization; ingestion is already served by
the repository's own machine-readable documents and the third-party hubs.
A self-operated query server would gate adoption behind infrastructure the
framework declines to maintain.

The origin claim does not rest on any derived surface. It stays fixed on
the repository through the identifier-federation layer — the registry DOI,
the timestamp, and the intrinsic content-derived identifier. A derived
view that paraphrases or re-hosts the repository is therefore a validation
event to bless — a derivative that extends reach — not a threat to
control. Keep the decision tool-agnostic: specific service instances are
recorded in the Lineage and in project memory, never in the decision, so
that a service's feature changes never back-propagate into the doctrine.

## Alternatives Considered

**Onboard to the index-only code-library catalog as well.** Submit the
repositories to a catalog that indexes installable libraries and serves
their version-specific interface documentation into the assistant's
prompt. Rejected: artifact-type mismatch. The catalog's retrieval is keyed
to library names and interface surfaces; a doctrine or specification
repository has no installable interface, so the entry is low-relevance and
its discovery payoff uncertain. The surface is built for a different
artifact type, and listing there is not harmful but is not a diffusion
gain — it adds an out-of-place entry rather than reaching the primary
audience.

**Self-host a model-callable query server over the repositories.** Operate
the query interface directly instead of riding a third-party hub.
Rejected: it violates friction-minimization, which already names a
self-built query server as a low-priority way to gate adoption behind
infrastructure the author must maintain; and ingestion is already served
by the repository's own machine-readable documents plus the zero-cost
third-party hubs. The same reach is available without the maintenance
burden.

**Treat the documentation-hub access count as a success metric.** Read the
badge's LLM-mediated access count as a number to grow. Rejected: it
collides with the metric-rejection decision. The framework fixes its
audience as the measure of success but excludes attention counters from
being optimization targets; the access count is a measurement signal of
that audience, informative but not a goal. Promoting it to a target would
reintroduce exactly the vanity-metric dynamic the framework rejects.

**Gate or correct the synthetic wiki to preserve the signature.** Treat
the paraphrasing surface as something to police — request corrections,
suppress generation where the vocabulary drifts. Rejected: the synthetic
wiki is a paraphrase by design, so correcting it is whack-a-mole against a
surface the author does not control. The defense against drift is upstream
dense anchoring at the source, with the derived surface used as a
*diagnostic* of where anchoring is thin — not as a surface to fix.
Policing a blessed derivative also contradicts the thesis: a derivative
is validation, not a threat.

**Onboard only to the no-drift documentation-hub type and skip the
paraphrasing synthetic-wiki type.** Avoid the dilution risk by adopting
only the verbatim surface. Rejected: the synthetic wiki reaches a
different sub-population — readers who want a synthesized orientation
rather than the raw documents — and its paraphrase doubles as the
regurgitation-test drift diagnostic, an early warning the verbatim hub
cannot provide. The two types are complementary; the paraphrase risk is
mitigated by upstream anchoring, not avoided by abstention.

## Consequences

**Positive.**

- Each repository gains two new LLM-mediated diffusion points on the
  primary audience's query path, at zero cost and zero maintained
  infrastructure.
- The documentation-hub badge adds a measurement surface — an
  LLM-mediated access count — that the identifier layer did not provide,
  read strictly as a signal under the metric-rejection decision.
- The synthetic wiki's paraphrase doubles as a drift diagnostic that feeds
  the vocabulary discipline: a term that dissolves in the derived view is
  a term to anchor more densely at the source.
- The policy is consistent with the thesis. Derivation-type surfaces enact
  "a derivative is validation"; blessing them rather than gating them is
  the exclusivity → derivation inversion applied at the channel level, the
  derivation-axis counterpart to ADR-0012's enclosure-axis channel rule.

**Negative.**

- The synthetic-wiki surface can dilute weakly-anchored signature. The
  defense is a standing upstream-anchoring obligation, not a fix on the
  derived surface; an under-anchored term will keep dissolving until it is
  anchored at the source.
- The access-count badge can be mistaken for a vanity metric. It must be
  read as measurement only, and not allowed to become an optimization
  target — a reading the author must hold deliberately against the badge's
  natural pull toward a growable number.
- These are fast-moving third-party services. Keeping the doctrine
  tool-agnostic means the concrete onboarding steps live outside the ADR
  (in project memory) and must be re-derived when a service changes; the
  benefit is that no service's feature change reaches the decision.
- The tactic applies only to public repositories. Private repositories
  cannot use these surfaces and fall outside the policy.

## Lineage

Originating operational record: two 2026-06-28 deployments — onboarding
the idea-bearing repositories of a research ecosystem to a third-party
synthetic-wiki service, and, following a multi-source survey of comparable
services, adding a documentation-hub access-count badge across the same
set. The survey also evaluated an index-only catalog whose artifact model
is the installable code library and excluded it as an artifact-type
mismatch.

The two surface types abstracted out of the body: the synthetic-wiki
instance is a service that generates a paraphrased wiki with a
conversational query interface from any public repository and indexes a
repository only on an explicit, notification-bearing request; the
documentation-hub instance is a zero-configuration service that exposes any
public repository's own machine-readable documents through a model-callable
interface and a per-repository access-count badge. Both are recorded in
project memory under the diffusion-channel ledger.

The decision complements ADR-0012, which governs author-initiated listings
in external curated collections, by covering author-blessed *automated
derivation* surfaces: where ADR-0012 applies the thesis's enclosure axis
to channel selection, this ADR applies the derivation axis — derived views
are validation to bless, not imitation to prevent. It builds on ADR-0006
(the LLM-first ingest surfaces these extend), is bounded by ADR-0007 (the
access count is a measurement signal, never a success metric), and
connects the regurgitation-test diagnostic to ADR-0010 (the dense-anchoring
discipline that defends against paraphrase drift) and ADR-0011 (the
measurement protocol the diagnostic is a lightweight instance of). The
tactic is operationalized in the authorship-strategy component skill as a
Layer 4 entry distinguishing the two surface types and a judgment-checklist
item, added 2026-06-28.
