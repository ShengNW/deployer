---
name: upgrade-pipeline
description: Manage module upgrade pipeline (code status check, package upload, package download) for deployer modules. Use when users ask to build/publish/roll out module packages from scripts/upgrade.
---

# Upgrade Pipeline

Use this skill to run module package lifecycle scripts under `scripts/upgrade/`.

## Commands

```bash
# Check module updates and build packages if needed
skills/upgrade-pipeline/scripts/run.sh check [module ...]

# Upload latest package(s) to WebDAV
skills/upgrade-pipeline/scripts/run.sh upload [module ...]

# Download latest package(s) from WebDAV and upgrade env
skills/upgrade-pipeline/scripts/run.sh download [module ...]
```

## Runtime notes

- WebDAV auth comes from `WEBDAV_TOKEN` or `WEBDAV_USERNAME/WEBDAV_PASSWORD`.
- Default paths are hardcoded in source scripts (`/root/code`, `/opt/package`, `/opt/logs`).
- Use module arguments to reduce blast radius.
