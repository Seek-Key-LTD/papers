#!/usr/bin/env bash
set -euo pipefail

project_dir=${1:?usage: package-overleaf-project.sh <paper-directory> [output.zip]}
output_zip=${2:-"${project_dir%/}.overleaf.zip"}

if [[ ! -f "$project_dir/main.tex" ]]; then
  echo "error: $project_dir/main.tex not found" >&2
  exit 2
fi

project_dir=$(realpath "$project_dir")
output_zip=$(realpath -m "$output_zip")
mkdir -p "$(dirname "$output_zip")"
rm -f "$output_zip"

# Keep editable sources and assets; exclude generated PDFs, caches and VCS data.
(cd "$project_dir" && zip -q -r "$output_zip" . \
  -x '*.pdf' '*.aux' '*.log' '*.fls' '*.fdb_latexmk' '*.synctex.gz' \
     '.git/*' '.gitignore')

unzip -tq "$output_zip"
echo "created: $output_zip"
echo "import this ZIP via Overleaf New Project → Upload Project"
