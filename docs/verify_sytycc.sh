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
assert_contains "$page" "nav-menu w-nav-menu"
assert_contains "$page" "Meet the crew behind SYTYCC"
assert_contains "$page" "cdn.prod.website-files.com/65dfe94f6194922108671f44/65dfe94f6194922108671f82_white%20Outline%20Logo.svg"
assert_contains "$css" "sytycc-shell"
assert_contains "$css" "\\.sytycc-team-section \\.feature-wrap\\.reverse"
assert_contains "$css" "\\.sytycc-team-section \\.feature-content-2"
assert_contains "$css" "\\.sytycc-team-section \\.paragraph-2, \\.sytycc-team-section \\.paragraph-3, \\.sytycc-team-section \\.paragraph-4"
assert_contains "$css" "text-align: left;"
assert_contains "$css" "grid-template-columns: repeat\\(2, minmax\\(0, 1fr\\)\\);"
assert_contains "$css" "display: grid;"
assert_contains "../.github/workflows/jekyll-gh-pages.yml" "path: ./docs"

assert_not_contains "$page" "Lorem ipsum"
assert_not_contains "$page" "Download Now"
assert_not_contains "$page" "HeadNulla vitae elit libero"
assert_not_contains "$page" "sytycc-topbar"
assert_not_contains "$page" "sytycc-primary-nav"
assert_not_contains "$page" "resource-hub-preview"
assert_not_contains "$page" "<a href=\"/team\""
assert_not_contains "$page" "<a href=\"/sytycc\""

echo "SYTYCC static checks passed."
