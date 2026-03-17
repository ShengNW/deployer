---
name: redis-cluster-check
description: Validate Redis cluster deployment health using middleware/redis/test-redis-cluster.sh. Use when users ask to verify Redis cluster state, node topology, or cluster readiness.
---

# Redis Cluster Check

Use this skill to run Redis cluster diagnostic script.

## Commands

```bash
skills/redis-cluster-check/scripts/run.sh [args...]
```

## Runtime notes

- Requires Docker Compose Redis services available in `middleware/redis`.
- Prefer running after cluster startup to avoid false negatives.
