#!/usr/bin/env bash
set -euo pipefail

SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
# shellcheck source=../../_shared/scripts/repo_runner.sh
source "$SELF_DIR/../../_shared/scripts/repo_runner.sh"

usage() {
  cat <<'USAGE'
Usage:
  run.sh start-network
  run.sh stop-network
  run.sh setup-config
  run.sh geth-service
  run.sh geth-check
  run.sh geth-version
  run.sh beacon-service
  run.sh beacon-check
  run.sh beacon-genesis-ssz
  run.sh beacon-get-node
  run.sh beacon-get-peer
  run.sh validator-service
  run.sh validator-check
  run.sh validator-generate
  run.sh erigon-check
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
  start-network)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/start-network.sh" "$@"
    ;;
  stop-network)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/stop-network.sh" "$@"
    ;;
  setup-config)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/config/setup-config.sh" "$@"
    ;;
  geth-service)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/geth/geth-service.sh" "$@"
    ;;
  geth-check)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/geth/check-status.sh" "$@"
    ;;
  geth-version)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/geth/get-version.sh" "$@"
    ;;
  beacon-service)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/beacon/beacon-service.sh" "$@"
    ;;
  beacon-check)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/beacon/check-status.sh" "$@"
    ;;
  beacon-genesis-ssz)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/beacon/generate_szz.sh" "$@"
    ;;
  beacon-get-node)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/beacon/get-node.sh" "$@"
    ;;
  beacon-get-peer)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/beacon/get-peer.sh" "$@"
    ;;
  validator-service)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/validator/validator-service.sh" "$@"
    ;;
  validator-check)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/validator/check-status.sh" "$@"
    ;;
  validator-generate)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/validator/generate-validators.sh" "$@"
    ;;
  erigon-check)
    run_repo_script "$SELF_DIR" "infra/ethereum/network/erigon/check-status.sh" "$@"
    ;;
  *)
    usage
    exit 1
    ;;
esac
