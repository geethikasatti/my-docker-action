#!/bin/bash

# Set shell options for safer scripting
set -euo pipefail

# The rest of your script follows...
WHO="${1:-World}"

echo "👋 Hello, $WHO!"

TIME="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
if [ -n "${GITHUB_OUTPUT:-}" ]; then
  echo "time=$TIME" >> "$GITHUB_OUTPUT"
else
  echo "time=$TIME"
fi
exit 0
