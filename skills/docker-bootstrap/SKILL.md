---
name: docker-bootstrap
description: Install and configure Docker engine/buildx on Ubuntu (aliyun or official mirror). Use when users need Docker bootstrap, registry mirror setup, or multi-arch buildx setup.
---

# Docker Bootstrap

Use this skill for host-level Docker bootstrap and buildx setup.

## Commands

```bash
skills/docker-bootstrap/scripts/run.sh setup-aliyun
skills/docker-bootstrap/scripts/run.sh setup-ubuntu
skills/docker-bootstrap/scripts/run.sh install-ubuntu
skills/docker-bootstrap/scripts/run.sh setup-buildx
```

## Runtime notes

- These scripts require privileged operations (`sudo`).
- Run in controlled environments; do not execute blindly on production hosts.
