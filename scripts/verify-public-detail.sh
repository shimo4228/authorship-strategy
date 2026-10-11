#!/usr/bin/env bash
# verify-public-detail.sh — this repo's call of the harness check
# ~/.claude/scripts/verify-public-detail.sh, which keeps private detail off the
# public surfaces (rfcs/ and the implementation log, ADR-0025). Pass --llm or
# --llm-all for the semantic pass, --staged to check the index (pre-commit).
# Exit 0 clean / 1 hit / 2 UNCHECKED.
set -euo pipefail
trap 'printf "UNCHECKED unexpected failure at line %s\n" "$LINENO"; exit 2' ERR
root="$(cd "$(dirname "$0")/.." && pwd)"
harness="$HOME/.claude/scripts/verify-public-detail.sh"
[[ -f $harness ]] || { printf 'UNCHECKED %s not found\n' "$harness"; exit 2; }
exec bash "$harness" --root "$root" --base origin/main \
  --target 'rfcs/*.md' --target docs/empirical/implementation-log.md \
  --terms "$root/.notes/public-guard-terms.txt" "$@"
