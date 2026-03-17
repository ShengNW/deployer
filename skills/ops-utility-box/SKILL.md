---
name: ops-utility-box
description: Run utility scripts for compression, key/password generation, GitHub release URL generation, and periodic backup automation. Use when users need generic operations under script/ or root generate.sh.
---

# Ops Utility Box

Use this skill for miscellaneous operational utilities.

## Commands

```bash
skills/ops-utility-box/scripts/run.sh generate
skills/ops-utility-box/scripts/run.sh compress-file [path]
skills/ops-utility-box/scripts/run.sh convert-16-2-10 <hex>
skills/ops-utility-box/scripts/run.sh github-download-url <owner/repo> [tag]
skills/ops-utility-box/scripts/run.sh generate-key
skills/ops-utility-box/scripts/run.sh generate-private-key
skills/ops-utility-box/scripts/run.sh generate-password
skills/ops-utility-box/scripts/run.sh periodic-backup-wiki
```

## Runtime notes

- `periodic_bakup_wiki.sh` contains hardcoded hosts/paths and remote delete logic.
- Validate all target paths before executing backup-related commands.
