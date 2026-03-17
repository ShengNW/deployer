#!/usr/bin/env bash
set -euo pipefail

resolve_deployer_repo_root() {
  local caller_dir="$1"

  if [ -n "${DEPLOYER_REPO_ROOT:-}" ]; then
    if [ -d "$DEPLOYER_REPO_ROOT/.git" ]; then
      cd "$DEPLOYER_REPO_ROOT" && pwd -P
      return 0
    fi
    printf 'DEPLOYER_REPO_ROOT is set but not a git repo: %s\n' "$DEPLOYER_REPO_ROOT" >&2
    return 2
  fi

  local guessed_root
  guessed_root="$(cd "$caller_dir/../../.." && pwd -P)"
  if [ -d "$guessed_root/.git" ] && [ -d "$guessed_root/skills" ]; then
    printf '%s\n' "$guessed_root"
    return 0
  fi

  printf 'Cannot resolve deployer repo root from %s.\n' "$caller_dir" >&2
  printf 'Set DEPLOYER_REPO_ROOT=/absolute/path/to/deployer and retry.\n' >&2
  return 2
}

run_repo_script() {
  local caller_dir="$1"
  local rel_path="$2"
  shift 2

  local repo_root
  repo_root="$(resolve_deployer_repo_root "$caller_dir")"

  local target
  target="$repo_root/$rel_path"
  if [ ! -f "$target" ]; then
    printf 'Target script not found: %s\n' "$target" >&2
    return 3
  fi

  if [ "${DRY_RUN:-false}" = "true" ]; then
    printf '[DRY_RUN] bash %s' "$target"
    if [ "$#" -gt 0 ]; then
      printf ' %q' "$@"
    fi
    printf '\n'
    return 0
  fi

  bash "$target" "$@"
}

print_repo_resolution_help() {
  cat <<'HELP'
Environment helpers:
  DEPLOYER_REPO_ROOT  Optional absolute path to cloned deployer repo.
  DRY_RUN=true        Print target command without executing it.
HELP
}
