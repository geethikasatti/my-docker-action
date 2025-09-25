#!/bin/bash
set -euo pipefail

WHO="${1:-World}"

# Example work the action does:
echo "👋 Hello, $WHO!"

# Prepare an output (UTC timestamp)
TIME="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

# Write outputs so GitHub recognizes them
# The runner injects $GITHUB_OUTPUT for communicating outputs.
if [ -n "${GITHUB_OUTPUT:-}" ]; then
  echo "time=$TIME" >> "$GITHUB_OUTPUT"
else
  # Fallback (shouldn't normally be required)
  echo "time=$TIME"
fi

# Exit normally (0).
