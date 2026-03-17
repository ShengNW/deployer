#!/usr/bin/env bash
set -euo pipefail

SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
# shellcheck source=../../_shared/scripts/repo_runner.sh
source "$SELF_DIR/../../_shared/scripts/repo_runner.sh"

usage() {
  cat <<'USAGE'
Usage:
  run.sh waku-start
  run.sh waku-stop
  run.sh waku-state
  run.sh waku-publish
  run.sh waku-consume
  run.sh waku-subscription
  run.sh nwaku-help
  run.sh nwaku-nodekey
  run.sh ipfs-start
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
  waku-start)
    run_repo_script "$SELF_DIR" "middleware/waku/start.sh" "$@"
    ;;
  waku-stop)
    run_repo_script "$SELF_DIR" "middleware/waku/stop.sh" "$@"
    ;;
  waku-state)
    run_repo_script "$SELF_DIR" "middleware/waku/state.sh" "$@"
    ;;
  waku-publish)
    run_repo_script "$SELF_DIR" "middleware/waku/publish.sh" "$@"
    ;;
  waku-consume)
    run_repo_script "$SELF_DIR" "middleware/waku/consume.sh" "$@"
    ;;
  waku-subscription)
    run_repo_script "$SELF_DIR" "middleware/waku/subscription.sh" "$@"
    ;;
  nwaku-help)
    run_repo_script "$SELF_DIR" "middleware/nwaku/help.sh" "$@"
    ;;
  nwaku-nodekey)
    run_repo_script "$SELF_DIR" "middleware/nwaku/nodekey.sh" "$@"
    ;;
  ipfs-start)
    run_repo_script "$SELF_DIR" "middleware/ipfs/scripts/start-ipfs.sh" "$@"
    ;;
  *)
    usage
    exit 1
    ;;
esac
