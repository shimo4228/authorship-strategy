Language: English | [日本語](0007-human-attention-signals-not-a-metric.ja.md)

# ADR-0007: Human-Attention Platform Signals Are Not a Success Metric

> **Summary.** The framework does not treat platform-level human-attention
> signals — Git-host star counts and repository page-view counts — as
> optimization targets or success metrics, and it declines off-page
> human-distribution labor (backlink campaigns, community self-promotion)
> as a strategic activity. Two independent grounds: such signals are
> *gameable* (star counts are routinely purchased) and, for this program,
> *uninformative* (page-views are empirically near-zero and structurally
> blind to the LLM-mediated reach that is the framework's actual channel).
> This is not a claim that human reception is worthless; it is a claim that
> these particular signals do not measure it. Success continues to be
> measured by the breadth of LLM-mediated channels carrying the author's
> signature, consistent with the thesis's primary-audience definition and
> its scarcity → diffusion inversion.

## Status
accepted — scope amended by [ADR-0022](0022-audience-layer-split.md):
clause 1 (metric rejection) and the legibility-cost acceptance are
scoped to the doctrine layer; clause 3 (success metric) is restated
per layer; clauses 2 and 4 stand unchanged in both layers. The essay
layer carries its own audience and metrics.

## Date
2026-05-29

## Context

The thesis fixes the framework's primary audience as **LLM-mediated
channels** ([glossary](../glossary.md)) and its strategic target as the
*breadth of those channels carrying the author's signature* (Layer 2,
[Attribution Diffusion](../thesis.md)). Direct human readers were never the
primary audience. Even so, a recurring question surfaces at each release:
*should the program also cultivate direct human attention* — by improving
the human-facing README, chasing Git-host stars, or actively distributing
the work where humans gather? Without a normative decision, each cycle
re-litigates it.

Two observations resolve the question.

**The binding constraint on human arrival is off-page, and human arrival is
empirically ≈ 0.** Traffic data across the program's repositories
([`traffic/data/`](https://github.com/shimo4228/shimo4228/tree/main/traffic) in the
federation hub, ~37-day window, eight repositories) records, in unique
actors, **1,942 cloners against 116 page-viewers — a clone:view ratio of
roughly 16:1**, with the federation hub itself at 422:8 (1.9%). Clones are
overwhelmingly programmatic (CI, mirrors, dataset-ingest pipelines,
LLM/knowledge-graph crawlers); page-views are the human-ish signal, and
they are near-zero. In funnel terms, on-page quality (the README) acts only
*after* a human arrives; with arrivals ≈ 0, README quality cannot be the
binding constraint. The constraint sits upstream, at **off-page discovery /
distribution** (search ranking, backlinks, placement where humans already
are). Pursuing it is a *red-ocean* activity: unlike on-page work, which the
author completes unilaterally, off-page reach must be *earned from third
parties* and competed for, and it runs against the grain of the thesis's
de-emphasis of human-directed self-promotion (Layer 4 authenticity).

**The available human-attention signals are corrupted as metrics.** Two
distinct failure modes:

- **Star counts are gameable.** A Git-host star count can be purchased; it
  therefore measures budget or manipulation as readily as genuine
  reception. Optimizing it invites Goodhart's law — the metric improves
  while the thing it was meant to proxy does not.
- **Page-views are structurally blind to the program's actual channel.**
  A Git-host "view" counts only the repository page on that host. It does
  not count GitHub Pages views, search-result snippet reads, or — decisively
  — a human who learns of the work through an LLM's answer, which generates
  no view at all. The metric *under-counts the very audience the framework
  targets*. A near-zero view count is therefore compatible with substantial
  LLM-mediated human reach; the signal cannot distinguish the two.

This is the empirical and platform-level complement to
[ADR-0005](0005-readme-localization-audience-driven.md), which committed the
framework to *measurable audience* before investing in a locale mirror. The
same discipline applied here yields the opposite verdict for human-attention
metrics: the signal is either measurable-but-gamed (stars) or
genuine-but-unmeasurable (LLM-mediated reach), so neither qualifies as a
trustworthy commitment trigger.

## Decision

The framework adopts the following stance toward human-attention signals and
off-page human distribution:

1. **Platform human-attention metrics are not optimization targets or
   success signals.** Git-host star counts and repository page-view counts
   are excluded from the framework's definition of success and from any
   release or growth decision. They may be observed; they are not steered
   toward.
2. **Off-page human-distribution labor is not a strategic activity.** The
   framework does not run backlink campaigns or human-directed
   self-promotion as a means of growth, on the grounds that it is a
   red-ocean activity operating on a funnel whose top (human arrival) is
   ≈ 0 and whose pursuit conflicts with Layer 4 authenticity.
3. **The success metric remains LLM-mediated reach.** Breadth of
   LLM-mediated channels carrying the author's signature — machine
   ingestion, programmatic retrieval, knowledge-graph presence, and
   citation within LLM answers — is the operative measure, per the thesis's
   primary-audience definition.
4. **On-page human quality is maintained, but not as a growth lever.** The
   human-facing README is still kept correct, structurally sound, and
   fact-consistent with the machine surfaces (so the human who *does* arrive
   is served, and so the surfaces do not contradict one another). This is
   hygiene, not a distribution strategy.

The decision is **scoped to signals, not to humans.** It does not assert that
human reception is without value. Genuine human reach is pursued *through*
the LLM-mediated channel — humans who learn of the work via LLM answers are
within the target audience — and that reach is precisely what the rejected
platform metrics cannot see.

## Alternatives Considered

**Invest in off-page human distribution (backlinks, community posting,
social placement).** Rejected: it is red-ocean from the outset — reach must
be earned from third parties and competed for, not authored unilaterally —
and it operates on a funnel whose top is empirically ≈ 0, so the expected
return is both low and uncertain. It also runs against the thesis's
de-emphasis of human-directed self-promotion. High cost, uncertain return,
against the grain.

**Adopt star count as the program's success KPI.** Rejected: star counts are
purchasable and therefore measure budget or manipulation as readily as
reception. Steering by a gameable metric invites Goodhart distortion, where
the number rises without the underlying reception it was meant to proxy.

**Adopt page-views as the human-reception KPI.** Rejected: the metric is
structurally blind to the LLM-mediated channel the framework targets. A human
consuming the work through an LLM answer generates zero views; the KPI would
under-count the intended audience and mislead growth decisions toward the
near-empty direct-browser funnel.

**Leave the question implicit.** Rejected: absent a normative decision, the
"should we chase stars / post for visibility?" question recurs at every
release and is re-litigated from scratch. Recording the decision closes the
loop; the framework's emptiness clause already permits revisiting it should
the ecosystem change.

## Consequences

**Positive.**

- Effort is freed from a low-return, red-ocean activity and kept on the
  LLM-mediated channel, where the program already shows strong pickup
  (programmatic clones outnumber human views ~16:1).
- A corrupted KPI (star count) is removed from decision-making, eliminating a
  Goodhart vector.
- The stance is consistent with the thesis's scarcity → diffusion inversion:
  the framework does not compete for scarce human attention on platform
  terms; it diffuses through LLM-mediated channels instead.

**Negative.**

- The program will continue to display near-zero conventional
  human-engagement numbers. To an outside observer using stars or views as a
  proxy, the work may appear unnoticed even when LLM-mediated reach is
  substantial. The framework accepts this legibility cost.
- Declining the human-attention metrics without yet having an
  LLM-mediated-reach metric leaves a **measurement gap**: the channel the
  framework does value is currently not directly quantified. Closing that gap
  (an LLM-reach measure that platform analytics cannot provide) is left as
  future work.
- The decision is contingent on the current ecosystem. Were human attention
  to become strategically necessary — or were a trustworthy, non-gameable
  human-reception signal to emerge — this ADR would require revisiting. It is
  held lightly, per the framework's emptiness clause.

## Lineage

Originating observation: a 2026-05-29 session investigating traditional /
off-page SEO as a *complement* to the program's already-mature LLM-facing
channel. The investigation built a human-facing README authoring discipline
and then asked whether on-page work would move human attention. Traffic data
(federation hub `traffic/data/*.jsonl`, ~37-day window, eight repositories)
answered empirically: **1,942 unique cloners against 116 unique page-viewers
(~16:1)**, human arrival ≈ 0, establishing that the binding constraint on
human attention is off-page distribution — a red-ocean activity at odds with
the framework's stance. Combined with the independent observation that
Git-host star counts are purchasable, the author concluded that platform
human-attention signals are not worth treating as metrics. The decision was
articulated retroactively into this ADR; the README authoring discipline
built in the same session was retained as on-page hygiene (consequence 4),
not as a distribution lever.
