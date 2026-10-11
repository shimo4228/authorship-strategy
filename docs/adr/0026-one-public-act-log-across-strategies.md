Language: English | [日本語](0026-one-public-act-log-across-strategies.ja.md)

# ADR-0026: One Public Act Log Shared Across the Author's Strategies

> **Summary.** The acts of the author's strategies — this framework and
> the author's personal-branding strategy — go into one public act log,
> the implementation log, with a row ID and the strategy that carried
> each act out. A human-facing route also reaches machines and the
> reverse, so the intent behind an act cannot separate its effects. Acts
> done in public places name the place and the URL; acts done through
> private routes (forms, applications, e-mail) record only that they
> happened. The log holds no reasons; counterpart reactions, contacts and
> personal matters stay in private notes. Work queues keep plans and the
> log ID, not a second record of the act. Past rows are kept, and names
> are added to them as dated annotations. Keeping every act in a public
> log also keeps the author choosing acts that can be published.

## Status

accepted

## Date

2026-10-12

## Context

Plan: [docs/plans/shared-act-log-convention.html](../plans/shared-act-log-convention.html) (approved 2026-10-12)

**The split followed intent; effects do not.** Earlier on 2026-10-12,
[ADR-0025](0025-planning-and-task-state-in-a-public-rfc-store.md) moved
planning and task state to a public `rfcs/` store and kept the
implementation log as the intervention timeline. Under
[ADR-0024](0024-success-as-arrival-at-the-dated-record.md) Decision 5,
the strategy whose aim motivates an act records its effect, so the
personal-branding strategy was to keep its own act log, in a private
repository, which this program would read rather than copy (commit
`bc76573`). The author then observed that intent does not separate
effects: a listing written for human readers is also crawled, and a
machine-facing surface also brings people to the record. ADR-0024 judges
success by arrival at the dated record, and that judgment is easier to
read when the acts that have no other dated record share one timeline,
whoever carried them out.

**What was withheld, and why.** The timeline had abstracted
operational detail to the level of
[ADR-0012](0012-link-index-channel-selection.md), by
[ADR-0014](0014-implementation-tracking-two-tier-ledger.md)'s Decision,
whose stated reason was privacy: operational detail in the public record
would expose information it should abstract. Two kinds of material fall
under that reason. Counterpart reactions, contacts and personal
constraints are context around an act, not the act; they stay private
and need not enter any log. Host names and URLs of acts done in public
places are another matter: a pull request, a post, a profile edit or a
deposit is already public where it happened, so naming it discloses
nothing new. An act done through a private route is not visible from
outside, so the log records only that it happened.

**Aggregation.** [ADR-0021](0021-self-sovereign-entity-grounding.md)
judges outreach by its cumulative footprint, not merely by whether each
act complies with a host's rules. A public log gathers acts from many
places on one page and makes that footprint visible at once. No
evidence links publishing such a log to a sanction; that it raises the
risk is a hypothesis. The author judged that the footprint is set by
the acts themselves — which hosts, how often, with authorship disclosed
— and that hiding the record would not change it. The author accepted
publishing the rows of both strategies on 2026-10-12, in the plan
discussion that chose this design.

**Review.** A cross-vendor review of the plan (gpt-6-astra) found that
work queues would remain a second record, that an unattended writer
could lose rows, that rewriting past rows would conflict with the
history preservation of ADR-0021, and that the decision spans several
repositories, a resident rule and automation. Decisions 4, 6 and 8 and
the form of this record follow from those findings.

## Decision

1. **One public act log.** Acts of the author's strategies are recorded
   in `docs/empirical/implementation-log.md`. From 2026-10-12 a
   chronological section holds one row per act with an ID, the date,
   the strategy that carried the act out (By), the act, where it
   happened, and the route to the record. By names who carried the act
   out; it does not attribute effects.
2. **Public places are named; private routes are not.** An act done in
   a public place names the place and the URL. An act done through a
   private route (a form, an application, e-mail) records only that it
   happened, without place or URL. This replaces, for acts in public
   places, the abstraction ADR-0014 applied to the timeline.
3. **No reasons in the log.** Reasons go to the planning store of the
   strategy that acted — `rfcs/` for this framework — which may state
   reasons that are not sensitive. Counterpart reactions, contacts and
   personal matters stay in private notes.
4. **One record per fact.** A work queue keeps plans, steering, private
   context, and the log ID of a completed act. It does not keep the
   act's URL or date as a second record.
5. **The scope is stated at the head of the log.** The log covers acts
   on third-party surfaces and interventions on the dated record. It
   does not cover changes inside a repository (git history and the
   CHANGELOG hold them) or the publication of articles (the publishing
   platform holds it). A reader assembling arrival reads the log
   together with those records.
6. **Past rows are kept.** Names are added to existing rows as dated
   annotations. Rows that record a revocation or a withdrawal stay.
   Where the strategy or the route of an old row is not known, the
   annotation says so. The log's sections for planned and declined
   work move to `rfcs/` (ADR-0025 Decision 2); the log points to the
   entries that carry them, and its earlier wording stays in its
   history.
7. **Three layers, one source each.** The resident harness rule
   `public-records.md` holds the common boundary of public records. The
   section "実施を記録するとき" of `docs/maintenance.md` holds this
   log's scope and columns. Scheduled tasks and skills hold the
   procedures.
8. **Unattended writers write the row first.** A scheduled task appends
   its row on a dedicated branch, then closes the queue item with the
   row's ID, and reports acts that have no row and rows that have no
   closed item. A session merges the branch after reading the diff and
   running the public-detail check.
9. **The footprint stays deliberate.** Rows use neutral wording, with
   By as an abbreviation defined once at the head of the log. The
   listing task keeps its cumulative-footprint check and its stop
   conditions, and discloses authorship in each submission.

## Alternatives Considered

**One log per strategy.** Rejected: an act that serves both strategies
would be recorded twice, or assigned to one owner by intent, and the
effects the logs are read for do not follow intent.

**A private log with a public projection.** Rejected: it restores the
two-tier ledger that ADR-0025 retired and keeps the same facts in two
places.

**Keep personal-branding rows out of the public log.** Rejected by the
author: it splits the timeline again, and the footprint depends on the
acts, which a hidden record does not change.

**Apply the new convention only from the new section.** Rejected: past
rows would stay unnamed, and a reader judging arrival would still have
to look up where each early act happened. Dated annotations add the
names without changing what the rows said at the time.

**Let the unattended task publish after the check.** Rejected: a row
naming a host spreads into release snapshots, archives and mirrors once
pushed, so a person reads the diff before publication.

**Dated notes on ADR-0024 and ADR-0025 only.** Rejected: the change
spans several repositories, a resident rule and an unattended task, and
a reader of those needs one record of why.

## Consequences

**Positive.**

- The acts without another dated record are read from one timeline,
  whoever carried them out.
- Each act has one record; reconciliation finds the rare drift between
  a queue and the log.
- The author chooses acts with the expectation that they will be
  listed in public.

**Negative.**

- The breadth of the author's outreach is visible on one page.
- A pushed row is effectively permanent: it spreads into Zenodo release
  snapshots, the Software Heritage archive and dataset mirrors.
- Named URLs rot; dead links stay in dated rows.
- The empirical layer's methods companion now carries acts that are
  not this framework's tactics; readers that cut the log by tactic
  (such as `docs/empirical/tactic-lifecycle.md`) filter by By.
- Unattended rows wait for a session to merge them, and the
  personal-branding strategy changes its own documents and queue format.
- Past rows read in two registers: the original abstraction and the
  dated annotations.

**Revisit when** the author hesitates to log an act before doing it,
a platform cites the log in a decision about the author's account, an
act cannot be recorded under Decision 2, or a third strategy starts to
record acts here.

## Lineage

The question came up after ADR-0025 on 2026-10-12, when the private copy
of personal-branding routes was removed (commit `bc76573`) and the
author asked whether the implementation log was shared with that
strategy. The author argued that intent and effect cannot be separated,
rejected a canonical-plus-public split, and judged that acts done in
public places can be named because they are already public. The plan
was reviewed by gpt-6-astra (nine findings) and revised; the author
accepted publishing both strategies' rows and noted that a public log
keeps acts publishable, which this record adopts as a reason. An ADR
review then corrected the account of where the abstraction came from
and the relation to ADR-0024 Decision 5.

Relations:
- Amends [ADR-0014](0014-implementation-tracking-two-tier-ledger.md):
  the abstraction of operational detail no longer applies to the place
  and URL of acts done in public places; the privacy reason still
  governs reactions, contacts and personal matters.
- Amends [ADR-0024](0024-success-as-arrival-at-the-dated-record.md)
  Decision 5: its sentence that the strategy whose aim motivates an act
  records its effect, and that an act serving both is recorded in both
  ledgers, is replaced by one record in the shared log with the
  strategy that carried the act out. Its owned questions stand.
- Amends [ADR-0025](0025-planning-and-task-state-in-a-public-rfc-store.md):
  the log records the acts of all the author's strategies and names
  public places; its Decision 2 stands (planning stays out of the log).
- [ADR-0023](0023-empirical-layer-role.md): the log stays an
  effect-claim-free record in the empirical layer; its scope widens to
  the acts of all strategies.
- [ADR-0012](0012-link-index-channel-selection.md): its selection
  criteria stand; its level of abstraction no longer governs the names
  of public acts in the log.
- [ADR-0021](0021-self-sovereign-entity-grounding.md): its cumulative
  footprint test governs Decision 9, and its history preservation
  governs Decision 6.
