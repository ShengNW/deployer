---
name: openapi-scaffold
description: Generate and run OpenAPI-based scaffolds (Go, Java, Python, TypeScript) using community/openapi scripts. Use when users ask to initialize SDK/server scaffolds from yeying-idl definitions.
---

# OpenAPI Scaffold

Use this skill to generate service scaffolds from IDL/OpenAPI pipelines.

## Commands

```bash
skills/openapi-scaffold/scripts/run.sh gen-go <output_path>
skills/openapi-scaffold/scripts/run.sh gen-java <output_path>
skills/openapi-scaffold/scripts/run.sh gen-python <output_path>
skills/openapi-scaffold/scripts/run.sh gen-typescript <output_path>

skills/openapi-scaffold/scripts/run.sh run-go
skills/openapi-scaffold/scripts/run.sh run-java
skills/openapi-scaffold/scripts/run.sh run-python
skills/openapi-scaffold/scripts/run.sh run-typescript
```

## Runtime notes

- Generation scripts assume repository-relative paths to `../yeying-idl`.
- Some scripts call `go`, `npm`, `protoc`, and global CLI tools.
