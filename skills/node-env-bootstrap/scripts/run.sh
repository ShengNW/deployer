#!/usr/bin/env bash
set -euo pipefail

SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
# shellcheck source=../../_shared/scripts/repo_runner.sh
source "$SELF_DIR/../../_shared/scripts/repo_runner.sh"

usage() {
  cat <<'USAGE'
Usage:
  run.sh
  run.sh [install.sh args...]
USAGE
  print_repo_resolution_help
}

if [ "$#" -eq 0 ]; then
  usage
fi

run_repo_script "$SELF_DIR" "developer/node/install.sh" "$@"
