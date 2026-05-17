# Empirical Layer

The empirical layer reports preliminary observations from the author's
own DOI-registered research ecosystem. The intent is to provide a
reference baseline against which subsequent releases — and adopting
authors — can interpret their own observations. All claims in this
layer are framed as **preliminary observation**, not as evidence.

## What "preliminary observation" means here

The empirical layer is *not* designed as an experiment. There is no
pre-versus-post intervention contrast, no controlled comparison, no
multi-author replication. The layer reports what the ecosystem looks
like on a specific date, what patterns the author has noticed, and
what limitations make the patterns difficult to elevate from
*observation* to *evidence*.

A reader looking for evidence that the framework's tactics work as
described should read the empirical layer as a *case study with
explicit limitations*, not as a quantitative validation. Subsequent
releases may add experiment-style sections as longer time series
accumulate and as adopting authors contribute replication data.

## Method

The empirical layer draws on traffic data published under CC0 license
by the federation hub of the author's research ecosystem
([`shimo4228/shimo4228`](https://github.com/shimo4228/shimo4228)). The
data is collected automatically once per day from each repository's
hosting-platform Insights API, stored as JSONL, and exposed through
a public dashboard ([raw data](https://github.com/shimo4228/shimo4228/tree/main/traffic),
[dashboard](https://shimo4228.github.io/shimo4228/traffic/dashboard/)).

The metrics collected per repository per day:

- `clones.count` — total clone events
- `clones.uniques` — unique cloners (deduplicated by source IP)
- `views.count` — total page views
- `views.uniques` — unique viewers (deduplicated by source IP)

The hosting-platform Insights API has known limitations: source IP is
the only deduplication signal (so a single cloner accessing from
multiple IPs is counted multiple times); the API surfaces clones and
views only for the past fourteen days at any given time (so the
ecosystem's persisted record is built by daily collection over time);
view counts depend on browser-side JavaScript and are not collected
for non-browser clients (so the view/clone ratio underestimates true
human-mediated access).

## Limitations

The following limitations are load-bearing and should be carried
forward by any reader interpreting the data.

### N=1 author, four repositories, twenty-four days

The full ecosystem at the time of this release consists of four
DOI-registered sibling research lines plus a federation hub plus two
supporting repositories (a writing source repository and a
contemplative-agent live data repository), all maintained by one
author. The dataset covers the period from 2026-04-21 to 2026-05-14
inclusive — twenty-four daily snapshots. Generalizations across
authors, ecosystems, or longer time periods are not supported by the
dataset and should not be inferred.

### No pre-versus-post intervention comparison

Several of the framework's tactics (the JSON-LD knowledge graph
deployment, the Answer.AI `llms.txt` convention adoption, the
cross-platform Hugging Face Dataset federation) were deployed before
the data window begins. The dataset therefore observes the *steady
state* after the interventions are in place, not the *contrast*
between pre- and post-intervention behavior. Claims of the form "the
JSON-LD knowledge graph increased clone counts by X percent" cannot
be made from this dataset.

### Crawler and automation dominance in clone signal

The view/clone ratio across the ecosystem ranges from approximately
13 to over 100, with the federation hub at the high end. Direct
human browsing is a small fraction of total access; clones are
dominated by automated tools (training-pipeline ingest, AI assistant
context-fetch, dependency-management crawlers, search-engine
indexers). The dataset cannot separate these categories from each
other or from human cloners using the Git host's CLI directly.

### Single-window LLM regurgitation tests

The author has, on three occasions in May 2026, performed
regurgitation tests against three frontier LLMs (ChatGPT, Qwen-class,
Gemini-class) to check whether the ecosystem's distinctive
terminology is recognized and whether responses cite the author. The
tests were not designed as repeatable experiments and the LLMs'
behavior drifts release-to-release, so the test results function as
*single-point evidence* of LLM-mediated reach, not as a sustained
measurement. Subsequent releases may institute a structured
regurgitation-test protocol if the methodological problems can be
addressed.

## What the layer contains

- **[`traffic-baseline-2026-05.md`](traffic-baseline-2026-05.md)** — the per-repository baseline summary for the twenty-four-day data window. Cumulative clones, unique cloners, views, unique viewers, and clone/view ratio per repository, with brief interpretive notes flagging the cross-repository patterns the author finds noteworthy.

The layer is intentionally small at v0.1.0. Subsequent releases will
add: pre-versus-post intervention contrasts where the data permits;
sustained regurgitation test protocols; cross-author replication data
contributed by adopting authors; and (if the dataset reaches a size
where statistical inference is appropriate) more formal statistical
analyses.

## How to contribute replication data

Adopting authors who run a DOI-registered research ecosystem of their
own are invited to share traffic data and observations through pull
request or issue on this repository. Acceptable replication data
includes: aggregated per-repository traffic statistics over a stated
time window; descriptions of the framework's tactics that have been
adopted and how; observed contrasts in audience composition,
regurgitation behavior, or citation network development. Contributed
data does not have to be CC0-licensed; the author will record the
provenance and license terms with the contribution.
