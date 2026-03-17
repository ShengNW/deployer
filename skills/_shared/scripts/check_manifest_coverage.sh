#!/usr/bin/env bash
set -euo pipefail

SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_ROOT="$(cd "$SELF_DIR/../../.." && pwd -P)"
MANIFEST="$REPO_ROOT/skills/skills-manifest.yaml"

if [ ! -f "$MANIFEST" ]; then
  echo "Manifest not found: $MANIFEST" >&2
  exit 1
fi

tmp_all="$(mktemp)"
tmp_mapped="$(mktemp)"

cleanup() {
  rm -f "$tmp_all" "$tmp_mapped"
}
trap cleanup EXIT

(
  cd "$REPO_ROOT"
  rg --files -g '*.sh' | rg -v '^skills/' | sort
) > "$tmp_all"

awk '
  $1 == "-" {
    print $2
  }
' "$MANIFEST" | rg '\.sh$' | sort -u > "$tmp_mapped"

missing="$(comm -23 "$tmp_all" "$tmp_mapped" || true)"
extra="$(comm -13 "$tmp_all" "$tmp_mapped" || true)"

if [ -n "$missing" ]; then
  echo "Unmapped scripts:" >&2
  echo "$missing" >&2
fi

if [ -n "$extra" ]; then
  echo "Manifest points to non-script paths:" >&2
  echo "$extra" >&2
fi

if [ -n "$missing" ] || [ -n "$extra" ]; then
  exit 2
fi

echo "Manifest coverage OK"
