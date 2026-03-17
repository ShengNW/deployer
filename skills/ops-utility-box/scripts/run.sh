#!/usr/bin/env bash
set -euo pipefail

SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
# shellcheck source=../../_shared/scripts/repo_runner.sh
source "$SELF_DIR/../../_shared/scripts/repo_runner.sh"

usage() {
  cat <<'USAGE'
Usage:
  run.sh generate
  run.sh compress-file [path]
  run.sh convert-16-2-10 <hex>
  run.sh github-download-url <owner/repo> [tag]
  run.sh generate-key
  run.sh generate-private-key
  run.sh generate-password
  run.sh periodic-backup-wiki
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
  generate)
    run_repo_script "$SELF_DIR" "generate.sh" "$@"
    ;;
  compress-file)
    run_repo_script "$SELF_DIR" "script/compress_file.sh" "$@"
    ;;
  convert-16-2-10)
    run_repo_script "$SELF_DIR" "script/convert_16_2_10.sh" "$@"
    ;;
  github-download-url)
    run_repo_script "$SELF_DIR" "script/generate_github_download_url.sh" "$@"
    ;;
  generate-key)
    run_repo_script "$SELF_DIR" "script/generate_key.sh" "$@"
    ;;
  generate-private-key)
    run_repo_script "$SELF_DIR" "script/generate_private_key.sh" "$@"
    ;;
  generate-password)
    run_repo_script "$SELF_DIR" "script/generate_password.sh" "$@"
    ;;
  periodic-backup-wiki)
    run_repo_script "$SELF_DIR" "script/periodic_bakup_wiki.sh" "$@"
    ;;
  *)
    usage
    exit 1
    ;;
esac
