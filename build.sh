#!/usr/bin/env bash
# Packages the site into dist/ for Netlify: copies static files, then vendors
# the Google Fonts so the deployed page makes no third-party requests.
set -euo pipefail
cd "$(dirname "$0")"

# Google only serves woff2 to browsers that advertise support for it.
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"

rm -rf dist
mkdir -p dist/fonts
cp index.html dist/
cp -R assets dist/
cp robots.txt sitemap.xml llms.txt brief.md favicon-dark.png favicon-light.png apple-touch-icon.png dist/

CSS_URL=$(grep -o 'https://fonts\.googleapis\.com/css2[^"]*' index.html | head -n1)
if [ -z "$CSS_URL" ]; then
  echo "ERROR: no Google Fonts stylesheet URL found in index.html" >&2
  exit 1
fi

echo "Fetching font stylesheet..."
css=$(curl -fsS -A "$UA" "$CSS_URL")

echo "Downloading font files..."
font_urls=$(printf '%s' "$css" | grep -o 'https://fonts\.gstatic\.com/[^)]*\.woff2' | sort -u)
for url in $font_urls; do
  # https://fonts.gstatic.com/s/newsreader/v21/abc.woff2 -> newsreader-v21-abc.woff2
  name=$(printf '%s' "$url" | sed -e 's|https://fonts\.gstatic\.com/s/||' -e 's|/|-|g')
  curl -fsS -A "$UA" -o "dist/fonts/$name" "$url"
  css=$(printf '%s' "$css" | sed "s|$url|$name|g")
done
printf '%s\n' "$css" > dist/fonts/fonts.css

echo "Rewriting index.html to use local fonts..."
perl -0pi -e 's{\s*<link rel="preconnect"[^>]*>\s*<link rel="preconnect"[^>]*>\s*<link href="https://fonts\.googleapis\.com[^>]*>}{\n<link href="fonts/fonts.css" rel="stylesheet">}s' dist/index.html

# Sanity checks: the build must be fully self-contained.
if grep -q 'fonts\.googleapis\.com\|fonts\.gstatic\.com' dist/index.html; then
  echo "ERROR: dist/index.html still references Google Fonts" >&2
  exit 1
fi
if ! ls dist/fonts/*.woff2 >/dev/null 2>&1; then
  echo "ERROR: no woff2 files were downloaded" >&2
  exit 1
fi
if grep -q 'fonts\.gstatic\.com' dist/fonts/fonts.css; then
  echo "ERROR: fonts.css still references fonts.gstatic.com" >&2
  exit 1
fi

echo "Build OK: dist/ ($(ls dist/fonts/*.woff2 | wc -l | tr -d ' ') font files)"
