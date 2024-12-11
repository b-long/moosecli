#!/bin/bash
e() {
  echo "ERROR:" "${@}"
  exit 1
}

WORK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
cd "$WORK_DIR" || e "Unable to navigate to 'WORK_DIR'"

echo "Starting build..."

rm -rf dist/portable_cli
rm -rf ~/.pex/

printf """
click==8.1.3
colorama==0.4.6
typer==0.7.0
""" > requirements.txt

echo "Requirements exported..."

echo "Building 'scie' PEX build."
uvx pex . --requirement=requirements.txt --scie eager -o dist/portable_cli --entry-point "moosecli"
echo "Build complete."

# echo "Running tool."
# ./dist/portable_cli