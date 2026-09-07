Language: English | [日本語](0014-implementation-tracking-two-tier-ledger.ja.md)

# ADR-0014: Implementation Tracking as a Two-Tier Ledger

> **Summary.** A private implementation ledger holds operational status and
> working detail. A public intervention timeline records its dated,
> effect-claim-free projection. Tracking supports implementation; it does
> not prescribe how ideas are generated or which strategic premises may be questioned.

## Status

accepted — amended 2026-09-07

## Date

2026-06-13; amended 2026-09-07

## Amendment — 2026-09-07

The two-tier ledger and ledger-first update rule remain in force. This
amendment supersedes the original mandatory gap-review procedure and its
“next move” trigger, including dependent descriptions of those requirements.
It also removes the prescribed inquiry-first sequence, candidate-category
quotas, and automatic question registration from the operational procedure.
The decision below states the current scope of tracking and evaluation.

## Context

A public intervention timeline and a private working ledger serve different
purposes. The timeline records which interventions occurred and when. Its
empirical conventions exclude effect claims and private operational detail;
the external-collection decision supplies the required abstraction level.
The ledger carries deployment status, selected candidates, and working detail.

Combining them would turn a public observation record into a planning
scratchpad and expose information that the public record should abstract.
Keeping implementation state available remains useful when an action is
being considered or carried out.

The author reported that prescribed proposal-generation procedures were
constraining exploration. Allowing open inquiry in general while requiring
a starting question, a fixed reading sequence, candidate categories, or a
recorded outcome still specifies the shape of the inquiry. Moving such a
procedure into a reusable skill does not remove that constraint.

## Decision

Maintain implementation tracking in **two tiers**. The private ledger is
the operational source of truth for deployment status, selected candidates,
and working detail. The public timeline is its dated, effect-claim-free
projection, with operational detail abstracted to the level established by
[ADR-0012](0012-link-index-channel-selection.md). They remain separate.

1. **Update after implementation.** Record a deployed intervention in the
   ledger first, then add its dated projection to the public timeline.
2. **Consult records for the task at hand.** Use the ledger for status,
   feasibility, and duplicate checks when relevant to the requested work.
   A request for ideas does not itself initiate a tracking or review routine.
3. **Keep exploration open.** The thesis, tactical catalog, and previous
   decisions are materials for thought, including challenges to their
   premises. Exploration has no mandatory reading order, candidate quota,
   scoring checklist, or requirement to produce a record.
4. **Evaluate concrete choices in context.** When adoption or implementation
   is being considered, examine the relevant evidence, tradeoffs, and action
   boundaries. A conflict with an existing strategic decision is a reason
   to discuss its premises and possible revision, not an automatic rejection.
   Save ideas or questions when that recording work is requested.

Project-specific artifact locations belong in task-relevant maintenance
instructions. The operational skill supplies optional decision support;
it does not define a mandatory ideation workflow.

## Alternatives Considered

**A single public tracking document.** Rejected: operational detail and
planning content would compromise the timeline's empirical role and privacy.

**A prescribed ideation workflow in a reusable skill.** Rejected: relocating
the procedure preserves its control over the starting point, candidate shape,
and output. The author needs to explore beyond the current framework as well
as to apply it.

**No implementation record.** Rejected: deployment state and the public
intervention timeline still need to stay consistent. Removing a compulsory
thinking procedure does not remove the need to record completed actions.

## Consequences

**Positive.**

- The public timeline remains an effect-claim-free intervention record.
- Operational status remains available without becoming every conversation's starting point.
- Ideas can challenge current strategic premises before an adoption decision is made.
- Maintenance and evaluation instructions can be consulted for the specific work they support.

**Negative.**

- Two artifacts still need to be kept consistent after deployment.
- External readers see a lossy projection of private working state.
- Removing a prescribed procedure does not establish that ideas will improve;
  the author must judge their usefulness in actual conversations.

## Lineage

The original 2026-06-13 request concerned turning an intervention timeline
into a living operational record. It produced both the two-tier separation
and a mandatory proposal-generation loop. On 2026-09-07, the author asked to
reduce instructions that constrained new ideas and explicitly included the
shared operational skill and challenges to existing strategic premises.

In this program, the private ledger is a project-memory note and the public
timeline is the empirical implementation log. Their locations are maintained
in the repository's maintenance reference. The earlier procedure remains in
version history; the amended decision above governs current operation.
