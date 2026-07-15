# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A single-page marketing/technical brief site: "Kleros: The Oracle for Prediction Markets". The entire site is `index.html` (~750 lines) plus static images in `assets/`. There is no build system, package manager, linter, or test suite — do not add one unless asked.

To preview locally, serve the directory (relative asset paths need HTTP, though `file://` also works):

```bash
python3 -m http.server 8000   # then open http://localhost:8000
```

## Architecture

`index.html` is a full-viewport slide deck ("spaces"), not a scrolling page:

- **Slides**: each top-level `<section>`-like `div` carries `data-space`. Slides are stacked with fixed positioning; exactly one is visible. The nav rail (`data-nav="N"` buttons), counter, and progress bar are generated/updated from the slide list at runtime, but the rail buttons are hand-written — **adding or removing a slide requires adding/removing the matching `data-nav` button and keeping indices sequential from 0**.
- **Deck controller**: the single `<script>` at the bottom defines a `Deck` class (vanilla JS, no framework — the `componentDidMount` naming is just a convention). It handles wheel/key/touch/click navigation, persists current slide and theme to `localStorage` (`kleros-oracle-space`, `kleros-oracle-theme`), and lets slides taller than the viewport scroll internally before advancing (`canScrollSlide`).
- **Entrance animations**: elements with `data-r` get a staggered fade-in via the Web Animations API when their slide activates. `data-d` overrides stagger order, `data-from` overrides the initial transform. Resting DOM state is fully visible; the animation is a progressive enhancement with a safety timeout — keep it that way (content must never be stuck invisible).
- **Click-to-advance**: clicking anywhere advances the deck unless the target is inside `a`, `button`, or `[data-no-advance]`. Interactive chrome (header, nav, controls) must carry `data-no-advance`.

## Styling conventions

- Nearly all styling is **inline `style` attributes**; the `<style>` block in `<head>` holds only theme variables, hover states, keyframes, and mobile overrides. Follow this pattern for new content.
- **Theming**: dark and light palettes are CSS custom properties on `[data-theme="dark"]` / `[data-theme="light"]` (the attribute lives on `#dc-root`). Always use the variables (`var(--ink)`, `var(--accent)`, etc.) instead of hard-coded colors so both themes work. `data-invert` on an image inverts it in dark mode.
- **Responsive**: mobile behavior is driven by `data-m="..."` and other data-attribute hooks targeted from the `@media (max-width:820px)` block — desktop layout stays in inline styles, mobile overrides live in the head.
- Fonts are Newsreader (serif body) and IBM Plex Mono (labels/chrome), loaded from Google Fonts.
