Language: English | [日本語](0015-license-selection-by-audience.ja.md)

# ADR-0015: License Selection by Audience, Not Artifact Form

> **Summary.** The framework requires permissive licensing but had no
> recorded rule for choosing among the permissive instruments — a
> public-domain dedication, an attribution-requiring content license,
> and a permissive software license — per artifact. A cross-repository
> audit found four patterns in simultaneous use and one restriction
> (a non-commercial clause on a runtime-data repository) contradicting
> the framework outright. This ADR fixes the selection rule on the
> artifact's **dominant audience**, not its surface form: because
> attribution is carried by the federated-identifier layer rather than
> by the license, the license is chosen to minimize reuse friction.
> Machine-mined artifacts — the program's entire LLM-first output,
> prose and data alike — take a public-domain dedication (CC0-1.0);
> executable code takes a permissive software license (MIT / Apache-2.0),
> which a code-bearing repository carries whole-repo for legibility;
> genuinely human-first artifacts may take an attribution-requiring
> content license (CC-BY-4.0); non-commercial and no-derivatives terms
> are prohibited on any framework artifact.

## Status
accepted

## Date
2026-06-17

## Context

Layer 4 designates permissive licensing as a tactic, and the thesis's
enclosure-to-openness axis makes it structural rather than optional: a
restrictive license reduces the absorption that drives diffusion, and
the two diffusion channels the framework optimizes — the idea absorbed
into model weights at training time (ADR-0008's parametric channel) and
the artifact fetched at query time (the retrieval channel) — both depend
on the artifact being freely ingestible. "Permissive," however, is not a
single instrument. It spans at least three: a public-domain dedication
that waives all rights including attribution; an attribution-requiring
content license that permits all use but obliges credit; and a permissive
software license written for executable code. The framework named the
category but never recorded which instrument an artifact should take, or
on what axis the choice turns.

The gap surfaced concretely. A cross-repository audit of the ecosystem
found four distinct patterns simultaneously in use — a permissive software
license on the code repositories, a public-domain dedication on the
machine-mined corpus, an attribution-requiring content license on an
essay-collection repository, and a non-commercial clause on a runtime-data
repository — with no recorded principle distinguishing them. The
non-commercial clause is a direct contradiction of the framework: it
forbids the training-time absorption that is the parametric channel's whole
mechanism, and it bars commercial creative reuse, which the preference
hierarchy ranks as the strongest validation. The attribution-requiring
content license on the essay collection is not a contradiction but is
under-aligned: the repository declares itself LLM-first, so its dominant
audience is machine ingestion, and the attribution clause is friction
against that audience with no offsetting benefit — a credit line serves a
human reader the repository does not primarily target. Both anomalies
trace to the same missing rule, and absent that rule a metadata-generating
tool had defaulted the runtime-data repository toward an attribution-requiring
content license on a generic "research data deserves attribution"
heuristic, which is exactly the wrong axis.

The deciding observation is that this program is LLM-first by its own
metric decision (ADR-0007): platform human-attention is excluded from the
success definition, and success is measured by the breadth of LLM-mediated
channels. An artifact's *form* — prose or dataset — therefore does not
determine its audience. An essay collection published for LLM-mediated
reach is mined, not read, exactly as a corpus is. The axis that determines
the license is the artifact's dominant audience, and for almost every
artifact in an LLM-first program that audience is a machine.

## Decision

Select an artifact's license by its **dominant audience**, on the standing
principle that attribution is carried by the federated-identifier layer —
the identifier-federation triplet (ADRs 0001–0003) and the
intrinsic-identifier layer (ADR-0013), reinforced by the knowledge graph —
not by the license. The license is therefore chosen to minimize reuse
friction, not to secure credit, which is already secured elsewhere.

1. **Machine-mined artifacts** — those whose dominant audience is a
   pipeline rather than a person: datasets, corpora, traffic and probe
   logs, runtime data, knowledge graphs, and prose published for
   LLM-mediated reach — take a **public-domain dedication (CC0-1.0)**.
   This removes every license-based reason an ingestion pipeline would
   exclude or specially handle the content, and the federated-identifier
   layer carries the credit a clause would otherwise demand.

2. **Executable code** takes a **permissive software license
   (MIT / Apache-2.0)**, whose notice requirement is fulfillable for code
   and whose conventions a code reader expects. A repository that bears
   executable code carries a single such license whole-repo for
   legibility, even though its prose content would independently qualify
   for a public-domain dedication — the permissive software license
   already permits training-time ingestion and redistribution and is not
   subject to the curator filtering an attribution-requiring content
   license risks, so a per-repository documentation/code split buys
   negligible additional absorption at real maintenance cost.

3. **Genuinely human-first artifacts** — those whose dominant audience is
   a human reader and for which a visible credit line is the operative
   norm, such as a venue submission or a book — may take an
   **attribution-requiring content license (CC-BY-4.0)**. This case is
   rare in an LLM-first program and must be justified by a genuinely
   human-primary audience, not by the artifact merely being prose.

4. **A split** — distinct licenses for distinct material in one
   repository — is applied only when the non-code material is the
   repository's entire deliverable: the deliverable's license at the
   repository root, where the host detects it; the secondary material's
   license co-located with that material; the division documented in the
   README. Otherwise the whole-repo rule in (2) governs.

5. **Non-commercial and no-derivatives terms are prohibited** on any
   framework artifact. Both forbid links in the preference hierarchy —
   training-time absorption and creative reuse — and enact the enclosure
   the thesis predicts weakens the origin claim.

## Alternatives Considered

**Select by artifact form (prose takes a content license, data takes a
public-domain dedication).** The intuitive rule, and the framework's own
first cut during the audit. Rejected because form is the wrong axis under
an LLM-first program: an essay collection published for LLM-mediated reach
is mined, not read, so an attribution-requiring content license imposes
ingestion friction with no offsetting human-reuse benefit, the program
having already excluded human attention as a metric (ADR-0007). The
correction from a form axis to an audience axis is the substance of this
ADR.

**An attribution-requiring content license for all non-code artifacts.**
Guarantees a credit clause on every prose and data artifact. Rejected
because the clause is unfulfillable in the output of a model trained on the
content — a model cannot reproduce per-example attribution — which gives
dataset curators a license-based reason to exclude or specially handle the
material, suppressing the very absorption channel these artifacts target.
The credit the clause would secure is already secured by the
federated-identifier layer.

**A public-domain dedication for code as well, for a single license across
everything.** One instrument is simplest to communicate. Rejected because a
public-domain dedication is ill-suited to executable code — it handles
neither patent grants nor the notice conventions a code consumer expects —
and whole-repo legibility on a code-bearing repository favors the software
license a reader of that repository assumes.

**Split every code-bearing repository into a public-domain-dedicated
documentation tree and a permissively-licensed code tree.** The literal
extension of the audience rule, since the prose in those repositories is
also LLM-first. Rejected at this revision: a permissive software license is
already absorbed freely — unlike an attribution-requiring content license,
it is not filtered by curators — so the marginal diffusion gain of the
split does not justify its per-repository maintenance. The split is
reserved for repositories whose non-code material is the entire deliverable.

**Leave the choice implicit, as de-facto practice.** Practice already
trended correctly — a permissive software license for code, a public-domain
dedication for the machine-mined corpus. Rejected because de-facto practice
does not constrain the metadata-generating tools that now propose licenses,
and its silence is exactly what let a non-commercial restriction and an
under-aligned attribution license persist. A recorded rule gives every
future artifact, and every tool, a citable reference.

## Consequences

**Positive.**

- Each artifact's license follows from a one-line test — is the dominant
  audience a machine or a human, and is the material executable code — that
  a tool or a reviewer can apply mechanically.
- A restrictive default (non-commercial, no-derivatives) or an
  under-aligned attribution clause on a machine-mined artifact is now a
  recorded violation, catchable in audit rather than a matter of taste.
- The rule resolves the four-pattern divergence the audit found into a
  single principle, and gives metadata-generating tools a reference that
  overrides their generic "research data deserves attribution" defaults.
- It is the license-layer counterpart of vocabulary discipline (ADR-0010):
  both choose the form of the artifact to maximize absorption while leaving
  the origin claim recoverable, and both rely on the federated-identifier
  layer rather than on enforcement.

**Negative.**

- The rule presupposes that the federated-identifier layer actually carries
  attribution through machine absorption. If measurement of the parametric
  channel (ADR-0011) finds the author's name does not survive ingestion —
  the ghost-citation failure mode — the premise that justifies waiving the
  attribution clause weakens, and the rule must be revisited rather than
  treated as settled.
- Relicensing an already-deposited artifact toward a public-domain
  dedication takes effect for the repository and future deposits; the prior
  deposited version retains its original license. The author owning the
  copyright may relicense their own work, and a move toward greater
  permissiveness raises no conflict, but the audit surface must track that
  older deposits carry the prior terms.
- A repository whose non-code material is the entire deliverable takes on a
  standing obligation to keep its split documented and its license surfaces
  — root file, deposit metadata, citation metadata, package metadata —
  mutually consistent.

## Lineage

Originating trigger: a 2026-06-17 cross-repository license audit of the
research ecosystem, prompted while relicensing a runtime-data repository,
which found four license patterns in simultaneous use and one
non-commercial restriction contradicting the framework. The rule's first
cut classified by artifact form (prose versus data); it was sharpened to an
audience axis when the LLM-first designation of an essay-collection
repository made the form classification untenable — a prose artifact whose
dominant audience is a machine takes the machine's license. The audit also
corrected the form-based default a metadata-generating tool had proposed
for the runtime-data repository.

Specific instances abstracted out of the body per repository convention:
the SPDX identifiers named in the Decision (CC0-1.0, CC-BY-4.0, MIT,
Apache-2.0) are the instruments current at the time of writing; the
normative content is the audience-to-license mapping, not the specific
identifiers. This decision governs the licensing of the framework's own
artifacts and is disjoint from ADR-0012, which governs the license
conditions a prospective external host must meet before the framework's
artifacts are listed there — the former is about the license the author
applies, the latter about the license a host must extend.
