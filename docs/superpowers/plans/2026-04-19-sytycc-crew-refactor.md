# SYTYCC Crew Refactor Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make the SYTYCC crew section visually match the working version using isolated, host-safe custom classes.

**Architecture:** Keep the current content and asset structure, but add a dedicated `sytycc-crew-*` presentation layer in the HTML and CSS. The new layer replaces dependence on legacy Webflow `feature-*` styles while preserving existing markup compatibility.

**Tech Stack:** Static HTML, Webflow-exported CSS, shell verification script

---

### Task 1: Add host-safe crew hooks

**Files:**
- Modify: `INNO_FLOW/docs/verify_sytycc.sh`

- [ ] Add verification checks for the new `sytycc-crew-*` hooks.
- [ ] Run `bash INNO_FLOW/docs/verify_sytycc.sh` and confirm it fails before implementation.

### Task 2: Refactor the crew markup

**Files:**
- Modify: `INNO_FLOW/docs/sytycc.html`

- [ ] Add `sytycc-crew-*` classes to the crew section wrapper, rows, copy, headings, bios, image containers, and portraits.
- [ ] Preserve existing content and image URLs.

### Task 3: Add isolated crew styling

**Files:**
- Modify: `INNO_FLOW/docs/css/inno-testing-c1472ac27c4ff37fb8193c9.webflow.css`

- [ ] Add a new CSS block for the `sytycc-crew-*` classes that recreates the working dark band and card layout.
- [ ] Add responsive rules so the cards stack on smaller screens.

### Task 4: Verify

**Files:**
- Test: `INNO_FLOW/docs/verify_sytycc.sh`

- [ ] Run `bash INNO_FLOW/docs/verify_sytycc.sh` and confirm it passes.
- [ ] Review the crew markup and CSS selectors for consistency.
