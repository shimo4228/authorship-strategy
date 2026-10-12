# Plugin Usage Readings (from 2026-10)

*Role: baseline data (dated console readings), per
[ADR-0023](../adr/0023-empirical-layer-role.md).*

Two of the author's repositories are listed in Anthropic's Claude plugin
directory: [`akc-cycle`](https://github.com/shimo4228/akc-cycle) (listed
in Claude Code, Cowork and the Claude apps) and
[`harness-scope`](https://github.com/shimo4228/harness-scope) (listed in
Claude Code). The directory's owner console reports installs and use per
plugin. It is the program's only first-party count of use. This file
records it once a month.

An install is a use of the scaffold, not of the idea: a skill can be
installed, loaded and run without the reader meeting the concept it
implements or its dated record. The readings are kept apart from the
admission readings ([`admission-readings.md`](admission-readings.md))
and make no claim about ideas reaching the record
([ADR-0024](../adr/0024-success-as-arrival-at-the-dated-record.md)).

## What is read

From each plugin's Usage tab in the owner console, period "30 days":
installs and installer accounts (all time), active accounts (28 days),
uses and the sessions in which the plugin was loaded (30 days),
uninstalls, plugin loads and load errors (30 days), and the per-component
usage table when the console shows one. The console states a data-through
date; it is copied with each row. Readings are taken read-only, by the
author or by a session reading the author's console, at the start of each
month together with the admission readings.

## Readings

| Date | Plugin | Data through | Installs / installers (all time) | Active accounts (28 d) | Uses / sessions (30 d) | Uninstalls | Loads (errors), 30 d | Note |
|---|---|---|---|---|---|---|---|---|
| 2026-10-12 | akc-cycle | 2026-10-10 | 268 / 266 | 3 | 3 / 3,490 | 0 | 5,389 (0) | installs by path (30 d): Claude.ai plugin page 148, Cowork browse 76; 125 Claude Code accounts reached by sync; no component row shown |
| 2026-10-12 | harness-scope | 2026-10-10 | 209 / 209 | 0 | 0 / 7,043 | 0 | 9,800 (0) | installs by path (30 d): Claude.ai plugin page 94, Cowork browse 63, Claude Code desktop browse 51; 115 Claude Code accounts reached by sync; no component row shown |

## Limitations

- **The vendor's own report.** Every number is what the directory's
  console states; definitions (what counts as a use, a session, an active
  account) are the console's. Metrics are computed once a day and lag by
  about two days.
- **Small rows are hidden.** The console leaves out any breakdown row
  (surface, path, component, retention window) with fewer than 50 events
  in the period; totals still count everything. Per-skill use stays
  invisible while use is this low.
- **Installs without use.** Both plugins were loaded in thousands of
  sessions with almost no recorded use. The console does not say why;
  sync from one surface to another installs without a person choosing
  the plugin there.
- **The listing funnel reads zero.** On 2026-10-12 the console showed 0
  listing views and 0 install clicks against hundreds of installs; the
  funnel and the install count are not reconciled here.
- **One author, two plugins, no contrast.** Nothing here compares a
  listed plugin with an unlisted one or a before with an after.
