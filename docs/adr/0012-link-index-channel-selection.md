Language: English | [日本語](0012-link-index-channel-selection.ja.md)

# ADR-0012: Link-Index Contributions to External Collections

> **Summary.** The diffusion strategy's Layer 4 includes listing artifacts
> in external curated collections so that both human readers and LLM
> crawlers discover them. Two contribution models exist: vendor-type, where
> the host carries the artifact body; and link-index-type, where the host
> carries only a hyperlink and a short factual description while the
> canonical artifact stays in the author's repository. This ADR establishes
> link-index-type as the only permitted contribution model and specifies a
> four-condition pre-submission audit. Both rules are grounded in two 2026
> withdrawal episodes whose shared pattern — vendor-type contributions are
> captured by any subsequent enclosure the host introduces — is the thesis's
> enclosure axis instantiated at the level of channel selection.

## Status
accepted

## Date
2026-06-13

## Context

The thesis's Layer 4 identifies listing artifacts in external curated
collections — community-curated link directories, skill marketplaces,
dataset registries — as a diffusion channel: these collections are heavily
crawled by LLM training and retrieval pipelines, and an entry extends the
canonical artifact's reach without the author replicating it elsewhere. Two
structurally different contribution models are in common use. In the
**vendor-type** model the host copies the artifact body (skill text,
document, package) into its own repository and becomes the distribution
point; in the **link-index-type** model the host carries only a hyperlink
and a short factual description, while the canonical artifact stays in the
author's repository. The distinction matters because only the link-index
model leaves the canonical source outside the host's control.

In early 2026 the author contributed eleven skill components under the
vendor-type model to a large commercially-operated component collection
during the period when that collection was openly accepting external
contributions. When the collection subsequently monetized, two pending
vendor-type contributions were withdrawn before merging. The trigger was
the author's employment-related constraints on contributing labor to
commercial ventures: once the host had monetized, continuing to submit
artifact bodies could be construed as providing labor to a commercial
product. The eleven already-merged contributions remained in the host's
distribution; that diffusion could not be reversed.

In a 2026-06 listing campaign covering eight submissions to external
directories, one submission was withdrawn the same day after auditing the
prospective host. That host combined four risk factors simultaneously:
corporate ownership, the absence of an open license on contributed content,
a content-vendoring structure in which the host carried artifact bodies
rather than linking to canonical sources, and operation as a marketing
funnel for a paid product. No single factor had previously been stated as
an explicit exclusion criterion; the episode revealed that the four in
combination constituted a risk profile warranting exclusion regardless of
contribution model.

Together the two episodes instantiate the thesis's enclosure axis at the
level of channel selection. Content vendored into a host that later encloses
— through monetization, license change, or access restrictions — is captured
by that enclosure regardless of the author's original intent. By contrast,
open-period diffusion (forks, mirrors, training snapshots taken before any
enclosure) is irreversible: what was absorbed by training pipelines or
mirrored openly cannot be retrospectively enclosed. The implication for
channel policy is asymmetric. The worst case for a link-index entry is a
one-line description inside an enclosing host; the worst case for a
vendor-type entry is an artifact body inside a product that charges for
access. The policy this ADR records closes that asymmetry.

## Decision

Adopt **link-index entries only** as the contribution model for external
collections. The canonical artifact remains in the author's repository; the
host carries a hyperlink and a short factual description. Vendor-type
contributions — where the host would carry the artifact body in its own
distribution — are declined by default.

Before submitting to any external collection, audit the prospective host on
four conditions:

1. **Corporate ownership** — the host is owned or operated by a corporate
   entity rather than a community or individual maintainer.
2. **Absence of an open license** — contributed content does not carry, or
   the host does not extend, an open license to downstream recipients.
3. **Content-vendoring structure** — the host carries artifact bodies in
   its own distribution rather than linking to canonical sources.
4. **Marketing funnel** — the host operates primarily to direct users toward
   a paid product or service.

The four conditions are not individually disqualifying for a link-index
entry. The more conditions combine, the higher the risk. A host meeting all
four is excluded even for link-index entries: the channel is unlikely to
serve the diffusion goal and the compliance risk remains non-trivial
regardless of contribution model.

After a listing is made, monitor the host for the introduction of paid tiers
or content-vendoring behavior. If either appears, withdraw the listing.

## Alternatives Considered

**Vendor content into external collections for maximal reach.** Contribute
artifact bodies wherever the collection size justifies it. Rejected:
copies become drift vectors against the canonical source; vendored content
is captured by any subsequent enclosure the host introduces (monetization,
license change, access restrictions), making the author's contribution a
component of a product they did not intend to supply; contributing artifact
bodies into a commercially-operated collection can also be construed as
providing labor to a commercial venture, conflicting with the author's
employment constraints. The same reach is available via link-index entries
in collections that accept them, without these costs.

**No external listings at all.** Abstain from submitting to external
collections rather than managing host risk. Rejected: community-curated
directories are heavily crawled by LLM training and retrieval pipelines and
represent a legitimate, low-friction attribution-diffusion channel; for
link-index entries, where no artifact body is contributed, the risk profile
is narrow. Abstaining forfeits the channel without reducing any real risk
for link-only entries.

**Case-by-case judgment without explicit criteria.** Evaluate each host
individually without codifying conditions. Rejected: the same four-factor
analysis was implicitly re-derived in both the 2026-02/03 withdrawal and
the 2026-06 same-day withdrawal; without explicit criteria the analysis
would be reconstructed inconsistently on every submission. The
four-condition audit makes channel selection a fast, mechanical
pre-submission check rather than an ad hoc judgment.

## Consequences

**Positive.**

- The canonical artifact has a single authoritative source; no drift can
  accumulate between the author's repository and host copies.
- The worst-case outcome of any listing is a one-line description inside
  an enclosing host — not an artifact body inside a paid product. The
  author's primary exposure to host enclosure is bounded.
- Compliance with employment constraints is structural: the link-index
  model contributes no artifact body to the host, so the constraint is
  satisfied by construction and does not require per-submission assessment
  of the host's commercial status.
- The four-condition audit is a pre-submission checklist requiring no
  open-ended judgment — channel selection becomes fast and auditable.
- The policy is consistent with the thesis: enclosure weakens origin
  claims, openness strengthens them; a contribution model that preserves
  the canonical source and limits host capture enacts that principle at
  the channel level.

**Negative.**

- Collections that only accept vendored content — including some of the
  largest in their category — are foreclosed. Maximal reach via those
  channels is unavailable under this policy.
- Listed entries carry a standing monitoring obligation: the host's
  commercial posture must be checked after any major policy change at the
  host. That obligation does not terminate.
- Withdrawing past vendor-type contributions (where already merged) does
  not undo open-period diffusion: artifact bodies distributed during the
  open period remain in forks, mirrors, and any training snapshots taken
  in that window. Accepted: that diffusion is consistent with the
  strategy; only future labor contributions are constrained.

## Lineage

Originating operational record: two withdrawal events — the 2026-02/03
withdrawal of two pending submissions to a commercially-operated collection
at the point of monetization, and the 2026-06-13 same-day withdrawal of one
submission after a four-condition audit of a corporate-owned, unlicensed,
content-vendoring, marketing-funnel host. The four conditions were derived
inductively from those two episodes and formalized here rather than left
implicit in a project memory note. The enclosure-axis framing traces to the
thesis's three-axis inversion (scarcity → diffusion / exclusivity →
derivation / enclosure → openness); this ADR is the first application of
that axis to a channel-selection decision rather than a release or openness
decision.

Specific instances abstracted out of the body: the commercially-operated
collection from the 2026-02/03 episode is a large skill-component registry
for LLM-based coding agents; the 2026-06 campaign covered eight
community-curated link directories; the operational record of both episodes
is in project memory under the heading "awesome-list-submissions." The
criterion is operationalized in the authorship-strategy component skill as a
Layer 4 tactic entry and a judgment-checklist item, added 2026-06-13.
