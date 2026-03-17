#!/usr/bin/env bash
set -euo pipefail

SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
# shellcheck source=../../_shared/scripts/repo_runner.sh
source "$SELF_DIR/../../_shared/scripts/repo_runner.sh"

usage() {
  cat <<'USAGE'
Usage:
  run.sh gen-go <output_path>
  run.sh gen-java <output_path>
  run.sh gen-python <output_path>
  run.sh gen-typescript <output_path>
  run.sh run-go
  run.sh run-java
  run.sh run-python
  run.sh run-typescript
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
  gen-go)
    run_repo_script "$SELF_DIR" "community/openapi/go.sh" "$@"
    ;;
  gen-java)
    run_repo_script "$SELF_DIR" "community/openapi/java.sh" "$@"
    ;;
  gen-python)
    run_repo_script "$SELF_DIR" "community/openapi/python.sh" "$@"
    ;;
  gen-typescript)
    run_repo_script "$SELF_DIR" "community/openapi/typescript.sh" "$@"
    ;;
  run-go)
    run_repo_script "$SELF_DIR" "community/openapi/go/runner.sh" "$@"
    ;;
  run-java)
    run_repo_script "$SELF_DIR" "community/openapi/java/runner.sh" "$@"
    ;;
  run-python)
    run_repo_script "$SELF_DIR" "community/openapi/python/runner.sh" "$@"
    ;;
  run-typescript)
    run_repo_script "$SELF_DIR" "community/openapi/typescript/runner.sh" "$@"
    ;;
  *)
    usage
    exit 1
    ;;
esac
