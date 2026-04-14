# 安装说明

## 仓库内维护

- 主源只维护 `skill.yaml` 与 `core/*.md`
- adapter 文件由 `./scripts/build <skill-id>` 生成
- 不直接手改 adapters，避免与 core 漂移

## 推荐流程

1. 修改 `core/*.md`
2. 执行 `./scripts/build iterative-ui-delivery`
3. 执行 `./scripts/doctor iterative-ui-delivery`
4. 再执行 `./scripts/install <tool> iterative-ui-delivery`

## 注意

- `codex` 安装会链接到 `~/.codex/skills/<skill-id>`
- `claude`、`cursor` 走各自 adapter 安装路径
