# Parametric Contrast — Autumn 2026 (result)

*Role: result of a contrast designed before the data, per
[ADR-0023](../adr/0023-empirical-layer-role.md) Decision 3. Reading: "no
transition observed", an outcome the pre-registration names, so the
reading is within its rules.*

This artifact reports the event run that the
[pre-registration](probe-preregistration-2026-09.md) (recorded
2026-09-07) was written for, and it is the last parametric run of the
program. The question it tests: does an eligible model, trained after
the ecosystem went public, recognize the ecosystem's concepts from its
weights alone, and does recognition of a concept come before naming its
author?

It is published on 2026-10-12, before the 2026-11-30 date in the
pre-registration's *Analysis and reporting* section. The Amendment of
2026-10-12, pushed before the run, ended the series after this run, so
no further eligible model can enter the window and waiting would add no
data.

## The run

| | |
|---|---|
| Run | `2026-10-12T02:45Z-parametric` (hub `probes/data/parametric.jsonl`, CC0) |
| Model | `claude-sonnet-5-5`, anthropic column, panel config v11 (series break from `claude-sonnet-5`) |
| Eligibility | written in the v11 header and the pre-registration Amendment before the run: cutoff Jun 2026; prior-generation zero baseline 2026-07-12; free default accepted by the author on Anthropic's statement and two press reports |
| Instrument | the eight probe templates of v10/v11 (byte-identical, `prompt_sha256`), detector v4, search suppressed, three repetitions per probe, `max_tokens` 1024 |
| Records | 24, of which 6 carry an empty-response error |
| Cost | about USD 0.15 (runner total) |

Only one eligible model existed on 2026-10-12. The GPT-6 family,
`gemini-3.8-flash` and `grok-4.7` all state training cutoffs before
2026-06-01 ([survey](../plans/research/2026-10-12-eligible-model-check.md)).

## Cells

A cell is positive on a boolean when at least two of three repetitions
carry it. The prior generation is `claude-sonnet-5`, run 2026-07-12.

| Probe | `project_named` | `author_named` | Prior generation `project_named` |
|---|---|---|---|
| `concept-akc` | negative (1/3) | negative (1/3) | negative (0/5) |
| `concept-aap` | negative (0/3) | negative (0/3) | negative (0/4) |
| `concept-ans` | negative (0/3) | negative (0/3) | negative (0/4) |
| `concept-inversion` | negative (0/3) | negative (0/3) | negative (0/4) |
| `concept-contemplative` | unreadable (3 empty responses) | unreadable | negative (0/4) |
| `author-identity` | negative (0/3) | negative (0/3) | negative (0/4) |
| `recommend-contemplative` | unreadable (3 empty responses) | unreadable | negative (0/4) |
| `control-fake` | negative (0/3) | negative (0/3) | negative (0/4) |

The control is clean, so no cell is set aside under Annex A.2. The two
unreadable cells are a different case the rules did not name: the model
spent the whole 1024-token output budget on reasoning and returned no
visible text in all three repetitions. They count neither for nor
against the claim.

## Reading under the pre-registered rules

- **R1 — not supported.** No concept cell is positive.
- **R2 — not applicable.** It reads the first positive cell; there is none.
- **Counts against (a) — not met.** It needs a positive cell.
- **Counts against (b) — not reached.** It needs two eligible families
  at zero; one family entered, and the series ended.
- **Neither — does not apply.** An eligible model entered the panel.

The reading is **"no transition observed"**: one eligible generation at
zero, which, as the pre-registration states, cannot separate
"unreachable" from "not yet".

## Observed outside the reading

In one repetition of `concept-akc` (the second), the model, with search
off, said it had a "vague, unverified recollection" of the Agent
Knowledge Cycle, listed its six phases in order (research, extract,
curate, promote, measure, maintain), and associated it with the GitHub
user shimo4228, while asking the reader to verify. The other two
repetitions did not. This is the first time any panel model produced the
concept and the author together from its weights. Under the cell rule
it is one repetition of three and does not change the reading. Had the
cell turned positive, the author's name would have arrived with the
concept, not after it, which is the pattern *Counts against (a)* names.

## Limits

- One model, one family, one run, three repetitions per probe; within-model
  variance is visible in `concept-akc` itself.
- Two of eight probes were unreadable because of the output budget, not
  the model's knowledge.
- The free-default condition rests on the author's acceptance of
  Anthropic's statement and press reports, not a logged-out check.
- Recognition is detected by deterministic string matching (detector v4);
  a paraphrased recognition without the project or author string scores 0.

## The series ends here

With this run the parametric channel ends, by the author's decision of
2026-10-12. The retrieval channel ended on 2026-10-01. All raw responses
from 2026-06-12 to 2026-10-12 stay in the hub's `probes/data/` (CC0) and
can be re-scored. The author's own reflection on the instrument is that a
temporary chat with search off would have answered the same question
with far less machinery, and that fewer probes would have sufficed.
