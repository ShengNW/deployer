# 工具集（Deployer）

## 部署规范

- 所有编译的二进制文件统一放到 `$HOME/.yeying/bin` 目录。
- 配置到 PATH：在 `~/.bashrc` 中添加 `export PATH=$PATH:$HOME/.yeying/bin`。
- 脚本内部直接使用二进制名启动，不写绝对路径。

---

## Skill Pack 架构（方案 C）

本仓库已落地为 **按业务域拆分的 Skill Pack**，目录位于 `skills/`。

设计目标：
- 自动触发准确（skill 描述按域收敛）
- 手动指定清晰（每个 pack 一个入口 `scripts/run.sh`）
- Codex/OpenClaw 可共用同一套技能源
- 不自动改动本机真实 skill 环境（导入动作由你手工执行）

### Pack 列表

| Skill Pack | 入口脚本 | 覆盖范围 |
|---|---|---|
| `git-collab-flow` | `skills/git-collab-flow/scripts/run.sh` | `scripts/sync.sh`, `scripts/merge.sh` |
| `upgrade-pipeline` | `skills/upgrade-pipeline/scripts/run.sh` | `scripts/upgrade/*` |
| `docker-bootstrap` | `skills/docker-bootstrap/scripts/run.sh` | `infra/docker/*` |
| `cert-ops` | `skills/cert-ops/scripts/run.sh` | `infra/cert/*`, `infra/certbot/*` |
| `openapi-scaffold` | `skills/openapi-scaffold/scripts/run.sh` | `community/openapi/*` |
| `ethereum-network-core` | `skills/ethereum-network-core/scripts/run.sh` | `infra/ethereum/network` 核心流程 |
| `ethereum-network-utils` | `skills/ethereum-network-utils/scripts/run.sh` | `infra/ethereum/network/util/*` |
| `postgresql-ops` | `skills/postgresql-ops/scripts/run.sh` | `middleware/postgresql/database.sh` |
| `redis-cluster-check` | `skills/redis-cluster-check/scripts/run.sh` | `middleware/redis/test-redis-cluster.sh` |
| `waku-ops` | `skills/waku-ops/scripts/run.sh` | `middleware/waku/*`, `middleware/nwaku/*`, `middleware/ipfs/scripts/start-ipfs.sh` |
| `tool-image-build` | `skills/tool-image-build/scripts/run.sh` | `tool/*/build_image_based_on_tag.sh` |
| `ops-utility-box` | `skills/ops-utility-box/scripts/run.sh` | `script/*`, `generate.sh` |
| `node-env-bootstrap` | `skills/node-env-bootstrap/scripts/run.sh` | `developer/node/install.sh` |

脚本覆盖映射在：`skills/skills-manifest.yaml`。

---

## 技能目录结构

```text
skills/
  _shared/
    scripts/
      repo_runner.sh
      check_manifest_coverage.sh
  <skill-pack>/
    SKILL.md
    scripts/run.sh
```

说明：
- 所有 pack 通过 `_shared/scripts/repo_runner.sh` 共享底层仓库脚本调用逻辑。
- 默认按“仓库内相对路径”定位脚本；若你把 skill 目录单独拷贝走，可设置 `DEPLOYER_REPO_ROOT=/absolute/path/to/deployer`。

---

## 拉库后如何导入 Skill（按需）

以下命令 **只在你手工执行时生效**，仓库不会自动写入 `~/.codex/skills` 或 `~/.openclaw/skills`。

先定义仓库路径变量：

```bash
export DEPLOYER_REPO="/absolute/path/to/deployer"
```

### A. 导入到 Codex

#### A1. 全局可用（所有项目）

```bash
mkdir -p ~/.codex/skills

# 按需导入（示例 3 个）
ln -sfn "$DEPLOYER_REPO/skills/git-collab-flow"    ~/.codex/skills/git-collab-flow
ln -sfn "$DEPLOYER_REPO/skills/upgrade-pipeline"   ~/.codex/skills/upgrade-pipeline
ln -sfn "$DEPLOYER_REPO/skills/docker-bootstrap"   ~/.codex/skills/docker-bootstrap
```

#### A2. 仅某个目录/项目可用（推荐给隔离场景）

```bash
# 进入你的目标项目目录
cd /path/to/your-project

# 为该项目创建独立 Codex Home
export CODEX_HOME="$PWD/.codex"
mkdir -p "$CODEX_HOME/skills"

# 按需导入
ln -sfn "$DEPLOYER_REPO/skills/git-collab-flow"  "$CODEX_HOME/skills/git-collab-flow"
ln -sfn "$DEPLOYER_REPO/skills/upgrade-pipeline" "$CODEX_HOME/skills/upgrade-pipeline"
```

启动 Codex 时保持同一个 `CODEX_HOME`，即可实现“仅该目录生效”。

### B. 导入到 OpenClaw

#### B1. 全局共享 Skill（所有 agent）

```bash
mkdir -p ~/.openclaw/skills
ln -sfn "$DEPLOYER_REPO/skills/git-collab-flow"  ~/.openclaw/skills/git-collab-flow
ln -sfn "$DEPLOYER_REPO/skills/upgrade-pipeline" ~/.openclaw/skills/upgrade-pipeline
```

#### B2. 仅某个工作区可用

```bash
# 假设你的 agent workspace 是 /path/to/workspace
mkdir -p /path/to/workspace/skills
ln -sfn "$DEPLOYER_REPO/skills/git-collab-flow"  /path/to/workspace/skills/git-collab-flow
ln -sfn "$DEPLOYER_REPO/skills/upgrade-pipeline" /path/to/workspace/skills/upgrade-pipeline
```

验证：

```bash
openclaw skills list --eligible
openclaw skills info git-collab-flow
openclaw skills check
```

### C. 一次导入全部 13 个 Pack（可选）

```bash
for pack in \
  git-collab-flow upgrade-pipeline docker-bootstrap cert-ops openapi-scaffold \
  ethereum-network-core ethereum-network-utils postgresql-ops redis-cluster-check \
  waku-ops tool-image-build ops-utility-box node-env-bootstrap; do
  ln -sfn "$DEPLOYER_REPO/skills/$pack" ~/.codex/skills/$pack
  # 或改成 ~/.openclaw/skills/$pack
  # ln -sfn "$DEPLOYER_REPO/skills/$pack" ~/.openclaw/skills/$pack
done
```

---

## 维护与校验

### 1) 校验脚本覆盖关系

```bash
bash skills/_shared/scripts/check_manifest_coverage.sh
```

该命令会检查：仓库中的 `.sh` 是否都被 `skills/skills-manifest.yaml` 映射。

### 2) 更新脚本后同步 Skill

当你修改任意业务脚本时，建议同时做三件事：
- 更新对应 skill 的 `SKILL.md`（触发语义和使用边界）
- 如入口参数变化，更新对应 `scripts/run.sh`
- 运行覆盖检查脚本

---

## 风险提示（务必读）

仓库存在高风险脚本（如 `git push`、`rebase`、`reset --hard`、`rm -rf`、远程删除、`sudo` 安装）。

建议执行策略：
- 先在测试环境跑。
- 生产环境默认先 `DRY_RUN=true`。
- 涉及远程写操作时，显式确认目标主机/分支/目录。
