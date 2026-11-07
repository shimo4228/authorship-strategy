Language: English | [日本語](0013-intrinsic-identifier-layer.ja.md)

# ADR-0013: Intrinsic Content-Derived Identifiers as a Complementary Priority-Claim Layer

> **Summary.** The framework's Layer 4 anchors priority claims in a
> DOI layer — extrinsic, registry-dependent, metadata-bound. An
> extrinsic identifier cannot be verified against the artifact's
> content, and the DOI registry is its single point of failure.
> This ADR adds an intrinsic, content-derived identifier layer —
> SWHID (ISO/IEC 18670), computed from the artifact and its version
> history, verifiable without consulting any registry, at granularities
> from a repository snapshot down to a single line — to complement
> the DOI layer rather than replace it. The addition closes the
> manifesto's open question 4 (substitute priority-claim mechanism
> for DOI-impractical genres), covers the DOI layer's failure mode,
> and as a side effect opens a second parametric-channel ingest
> surface through archival in a content-addressed public software
> archive at zero marginal authoring cost.

## Status
accepted

## Date
2026-06-13

## Context

The identifier-federation triplet (ADRs 0001–0003) anchors the
framework's priority claim in a **DOI layer**. Each release of a
DOI-registered repository is archived on a DOI minting service,
producing a timestamped, citable record linked to the author's
persistent identifier and exposed to citation-graph ingestion
pipelines. Layer 4 tactic 2 designates DOI registration as the
program's primary priority-claim mechanism.

A DOI is an **extrinsic** identifier: an opaque name bound to a
metadata record by a registry. The identifier points to a deposited
record *about* the artifact, not to the artifact's content itself.
Resolution, verification, and persistence all depend on the
registry's continued operation. Nothing in the identifier allows
a reader to verify that the content they hold matches the content
the timestamp covers; the connection between identifier and content
passes through the registry as an intermediary that must be trusted.

The manifesto's open question 4 named the gap directly: the
framework advises DOI registration, but what is the substitute
priority-claim mechanism when DOI registration is impractical or
unconventional for the artifact's genre? Candidate mechanisms were
listed — software-archive identifiers, release tags on a Git
hosting platform, time-stamped public archives — but the question
was deferred to a subsequent release.

An **intrinsic** identifier is derived from the content itself:
a cryptographic hash computed over the artifact and its version
history graph. SWHID (standardized as ISO/IEC 18670 in 2025) is
such an identifier. Anyone holding the content can recompute the
identifier and verify the match without consulting any registry or
trusting any intermediary. SWHIDs exist at several granularities —
repository snapshot, release, revision, directory, and file content,
down to a single line — a precision no registry-issued identifier
offers.

A content-addressed public software archive operated as a non-profit
archives public version-control repositories and issues SWHIDs for
what it stores. Its archival timestamps constitute third-party
attestation of existence independent of both the author and the
Git hosting platform used as the canonical source. The same archive
is a direct ingest source for code-focused LLM training corpora, a
parametric-channel ingest surface (ADR-0008's terms) distinct from
crawls of the Git hosting platform; archival there extends diffusion
reach as a side effect of the priority-claim operation. On
2026-06-13 the author archived all 36 public repositories of the
program through the archive's on-demand save interface as an initial
bulk pass; snapshot identifiers were issued within the hour.

## Decision

Add an **intrinsic, content-derived identifier layer** — SWHID
(ISO/IEC 18670) — to the identifier federation, complementing the
DOI layer rather than replacing it. The two layers have a defined
division of labor: the DOI carries citability, rich metadata, and
registry-mediated scholarly discovery; the intrinsic identifier
carries content-verifiable, registry-independent existence proof.
Each covers the other's failure mode: if the registry disappears,
the intrinsic identifier still verifies; if the content is lost,
the DOI record still cites.

The release workflow integrates the new layer as follows:

1. After the release tag is pushed, submit an explicit archival
   request to a content-addressed public software archive rather
   than relying on its periodic crawl schedule. Explicit submission
   guarantees the snapshot covers the released state.

2. Retrieve the resulting snapshot identifier and record it
   alongside the DOI in the repository's citation metadata.

3. Treat the archival step as asynchronous; the archive may not
   complete the snapshot immediately, and the release workflow must
   not block on it.

4. For artifact genres where DOI registration is impractical or
   unconventional, designate the intrinsic identifier as the
   **substitute priority-claim mechanism**, closing the manifesto's
   open question 4 rather than deferring it further.

## Alternatives Considered

**DOI-only (status quo).** Continue with the existing identifier
federation without adding a content-derived layer. Rejected: the
priority claim inherits the registry's single point of failure;
the identifier cannot be verified against the artifact's content;
the manifesto's open question 4 remains open; and the
parametric-channel ingest surface available through the software
archive goes unused.

**Release tags and commit hashes on the Git hosting platform.**
Use the platform's release tags or commit hashes as the substitute
mechanism for DOI-impractical genres. Rejected: refs are mutable
and host-dependent — the host can vanish, enclose, or rewrite its
namespace; a hash without an independent archive carries no
temporal claim about *when* the content existed, because only the
author's local clock and the host's opaque timestamps stand behind
it; there is no third-party attestation of existence.

**General-purpose web page archives.** Use a service that captures
time-stamped snapshots of rendered web pages as the archival
mechanism. Rejected: these services archive rendered pages, not
version-control history; their identifiers are URLs rather than
content-derived hashes; and the granularity and verifiability they
offer for source artifacts are poor. A snapshot of a repository's
rendered landing page is not a verifiable record of its code.

**Self-managed cryptographic attestation (signed tags, published
checksums).** Generate and publish a signed tag or checksum under
the author's own key as the priority claim. Rejected:
self-attestation has no independent witness; verifying it requires
trusting the author's own key and clock, which is exactly what a
priority claim cannot assume. The claim is weaker, not stronger,
than the content's hash held by an independent party.

## Consequences

**Positive.**

- The priority claim no longer has a single point of failure:
  content-derived identifiers remain verifiable from the content
  alone even if the DOI registry or the Git hosting platform
  disappears.
- The manifesto's open question 4 is closed: artifact genres for
  which DOI registration is impractical or unconventional now have
  a designated substitute priority-claim mechanism.
- A second parametric-channel ingest surface opens at zero marginal
  authoring cost: code-focused LLM training corpora that source
  from the archive ingest the program's artifacts directly.
- Citation granularity improves: an intrinsic identifier can pin a
  directory, a file, or a single line — a precision a DOI cannot
  offer.
- Marginal cost per release is one explicit archival request.

**Negative.**

- One more identifier per artifact must be recorded and federated;
  citation metadata maintenance grows accordingly.
- The archive's on-demand save interface rate-limits anonymous
  requests, so bulk operations and busy release days must tolerate
  deferred completion; the release workflow treats the archival step
  as asynchronous and does not block on it.
- An intrinsic identifier proves *what* content existed *when* — it
  carries no authorship semantics. Authorship is still established
  by the DOI and ORCID layer; the intrinsic layer must not be
  over-claimed as an authorship proof.
- The release workflow takes on a standing obligation to submit
  explicit archival requests at each release; relying on the
  archive's periodic crawl schedule is insufficient to guarantee
  the snapshot covers the released state.

## Lineage

Originating question: the manifesto's open question 4 (substitute
priority-claim mechanism for DOI-impractical genres), which named
software-archive identifiers as a candidate and deferred the answer
to a subsequent release. Trigger: a 2026-06-13 diffusion-channel
review identified the software-archive layer as the highest-priority
unexploited channel; the same day, all 36 public repositories of the
program were bulk-archived through the archive's on-demand save
interface — anonymous rate limit: 10 requests per hour, handled by
a deferred queue — and the first snapshot identifiers were issued
within the hour.

Specific instances abstracted out of the body: the archive is a
UNESCO-backed non-profit universal source-code archive; SWHID was
standardized as ISO/IEC 18670 on 2025-04-23; a major open
code-model training corpus announced in 2024 sources directly from
this archive, constituting the parametric-channel ingest surface the
body references. The release-time operational procedure — which
service to call and how to retrieve the snapshot identifier — lives
in the release-doi component skill, keeping the vendor instance out
of this ADR per repo convention.
