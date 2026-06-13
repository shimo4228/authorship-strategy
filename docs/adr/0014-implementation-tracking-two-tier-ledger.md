Language: English | [日本語](0014-implementation-tracking-two-tier-ledger.ja.md)

# ADR-0014: Implementation Tracking as a Two-Tier Ledger with Periodic Gap-Review

> **Summary.** Layer 4 tactics are deployment decisions that operate
> over time, not one-time acts. The program already publishes a
> public intervention timeline recording which tactics were deployed
> and when; its empirical-layer conventions — no effect claims,
> host-abstraction discipline (ADR-0012), no operational detail —
> prevent it from doubling as a progress-management mechanism. This
> ADR establishes a two-tier ledger: a private implementation ledger
> holds per-tactic deployment status, ranked candidate interventions,
> and working detail; the public timeline is its projection, dated
> and effect-claim-free. A periodic gap-review generates new
> proposals by comparing deployed tactics against the Layer 4 catalog
> and the framework's open questions. The review procedure lives in
> the framework's operational skill; project-specific wiring lives in
> the project's context file.

## Status

accepted

## Date

2026-06-13

## Context

Layer 4 tactics are deployment decisions sustained over time, not
one-time acts. Operating the strategy coherently requires knowing
which tactics are deployed, which are pending, and what the next
move is — a running operational picture the program needs in order
to act consistently rather than re-deriving its position at each
session.

The program already publishes a public intervention timeline as
part of the empirical layer: a DOI-versioned artifact that records
which tactics were deployed and when. That timeline is governed by
the empirical layer's standing conventions — preliminary-observation
tone, no effect claims, and the host-abstraction discipline the
external-collection ADR (ADR-0012) establishes, under which the
specific hosts and operational identities behind each intervention
are abstracted to a generic description. The normative/empirical
separation, which the empirical layer exists to enforce, also
applies: the timeline is a methods companion to the observation
record, not a strategy document.

A progress-management mechanism requires the opposite of those
conventions. It must carry per-tactic deployment status (deployed,
in-progress, not-started, out-of-scope), ranked candidate
interventions with rationale, and the working detail — host
identities, rate limits, pending external requests — that the
timeline's abstraction discipline explicitly removes. Writing that
content into the public timeline would break its role: it would stop
being a preliminary-observation methods companion and become a
planning scratchpad, violate the ADR-0012 abstraction discipline,
and expose operational detail publicly. The timeline is a
DOI-versioned record; enriching it with planning notes would also
churn the versioned artifact with content that has no empirical
function.

The need is a durable home for operational status that drives
consistent next-step proposals, without polluting the published
timeline and without requiring the working state to be re-derived
from scratch each session.

## Decision

Maintain implementation tracking in **two tiers** with a strict
separation of roles. Tier one, the private implementation ledger,
is the operational source of truth: per-tactic deployment status
(deployed / in-progress / not-started / out-of-scope), ranked
candidate interventions with rationale, and operational working
detail that the public timeline must not carry. Tier two, the
public intervention timeline, is a dated projection of the ledger:
effect-claim-free, with operational detail abstracted to the level
ADR-0012 sets, in the canonical publication language. The two are
never merged.

Four operating rules govern the tiers:

1. **Update rule.** When an intervention is deployed, update the
   ledger first, then project a dated row into the public timeline.
   The ledger is always the source; the timeline is always the
   projection.

2. **Gap-review procedure.** A periodic gap-review generates new
   proposals: read the ledger's current status; gap-analyze deployed
   tactics against the Layer 4 tactic catalog, the framework's open
   questions, and recent relevant literature; rank the candidate
   interventions; run each through the framework's judgment checklist;
   record surviving candidates in the ledger and surface them.

3. **Division of homes.** The review procedure is generic and lives
   in the framework's operational skill, so any adopter can run it.
   The project-specific wiring — which artifacts are this program's
   ledger and timeline — lives in the project's context file, because
   a portable skill must not hardcode personal artifact locations.

4. **Trigger.** The gap-review runs on-demand by default — when
   the next move is in question or an intervention round closes. A
   periodic schedule is an optional wrapper, not the primary
   activation mechanism.

## Alternatives Considered

**Single-document tracking.** Enrich the public intervention
timeline itself with status and ranked-proposal sections. Rejected:
it overloads a DOI-versioned public empirical artifact with
operational working content, breaks its preliminary-observation and
methods-companion role, violates the ADR-0012 abstraction discipline
by surfacing operational detail, and churns the versioned record with
planning notes that have no empirical function. The timeline is
citable and public; a planning scratchpad is neither.

**Procedure in the project context file.** Put the full gap-review
procedure in the project's context document rather than a reusable
skill. Rejected: a multi-step review-and-propose workflow is
procedural content that belongs in the reusable skill layer; the
context document is for project-specific wiring. Placing the
procedure there bloats the context file, mismatches its role, and
makes the review non-portable to adopters who do not share the
project's context.

**No formal mechanism.** Track implementation ad hoc in conversation
and memory without a defined ledger-and-projection discipline or
review loop. Rejected: deployment status drifts without a maintained
record; the public timeline and the working state diverge silently;
and the next move is re-derived inconsistently each time rather than
from a maintained gap-analysis. An informal approach reproduces the
coordination cost of the formal one at each session without
accumulating the benefit.

## Consequences

**Positive.**

- The public timeline keeps its role: an effect-claim-free
  intervention record, not a planning scratchpad. Its DOI-versioned
  content is not churned with operational notes.
- Operational status and ranked proposals have a durable home; the
  next move is produced by a repeatable gap-analysis rather than
  re-derived ad hoc.
- The gap-review is a self-application of the framework: the program
  observes its own diffusion implementation and generates its next
  move from the same tactic catalog and open questions it publishes.
  This bears on the open questions about the empirical layer's role
  and about the framework's recursive application to itself.
- The generic review procedure is adoptable by any author running
  the same framework; only the project-specific wiring differs.

**Negative.**

- Two artifacts must be kept in sync; the update rule (ledger first,
  then projection) is a standing discipline that can be skipped under
  time pressure, producing drift between the working state and the
  public record.
- The private ledger is not citable; the public record is necessarily
  a lossy projection, so an external reader sees interventions and
  dates but not the reasoning or the rejected candidates.
- The gap-review's proposal quality depends on the tactic catalog and
  the open-question set being current; a stale catalog yields stale
  proposals.

## Lineage

Originating need: a 2026-06-13 request to make the published
intervention timeline a living progress-management mechanism that also
generates new strategy proposals. That request surfaced the conflict
between the operational need and the public artifact's empirical-layer
conventions, which do not admit planning content or unexpurgated
operational detail.

Specific instances abstracted out of the body: the private ledger is
a project-memory note maintained alongside the project's other
operational records; the public intervention timeline is the empirical
layer's implementation-log document; the framework's operational skill
is its authorship-strategy component skill; the project's context
file is the repository's agent-instruction document. The generic form
of the review procedure is recorded in that component skill; this ADR
records only the decision and its rationale.
