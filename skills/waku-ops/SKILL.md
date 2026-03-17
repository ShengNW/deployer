---
name: waku-ops
description: Operate Waku/NWaku/IPFS helper scripts for start/stop/state/publish/consume flows. Use when users ask for messaging network runtime operations in middleware/waku or middleware/nwaku.
---

# Waku Ops

Use this skill for Waku family runtime actions.

## Commands

```bash
skills/waku-ops/scripts/run.sh waku-start
skills/waku-ops/scripts/run.sh waku-stop
skills/waku-ops/scripts/run.sh waku-state
skills/waku-ops/scripts/run.sh waku-publish
skills/waku-ops/scripts/run.sh waku-consume
skills/waku-ops/scripts/run.sh waku-subscription
skills/waku-ops/scripts/run.sh nwaku-help
skills/waku-ops/scripts/run.sh nwaku-nodekey
skills/waku-ops/scripts/run.sh ipfs-start
```

## Runtime notes

- `nwaku/*` scripts are minimal and may be placeholders.
- Verify network ports and Docker state before publish/consume workflows.
