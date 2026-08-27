#!/usr/bin/env bash
# Render the paper's figure pages to PNG so they can be cropped into static/images/.
#
# Usage:  bash tools/extract_figures.sh [path/to/paper.pdf]
#
# Step 1 (this script): render the pages that contain figures at 300 DPI into tools/_pages/.
# Step 2 (manual):      crop each figure out of its page and save it under the stable
#                       filename the page expects. Example:
#
#   convert tools/_pages/page-03.png -crop 2400x900+150+300 +repage static/images/fig2_pipeline.png
#
# The filenames below are referenced by index.html and must not change — swapping a figure
# later means overwriting the same file, with no HTML edit needed.
#
#   static/images/fig1_teaser.png             Figure 1  — page 1, right column, top
#   static/images/fig2_pipeline.png           Figure 2  — page 3, full width, top
#   static/images/algorithm1.png              Algorithm 1 — page 4, left column, top
#   static/images/fig3_iterations.png         Figure 3  — page 7, bottom left
#   static/images/fig4_questions_per_role.png Figure 4  — page 7, bottom right
#   static/images/fig5_qg_breakdown.png       Figure 5  — page 12, top
#   static/images/fig6_data_scaling.png       Figure 6  — page 15, left column, middle

set -euo pipefail

PDF="${1:-paper.pdf}"
OUT="tools/_pages"
DPI=300
PAGES=(1 3 4 7 12 15)

if [ ! -f "$PDF" ]; then
  echo "error: $PDF not found. Copy the camera-ready PDF here first." >&2
  exit 1
fi

mkdir -p "$OUT"
for p in "${PAGES[@]}"; do
  printf 'rendering page %s at %s dpi...\n' "$p" "$DPI"
  pdftocairo -png -r "$DPI" -f "$p" -l "$p" "$PDF" "$OUT/page"
done

echo
echo "Rendered pages are in $OUT/. Crop them into static/images/ using the names above."
ls -la "$OUT"
