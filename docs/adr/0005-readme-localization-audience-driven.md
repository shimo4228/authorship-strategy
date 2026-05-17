Language: English | [日本語](0005-readme-localization-audience-driven.ja.md)

# ADR-0005: README Localization Policy — Audience-Driven Maintenance

> **Summary.** Locale mirrors of human-facing documentation (README files
> and equivalent landing-page content) are added or retired based on
> observed traffic data, not on speculation about prospective audiences.
> A mirror with no measurable direct human audience is retired even when
> the language community might *seem* important in the abstract.

## Status
accepted

## Date
2026-05-18

## Context

A repository hosting a project of broad potential interest is a frequent
candidate for README localization: maintainers reason about audiences in
multiple language communities and produce locale-mirror README files
(`README.zh-CN.md`, `README.pt-BR.md`, etc.) to make the project
accessible to those communities.

Each locale mirror has a maintenance cost. When the canonical README is
edited — a new feature, a new ADR, a sibling-line reference — each
mirror must be edited in parallel to remain accurate. Drift between the
canonical README and a stale mirror produces a worse outcome than
having no mirror: a reader in the mirror's language sees content the
canonical README has superseded and may rely on it.

In an LLM-mediated diffusion context, the localization calculation has
an additional consideration: LLM-mediated audiences (LLM training
pipelines, LLM-mediated user queries) do not require locale mirrors.
LLMs read the canonical (typically English) source and respond in the
user's language. The *user* experience is locale-appropriate; the
*ingestion* is locale-independent. Locale mirrors therefore serve only
the *direct browser* audience — the readers who arrive at the
repository via a direct URL, not via an LLM-mediated path.

Whether the direct-browser audience in a given language community
justifies the per-mirror maintenance cost is an empirical question. A
priori reasoning ("the language community is large, so the audience
must be substantial") is unreliable because the *direct-browser* audience
in any specific repository may not match the size of the language
community at all.

## Decision

Locale mirrors of human-facing landing-page documentation are added or
retired based on observed direct-browser traffic, measured over a
sustained period (at least thirty days), against the maintenance cost
the mirror imposes on each edit of the canonical document.

### Decision criteria

The default decision is **no mirror beyond the author's primary working
languages**. A mirror is added only when both of the following hold:

1. **Evidence of direct-browser audience**: the repository's traffic data
   (or a comparable signal) shows that direct human visits would
   plausibly include readers preferring the proposed mirror language.
   "Plausibly" is interpreted strictly: a non-trivial number of unique
   human viewers (not unique cloners, which are dominated by automated
   tools), sustained over the measurement window.
2. **Sustained maintenance commitment**: the author commits to keeping
   the mirror in sync with the canonical document on every subsequent
   edit, indefinitely. The commitment is not "translate now"; it is
   "translate and continue translating."

A mirror is retired when either of the following holds:

1. **Absence of direct-browser audience**: thirty or more days of
   traffic data show statistically zero direct human visits from
   readers preferring the mirror's language.
2. **Loss of maintenance commitment**: the author has stopped editing
   the mirror in parallel with the canonical document, and the drift
   between them exceeds a small number of edits.

### Application discipline

The author's discipline for maintaining the localization decision:

1. On creating a new repository, the README is created in the author's
   primary working language(s). For the present author, this is English
   and Japanese; for other authors it will be the small set of
   languages in which the author can sustain parallel editing.
2. Locale mirror requests (whether external requests or the author's
   own speculation) are deferred until evidence of direct-browser
   audience exists.
3. When a locale mirror exists but the traffic data shows no
   direct-browser audience after a sustained measurement window, the
   mirror is retired via hard deletion. The repository's version
   control retains the historical content; future restoration is
   mechanical if audience evidence later emerges.
4. The retirement is documented in the changelog so the decision is
   discoverable to subsequent readers (and to the author's future
   self, who may otherwise wonder why the mirror does not exist).

## Alternatives Considered

**Maintain mirrors for all major language communities.** Rejected: the
per-mirror maintenance cost scales linearly with the number of
mirrors, and a single edit of the canonical document requires *N+1*
file edits in an *N*-mirror configuration. For frequent-edit
repositories, this dominates the project's documentation maintenance
budget without commensurate audience benefit. The author's specific
experience: a five-mirror configuration multiplied per-feature
documentation work approximately sixfold against a measured audience
of statistically zero direct human viewers per mirror.

**Maintain mirrors only at major release boundaries.** Rejected: a
mirror that lags the canonical document by an entire release cycle is
worse than no mirror, because readers in the mirror's language see
content the canonical document has superseded. The *worse than no
mirror* threshold for drift is small; "translate at release boundaries"
exceeds it routinely.

**Use machine translation for mirrors, edited only when the canonical
document changes substantially.** Rejected (with hesitation): machine
translation has improved markedly and may eventually be the right
substrate for locale mirrors. The current concern is that machine
translation produces fluent output without verifying technical
accuracy; for documentation that includes coined terminology, code
samples, and specific URL paths, the verification cost approaches the
parallel-editing cost. A subsequent ADR may revisit this when machine
translation can be trusted on technical content.

**Make the canonical document multilingual within a single file (e.g.,
side-by-side English and Japanese paragraphs).** Rejected: this scales
poorly beyond two languages, reduces readability for each language's
reader (who is asked to skip past unfamiliar passages), and produces
files that are awkward for both human readers and automated tooling.
The two-language pair (canonical + one parallel mirror) is the
sustainable form; beyond two, the cost-benefit collapses.

## Consequences

**Positive.**

- Documentation maintenance cost is bounded to the author's primary
  working languages, freeing time for substantive content work.
- Drift risk is minimized: parallel editing of two languages is
  sustainable in practice; parallel editing of five or six is not.
- The decision criteria are *evidence-based*: a future request for a
  new mirror can be evaluated against traffic data rather than
  arbitrated by author preference.

**Negative.**

- A reader in a language community without a mirror has no
  direct-browser path to the documentation. (The LLM-mediated path
  remains: the reader's LLM will translate the canonical document on
  demand.) The framework treats this as acceptable given the
  observation that direct-browser audiences in mirror languages are
  typically much smaller than the corresponding language community
  size.
- A retired mirror produces 404 responses for readers who had
  bookmarked it. The framework treats this as acceptable given the
  same audience-evidence concern; readers in the mirror's language
  who had bookmarked it would, by assumption, appear in the traffic
  data as direct human visits, and their absence is what triggered
  retirement.
- The decision depends on traffic-data availability. Repositories on
  hosting platforms that do not surface traffic data (or that
  surface it in unstable ways) cannot apply the discipline as-stated;
  those repositories must substitute a different audience signal or
  default to mirror-free.

## Lineage

Originating observation: in May 2026, the author audited thirty days of
traffic data across a five-locale-mirror README configuration spanning
four sibling research repositories. The audit found that the
direct-browser audience for each non-primary mirror was *statistically
zero unique human viewers* — single-digit at best, against per-mirror
clone counts in the hundreds (clones being dominated by automated
tools, LLM training pipelines, and AI assistant context-fetch). The
maintenance cost per canonical-README edit was approximately
sixfold (one canonical edit plus five mirror edits, with cross-linguistic
quality verification overhead on each mirror).

The retirement decision was made deliberately and the four
non-primary mirrors were hard-deleted, with version control retaining
the historical content for potential future restoration. The
restoration mechanism is documented in the changelog of the retiring
release.

The decision generalizes the approach into a standing policy: locale
mirrors are an evidence-driven addition, not a default; the absence of
evidence is sufficient grounds to remain mirror-free or to retire an
existing mirror.
