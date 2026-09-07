#!/usr/bin/env bash
#
# verify-layer-boundary.sh — guard the doctrine layer against essay-layer numbers.
#
# Why this exists: ADR-0022 splits the program's accounting into two audience
# layers and states a boundary clause — "essay-layer signals do not flow into
# doctrine-layer decisions." Manifesto open question 11 observes that a
# prohibition held by the same person who watches the numbers is a discipline,
# not a mechanism. This script is the mechanism: it does not judge whether a
# decision *was* steered by reception, which no grep can see, but it makes the
# two textual traces such steering leaves fail loudly:
#
#   1. SOURCE — a doctrine-layer file names the essay layer's accounting
#      sources (the per-article schedule, the metrics snapshots). Those files
#      are the essay layer's own instrument (ADR-0022 Decision 6, ADR-0014
#      amendment 2026-09-07) and have no legitimate reader in the doctrine
#      layer.
#   2. NUMBER — doctrine-layer prose states a reception count (a number next
#      to likes / reads / views / reactions / followers, in either language).
#      ADR-0007, ADR-0022 and the glossary legitimately *name* these nouns
#      while rejecting or scoping them; what they never do is quote a value.
#      Anchoring on number+noun keeps those definitional mentions out of the
#      finding set without an allowlist.
#
# Detection is code; the fix is a human judgment (move the passage to the
# empirical or essay layer, or supersede the boundary clause by ADR).
#
# Exit 0 = no essay-layer trace in the doctrine layer. Exit 1 = drift found.
set -euo pipefail
cd "$(dirname "$0")/.."

fail=0

# Doctrine-layer carriers: the normative documents plus the AI-facing and
# human-facing entry points that restate them. docs/empirical/ is out of
# scope by construction — it is the layer where observations belong.
DOCTRINE=()
while IFS= read -r _f; do DOCTRINE+=("$_f"); done < <(
  git ls-files 'docs/thesis*.md' 'docs/manifesto.md' 'docs/glossary*.md' \
    'docs/adr/*.md' 'README*.md' 'llms*.txt' 'CITATION.cff')

# Prose subset for the NUMBER check. llms-full.txt is excluded from this one
# check only: it concatenates the empirical traffic baseline, whose repository
# view/clone counts are ADR-0007's domain (rejected as a metric, still
# reported as baseline data), not essay-layer reception.
PROSE=()
for _f in "${DOCTRINE[@]}"; do
  [[ $_f == llms-full.txt ]] && continue
  PROSE+=("$_f")
done

# report LABEL FILE MATCH
report() {
  printf 'DRIFT  %-7s %s: %s\n' "$1" "$2" "$3"
  fail=1
}

# --- 1. SOURCE: essay-layer accounting sources named in the doctrine layer ---
SOURCE_RE='metrics/snapshots|snapshots\.jsonl|schedule\.json'
for f in "${DOCTRINE[@]}"; do
  while IFS= read -r m; do
    [[ -z $m ]] && continue
    report SOURCE "$f" "$m"
  done < <(/usr/bin/grep -nE "$SOURCE_RE" "$f" || true)
done

# --- 2. NUMBER: a reception count stated in doctrine prose ---
# Left context forbids a preceding letter/digit/dot/hyphen so that section
# labels ("A.3 Read the …") and identifiers do not match; the noun must be
# followed by a non-letter so "read" does not match "README". Case-sensitive:
# reception counts in prose are lowercase, headings are not.
NUMBER_RE='(^|[^0-9.A-Za-z-])[0-9][0-9,]*(\.[0-9]+)?[[:space:]]*(k|K|万|件|回)?[[:space:]]*(likes?|reads?|views?|reactions?|followers?|いいね|閲覧|リアクション|フォロワー)([^A-Za-z]|$)'
for f in "${PROSE[@]}"; do
  while IFS= read -r m; do
    [[ -z $m ]] && continue
    report NUMBER "$f" "$m"
  done < <(/usr/bin/grep -nE "$NUMBER_RE" "$f" || true)
done

if [[ $fail -eq 0 ]]; then
  printf 'verify-layer-boundary: OK — %s doctrine carriers, no essay-layer source or reception count.\n' \
    "${#DOCTRINE[@]}"
else
  printf '\nverify-layer-boundary: FAIL — an essay-layer trace is in the doctrine layer.\n'
  printf 'Move the passage to docs/empirical/ or the essay layer, or supersede\n'
  printf 'the ADR-0022 boundary clause by ADR. Do not silence the finding here.\n'
fi
exit $fail
