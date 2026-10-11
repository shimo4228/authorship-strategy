Language: English | [日本語](0024-success-as-arrival-at-the-dated-record.ja.md)

# ADR-0024: Success Is a Use That Reaches the Dated Record — the Name Is Observed, and Each Strategy States the Question It Owns

> **Summary.** The framework defined its strategy as maximizing the
> breadth of LLM-mediated channels that carry recognizable signatures
> of the author's ideas, anchored to a permanent timestamp, and its
> instruments asked above all whether a signature — the author's name
> or a coined term — travelled with the idea. That definition mixed two
> aims, whether authorship survives when an answer engine reuses the
> work and how the work is found and used by machines at all, and its
> operating weight fell on the first, although whether a name is printed
> in an answer is set by the answer engine, not by the author. This ADR
> fixes the success criterion on what the author must protect: the
> dated judgment, *that this was thought at this time*. **Success is a
> use of the author's idea that reaches the dated record** — the
> concept-DOI deposit or the repository whose history and archive
> identifier timestamp it. The name is not required: a retrieved record
> already carries it, and in a model's weights a recalled name, coined
> term, project name or DOI matters as a pointer back to the record.
> Absorption with no route back is recorded as diffusion, not counted as
> success. Arrival is judged in two tiers. Each strategy states the
> question it owns — this one, arrival at the record; the author's
> personal-branding strategy, the author as a person — and the two are
> written to feed each other. ADR-0022 is superseded, and the guard that
> enforced its boundary clause as a textual prohibition is retired.

## Status

accepted

## Date

2026-10-11

## Context

Plan: [docs/plans/arrival-success-and-branding-boundary.html](../plans/arrival-success-and-branding-boundary.html) (approved 2026-10-11)

**The success definition weighted a variable the author cannot move.**
The thesis's Layer 2 names the strategy as "maximizing the breadth of
LLM-mediated channels that carry recognizable signatures of the
author's ideas, anchored to a permanent timestamp", and
[ADR-0007](0007-human-attention-signals-not-a-metric.md) clause 3 lists
"machine ingestion, programmatic retrieval, knowledge-graph presence,
and citation within LLM answers" as the operative measure. Several of
those measures are already about arrival: the thesis's tactic 1 counts
clones, DOI citations and llms.txt fetches, and the probe protocol of
[ADR-0011](0011-two-channel-probe-protocol.md) records *owned
identifier cited* as its own boolean. What carried the weight was the
signature: the probe's parametric arm defines success as the model
producing the concept *and the author's name*, the derived
ghost-citation rate treats an identifier cited without the name as the
problem case, and [ADR-0017](0017-failure-mode-diagnostics.md)
classifies a concept carried without the author's name as the first
failure mode. Whether an answer prints the author's name is a property
of the answer engine's design, and answer engines often answer with no
clickable citation at all (Strauss et al., arXiv:2508.00838, a log study
of answer engines), so a signature-weighted criterion counts much of
what happens as failure.

**The name question is well-posed only for the weights.** When an
answer engine retrieves the repository, an essay or a paper, the
author's name is on the retrieved page; asking whether the model knows
the name adds nothing to asking whether the record was retrieved. The
question has content only for parametric absorption, and there the
name is one pointer among several — a coined term, the project name and
the DOI lead back to the record as well.

**An admission failure went unread.** On 2026-07-02 the program
verified ownership of its served pages on a major search console and
submitted their sitemap, keeping the console "as a diagnostic, never as
a target" under ADR-0007 (the implementation log records both). A
general audit on 2026-10-01 then read that console for the first time
in three months: the search index knew 1 of the 27 served URLs, the
submitted sitemap had never been fetched, and no followed inbound link
pointed at the pages. The instrument existed; nothing in the
framework's success definition made its reading a question the program
had to ask. The literature places this gate first: in a causal replay of
agentic search, structured presentation raised the target document's
citations per answer (+0.50, 95% CI [+0.20, +0.84]) but did not clearly
raise whether the document was cited at all (+4.5 points, CI
[−1.4, +10.4]); the setting was a single agent configuration with 113
matched document pairs (CITECHOICE, arXiv:2609.15164). Presentation
moves credit among documents already retrieved; whether a document is
retrieved comes before it.

**The accounting boundary with the sibling strategy was drawn on two
axes at once.** The author's personal-branding strategy (a local
repository) states its boundary with this one as "idea → LLM-mediated
channels" against "person → human audience" — payload and audience
together. That leaves one cell unowned: a person on machine channels,
which in practice meant planting records about the author in
machine-read authority records. When the program created such records
— about the author, the papers and the repositories — the host read the
aggregate as promotion of the author, revoked the account and deleted
them ([ADR-0021](0021-self-sovereign-entity-grounding.md)).

**Genre no longer selects a single reader.** [ADR-0022](0022-audience-layer-split.md)
routed doctrine artifacts to LLM-mediated readers and essays to
contemporary human readers. The author now writes READMEs and essays
for both readers at once — prose for people, folded detail for
machines (this repository's README is one instance) — and a person who
follows an essay link arrives at the same record an agent does.

**Most observed traffic shows that something arrived, not that the
idea was used.** In the program's daily traffic snapshots (raw counts,
computed 2026-10-11 from the hub repository's `traffic/data/*.jsonl`),
for the six repositories with records in 2026-04, clones outnumbered
page views 29.0 to 1 in 2026-04 (1,943 / 67) and 8.1 to 1 in 2026-09
(2,350 / 290). The hosting platform reports no origin for a clone, and
page views with a referrer became a meaningful share only from 2026-09,
alongside a human-facing campaign. A definition that counted every fetch
as success would be inflated by crawlers and trial reads.

## Decision

1. **Count a use that reaches the dated record as success.** The dated
   record is the concept-DOI deposit
   ([ADR-0001](0001-concept-doi-canonical.md)) or the repository whose
   commit history and archive identifier timestamp its content
   ([ADR-0013](0013-intrinsic-identifier-layer.md)). The reason is the
   object protected: the judgment, dated, that this was thought at this
   time. Which events count, and how strongly, is fixed by Decision 4.
2. **Record absorption with no route back as diffusion, not success.**
   An idea paraphrased from weights with no identifier, link or
   recoverable pointer is logged where it is observed; it does not
   count toward success, because nothing in it lets a reader verify the
   dated judgment.
3. **Observe the name; do not require it.** In retrieval, the record
   carries the name. In weights, a recalled name, coined term, project
   name or DOI is a pointer back to the record. Naming probes continue
   as observations; this decision asks no artifact to show or withhold
   the author's name.
4. **Judge arrival in two tiers, in one list.**
   - *Use with arrival (evidence):* an answer that cites an owned
     identifier — the DOI, the repository URL or the archive identifier
     (the boolean of ADR-0011) — for the idea; a derivative that links
     the record; an install that runs the component; a model that,
     without retrieval, recalls a pointer (the DOI, the project name, a
     coined term bound to the record) for the idea.
   - *Arrival proxy (observation):* clones, page views, referrers
     (including a person who follows a link), DOI resolutions, crawler
     fetches.
   Proxies are reported in the proxy tier. Evidence-tier events are
   recorded in the private implementation ledger of
   [ADR-0014](0014-implementation-tracking-two-tier-ledger.md), from the
   probe runs of ADR-0011 and from directly observed citations,
   derivatives and installs; the author reads them whenever the ledger
   is consulted. No review cadence is added (ADR-0014 sets none).
5. **State each strategy's owned question, and write the two to feed
   each other.** This strategy owns whether uses of the author's ideas
   reach the dated record, including admission into retrieval and the
   pointers left in weights. The personal-branding strategy owns
   whether the author as a person is known by, and related to, people.
   Its essays, profiles and announcements create routes and links by
   which people and search indexes reach the record; the dated record
   gives those acts substance to point to. One act can serve both; the
   strategy whose aim motivates an act records its effect, and an act
   that serves both is recorded in both ledgers. The boundary is stated
   as ownership; no act is assigned to either strategy by prohibition.

   > **Note (2026-10-12, [ADR-0025](0025-planning-and-task-state-in-a-public-rfc-store.md)):** The private
   > implementation ledger named in Decisions 4 and 5 is replaced by the
   > public `rfcs/` store. Evidence-tier events are recorded in the entry
   > of the instrument or channel concerned, with sensitive detail kept in
   > private notes. For an act that serves both strategies, an act this
   > program carries out is recorded in `rfcs/` and the implementation
   > log; a personal-branding act that leads to the record is read from
   > that strategy's own act log and is not copied.

   > **Note (2026-10-12, [ADR-0026](0026-one-public-act-log-across-strategies.md)):** Superseding the note
   > above and the sentence of this Decision that the strategy whose aim
   > motivates an act records its effect and that an act serving both is
   > recorded in both ledgers: every act is recorded once, in the shared
   > public act log (the implementation log), with the strategy that carried
   > it out. The personal-branding strategy moves its act records there
   > (RFC-0032). The owned questions above stand.
6. **Share one principle across strategies: content is decided by the
   author's thought; distribution may be optimized without changing
   content.** The principle is already the common line of the
   personal-branding strategy's layer table and of the essay corpus's
   content-integrity decision; this framework adopts it as the rule for
   placement, indexing and linking in its own artifacts.
7. **Supersede ADR-0022.** Routing genres to single audiences, and the
   clauses that rested on that routing, lapse:
   - its Decision 1 routing and the default that placed unnamed
     artifact classes in the doctrine layer;
   - its Decision 2 layer-scoped metrics, and Decision 6's accounting of
     the essay layer inside this framework;
   - its Decision 3 scoping of ADR-0007 clauses 1 and 3 by layer, and
     its Decision 4 narrowing of the thesis's audience demotion —
     ADR-0007 clause 1 now governs every artifact of this framework, and
     the thesis's audience paragraph is rewritten.
   Reception counts — reads, reactions and followers of essays and of
   the author as a person — are owned by the personal-branding strategy
   and the essay corpus. Arrival proxies (Decision 4) stay here.
8. **Retire `scripts/verify-layer-boundary.sh`.** The guard failed any
   doctrine text that named the essay corpus's accounting files or
   stated a reception count — a prohibition on mentioning numbers,
   stronger than the principle in Decision 6. Remove the script and its
   reference in `docs/maintenance.md`.
9. **Align the affected records.** Add dated notes to ADR-0007, ADR-0008,
   ADR-0009, ADR-0011, ADR-0015, ADR-0017, ADR-0019 and ADR-0023 under
   the passages this decision changes; set ADR-0022's Status to
   superseded; rewrite the thesis's protected-object section, its first
   and third axes, Layer 2, its audience paragraph, the Layer 3 sorting
   note and tactics 1 and 4; align the glossary entries and manifesto
   open questions 8 to 11; and bring the restating carriers into step
   (README pair, llms surfaces, graph, ADR index, adoption table,
   conformance tiers, tactic lifecycle, deposit metadata, changelog).
   The probe pre-registration of 2026-09 is not modified.

## Alternatives Considered

**Keep the signature as the success criterion.** Attractive because a
named author is the most legible form of credit and the probes already
measure it. Rejected: the name in an answer is set by the answer
engine's design, so the criterion tracks a variable the author cannot
move and scores much ordinary use as failure. (The unread console is a
separate failure of review cadence; it shows what the criterion did not
direct attention to, not that a criterion can replace an instrument.)

**Count every use as success, attributed or not.** Attractive because
the thesis's Layer 1 already names "the idea surviving diffusion as
thought" as its success criterion, and because the author's own
practice holds that ideas outlast code. Rejected by the author: an
idea used with no route back leaves nothing that verifies when it was
thought, so the dated judgment — the thing to protect — is not
protected. Layer 1 stays as the floor under content, not as the
operating criterion.

**Record the change with dated notes only.** Attractive because the
repository has no superseded ADR and prefers in-place notes. Rejected:
the change replaces the operating success criterion that the thesis,
eight ADRs, the glossary, the manifesto and the component skill each
restate, and notes scattered over those records would leave no single
record a reader could follow back.

**Supersede ADR-0022 in part.** Attractive because some of its content
is sound (the content bound in both layers, the safety guards). Rejected:
every clause of ADR-0022 rests on routing a genre to one reader, which
no longer describes the artifacts; the clauses that are sound already
live in their own records (ADR-0019, ADR-0021), so a partial supersede
would keep a retired frame alive to host them.

**Draw the boundary by audience and give the sibling strategy no
machine-facing acts.** Attractive because it gives a clean line.
Rejected: artifacts are written for both readers, so an audience line
cuts single acts in half, and a rule that one strategy may not act on
machine channels is a new prohibition for a zone that is genuinely
grey.

**Model the two strategies as one pipeline — machines first, people
after.** Attractive because people increasingly reach work through
answer engines. Rejected as the structure: most answers send no person
onward, so judging the machine stage by the human stage would bring the
name criterion back by another door. Routes are parallel, and the
tiers of Decision 4 judge each on its own evidence.

**Keep the boundary guard, or keep it as a warning.** Keeping it as it
stands was rejected because it would leave the old prohibition in
force as a machine gate. A warning-only form is **open — revisit when**
a reception count is found to have steered a release, deposit or
federation decision in this framework.

## Consequences

**Positive.**

- The success criterion points at what the author can act on: admission
  into retrieval, placement, and the pointers an artifact carries.
- An answer that cites an owned identifier without naming the author
  now reads as an arrival rather than a failure; the ghost-citation
  measurement of ADR-0011 is unchanged, and its reading changes.
- The boundary with the sibling strategy has no unowned cell, and the
  way the two strategies help each other is written down.
- One textual prohibition and its machine gate are gone.

**Negative.**

- Success is harder to observe. Evidence-tier arrivals are rare and
  slow, most of the data is proxy, a clone carries no origin, and an
  install that runs a component is not observable today; for a long
  stretch the honest reading may be "proxies only".
- ADR-0019's content bound loses its support from ADR-0007 everywhere,
  not only in the former essay layer: Decision 6 makes distribution a
  legitimate target across the framework, so the bound now stands on its
  Layer 1 ground alone and is leaned on harder.
- With the guard retired, nothing mechanical flags a reception count
  that drifts into this framework's text; open question 11, restated for
  two strategies that feed each other, rests on review.
- The 2026-08 defect ADR-0022 answered — a recognition-seeking motive
  with no ledger, which let stagnant human signals be read as purity —
  could return if the sibling strategy's ledger lapses. The motive now
  has an owner outside this framework; whether that owner keeps its
  ledger is outside this framework's control.
- ADR-0022 is reversed two months after acceptance; a reader must follow
  the supersede to learn what replaced it, and frequent reversals cost
  the framework legibility.
- A second record lags: the personal-branding strategy's boundary text,
  and its ADR that relies on ADR-0022's doctrine-layer default, still
  describe the old frame until that strategy's own session rewrites
  them. The rewrite belongs to that repository; this framework hands it
  a request and does not edit it.
- The retired script is restorable from git history.

**Revisit when.** An answer engine begins to show the author's name by
default for retrieved records (the name criterion would then cost
nothing to add back), or a reading of the ledger finds no evidence-tier
arrival recorded over two quarters of probe runs and observed citations
while the six-repository clone and view totals of the Context kept
growing (the tiers would then need a reachable evidence form).

> **Note (2026-10-12, [ADR-0025](0025-planning-and-task-state-in-a-public-rfc-store.md)):** "A reading of the
> ledger" now means a reading of the `rfcs/` entries for the instruments
> and channels concerned.

## Lineage

The decision came out of an exploration session on 2026-10-11. The
author observed that the framework's component skill mixed two aims —
whether authorship survives an AI citation, and how the work is found
and used by machines — and weighted the first. Four context-free agents
then argued the reorganization from the brief alone: an essence judge
recommended a minimal change, a defender of the current doctrine held
that a signature must travel with the use, a proponent proposed a
ledger of parallel exits, and a moderator reduced the disagreement to
one value question — whether unattributed absorption counts as
success. The author answered no, and added that the name is not
required but arrival at the DOI or the repository is: the judgment of
having thought this at this time is what must be protected. The
author then judged that the person-on-machines cell is not a well-posed
question, that the sibling strategy should not be barred from
machine-facing acts, and that the two strategies should be written to
feed each other. A cross-vendor review of the plan (a Codex agent on
gpt-6-astra) added the two-tier arrival judgment of Decision 4, the
retirement form of Decision 8, and the widening of the ADR-0007 notes
to its clauses 1, 2 and 4.

Grounding: CITECHOICE (arXiv:2609.15164) for the admission-before-
allocation order; Strauss et al. (arXiv:2508.00838) for answers given
without clickable citations; the implementation log's 2026-07-02
search-console entry and the 2026-10-01 audit; the hub repository's
daily traffic snapshots for the clone-to-view ratios. Both papers are
entered in [`inspiration.md`](../inspiration.md). The internal survey of every carrier this decision touches is
the plan's research report,
[docs/plans/research/2026-10-11-arrival-success-and-branding-boundary.md](../plans/research/2026-10-11-arrival-success-and-branding-boundary.md).

Relations:
- Supersedes ADR-0022 in full (Decision 7 lists what lapses; ADR-0022's
  Status lists what stands on its own records).
- [ADR-0007](0007-human-attention-signals-not-a-metric.md): restates
  clause 3; clause 1 governs every artifact again and admits page views
  and referrers as arrival proxies; clause 2 describes what this
  framework itself runs, with acts aimed at the author as a person
  governed by the personal-branding strategy's own rules; clause 4 is
  loosened by Decision 6 for placement, indexing and linking.
- [ADR-0008](0008-rag-era-attribution-diffusion.md): the
  ghost-citation rejection reason lapses; running both channels stands.
- [ADR-0009](0009-dual-entry-asymmetric-rebalance.md): entity
  resolution reads as resolution to the dated record.
- ADR-0011: the instrument and its lexicon are unchanged (no series
  break); the *owned identifier cited* cell reads as an arrival.
- [ADR-0015](0015-license-selection-by-audience.md): the
  ingest-audience test is unaffected.
- ADR-0017: the first failure mode becomes reach without a route back.
- [ADR-0019](0019-structural-optimization-vs-content-authenticity.md):
  the content bound stands on Layer 1 alone across the framework.
- [ADR-0023](0023-empirical-layer-role.md): arrival proxies are
  recorded under its reference-baseline minimum.
- Extends ADR-0001, ADR-0013 and ADR-0021, whose dated, self-sovereign
  records are what a use must reach.
