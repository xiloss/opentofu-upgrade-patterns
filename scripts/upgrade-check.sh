#!/usr/bin/env bash
set -euo pipefail

TOOL="${TOOL:-tofu}"
WORKDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../examples/03-ci-upgrade-check" && pwd)"

if ! command -v "$TOOL" >/dev/null 2>&1; then
  echo "Error: '$TOOL' not found in PATH. Set TOOL=terraform or install OpenTofu."
  exit 1
fi

echo "Using tool: $TOOL"
echo "Working directory: $WORKDIR"

cd "$WORKDIR"

"$TOOL" init -upgrade
"$TOOL" fmt -check
"$TOOL" validate
"$TOOL" plan -out=tfplan

echo "Upgrade check completed successfully."
