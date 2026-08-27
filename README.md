# LoQ — project page

Project page for **"Improving Information Extraction with Learned Queries"**
(Omar Sharif, Soroush Vosoughi, Nikhil Singh — Dartmouth College).

Live at **https://omar-sharif.github.io/LoQ/** once the repo is pushed to the
`omar-sharif` account under the name `LoQ` and GitHub Pages is enabled.
That path is printed in the camera-ready, so both the account and the repo name matter.

## Layout

```
index.html                  the entire page — one file, no build step
static/css/loq.css          project-specific styles (tables, example cards, stats)
static/css/                 bulma + template CSS (unmodified)
static/js/                  bulma carousel/slider + template JS
static/images/              figures — swap these, filenames are stable
static/pdfs/paper.pdf       camera-ready PDF served by the "Paper" button
tools/extract_figures.sh    renders the paper's figure pages for cropping
```

## Local preview

```bash
python3 -m http.server 8000
# open http://localhost:8000
```

## Before publishing — remaining TODOs

Every item below is marked with a `TODO` comment in `index.html`.

- [ ] **Add `static/pdfs/paper.pdf`** — the Paper button 404s without it.
- [ ] **Replace the placeholder figures.** `static/images/*.png` are grey placeholders.
      Run `bash tools/extract_figures.sh paper.pdf`, crop each figure, and overwrite the
      matching filename. No HTML edit is needed — the names are fixed.
- [ ] **arXiv / Code / Dataset buttons.** Each is a disabled grey placeholder. Set the real
      `href` and delete the `is-disabled-link` class (and the " (soon)" in the label).
- [ ] **Hugging Face dataset id** in the `load_dataset(...)` snippet (`REPO_PLACEHOLDER`).
- [ ] **Author homepage links** for Soroush Vosoughi and Nikhil Singh.
- [ ] **Confirm the venue string** ("EMNLP 2026") and complete the BibTeX entry with
      pages/address once the proceedings are out.
- [ ] Optional: a 1200×630 `static/images/social_preview.png` for link previews
      (the Open Graph tags currently point at the teaser figure).

## Deploying

```bash
gh repo create omar-sharif/LoQ --public --source=. --remote=origin --push
gh api -X POST repos/omar-sharif/LoQ/pages -f 'source[branch]=main' -f 'source[path]=/'
```

## Credit

Built on the [Academic Project Page Template](https://github.com/eliahuhorwitz/Academic-project-page-template),
adapted from [Nerfies](https://nerfies.github.io). The template asks that the footer credit stays in place.
