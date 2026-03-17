#!/usr/bin/env bash
set -euo pipefail

SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
# shellcheck source=../../_shared/scripts/repo_runner.sh
source "$SELF_DIR/../../_shared/scripts/repo_runner.sh"

usage() {
  cat <<'USAGE'
Usage:
  run.sh install-dependency
  run.sh extract-private-key
  run.sh copy-to
  run.sh copy-from
  run.sh balance-eth
  run.sh balance-token
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
  install-dependency)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/util/install-dependency.sh" "$@"
    ;;
  extract-private-key)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/util/extract-private-key.sh" "$@"
    ;;
  copy-to)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/util/copy_to.sh" "$@"
    ;;
  copy-from)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/util/copy_from.sh" "$@"
    ;;
  balance-eth)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/util/balance-eth.sh" "$@"
    ;;
  balance-token)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/util/balance-token.sh" "$@"
    ;;
  *)
    usage
    exit 1
    ;;
esac
