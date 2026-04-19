#!/usr/bin/env bash
set -euo pipefail

page="index.html"

cd "$(dirname "$0")"

assert_contains() {
  local file="$1"
  local pattern="$2"
  if ! rg -q "$pattern" "$file"; then
    echo "Missing expected pattern '$pattern' in $file" >&2
    exit 1
  fi
}

assert_not_contains() {
  local file="$1"
  local pattern="$2"
  if rg -q "$pattern" "$file"; then
    echo "Unexpected pattern '$pattern' still present in $file" >&2
    exit 1
  fi
}

assert_contains "$page" "camp-inno-home"
assert_contains "$page" "A new kind of camp is taking shape"
assert_contains "$page" "So, You Think You Can Camp\\?"
assert_contains "$page" "camp-inno-mission"
assert_contains "$page" "camp-inno-programs"
assert_contains "$page" "camp-inno-motion"
assert_contains "$page" "camp-inno-team"
assert_contains "$page" "camp-inno-interest"
assert_contains "$page" "Interest Form"
assert_contains "$page" "team.html"
assert_contains "$page" "sytycc.html"

assert_not_contains "$page" "REGISTER\\s*NOW"
assert_not_contains "$page" "campbrainregistration"
assert_not_contains "$page" "values-accordion-item"
assert_not_contains "$page" "background-video-3"

echo "Homepage static checks passed."
