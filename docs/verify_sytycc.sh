#!/usr/bin/env bash
set -euo pipefail

page="sytycc.html"
css="css/inno-testing-c1472ac27c4ff37fb8193c9.webflow.css"

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

assert_contains "$page" "SYTYCC Resource Hub"
assert_contains "$page" "soyouthinkyoucancamp.com"
assert_contains "$page" "resource-hub-embed"
assert_contains "$page" "Meet the crew behind SYTYCC"
assert_contains "$css" "sytycc-shell"

assert_not_contains "$page" "Lorem ipsum"
assert_not_contains "$page" "Download Now"
assert_not_contains "$page" "HeadNulla vitae elit libero"

echo "SYTYCC static checks passed."
