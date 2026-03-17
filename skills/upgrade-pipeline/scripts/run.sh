#!/usr/bin/env bash
set -euo pipefail

SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
# shellcheck source=../../_shared/scripts/repo_runner.sh
source "$SELF_DIR/../../_shared/scripts/repo_runner.sh"

usage() {
  cat <<'USAGE'
Usage:
  run.sh check [module_name ...]
  run.sh upload [module_name ...]
  run.sh download [module_name ...]

Examples:
  run.sh check api gateway
  WEBDAV_TOKEN=xxx run.sh upload webdav
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
  check)
    run_repo_script "$SELF_DIR" "scripts/upgrade/check_code_status.sh" "$@"
    ;;
  upload)
    run_repo_script "$SELF_DIR" "scripts/upgrade/upload_packages.sh" "$@"
    ;;
  download)
    run_repo_script "$SELF_DIR" "scripts/upgrade/download_packages.sh" "$@"
    ;;
  *)
    usage
    exit 1
    ;;
esac
