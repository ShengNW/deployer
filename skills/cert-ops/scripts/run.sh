#!/usr/bin/env bash
set -euo pipefail

SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
# shellcheck source=../../_shared/scripts/repo_runner.sh
source "$SELF_DIR/../../_shared/scripts/repo_runner.sh"

usage() {
  cat <<'USAGE'
Usage:
  run.sh certbot-install
  run.sh certificate [args...]
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
  certbot-install)
    run_repo_script "$SELF_DIR" "infra/certbot/install.sh" "$@"
    ;;
  certificate)
    run_repo_script "$SELF_DIR" "infra/cert/certificate.sh" "$@"
    ;;
  *)
    usage
    exit 1
    ;;
esac
