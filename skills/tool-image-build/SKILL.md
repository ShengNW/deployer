---
name: tool-image-build
description: Build Bookstack/Nextchat images by tag using tool/*/build_image_based_on_tag.sh scripts. Use when users request reproducible Docker image build flow for bundled tools.
---

# Tool Image Build

Use this skill to build tool images from tagged upstream repositories.

## Commands

```bash
skills/tool-image-build/scripts/run.sh bookstack [args...]
skills/tool-image-build/scripts/run.sh nextchat [args...]
```

## Runtime notes

- Build scripts can run `git clean -fd` and Docker buildx operations.
- Use isolated working copies when testing image builds.
