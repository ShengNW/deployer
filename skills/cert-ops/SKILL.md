---
name: cert-ops
description: Operate certificate workflows with certbot install and certificate helper scripts. Use when users ask to install certbot, request certificates, or manage certificate deployment helpers.
---

# Cert Ops

Use this skill for TLS certificate setup workflows.

## Commands

```bash
skills/cert-ops/scripts/run.sh certbot-install
skills/cert-ops/scripts/run.sh certificate [args...]
```

## Runtime notes

- Certbot install script uses `sudo` and modifies host-level paths.
- Review certificate script parameters before execution.
