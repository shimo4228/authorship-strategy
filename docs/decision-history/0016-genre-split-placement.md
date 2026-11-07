Language: English | [日本語](0016-genre-split-placement.ja.md)

# ADR-0016: Genre-Split Placement — Essays as Repository-Corpus Canonical with Intrinsic Identifier, Papers as Concept-DOI Canonical

> **Summary.** The identifier layer fixes the concept DOI as the canonical
> priority claim (ADR-0001) and adds an intrinsic content-derived
> identifier as the substitute claim for genres where DOI registration is
> impractical (ADR-0013), but it never recorded which genre takes which
> canonical. Two genres in the program's output pull apart: papers, which
> are conventionally DOI-registered and benefit from concept-DOI
> citability, and essays, which the manifesto's open question 4 names as
> DOI-registrable only through a registry's general-upload type — a
> practice uncommon for the genre. This ADR routes the canonical by genre:
> the essay genre's canonical is the author's version-controlled
> repository corpus, its priority claim resting on the intrinsic
> content-derived identifier rather than a registry DOI, under a
> public-domain dedication; the paper genre's canonical is the concept
> DOI. Syndicated essay copies are bound to the canonical by entity
> federation (sameAs / ORCID / DOI / intrinsic identifier / distinctive
> vocabulary), not by a platform canonical-URL tag. Corpus membership is
> gated by an authenticity criterion — author-voiced, reader-intended
> pieces only — and a load-bearing essay idea is promoted to a
> concept-DOI deposit when it graduates into a paper.

## Status
accepted

## Date
2026-06-25

## Context

The framework's identifier layer fixes the **concept DOI** as the
canonical priority claim (ADR-0001) and adds an **intrinsic
content-derived identifier** as the substitute claim for artifact genres
where DOI registration is impractical or unconventional (ADR-0013,
closing the manifesto's open question 4). What neither ADR recorded is
*which genre takes which canonical*. The program's output splits across
two genres that pull in different directions:

- **Papers** are conventionally DOI-registered, and the concept DOI gives
  them citability, rich metadata, and registry-mediated scholarly
  discovery. Their canonical is uncontested.
- **Essays** are the case open question 4 named directly: DOI-registrable
  only through a registry's general-upload type, a practice uncommon for
  the genre. The essays already have a home — a public, version-controlled
  markdown corpus, syndicated across several publishing platforms — but
  that corpus was a *publishing pipeline*, not a governed artifact. It
  lacked the three governance elements the rest of the ecosystem carries:
  an intrinsic-identifier priority claim, a reconciled license (it
  declared an attribution-requiring content license, against the
  machine-mined-audience rule of ADR-0015), and entity federation back to
  the ecosystem. Absent a recorded rule, syndicated essay copies had no
  recorded binding to a canonical, and the essay corpus had no priority
  claim at all.

A second pressure makes the binding load-bearing. An essay published for
LLM-mediated reach is mined, not read (ADR-0007, ADR-0015), and it spreads
across syndication platforms by design — the thesis's enclosure-to-openness
axis favors federated republication over single-platform consolidation. The
mechanism that routes LLM-mediated credit from a syndicated copy back to its
origin therefore matters as much as the canonical itself. Two candidates
exist: the **platform canonical-URL tag** (the syndication metadata a
republishing platform emits to point a search engine at an original URL),
and **entity federation** (the sameAs, ORCID, DOI, intrinsic-identifier,
and distinctive-vocabulary edges that ADR-0009 and the program's structured
layer already maintain). The framework's own doctrine grounds the second
and can measure it (ADR-0011); the first is a human-reader and
search-engine convention whose effect on LLM-mediated credit the framework
has not verified.

## Decision

Route the canonical by **genre**, bind syndicated copies by **entity
federation**, gate corpus membership by an **authenticity criterion**, and
promote a load-bearing essay idea into the **paper genre** when it warrants
a concept DOI.

1. **Genre routing.**
   - The **essay genre's** canonical is the author's version-controlled
     repository corpus. Its priority claim rests on the **intrinsic
     content-derived identifier** — a snapshot of the corpus in a
     content-addressed public archive (ADR-0013) — not on a registry DOI.
     The corpus takes a **public-domain dedication (CC0-1.0)**, its
     dominant audience being machine ingestion (ADR-0015).
   - The **paper genre's** canonical is the **concept DOI** (ADR-0001),
     with the intrinsic identifier as its complementary layer (ADR-0013).

2. **Syndication binding by entity federation, not canonical-URL tag.**
   Syndicated essay copies are bound to the canonical by the
   federated-identifier layer — sameAs, ORCID, DOI, intrinsic identifier,
   and the distinctive vocabulary that survives paraphrase (ADR-0010) — the
   same layer that carries attribution everywhere else in the framework.
   The platform canonical-URL tag is *retained* where a platform emits it,
   as cheap human-reader and search-engine hygiene; it is *not relied on*
   to route LLM-mediated credit. The framework does not assert that
   LLM-mediated channels ignore canonical-URL tags — that is unverified —
   only that its recognition mechanism is the federation layer it controls
   and can measure, not a tag whose effect it cannot.

3. **Corpus membership by authenticity criterion (Layer 1).** The governed
   corpus admits **author-voiced, reader-intended** pieces: written in the
   author's own voice and published for a reader. Study or learning drafts
   without an author voice are excluded. This is a membership *criterion* —
   a statement of what belongs — not a churn rule enforced by reshuffling
   files.

4. **Essay-to-paper promotion.** When a load-bearing idea in an essay
   warrants a concept-DOI deposit, it is promoted to the **paper genre**
   and moves to the concept-DOI canonical — the idea-character artifact
   surviving into a registered deposit while the essay-as-vehicle remains
   on the corpus surface (Layer 3, idea-versus-scaffold separation). Until
   promotion, the idea rests on the essay genre's intrinsic-identifier
   claim.

## Alternatives Considered

**DOI-register every essay through a registry's general-upload type.**
Gives each essay a registry DOI and a uniform canonical across both genres.
Rejected: the practice is uncommon for the genre (open question 4), and the
intrinsic identifier already supplies a per-artifact, content-verifiable
priority claim without the version sprawl the concept-DOI discipline guards
against (ADR-0001, ADR-0004). A DOI per essay buys citability the genre
rarely uses at the cost of registry maintenance the intrinsic layer avoids.

**Route LLM-mediated credit through the platform canonical-URL tag.** Treat
the republishing platforms' canonical metadata as the binding from copy to
origin. Rejected: the tag's effect on LLM-mediated credit is unverified,
whereas entity federation is doctrine-grounded (ADR-0009, open question 9)
and measurable (ADR-0011). The framework will not promote an unverified
platform convention to the credit-routing mechanism while it holds a
federation layer it controls; the tag is kept only as human-reader and
search-engine hygiene.

**Consolidate the essays onto a single platform to present one canonical
surface.** Removes the syndication-binding problem by removing the
syndication. Rejected: the diffusion thesis (enclosure to openness) favors
federated republication, which widens LLM-mediated reach; consolidation
trades that reach for a tidiness the federation layer already supplies
without it. The right answer to scattered copies is to bind them, not to
stop scattering.

**Give the essay corpus no priority claim, treating essays as ephemeral.**
Accepts that essays are lower-stakes than papers and need no timestamp.
Rejected: any artifact carrying a load-bearing idea needs a timestamped
priority claim, and the intrinsic identifier is exactly the low-cost claim
ADR-0013 designated for DOI-impractical genres. Leaving the corpus
unclaimed would forfeit priority on ideas that may later be promoted to
papers.

## Consequences

**Positive.**

- Each genre has a recorded canonical and a recorded priority-claim
  mechanism, so "where does this artifact live, and what stamps its
  priority" is answerable by genre rather than case by case.
- The essay corpus graduates from a publishing pipeline to a governed
  artifact: an intrinsic-identifier priority claim, a license reconciled to
  the machine-mined-audience rule (ADR-0015), and entity federation back to
  the ecosystem hub, the author identifier, and the sibling DOIs at the
  repository surface.
- Recognition routing for syndicated copies rests on the federation layer
  the framework controls and measures, not on a platform convention whose
  effect it cannot observe — keeping the credit mechanism inside the
  instrumented part of the system.
- The genre split instantiates ADR-0013's DOI-impractical-genre clause
  concretely and complements ADR-0015's license-by-audience rule, turning
  two abstract provisions into a placement an adopting author can follow.

**Negative.**

- The essay genre's intrinsic-identifier claim inherits ADR-0013's premise
  that the federated-identifier layer carries attribution through machine
  absorption. If the parametric-channel measurement (ADR-0011) finds the
  ghost-citation-of-authorship failure mode (open question 8), the essay
  genre's reliance on the intrinsic claim plus federation weakens along
  with the rest of the program.
- The promotion trigger is a judgment call — is this idea load-bearing
  enough for a concept DOI? — with no mechanical test. A mis-call either
  leaves a load-bearing idea on the weaker intrinsic claim or over-promotes
  into the version sprawl the concept-DOI discipline exists to prevent.
- Maintaining the corpus's intrinsic-identifier currency is a standing
  obligation: a materially new corpus state should be re-archived so the
  recorded snapshot continues to cover what the priority claim asserts.

## Lineage

Originating trigger: a 2026-06-25 review of where crystallized essays and
papers should live for LLM-mediated diffusion. The review found that the
essays already had a public, version-controlled markdown corpus syndicated
across several publishing platforms, but that the corpus was a publishing
pipeline lacking the three governance elements the rest of the ecosystem
carries — an intrinsic-identifier priority claim, a reconciled license (it
declared an attribution-requiring content license against the
machine-mined-audience rule of ADR-0015), and entity federation. The
decision applied the genre split — essays on the intrinsic-identifier
canonical, papers on the concept-DOI canonical — and, as the implementation
this ADR records rather than plans, the essay corpus was relicensed to a
public-domain dedication, given a citation record carrying its archive
snapshot identifier, and federated to the ecosystem hub, the author
identifier, and the sibling DOIs at the repository surface; the papers were
confirmed already canonical on their concept DOIs with preprint mirrors
back-routing to the DOI.

Specific instances abstracted out of the body per repository convention:
the essay corpus is a public articles repository syndicated to a Japanese
technical-publishing platform and an English developer-publishing platform
with a newsletter mirror; the content-addressed public archive is the same
UNESCO-backed source-code archive ADR-0013 names, and the snapshot
identifier is a SWHID (ISO/IEC 18670); the paper genre's concept DOIs are
minted by the same DOI service the rest of the program uses, with preprint
mirrors on a scholarly preprint server whose page back-routes to the DOI.
The genre routing and the federation-over-tag binding are the normative
content; the specific platforms are current instances. This decision
complements ADR-0015 (license by audience) and instantiates ADR-0013's
DOI-impractical-genre clause, anchored to ADR-0001 (concept-DOI canonical),
ADR-0005 (audience-driven localization of the bilingual corpus), ADR-0009
(the structured graph as the registration surface the federation binding
relies on — consideration-set entry and entity resolution, per its
2026-08-19 revision), ADR-0010 (distinctive vocabulary as a binding edge that survives
paraphrase), Layer 3 (idea-versus-scaffold separation, governing
promotion), and the manifesto's open questions 4 (the substitute
priority-claim mechanism) and 8 (the reach-without-recognition failure
mode the federation binding is meant to keep at bay).
