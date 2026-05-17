# Traffic Baseline (2026-05)

Preliminary baseline observation of the author's research ecosystem's
public traffic during the twenty-four-day window from 2026-04-21 to
2026-05-14 inclusive. Data source: the hub repository's CC0-published
JSONL collection ([raw data](https://github.com/shimo4228/shimo4228/tree/main/traffic),
[dashboard](https://shimo4228.github.io/shimo4228/traffic/dashboard/)).

For methodology, definitions, and limitations, see
[`README.md`](README.md). All numbers in this document are
*preliminary observations*; do not propagate as evidence.

## Per-repository cumulative traffic (24-day window, 2026-04-21 → 2026-05-14)

| Repository | Role | Clones | Unique cloners | Views | Unique viewers | Clone/View ratio |
|------------|------|-------:|---------------:|------:|---------------:|-----------------:|
| [`shimo4228`](https://github.com/shimo4228/shimo4228) | Federation hub | 348 | 181 | 3 | 2 | ~116 |
| [`agent-knowledge-cycle`](https://github.com/shimo4228/agent-knowledge-cycle) | AKC research line (mechanism) | 233 | 108 | 13 | 11 | ~18 |
| [`contemplative-agent`](https://github.com/shimo4228/contemplative-agent) | Contemplative Agent research line (implementation) | 1,140 | 404 | 31 | 20 | ~37 |
| [`agent-attribution-practice`](https://github.com/shimo4228/agent-attribution-practice) | AAP research line (practice) | 228 | 118 | 17 | 14 | ~13 |
| [`contemplative-agent-data`](https://github.com/shimo4228/contemplative-agent-data) | Live agent state (identity / knowledge / episodes) | 930 | 230 | 45 | 22 | ~21 |
| [`zenn-content`](https://github.com/shimo4228/zenn-content) | Long-form writing source | 438 | 178 | 8 | 8 | ~55 |

(Data extracted from the JSONL files on 2026-05-18; raw values are
direct cumulative sums of the `clones.count`, `clones.uniques`,
`views.count`, and `views.uniques` fields across all twenty-four daily
snapshots per repository.)

## Preliminary observations

The following observations are the author's notes on the patterns
visible in the table above. Each is framed as preliminary
observation; do not propagate as evidence.

### Observation 1 — Clone counts overwhelm view counts in every repository

Across all six repositories, clone counts are at least an order of
magnitude larger than view counts; the smallest ratio is approximately
13 (the Agent Attribution Practice research line) and the largest is
over 100 (the federation hub). The hub's extreme ratio is partly
explainable by the hub's character (a small metadata-only repository
that is rarely visited by human readers but is fetched by crawlers
following federation cross-references), but the pattern of
clone-dominant access holds across the substantive research lines as
well.

The pattern is *consistent with* the framework's Layer 2 claim that
LLM-mediated channels are now the primary access path for
DOI-registered research artifacts, and that direct-browser human
visits are a non-primary audience. The pattern is *not evidence for*
that claim, because the dataset cannot separate LLM-mediated access
from other clone-style access (training-pipeline ingest, AI assistant
context-fetch, dependency-management crawlers, search-engine
indexers, human CLI-based clones, automated CI ingestion).

### Observation 2 — Contemplative-agent and its live data repository jointly dominate clone volume

The contemplative-agent research line itself shows the highest
absolute clone count (1,140 over the window), and its paired live
data repository (the live agent's identity, knowledge, and episode
logs) is second-highest (930). Together they account for
approximately 56 percent of the ecosystem's total clone volume.

A possible interpretation: the contemplative agent's worked
implementation supplies the corpus that training-pipeline and
context-fetch consumers find useful, with the live data repository
serving as the most natural ingest target (it is updated daily and
contains operational data rather than only specifications). The
abstract-doctrine repositories (AKC, AAP) draw fewer clones, but
their clone counts are still in the hundreds — consistent with the
framework's *abstract-doctrine-plus-worked-implementation pair*
claim that the doctrine is reachable in tandem with, not
independent of, the implementation.

### Observation 3 — The two abstract-doctrine research lines have nearly identical clone counts

The Agent Knowledge Cycle research line (233 clones) and the Agent
Attribution Practice research line (228 clones) have nearly identical
clone counts over the window. They are also similar in unique-cloner
count (108 vs. 118), suggesting that the two lines reach similarly-sized
populations of distinct consumers. This is *consistent with* the
framework's prediction that abstract-doctrine repositories reach
their natural audience through cross-references in the federation
network, regardless of the specific doctrine's subject matter; but it
is also *consistent with* simpler explanations (the two lines were
created at similar times, are linked from the same hub, and have
similar README sizes).

### Observation 4 — The federation hub has the highest unique-cloner-to-unique-viewer ratio

The hub repository's 181 unique cloners against only 2 unique viewers
is the most extreme ratio in the ecosystem. The hub contains no
implementation, no ADR, no thesis — only the cross-reference
metadata that lets a crawler navigate to the substantive sibling
lines. The fact that crawlers reach the hub at scale while human
viewers do not is *consistent with* the framework's Layer 3
prediction that LLM-mediated channels are now the primary substrate
for traversing inter-artifact relationships; humans typically reach
the substantive lines directly without first visiting the hub, but
crawlers reach the hub (via its DOI federation metadata) and use it
as the entry point.

This observation is the closest the dataset comes to direct
evidence for any specific framework tactic. It is *suggestive*, but
the absence of pre-versus-post intervention contrast leaves
alternative explanations open (the hub may simply be more frequently
indexed by search engines for unrelated reasons; the dataset
does not separate search-engine indexing from training-pipeline
ingest from AI assistant context-fetch).

### Observation 5 — The writing source repository has high clones relative to its viewer count

The `zenn-content` repository (438 clones, 8 unique viewers over the
window) is a writing-source repository: its content is the markdown
source of essays that are published on an external blog platform.
Direct human readers typically read the published essays on the blog
platform, not the markdown source on the Git host. The high clone
count combined with very low viewer count is *consistent with* the
framework's Layer 2 claim that LLM-mediated channels reach the
markdown source for training and ingestion purposes, even when human
readers reach only the rendered output on the blog platform.

## Observations the dataset does NOT support

To make the limitations of the dataset explicit, the following
claims would be plausible-sounding but are *not* supported by this
baseline alone:

- "The JSON-LD knowledge graph increased LLM citation rates by X percent." (No pre-versus-post contrast available.)
- "Crawlers spend Y times more time on repositories with `llms.txt` than on repositories without." (No per-crawler time-on-site data available; no controlled comparison.)
- "Authors who adopt the cross-platform federation pattern see N times more clones than authors who do not." (Single-author dataset, no cross-author comparison.)
- "The framework's three-axis inversion is empirically validated by the observed clone distribution." (The dataset is consistent with the framework but also consistent with several alternative frames; observation is not validation.)

Any of these claims would require either a controlled experiment, a
multi-author dataset, or a sustained time series with explicit
intervention markers. Subsequent releases will work toward the
sustained time series; the multi-author dataset awaits replication
contributions from adopting authors.

## Reproducibility

The raw data and the dashboard generation code are CC0 in the hub
repository. Anyone wishing to reproduce the per-repository
aggregations in the table above can:

1. Clone the hub repository: `git clone https://github.com/shimo4228/shimo4228`
2. Read the JSONL files at `traffic/data/*.jsonl`
3. Sum the `clones.count`, `clones.uniques`, `views.count`, `views.uniques` fields per file over the date range of interest

The dashboard at `traffic/dashboard/` provides an interactive view of
the same data with additional derived metrics (co-traffic correlation
across repositories, time-series plots, referrer breakdowns). The
dashboard's source is also in the repository and is reproducible
locally.
