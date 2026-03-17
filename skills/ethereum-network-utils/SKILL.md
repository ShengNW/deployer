---
name: ethereum-network-utils
description: Use Ethereum utility scripts for dependency install, key extraction, file transfer, and balance queries. Use when users ask for infra/ethereum/network/util operations.
---

# Ethereum Network Utils

Use this skill for utility operations under `infra/ethereum/network/util`.

## Commands

```bash
skills/ethereum-network-utils/scripts/run.sh install-dependency
skills/ethereum-network-utils/scripts/run.sh extract-private-key
skills/ethereum-network-utils/scripts/run.sh copy-to
skills/ethereum-network-utils/scripts/run.sh copy-from
skills/ethereum-network-utils/scripts/run.sh balance-eth
skills/ethereum-network-utils/scripts/run.sh balance-token
```

## Runtime notes

- Install flow may alter system-level software (Go/Python/node dependencies).
- Copy and key operations should be run only with explicit target inputs.
