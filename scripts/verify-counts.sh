#!/usr/bin/env bash
#
# verify-counts.sh — guard aggregate counts against filesystem reality.
#
# Why this exists: aggregate counts (the ADR total, the open-question total)
# are restated in prose across many carriers — README, thesis, llms.txt,
# graph.jsonld, CODEMAPS, the deposit metadata, and so on. Prose cannot be
# rewritten as pointers without wrecking readability, so the CLAUDE.md
# numeric-claim rule applies its second clause instead:
#
#   "集約カウントの正本は 1 箇所（他はポインタ）。機械検証可能な
#    doc↔実体対応は prose 修正でなくテストで固定する（検出は code、
#    削除判断は人間）。"
#
# The FILESYSTEM is the single source of truth for these counts. Prose
# carriers may state the number, but THIS SCRIPT is the single enforcement
# point that they still agree with reality. It detects drift (code); a human
# decides the fix. Run it in the release-doi Phase 4 verify step.
#
# Exit 0 = every carrier agrees with the filesystem. Exit 1 = drift found.
set -euo pipefail
cd "$(dirname "$0")/.."

# English number words for 0..40 (index = value). Digit forms are accepted
# alongside the word form, so "20 ADRs" and "twenty ADRs" are both correct.
# The range comfortably exceeds the guarded counts (ADR total, open-question
# total) for many release cycles; the lookup in check_noun is additionally
# bounds-guarded so a count beyond this range degrades to digit-only checking
# rather than crashing under `set -u`.
WORDS=(zero one two three four five six seven eight nine ten eleven twelve \
  thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty \
  twenty-one twenty-two twenty-three twenty-four twenty-five twenty-six \
  twenty-seven twenty-eight twenty-nine thirty thirty-one thirty-two \
  thirty-three thirty-four thirty-five thirty-six thirty-seven thirty-eight \
  thirty-nine forty)

# Every recognized number token, longest-first so ERE leftmost-longest picks
# "twenty-four" over "twenty" and "thirty-one" over "thirty".
NUM='twenty-one|twenty-two|twenty-three|twenty-four|twenty-five|twenty-six|twenty-seven|twenty-eight|twenty-nine|thirty-one|thirty-two|thirty-three|thirty-four|thirty-five|thirty-six|thirty-seven|thirty-eight|thirty-nine|thirteen|fourteen|fifteen|sixteen|seventeen|eighteen|nineteen|eleven|twelve|twenty|thirty|forty|three|seven|eight|four|five|nine|zero|one|two|six|ten|[0-9]+'

# Carriers to guard. CHANGELOG.md and the individual ADR files legitimately
# name historical / sub-cluster counts (e.g. "four ADRs since v0.7.0",
# "three decisions"), so they are excluded.
FILES=()
while IFS= read -r _f; do FILES+=("$_f"); done < <(
  git ls-files '*.md' '*.txt' '*.cff' '*.json' '*.jsonld' \
    | grep -vE '^CHANGELOG\.md$' \
    | grep -vE '^docs/adr/[0-9]')

fail=0

# is_number TOKEN -> 0 if TOKEN is a recognized number word or an integer.
is_number() {
  local t=$1
  [[ $t =~ ^[0-9]+$ ]] && return 0
  local w
  for w in "${WORDS[@]}"; do [[ $t == "$w" ]] && return 0; done
  return 1
}

# check_noun EXPECTED_INT "human label" NOUN_REGEX...
# For every guarded file, find "<number><sep><noun>" and flag any leading
# number token that is neither the expected word nor the expected digit.
check_noun() {
  local expected=$1 label=$2; shift 2
  # Bounds-guard the word lookup: under `set -u`, indexing an unassigned array
  # slot aborts the script. Beyond the WORDS range we fall back to a sentinel
  # that never matches a real token, so digit-form carriers still validate.
  local digit=$expected word='__out_of_range__'
  (( expected >= 0 && expected < ${#WORDS[@]} )) && word=${WORDS[$expected]}
  local noun m token f
  for f in "${FILES[@]}"; do
    for noun in "$@"; do
      # -o: matched text only; -i: case-insensitive; grep may exit 1 (no match)
      while IFS= read -r m; do
        [[ -z $m ]] && continue
        token=$(printf '%s' "$m" | tr 'A-Z' 'a-z')
        token=${token%%[[:space:]]*}   # number tokens carry no internal space
        is_number "$token" || continue
        if [[ $token != "$word" && $token != "$digit" ]]; then
          printf 'DRIFT  %-8s expected %s/%s but found "%s" in %s\n' \
            "$label" "$word" "$digit" "$m" "$f"
          fail=1
        fi
      done < <(grep -ohiE "(${NUM})[ -]+(${noun})" "$f" || true)
    done
  done
}

# --- ADR total ---
# `grep -v` exits 1 when it filters out every line (e.g. docs/adr/ renamed away),
# which under `set -e`+pipefail would silently abort the whole guard. `|| true`
# lets a resulting count of 0 flow through and be reported as loud drift instead.
adr=$(git ls-files 'docs/adr/[0-9]*.md' | { grep -vE '\.ja\.md$' || true; } | wc -l | tr -d ' ')
# Nouns are deliberately plural ("ADRs") or の-anchored ("の ADR"): the total is
# always restated in one of these forms, whereas singular "one ADR" / "N ADR"
# occurs as a legitimate non-total mention (e.g. "closes one ADR") in carriers
# that are in scope, so a bare 'ADR' noun would false-positive. Japanese prose
# must therefore use a covered form ("20 の ADR" / "20 の戦術的判断"), not a bare
# "20 ADR" — the guard cannot see the latter by design.
check_noun "$adr" ADR \
  'ADRs' 'tactical decisions' 'tactical ADRs' 'decisions extracted' \
  'の ADR' 'の戦術的判断'

# --- Open questions total ---
# `grep -c` exits 1 when the count is 0 (header convention changed / file moved);
# `|| true` keeps the "0" it prints instead of letting errexit swallow the run.
oq=$(grep -cE '^## Open question ' docs/manifesto.md || true)
check_noun "$oq" open-q 'open questions'

if [[ $fail -eq 0 ]]; then
  printf 'verify-counts: OK — ADR total %s, open questions %s, all carriers agree.\n' \
    "$adr" "$oq"
else
  printf '\nverify-counts: FAIL — fix the carriers above to match the filesystem,\n'
  printf 'or (if the count really changed) update every carrier to the new number.\n'
fi
exit $fail
