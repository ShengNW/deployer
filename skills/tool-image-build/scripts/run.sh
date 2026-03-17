#!/usr/bin/env bash
set -euo pipefail

SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
# shellcheck source=../../_shared/scripts/repo_runner.sh
source "$SELF_DIR/../../_shared/scripts/repo_runner.sh"

usage() {
  cat <<'USAGE'
Usage:
  run.sh bookstack [args...]
  run.sh nextchat [args...]
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
  bookstack)
    run_repo_script "$SELF_DIR" "tool/bookstack/build_image_based_on_tag.sh" "$@"
    ;;
  nextchat)
    run_repo_script "$SELF_DIR" "tool/nextchat/build_image_based_on_tag.sh" "$@"
    ;;
  *)
    usage
    exit 1
    ;;
esac
