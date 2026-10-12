# Admission Readings (from 2026-10)

*Role: baseline data (dated console readings), per
[ADR-0023](../adr/0023-empirical-layer-role.md).*

This file records, once a month, what two search engines' own consoles
report about the federation hub
([`shimo4228.github.io/shimo4228/`](https://shimo4228.github.io/shimo4228/)):
how many of its pages are in the index, whether the sitemap was read,
and whether an AI answer system cited a hub page. A second table splits
where visitors to the author's repositories came from.
[ADR-0024](../adr/0024-success-as-arrival-at-the-dated-record.md) places
admission to an index before any arrival at the dated record; these
readings are the dated record of that admission step. They make no
effect claim. The acts that requested indexing are rows in the
[implementation log](implementation-log.md) (A-0031 to A-0033, 2026-10-12);
the readings sit beside those dates and do not contrast before with
after.

## What is read

| Console | Report | Reading |
|---|---|---|
| Google Search Console, property `https://shimo4228.github.io/shimo4228/` | Page indexing | indexed URLs; not-indexed URLs; the report's own last-updated date |
| Google Search Console | Sitemaps | status and last read date of `/shimo4228/sitemap.xml` |
| Bing Webmaster Tools, same site | Site Explorer | indexed URLs |
| Bing Webmaster Tools | Sitemaps | status, last crawl date, URLs discovered |
| Bing Webmaster Tools | AI Performance | total citations and cited pages over the trailing window; grounding queries, listed when there are any |

The sitemap lists 27 URLs. Readings are taken read-only, by the author or
by a session reading the author's consoles, at the start of each month
together with the probe panel's currency check. A grounding query is
copied here only when it carries no personal data.

## Readings

| Date | Google indexed / not indexed (report date) | Google sitemap | Bing indexed | Bing sitemap | Bing AI citations (window) | Note |
|---|---|---|---|---|---|---|
| 2026-10-12 | 4 / 0 (2026-10-04) | could not be read; last attempt 2026-10-01 | 5 | read 2026-07-04, 26 URLs discovered | 0 (2026-07-12 to 2026-10-09) | taken before the indexing requests of the same day |

On 2026-10-12 the four Google-indexed URLs were the hub top page (last
crawled 2026-07-02), `/concepts/`, `/vocab` and one concept page (all
three crawled 2026-10-01). Other concept pages were not known to Google
at all ("URL is unknown to Google", no referring sitemap or page),
although `/concepts/` links to each of them.

## Arrival proxies: referrers

The same monthly reading also splits where human visitors to the
author's repositories came from, an arrival proxy in ADR-0024's terms.
The federation hub's CI stores each repository's rolling 14-day
referrer list every day (`traffic/referrers/<repo>.jsonl`, from
2026-10-11). Daily snapshots overlap, so a reading takes the latest
snapshot on or before its date and the latest one at least 14 days
earlier, and sums visit counts over all repositories into four buckets:
AI answer engines (an explicit domain list), search engines, `github.com`
itself (the author's profile, other repositories and GitHub search mixed
together), and every other referrer. The hub's
`scripts/referrer_split.py` holds the bucket rules and produces the row.

| Date | Windows | AI answer engines (top) | Search engines (top) | github.com | Other (top) | Total | Note |
|---|---|---|---|---|---|---|---|
| 2026-10-12 | 2026-09-28 to 2026-10-11 | 2 (chatgpt.com 2) | 34 (Google 27, Bing 4, search.brave.com 1) | 317 | 42 (t.co 39, mods.aidojo.si 2, maxpertise.net 1) | 395 | 25 repositories; one window only, the series starts 2026-10-11 |

## Limitations

- **The engines' own reports.** Each number is what one console states
  about its own index. The consoles lag: the Google report read on
  2026-10-12 was last updated 2026-10-04. Bing labels its AI Performance
  data a sample of overall activity.
- **Two engines, one answer surface.** Bing's AI Performance covers
  Microsoft's assistants and named partners. Answer systems that draw on
  other indexes leave no trace here.
- **The hub only.** The line repositories on the code host and their DOI
  records are outside both properties.
- **No contrast.** A change after an indexing request is consistent with
  the request and with everything else that happened in the interval
  (crawl schedules, links from elsewhere). One site, one author.
- **Referrers are the top entries only, and only clicks.** The Traffic
  API returns each repository's top referrers, so rare sources drop out.
  A referrer appears only when a person follows a link; an AI answer
  that names a repository without a link leaves no referrer. Counts are
  visits, not people: `uniques` are deduplicated per repository and
  window, so they are not summed.
- **Google's sitemap failure is not explained here.** The site served
  the sitemap with HTTP 200 and `application/xml`, every listed page
  returned 200 without `noindex`, and Bing read the same file; why
  Google did not is not observable from outside its console.
