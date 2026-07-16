Language: English | [日本語](0021-self-sovereign-entity-grounding.ja.md)

# ADR-0021: Self-Sovereign Entity Grounding — Community-Governed Authority Records Are a Revocable Layer, Not a Foundation

> **Summary.** The framework's entity-grounding tactic federated the
> author entity, the DOI-registered artifacts, bibliographic records of
> cited works, and machine-readable citation edges among them into a
> community-governed public knowledge base through self-created entries.
> The host's governance judged the account's aggregate editing pattern
> promotional, revoked the account indefinitely, and mass-deleted every
> entry in a single action — including the bibliographic records of
> third-party works. This ADR retires self-created entries in
> community-governed authority records as a Layer 4 tactic. It classifies
> grounding surfaces by *revocation control*: only self-sovereign layers
> (the repository and its knowledge graph, registry deposits under the
> author's account, the author-identifier record, intrinsic
> content-derived identifiers) may be load-bearing for the origin claim;
> third-party-governed grounding is admitted only when *earned* — created
> unprompted by uninvolved parties — never self-manufactured. Revoked
> machine-readable edges are purged promptly while dated historical
> records are preserved unmodified, and circumvention of the revocation
> is prohibited outright. The event is recorded as the strongest observed
> instance of the manifesto's ninth open question: authority a first-mover
> cannot yet supply also cannot be self-manufactured — the attempt is not
> merely ineffective but sanctioned.

## Status
accepted

## Date
2026-07-16

## Context

The 2026 structured-data-efficacy literature (read against the framework
in manifesto open question 9) indicates that entity-anchored markup —
structured data whose entities resolve to external authority records —
earns AI-retrieval citation where generic markup does not. Acting on
this, the program operated an entity-grounding tactic as part of its
Layer 4 structured-artifact surface: on a community-governed public
knowledge base, the author created an entry for the author entity,
entries for each DOI-registered artifact, bibliographic entries for
external works the doctrine cites, and machine-readable citation edges
connecting them; the ecosystem's knowledge graphs pointed `sameAs` edges
at those entries, and the author-identifier record cross-linked them.
Roughly one hundred entries accumulated over six weeks, each edit
conforming to the host's formal constraints — referenced statements,
constraint-checked properties, notability arguments grounded in
registry-issued persistent identifiers.

On a single date the host's governance process judged the account a
promotion-only account, blocked it indefinitely, and mass-deleted all of
its entries within one minute, including the bibliographic records of
third-party works. No individual edit was cited as violating; the
judgment was pattern-level — an account whose contributions exclusively
constructed a web of entries about one author and works citing that
author reads, in aggregate, as promotion regardless of per-edit
compliance.

Two structural facts follow. First, formal compliance at edit
granularity is no defense against a governance judgment made at account
granularity; a single-author diffusion program's footprint on any host
converges on the same shape — everything points at one author — and a
host may legitimately read that shape as promotion. Second, the revoked
layer was load-bearing: the citation-graph edges, the scholarly-profile
surface derived from them, and the deep `sameAs` anchor set all failed
simultaneously, and the ecosystem's own knowledge graphs were left
asserting equivalence to entries that no longer resolve — dead edges
that are misinformation to crawlers and that mimic the very spam pattern
the revocation alleged.

Manifesto open question 9 had already identified the supply-side gate:
entity grounding presupposes prior authority, which a first-mover idea
cannot yet supply. The revocation sharpens the question into an
observation. The missing authority cannot be self-manufactured either;
self-manufacture converts a neutral absence of grounding into an adverse
governance judgment attached to the author's name.

## Decision

**Retire self-created authority-record federation.** Create no entries
about the author, the author's artifacts, or citation edges pointing at
either, in community-governed knowledge bases or comparable authority
records. The retirement covers self-creation, not the surface itself:
an entry created unprompted by uninvolved third parties out of the host
community's own judgment is a blessed derivation event — consistent with
the framework's derivation axis — and once such an entry exists
independently, pointing `sameAs` at it is legitimate grounding.

**Classify grounding surfaces by revocation control.** A surface is
*self-sovereign* when its continued existence is under the author's
control: the repository and its knowledge graph, registry deposits made
under the author's own account, the author-identifier record, and the
intrinsic content-derived identifier layer — the last verifiable without
any registry and therefore non-revocable by construction. A surface is
*third-party-governed* when a host community or operator can revoke it
unilaterally: community knowledge bases, synthetic wikis, documentation
hubs, catalogs, link indexes. Only self-sovereign layers may be
load-bearing for the origin claim. Third-party-governed surfaces are
reach amplifiers whose total loss the strategy must be able to survive,
and are deployed only under that assumption.

**Purge revoked machine-readable edges promptly; preserve dated
history.** When a third-party-governed layer is revoked, remove the dead
identifiers from every machine-readable carrier — knowledge-graph
`sameAs` edges, structured-metadata records, served mirrors and their
generation sources. Dated historical records (changelogs, the public
intervention timeline, ADR lineage sections) are not rewritten; the
revocation is recorded as its own dated event. Machine-readable layers
assert present-tense truth and must resolve; history belongs in dated
records.

**Do not circumvent the revocation.** No new accounts, no editing while
logged out, no soliciting others to re-create the deleted entries.
Beyond the host's own rules, circumvention converts a governance
disagreement into permanent adversarial status under an identity
disconnected from the author — destroying exactly the traceability the
strategy exists to protect, and contaminating the attribution chain with
an identity the author could never again openly claim.

**Apply an aggregate-pattern test to future third-party deployments.**
Before deploying on any third-party-governed surface, ask how the
account's cumulative behavior will read to the host's governance — not
merely whether each action is formally compliant. Where the host's
governance culture reads a single-author footprint as promotion, the
surface is unsuitable for self-deployment regardless of per-action
compliance, and only the earned path remains.

## Alternatives Considered

**Appeal for restoration and continue the tactic.** The host provides an
appeal channel, and a partial appeal (for the bibliographic records of
third-party works, which are arguably neutral public data) might
succeed. Rejected as the doctrinal response: even a fully successful
appeal restores a layer that remains revocable at the host's discretion,
and the premise the governance rejected — self-populated authority — is
the tactic itself, not an execution error. An appeal may still be made
as a courtesy to the commons (the third-party bibliographic records
benefit others), but the retirement does not depend on its outcome.

**Re-create the entries under a new identity.** Rejected outright. It is
circumvention of an active revocation under the host's rules, and it is
self-defeating on the framework's own terms: an origin claim maintained
by an identity the author must conceal is not an origin claim.

**Keep the dead `sameAs` edges as historical priority claims.**
Rejected. A knowledge-graph edge asserts a present-tense equivalence;
once the target no longer resolves, the edge is misinformation to every
crawler that ingests it — and a graph dense with dead authority links
mimics the spam pattern the revocation alleged. The priority claim
already rests on the identifier layer (registry DOI, timestamp,
intrinsic identifier), not on any external mirror of it.

**Abandon entity grounding entirely.** Rejected as over-rotation. The
self-sovereign subset — author-identifier record, registry DOIs,
intrinsic identifiers, the repository's own knowledge graph, mirrors on
platforms where the author's account hosts its own artifacts — remains
deployed and was untouched by the revocation. The open question whether
this subset alone clears the citation threshold stays open; what is
retired is only the self-manufactured extension beyond it.

**Solicit third parties to create the entries (wait-and-earn as an
active campaign).** Rejected. Solicited creation is proxy
self-promotion: the same aggregate pattern, one hop removed, and a
governance process that detects the first pattern eventually attributes
the second. *Earned* means unprompted.

## Consequences

**Positive.**

- The framework gains an explicit revocation-control axis for
  classifying identifier and grounding layers. The intrinsic-identifier
  decision's rationale — each layer covers the other's failure mode —
  now demonstrably covers a third failure mode, governance revocation,
  against which the intrinsic layer is the only immune layer by
  construction.
- Manifesto open question 9 gains its strongest worked instance to
  date, recorded in the empirical layer as a preliminary observation:
  self-manufactured third-party authority is not merely insufficient
  for entity grounding — it is revocable with sanction.
- The purge discipline keeps every machine-readable carrier truthful in
  present tense, and the aggregate-pattern test gives future channel
  decisions a governance lens the four-condition host audit did not
  cover.

**Negative.**

- The program loses its machine-readable citation-graph edges, the
  scholarly-profile surface derived from them, and the deep `sameAs`
  anchor set. Citation federation contracts to the self-sovereign
  carriers: archive-metadata references and the repository knowledge
  graphs.
- The strongest form of entity grounding the literature rewards is now,
  for this program, reachable only through unprompted third-party
  action the author cannot schedule. The open question 9 tension is
  accepted, not escaped: the inversion's weakest point remains the
  authority gate on grounding.
- Bibliographic records of cited third-party works — neutral public
  data benefiting others — were destroyed alongside the author's own
  entries. The aggregate pattern's cost fell on bystander content the
  author contributed; the commons lost entries because of the context
  they were created in.
- The purge obligation spans every machine-readable carrier in the
  ecosystem; a missed carrier silently keeps asserting dead
  equivalences until found.

## Lineage

Originating operational record: a 2026-07-16 revocation event. An
account on a community-governed public knowledge base — used over the
preceding six weeks to create an author entity, entities for each
DOI-registered artifact, bibliographic entries for cited external works,
and citation edges among them, roughly one hundred entries in total —
was blocked indefinitely by the host's governance as a promotion-only
account, and all of its entries were mass-deleted within the same
minute, verified against the host's public deletion log. The event, the
retirement decision, and the ecosystem-wide purge plan are recorded in
the private implementation ledger; projection to the public dated
timeline follows the two-tier discipline (ADR-0014).

Relations: extends ADR-0013 — the intrinsic identifier's
registry-independence now covers governance revocation, a failure mode
the extrinsic layers share; bounds the entity-grounding practice built
on ADR-0009's structured-graph surface and the citation-edge federation
layered on ADR-0002 — both continue, restricted to self-sovereign
carriers; complements ADR-0012 — its four-condition audit governs where
the author *lists*, this ADR adds a revocation-control and
aggregate-pattern lens governing where the author *writes*; extends
ADR-0017's failure-mode register with an observed instance of a mode the
register did not anticipate (tactic revocation by platform governance);
and is consistent with ADR-0020 — derived and earned views are blessed,
never manufactured. Manifesto open question 9 remains open; this ADR
records its sharpest empirical instance without closing it.
