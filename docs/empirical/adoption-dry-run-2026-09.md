# Adoption Dry Run — the Action Path Applied to a Stranger's Manuscript

*Role: interpretive note.* A case study, marked as interpretation. On
2026-09-07 the author took the [adoption guide](../adoption.md) and
walked its five steps, on paper, against a repository the author has no
connection to, to see where the guide holds and where it breaks once
the framework's own voice is removed. Nothing was sent to the
repository's maintainer: no issue, no pull request, no contact. The
exercise is a held-out test of the guide's text, not of the target, and
it is the nearest thing to the external-adoption test that manifesto
[Open Question 5](../manifesto.md#open-question-5-where-is-the-line-between-the-framework-and-authorship-strategy-as-rhetoric)
asks for that one person can run alone. It is not that test: the
person walking the steps had written them.

## Target selection

The target was chosen by a search of the public git host on
2026-09-07 for repositories whose value is an articulated idea rather
than running code, filtered to: a single-person account, a README
describing an essay or framework, no license file, no citation
metadata, no stable identifier, and no prior contact with or mention
of this ecosystem. Several candidates matched; the one taken is a
working book manuscript — an essay on load-bearing representations,
draft 0.21 dated July 2026, ten chapters published as a static site
from the repository's `docs/` directory, a works-cited list without
resolvable identifiers, nine commits, no stars, no forks. It is named
here only as the public repository it is (`RoskiDeluge/durable-forms`)
so that the walk can be repeated; nothing below judges the manuscript,
and the maintainer's identity is not relevant to the note.

One near-miss is worth recording. The same search surfaced a personal
research site whose description said it was published agent-readable
with a navigator file and a JSON-LD graph. That is the framework's
Layer 4 ingest pair as a convergent practice in the wild, from an
author with no visible link to this ecosystem. It bears on Open
Question 5 — the tactic is adoptable without the doctrine — but it is
convergence, not derivation, and is recorded as such.

## The walk

Each step is rated **holds** (the guide's text was enough to act on),
**friction** (actionable, but only with knowledge the guide does not
supply), or **breaks** (the step cannot be taken, or contradicts the
guide's own promise, for this target).

### Who this is for — *friction*

The scope test has two halves. The first — value is the idea, not the
scaffold — is decidable from the repository: a manuscript is the idea,
the static-site configuration is scaffold. The second — the primary
audience reaches the work through LLM-mediated channels — is not a
property of the artifact but a belief about its audience, and the
guide gives the adopter no way to check it. For a book manuscript the
adopter most plausibly wants human readers. The guide's one sentence
on this ("if that description fits your work") asks the adopter to
already hold the thesis's Layer 2 stance before the walk begins. An
adopter who does not is routed out at the door without being told that
[ADR-0022](../adr/0022-audience-layer-split.md) gives human-first
prose a place inside the framework.

### The single-author caveat — *breaks*

The guide asks "if your work has multiple authors" and defers. The
target cannot answer the question from its own contents: the prose is
in the first-person plural, the commit history carries two git
identities of which one is unlinked to any account, and there is no
author statement anywhere in the repository. The framework's first
tactic (a registered identifier) will require an author name and,
ideally, a persistent author identifier, and the guide never says
"state who the author is" as a step. It is presupposed. For a target
with no metadata at all, the actual first action is one the guide does
not list.

### Step 1 — identify idea-rescue artifacts — *friction*

The sort is clear. What the guide does not say is the **granularity**
of "artifact": the book, or each chapter, or each coined concept? The
identifier tactic will register one thing; the knowledge-graph tactic
will want the concepts. The manuscript coins at least three terms
(a one-word portmanteau for its central construct with a four-letter
abbreviation, a "Structural Consequence Model", a "differential decay
thesis"), each definable in a sentence of existing vocabulary and each
anchored to a named prior source — the vocabulary discipline of
[ADR-0010](../adr/0010-vocabulary-discipline.md) is already being
practised here without the ADR. The guide says "per artifact, not per
author" and leaves the adopter to decide what an artifact is.

### Step 2 — the four-layer judgment — *breaks at Layer 2*

Layer 1 (authenticity) is a first-person question and cannot be walked
by a third party; the note records only that the manuscript's own
closing chapter states the ways its proposal fails, which is the
posture Layer 1 asks for. Layer 2 is where the walk stops: the guide
asks the adopter to "confirm your strategy is to maximize the breadth
of LLM-mediated channels ... not to maximize direct-browser attention
signals." A book author cannot honestly confirm that. The framework
has an answer — the audience-layer split routes human-first prose to
an essay layer where reception is a legitimate signal — but the
adoption guide surfaces it only as a parenthesis inside the
[ADR-0007](../adr/0007-human-attention-signals-not-a-metric.md) table
row, three sections later. A reader following the steps in order meets
the demand before the exemption.

### Step 3 — deploy the Layer 4 tactics

1. **Register a stable identifier — *breaks*.** The registry's git-host
   integration deposits on a tagged release; the target has draft
   numbers but no tags, which is fixable in one command. What is not
   fixable from the guide is that the deposit form requires a license,
   and the target has none. The framework has a license-selection rule
   ([ADR-0015](../adr/0015-license-selection-by-audience.md)) but the
   guide's tactic list and its ADR table both omit it. The deposit also
   requires the author name the previous section found missing.
2. **Intrinsic-identifier archival — *holds*.** The archive's
   save-request accepts any public repository with no account. The only
   gap is where to record the identifier; the citation-metadata file the
   first tactic creates is the place, so the order of tactics carries
   the answer.
3. **AI-facing ingest pair — *friction*.** A navigator file for a
   static site is a copy-and-edit task. The knowledge graph is not:
   this repository's own graph is the worked example the guide points
   to, and it is bound to this ecosystem's vocabulary namespace and hub.
   An adopter has to invent a namespace, decide which of the
   manuscript's concepts are nodes, and choose relation types, with the
   glossary as the only vocabulary. "Clone-and-copy" overstates it; the
   graph is clone-and-rewrite.
4. **Federate the citation graph — *friction, degenerate*.** The tactic
   assumes an ecosystem — sibling artifacts to declare relations among,
   a dataset platform to mirror to. For a single manuscript there are
   no siblings, the works-cited list has no identifiers to declare
   relations to, and mirroring a book to a dataset platform is a genre
   mismatch the framework itself addresses in
   [ADR-0016](../adr/0016-genre-split-placement.md), which the guide
   does not cite. The tactic reduces to "add resolvable identifiers to
   your citations", which is sound and is not what the guide says.
5. **Two-channel measurement — *breaks*.** Running the probe protocol
   means API credentials on several model providers, a scheduled
   runner, and a recurring spend. The guide's own expectation section
   says the path "is designed to require clone-and-copy, not signup,
   API keys, or bespoke infrastructure." Tactic 5 contradicts that
   sentence directly. An adopter who trusts the expectation will not
   budget for the tactic; one who reads the tactic will not trust the
   expectation.

The two cross-cutting disciplines hold. Vocabulary discipline is,
as noted, already practised by the target. Channel selection has no
occasion here.

### Step 4 — the ADR table — *breaks, then fixed*

The table stopped at ADR-0014. Nine decisions the walk needed —
license selection, genre placement, failure-mode diagnostics,
claim falsifiability, the optimization bound, derived-surface
onboarding, self-sovereign grounding, the audience split, the
empirical-layer role — had no adopter-action row. Two of them
(license, genre) were the direct cause of breaks above. The rows were
added to the guide in the same change as this note; the table is now
complete through ADR-0023.

### Step 5 — where to go next — *holds*

The conformance check and the implementations registry both exist and
both say what the guide says they say.

## What the walk is consistent with

As interpretation, bounded to this one target:

- **The guide presupposes an ecosystem.** Its tactics were extracted
  from several artifacts under one author with identifiers, siblings,
  a hub, and a measurement budget already in place. Applied to one
  bare manuscript, two tactics degenerate and one contradicts the
  guide's own promise. This is the single-author-normative caveat
  showing a second face: the framework is not only single-*author*
  normative but single-*ecosystem* normative, and the adoption guide
  inherits the second without naming it.
- **The prerequisites are missing, not the steps.** Every break traces
  to something the guide assumed the adopter had already done — named
  the author, chosen a license, decided what counts as an artifact,
  accepted the Layer 2 stance. A "Step 0" listing those, with the
  ADRs that already govern two of them, would have converted three
  breaks to friction.
- **The voice was not the problem.** Open Question 5 worries that the
  framework's tactics look adoptable only because its own articulation
  uses them. The walk found the opposite: the tactics that held (the
  archive request, the navigator file, vocabulary discipline) held
  because they are plain actions; the ones that broke did so for
  operational reasons a stranger would hit before the rhetoric could
  matter. Whether the rhetoric matters is still untested — that
  requires a stranger walking, not the author walking as a stranger.

## Limitations

- **The author walked it.** The person following the guide knew every
  unwritten prerequisite. The breaks recorded are those visible *even
  so*; a genuine outsider would find more, not fewer.
- **One target, one genre.** A manuscript is the friendliest case for
  Step 1 and the hardest for Layer 2. A tool-plus-idea repository would
  break in different places.
- **On paper only.** No action was taken on the target; steps rated
  *holds* are rated on the guide's text against the target's contents,
  not on a completed deployment.
- General limitations in the [empirical README](README.md#limitations)
  apply.
