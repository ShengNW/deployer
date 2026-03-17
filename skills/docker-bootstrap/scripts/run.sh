#!/usr/bin/env bash
set -euo pipefail

SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
# shellcheck source=../../_shared/scripts/repo_runner.sh
source "$SELF_DIR/../../_shared/scripts/repo_runner.sh"

usage() {
  cat <<'USAGE'
Usage:
  run.sh setup-aliyun
  run.sh setup-ubuntu
  run.sh install-ubuntu
  run.sh setup-buildx
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
  setup-aliyun)
    run_repo_script "$SELF_DIR" "infra/docker/setup_aliyun.sh" "$@"
    ;;
  setup-ubuntu)
    run_repo_script "$SELF_DIR" "infra/docker/setup_ubuntu.sh" "$@"
    ;;
  install-ubuntu)
    run_repo_script "$SELF_DIR" "infra/docker/install_ubuntu.sh" "$@"
    ;;
  setup-buildx)
    run_repo_script "$SELF_DIR" "infra/docker/setup-buildx-multiarch.sh" "$@"
    ;;
  *)
    usage
    exit 1
    ;;
esac
