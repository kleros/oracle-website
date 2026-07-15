# Kleros: The Oracle for Prediction Markets

A single-page site presenting Kleros as the resolution layer for prediction markets — an interactive technical brief covering the Reality.eth optimistic oracle with Kleros Court as its arbitration backstop, a comparison with UMA, notable resolution cases, and the surrounding ecosystem.

The site is built as a full-screen slide deck: navigate with scroll, arrow keys, swipe, or the on-screen controls. It supports light and dark themes and remembers your position between visits.

## Structure

- `index.html` — the entire site: markup, styles, and the vanilla-JS deck controller. No frameworks, no dependencies.
- `assets/` — logos and images.
- `build.sh` — packages the site into `dist/` for deployment (see below).

## Running locally

Serve the directory with any static file server, e.g.:

```bash
python3 -m http.server 8000
```

Then open http://localhost:8000.

## Deploying

The site deploys to Netlify. `./build.sh` builds a self-contained `dist/` folder: it copies `index.html` and `assets/`, downloads the Google Fonts (Newsreader, IBM Plex Mono) into `dist/fonts/`, and rewrites the page to use them locally — the deployed site makes no third-party requests. Netlify runs the script automatically via `netlify.toml` (`publish = "dist"`).
