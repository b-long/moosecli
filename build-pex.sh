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
# rm -rf .venv/
# poetry install --no-dev

# Bad because it has moosecli
# poetry run pip freeze > requirements.txt
poetry export -f requirements.txt --without-hashes --output requirements.txt

echo "Requirements exported..."

pex . --requirement=requirements.txt --python-shebang="#!/usr/bin/env python3" -o dist/portable_cli -e moosecli

echo "Build complete."