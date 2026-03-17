#!/usr/bin/env bash
set -euo pipefail

SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
# shellcheck source=../../_shared/scripts/repo_runner.sh
source "$SELF_DIR/../../_shared/scripts/repo_runner.sh"

usage() {
  cat <<'USAGE'
Usage:
  run.sh sync [AUTO_PUSH=true|false]
  run.sh merge [base_branch]

Examples:
  AUTO_PUSH=false run.sh sync
  INTERACTIVE=false AUTO_FILL_PR=true run.sh merge main
USAGE
  print_repo_resolution_help
}

if [ "$#" -lt 1 ]; then
  usage
  exit 1
fi

action="$1"
shift

case "$action" in
  sync)
    run_repo_script "$SELF_DIR" "scripts/sync.sh" "$@"
    ;;
  merge)
    run_repo_script "$SELF_DIR" "scripts/merge.sh" "$@"
    ;;
  *)
    usage
    exit 1
    ;;
esac
