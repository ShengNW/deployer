---
name: ethereum-network-core
description: Run Ethereum network lifecycle scripts (config, start/stop, geth/beacon/validator service and status helpers). Use when users need to operate private chain node services in infra/ethereum/network.
---

# Ethereum Network Core

Use this skill for lifecycle operations of geth/beacon/validator network components.

## Commands

```bash
skills/ethereum-network-core/scripts/run.sh setup-config
skills/ethereum-network-core/scripts/run.sh start-network
skills/ethereum-network-core/scripts/run.sh stop-network

skills/ethereum-network-core/scripts/run.sh geth-service
skills/ethereum-network-core/scripts/run.sh geth-check
skills/ethereum-network-core/scripts/run.sh geth-version

skills/ethereum-network-core/scripts/run.sh beacon-service
skills/ethereum-network-core/scripts/run.sh beacon-check
skills/ethereum-network-core/scripts/run.sh beacon-genesis-ssz
skills/ethereum-network-core/scripts/run.sh beacon-get-node
skills/ethereum-network-core/scripts/run.sh beacon-get-peer

skills/ethereum-network-core/scripts/run.sh validator-service
skills/ethereum-network-core/scripts/run.sh validator-check
skills/ethereum-network-core/scripts/run.sh validator-generate
skills/ethereum-network-core/scripts/run.sh erigon-check
```

## Runtime notes

- Scripts rely on `.env` and repository config in `infra/ethereum/network/`.
- Start/stop workflows can remove pid files and reset service state.
