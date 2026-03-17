---
name: postgresql-ops
description: Operate PostgreSQL middleware helper (database/user/init SQL management) from middleware/postgresql/database.sh. Use when users request DB creation, user provisioning, or init SQL execution in local Docker setup.
---

# PostgreSQL Ops

Use this skill to run `middleware/postgresql/database.sh` with explicit subcommands.

## Commands

```bash
skills/postgresql-ops/scripts/run.sh <database.sh args...>

# Example
skills/postgresql-ops/scripts/run.sh create-db -d app -u app_user
```

## Runtime notes

- Assumes Docker Compose service is running in `middleware/postgresql`.
- Script writes init SQL files and may create users with random passwords.
