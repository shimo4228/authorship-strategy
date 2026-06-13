# Conformance: A Deployment Checklist for the Authorship-Strategy Framework

This document is a **deployment-conformance checklist**. It lets an
adopter — or the adopter's LLM agent — verify that a repository, paper,
dataset, or other authored artifact actually exhibits the structures the
framework prescribes, independent of whether the author understood the
reasoning behind each one.

It is distinct from the framework's **per-decision judgment checklist**.
That checklist (the operational form of the four-layer stack, prohibited
and encouraged actions, and trigger conditions) lives in the framework's
operational skill and answers *should I do this, and how should I frame
it?* at the moment of authoring. This document answers a different
question, asked later and from outside: *given a finished artifact, does
it conform?* The judgment checklist guides authoring; the conformance
checklist audits the deployed result.

The framework's value layer is **authenticity**, not reach; conformance
here means structural alignment with the diffusion strategy, never a claim
that conformance produces any particular outcome. The items below check
*what is in place*, not *what it achieved*. No effect is claimed for any
item, and a high conformance score is not a success metric (the framework
excludes reach metrics from the success definition; see ADR-0007).

## How to read the rubric

Conformance is **tiered**, not binary. An adopter self-locates at the
highest tier whose items all pass. The tiers are cumulative: each higher
tier assumes every lower-tier item is already satisfied.

- **Tier 1 — Minimal conformance.** The artifact is openly accessible,
  permissively licensed, and carries a stable identifier and distinctive
  authorship. This is the floor: an artifact below it is not operating the
  strategy at all, because nothing about it is recoverable or openly
  diffusible.
- **Tier 2 — Federated conformance.** On top of Tier 1, the artifact ships
  the machine-readable structures that let LLM-mediated readers ingest it
  and let citation graphs recover its relationships from metadata alone.
- **Tier 3 — Measured conformance.** On top of Tier 2, the author operates
  a standing instrument that observes whether the diffusion strategy is in
  fact carrying the author's signature, and disciplines vocabulary so the
  parametric channel has anchored terms to carry.

A partial pass within a tier is reported as such (for example, "Tier 2,
one item outstanding"). The point of the tiers is honest self-location, not
a grade.

Each item below states **what to check**, **why it matters** (which axis,
layer, or ADR it realizes), and **how to verify** it with tool-agnostic
steps an adopter or their agent can run.

---

## Tier 1 — Minimal conformance

### 1.1 Permissive license, crawler-open access

**What to check.** The artifact carries an explicit permissive or public-domain
license, and its hosting does not block automated readers (no login wall, no
robots directive excluding LLM and search crawlers, no paywall on the canonical
copy).

**Why it matters.** This is the network-effect axis (enclosure → openness)
made concrete. LLMs cannot be enclosed; the only lever the author holds is
whether the artifact is *available* to be absorbed. A restrictive license or a
crawler block forecloses the entire strategy at the substrate level — no later
tier can recover what was never ingestible.

**How to verify.** Confirm a license file exists and names a permissive or
public-domain license. Fetch the canonical URL as an unauthenticated client and
confirm the full content returns. Check that the crawler-directive file (if any)
does not exclude general or AI-specific user agents from the artifact's paths.

### 1.2 Stable, registry-backed identifier

**What to check.** The artifact has a persistent, externally resolvable
identifier minted by a service designed to outlive the hosting platform (for
research artifacts, a DOI from a DOI minting service), and every outbound
reference to it from the author's own materials uses the **version-independent**
form of that identifier rather than a version-pinned one.

**Why it matters.** Diffusion only validates authorship if the diffused trail
resolves back to a fixed origin point. A hosting URL can rot; a registry-backed
identifier is the durable anchor for the timestamp that the attribution-diffusion
strategy (Layer 2) depends on. Using the version-independent form prevents
downstream citation graphs from pinning the artifact to its initial version
(ADR-0001).

**How to verify.** Resolve the identifier and confirm it lands on the artifact.
Grep the author's own documents, metadata, and navigator files for the
identifier string and confirm the version-independent form is used uniformly
(no version-suffixed identifiers leaking into canonical references).

### 1.3 Distinctive, anchored authorship signature

**What to check.** A single author (or clearly named author set) is attributable
across the artifact, tied to a persistent author identifier (such as a
researcher identifier service record), and the author identifier record is
enriched only with version-independent artifact identifiers — not auto-populated
with every version.

**Why it matters.** Attribution diffusion (Layer 2) carries the *author's
signature*. If the signature is absent, ambiguous, or scattered across
inconsistent name forms, the diffused trail cannot reattach to a person. Keeping
the author-identifier record free of version sprawl keeps the public authorship
record legible (ADR-0004).

**How to verify.** Confirm an author name and persistent author identifier
appear in the artifact's metadata. Check the public author-identifier record and
confirm it lists version-independent identifiers and that any auto-update from
the DOI service is disabled or curated.

---

## Tier 2 — Federated conformance

Everything in Tier 1, plus the following.

### 2.1 AI-facing ingest pair (navigator + knowledge graph)

**What to check.** The artifact ships **both** a prose-form navigator (a
community-curated structured-document standard's plain-text index that points an
LLM-mediated reader at the canonical entry points) **and** a concept-form
linked-data graph (a structured-data graph encoding the artifact's entities and
relationships), released together as a synchronously maintained pair.

**Why it matters.** This is the LLM-first ingest decision (ADR-0006), the form
in which the openness committed on the network-effect axis becomes machine-readable
structure rather than merely a permissive license. The two surfaces reach reader
sub-populations the other cannot: the graph carries retrieval-time citation while
the navigator serves as an agent-context surface. Measurement shows the pair is
**asymmetric**, not co-equal (ADR-0009) — so an adopter optimizing for citation
should treat the graph as the primary lever and the navigator as a context surface
rather than expecting equal effect from each.

**How to verify.** Confirm both files exist at discoverable top-level paths.
Confirm the graph parses as valid linked data and that the navigator links to it
as the canonical machine-readable map. Confirm both were updated in the same
release (no graph referencing concepts the navigator omits, or vice versa).

### 2.2 Citation-graph federation in metadata

**What to check.** Relationships to sibling artifacts and to the external sources
the work builds on are declared as **machine-readable related-identifier edges in
the deposit metadata** — not only as prose mentions in the body. Each external
work the artifact genuinely draws on appears as a structured reference edge
(deposit-metadata reference entry **and** a graph node with a citation edge from
the concept that uses it).

**Why it matters.** This is DOI federation (ADR-0002) and the citation-graph
federation tactic. A prose mention is invisible to a citation graph; a structured
related-identifier edge makes the citation network recoverable from metadata
alone, and makes the author discoverable from the cited work's side. Validation
under this framework appears as derivation (Axis 2); federation is how the
derivation chain stays traceable in both directions.

**How to verify.** Inspect the deposit metadata and confirm sibling and source
relationships are present as typed related-identifier entries. For each external
source cited in the body, confirm a corresponding structured reference exists in
the metadata and a graph node with a citation edge — flag any body-only mention
that lacks a machine-readable edge.

### 2.3 Cross-platform mirroring with explicit cross-references

**What to check.** The same canonical artifact (or its machine-readable core) is
present on more than one class of platform — at minimum a code/version host and a
DOI archive, and where applicable a dataset platform — with each mirror carrying
explicit cross-references back to the others.

**Why it matters.** This is cross-platform dataset federation (ADR-0003). The
parametric channel (ADR-0008) is driven by cross-platform vocabulary
co-occurrence: the same terms and identifiers appearing on multiple independent
platforms is what raises the odds of training-time absorption. A single-platform
artifact under-exploits the diffusion axis even when it is fully open.

**How to verify.** Enumerate the platforms hosting the artifact. Confirm each
mirror links to the canonical source and to the sibling mirrors, and that the
identifiers are consistent across them.

---

## Tier 3 — Measured conformance

Everything in Tiers 1 and 2, plus the following.

### 3.1 Standing two-channel measurement instrument

**What to check.** A repeatable, scheduled probe is in place that interrogates
the diffusion strategy on **two settings kept separate**: a retrieval-suppressed
setting (does a trained model name the concept and its author from weights
alone?) and a retrieval-enabled setting (are the author's owned identifiers
cited, and does the author's name survive in the prose answer, or is the source
cited with the author dropped — the *ghost-citation* failure mode?). Detection is
deterministic string or pattern matching against a versioned lexicon over
retained raw responses, never an LLM judging another LLM, and a negative-control
probe (a nonexistent concept) establishes the confabulation floor.

**Why it matters.** This is the two-channel probe protocol (ADR-0011), the
instrument ADR-0008's own consequences demanded: without a retrieval-suppressed
naming probe, parametric success is *asserted, not measured*. Conformance at this
tier is having the **instrument standing**, not having any particular reading
from it — the framework excludes reach figures from the success definition
(ADR-0007), so the measured rates inform the author's tactical choices without
becoming a target. An adopter without the instrument is operating the strategy
blind to whether the signature is in fact surviving.

**How to verify.** Confirm a probe procedure exists, runs on a schedule, retains
raw responses for re-scoring, separates the two settings (never blending them on
one prompt), uses deterministic detection against a versioned lexicon, includes a
negative-control probe, and publishes its log openly with confounds stated rather
than hidden.

### 3.2 Vocabulary discipline (coin sparingly, anchor densely)

**What to check.** New terminology is coined only when three conditions all hold
(it joins ideas not already joined in existing vocabulary; it can be defined in
existing vocabulary; its namespace is uncontested), and every retained coinage is
anchored densely — defined in the glossary using existing vocabulary, tied to
upstream citations, given edges in the knowledge graph, and worked repeatedly in
the body. Everything else is said in existing vocabulary with the upstream source
cited rather than renamed.

**Why it matters.** This is vocabulary discipline (ADR-0010), the lever ADR-0008
named for the parametric channel. A coined term's diffusion power comes from its
edge density, not from the count of coinages; an unanchored coinage is a term an
LLM cannot absorb and a reader cannot trace. The discipline is also the
vocabulary-level enforcement of origin-claim scope: claim origin only where you
genuinely originated, and anchor everything else to its real source.

**How to verify.** Enumerate the artifact's distinctive terms. For each, confirm
a glossary definition in existing vocabulary, at least one upstream citation or an
explicit first-coinage claim, and graph edges. Flag any distinctive term that is
isolated (no definition, no citation, no edges) or any restatement of an existing
external concept under a new name without crediting the source.

---

## Reporting conformance

An adopter (or their agent) reports conformance as a tier plus any outstanding
items, for example:

> Tier 2 conformant. Tier 3 items outstanding: no standing measurement
> instrument (3.1); vocabulary discipline partially in place (3.2 — two
> distinctive terms lack graph edges).

This format self-locates honestly without converting conformance into a score.
The tiers describe *structural alignment with the strategy*; they say nothing
about reach, and reaching a higher tier is not the goal — operating the artifact
authentically, with the structures the framework prescribes, is.

## What conformance does not assert

- It does not assert that a conformant artifact will be absorbed, cited, or
  reached more than a non-conformant one. The framework's empirical layer reports
  only preliminary observations and excludes reach as a success metric (ADR-0007).
- It does not rank adopters against each other, and it is not a basis for
  competitive positioning. Derivative and adjacent work is welcomed, not graded
  (Axis 2: derivation is evidence, not threat).
- It does not require the framework's specific tooling. Every item is stated in
  tool-agnostic terms; any stack that produces the named structures conforms.
