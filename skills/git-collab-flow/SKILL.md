---
name: git-collab-flow
description: Sync a fork with upstream and create GitHub pull requests using deployer workflows. Use when users ask to sync branch history, push fork branches, or create PRs from current branch.
---

# Git Collab Flow

Use this skill for repository collaboration tasks around `origin`/`upstream` sync and PR creation.

## Commands

```bash
# Sync local branch with upstream/current remote strategy
skills/git-collab-flow/scripts/run.sh sync

# Create pull request from current branch to base branch
skills/git-collab-flow/scripts/run.sh merge main
```

## Runtime notes

- Set `INTERACTIVE=false` for non-interactive automation.
- Set `AUTO_PUSH=false` to avoid automatic `git push`.
- Set `DRY_RUN=true` to print command only (wrapper-level dry run).
- If skill folder is copied out of repo, set `DEPLOYER_REPO_ROOT=/absolute/path/to/deployer`.
