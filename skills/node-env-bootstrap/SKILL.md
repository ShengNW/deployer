---
name: node-env-bootstrap
description: Bootstrap Node.js development environment with nvm installer workflow from developer/node/install.sh. Use when users request Node runtime setup or nvm-based version management setup.
---

# Node Env Bootstrap

Use this skill for nvm/node bootstrap on developer machines.

## Commands

```bash
skills/node-env-bootstrap/scripts/run.sh
```

## Runtime notes

- Script is large and can modify shell profile configuration.
- Prefer running on fresh dev environments; review before applying to shared hosts.
