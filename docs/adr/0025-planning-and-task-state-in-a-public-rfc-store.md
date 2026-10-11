Language: English | [日本語](0025-planning-and-task-state-in-a-public-rfc-store.ja.md)

# ADR-0025: Planning and Task State in a Public RFC Store

> **Summary.** ADR-0014 made a private ledger the operational source of
> truth for the program's working state and published only a dated,
> effect-claim-free projection of it. Over four months that state spread
> across four private places, and a session could not read the current
> state in one place. This ADR moves the source of truth for planning
> and task state to a public `rfcs/` store in this repository: one entry
> per file, with its state in the front matter. The implementation log
> stays a separate document, the intervention timeline. Sensitive detail
> stays in private working notes, and an entry links to it. ADR-0014's
> reasons for keeping planning out of public view were about the
> timeline and about detail; both still hold, because planning stays out
> of the timeline and the detail stays private. What this ADR reverses is
> ADR-0014's commitment that the private ledger is the source of truth.
> ADR-0014's Decisions 2–4 stand, with "the ledger" now read as the store.

## Status

accepted

## Date

2026-10-12

## Context

Plan: [docs/plans/rfcs-store-consolidation.html](../plans/rfcs-store-consolidation.html) (approved 2026-10-12)

**Working state had spread across four private places.** By 2026-10-11
the program's open work lived in:

1. the private implementation ledger of
   [ADR-0014](0014-implementation-tracking-two-tier-ledger.md), a
   project-memory note of 843 lines. It held deployment history,
   candidate rounds, watch items and rejection guards in one sequence;
2. a private task table, kept apart from the ledger by an earlier
   author decision (2026-07-06) that split "work state" from "strategy
   state";
3. working notes, among them a candidate ledger harvested from the
   author's wiki;
4. a hand-off file that a session wrote on 2026-10-11 to carry fifteen
   remaining items into the next session.

The same item could appear in three of them. The OpenAttribution
decision, for example, was a row in the task table, a candidate in the
ledger and an item in the hand-off, each with its own wording. The
ledger declared its own candidate sections a historical record that
should not start the next move, so a reader had to know which parts of
it were still state. The internal survey that counted these items is
the plan's research report,
[docs/plans/research/2026-10-12-rfcs-store-consolidation.md](../plans/research/2026-10-12-rfcs-store-consolidation.md).

**Why the store is public.** Consolidation alone could be private. The
author chose a public store so that the reasons for rejecting a
proposal, and the open plan they sit beside, become part of the public
record, in the same way the ADRs record why a tactic was chosen. This
follows the openness this framework argues for: a dated, readable
record of what was considered and why.

**ADR-0014's two reasons.** ADR-0014 rejected a single public document
that would carry both the timeline and the planning, because
"operational detail and planning content would compromise the
timeline's empirical role and privacy." The first reason is about the
timeline: planning content in the intervention record would turn it
into a scratchpad. The second is about detail: contacts, the state of
third parties' replies, account detail and personal constraints.
Neither reason requires the plan itself to be private, as long as the
plan stays out of the timeline and the detail stays private.

**A public store already exists as a convention.** Since 2026-08-25 the
author's harness and sibling repositories keep tasks in a public
`rfcs/` store: one entry per file, a `state:` field with a fixed
vocabulary, and terminal entries kept in place as a public record of
decisions
([claude-harness ADR-0049](https://github.com/shimo4228/claude-harness/blob/main/docs/adr/0049-unify-task-ledger-into-public-rfcs.md)).
The command `claims.py ready` lists the open entries of a repository in
one read. On 2026-10-11 the author decided to bring this repository
into the same form.

## Decision

1. **Planning and task state live in `rfcs/`.** The store is the source
   of truth for them. Each entry is one file with a `state:` field in
   its front matter. Open entries are `draft`, `accepted`,
   `in_progress` or `blocked`. The store also holds, as terminal entries
   (`rejected` or `withdrawn`), the rejection guards that no ADR already
   records. A guard whose reason is already in an ADR stays in that ADR.
   Entries follow the store convention of claude-harness ADR-0049 and
   its filing procedure.
2. **The implementation log stays a separate document.** It stays the
   dated, effect-claim-free intervention timeline of
   [ADR-0023](0023-empirical-layer-role.md). Planning content goes to
   `rfcs/`, never to the log, so ADR-0014's first reason holds.
3. **Sensitive detail stays private and is linked.** Contacts, the state
   of third parties' replies, account detail and personal constraints
   stay in the private working notes. An entry states that the detail
   exists and links to it; the link and its filename carry no such
   detail either. ADR-0014's second reason holds at the level of the
   detail. Before publication, `scripts/verify-public-detail.sh` checks
   the entries and the log, and the author reads the diff, because
   publication cannot be undone.
4. **Record an implementation in one commit.** The same commit updates
   the entry's state and Status section and adds the dated line to the
   implementation log. This replaces the order of ADR-0014 Decision 1
   (private ledger first, then the projection).
5. **Open items move as entries; closed history stays private.** Each
   open item of the old ledger, task table and hand-off becomes an entry
   with a "previous ID" line. The ledger and the task table as they
   stood on 2026-10-12 move to a private archive. Their public record is
   the implementation log, the ADRs and the commit history. No entries
   are filed after the fact for completed work.
6. **Project memory points to the store.** It keeps a pointer to
   `rfcs/` and to the implementation log, not a copy of the state.

## Alternatives Considered

**Keep the private two-tier ledger.** Rejected: the state was already
in four places, and a session needed a hand-off file to carry it across
one boundary.

**Consolidate into one private store.** A single private store (a
gitignored `rfcs/`, or one private ledger) would also end the
fragmentation, and it would need no check for sensitive detail.
Rejected: the reasons for rejecting proposals, and the open plan, would
stay out of the public record that this framework argues for. The
author chose the public store and the check that comes with it.

**Publish the full history.** Rejected: the 843-line ledger carries
contacts, third-party handles, operational procedure and run
identifiers throughout. A public version would need a line-by-line
rewrite and would add a third public surface next to `rfcs/` and the
log, which already records the deployed interventions as a curated
timeline.

**Keep rejection guards private.** Rejected: a guard is state — it tells
the next session what not to propose again. Keeping guards in a private
archive would split the state again, between the store and the archive.

**File a terminal entry for every guard, including those an ADR holds.**
Rejected: the same reason would then live in two places, and the two
would drift.

**Record the change as a note on ADR-0014.** Rejected: this decision
reverses ADR-0014's lead commitment, that the private ledger is the
source of truth. A note on a decision that no longer holds would leave
its current form readable only through the note.

## Consequences

**Positive.**

- `claims.py ready` lists the open work of this repository in one read.
- A rejected proposal keeps its reason in public, next to the open work.
- The intervention timeline keeps its empirical role; planning never
  enters it.
- The repository follows the same task convention as its sibling
  repositories.

**Negative.**

- Every entry needs a check for sensitive detail before it is
  published, and a missed item cannot be withdrawn.
- Links from an entry into the private notes do not resolve for public
  readers; the entry has to say what the linked file holds.
- Old identifiers (task-table rows, ledger candidates, hand-off items)
  survive only as a "previous ID" line in each entry and in the private
  archive.
- Readers of the public record see the open plan, including items that
  are never carried out.
- Documents and tools that named the private ledger have to change: the
  maintenance reference, the implementation log's own maintenance
  section, scheduled tasks that read or wrote the ledger, and the sibling
  personal-branding strategy's boundary decision, which refers to this
  program's ledger.

**Revisit when** an entry causes a privacy incident, no new entry is
filed in `rfcs/` for three months, or the author moves planning back to
a private place.

## Lineage

ADR-0014 (2026-06-13, amended 2026-09-07) set up the two-tier ledger.
On 2026-07-06 the author kept a separate task table next to the ledger
rather than merge the two. On 2026-10-11, at the end of the session
that wrote ADR-0024, the author decided to make `rfcs/` the single
place for planning and state, with the implementation log as the
second public surface and sensitive detail kept private and linked.
The plan of 2026-10-12 settled the open questions: a new ADR rather
than a note; terminal entries only for guards no ADR holds; the closed
history kept in a private archive; the personal-branding strategy's acts
read from that strategy's own log rather than copied. During implementation the author
weighed a private store again and kept the public one, with a machine
check for sensitive detail.

Relations:
- Supersedes [ADR-0014](0014-implementation-tracking-two-tier-ledger.md)
  in part: the private ledger as source of truth for planning and task
  state, and the update order of its Decision 1. Its Decisions 2–4
  (consult records for the task at hand, keep exploration open, evaluate
  concrete choices in context) stand, with "the ledger" read as the
  store. Its first rejected alternative stays rejected: the timeline and
  the planning remain separate documents.
- [ADR-0023](0023-empirical-layer-role.md): its Decision is unchanged;
  its description of the log as the projection of ADR-0014's ledger is
  annotated.
- [ADR-0024](0024-success-as-arrival-at-the-dated-record.md): the
  evidence-tier events that its Decision 4 records in the private
  ledger are recorded in the `rfcs/` entry of the instrument or channel
  concerned, and its revisit condition reads that store. For an act that
  serves both strategies (its Decision 5), an act this program carries
  out is recorded in `rfcs/` and the log; an act of the personal-branding
  strategy that leads to the record is read from that strategy's own act
  log and is not copied here, because that log is its single record.
- [ADR-0021](0021-self-sovereign-entity-grounding.md) and ADR-0022 name
  the private ledger as it stood when they were written; they are not
  amended.
