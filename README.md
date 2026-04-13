# skills-repo

一个由 GitHub 托管、面向团队共享的 skills 仓库，用于把同一份 skill 源内容安装到 Codex、Claude Code 和 Cursor。

## 目标

- 每个 skill 只维护一份平台无关的 `core/` 源内容。
- 通过脚本生成适配 Codex、Claude Code、Cursor 的 adapter 产物。
- 团队成员在 `git pull` 之后，用一条命令完成安装或更新。
- 支持把 Claude Code 中的草稿回收进仓库，再做规范化整理。
- 支持用一条命令创建新的 starter skill 包。

## 仓库结构

```text
skills-repo/
  README.md
  catalog.yaml
  docs/
    skill-format.md
  skills/
    <skill-id>/
      skill.yaml
      core/
      adapters/
  scripts/
    build
    create-skill
    install
    update
    doctor
    ingest-claude
    init-skill
```

## 主流程

1. 用 `./scripts/create-skill` 创建一个新的 starter skill。
2. 使用 `cross-tool-skill-creator` 把 starter 中的 TODO 内容替换成真正可复用的源内容。
3. 执行 `./scripts/build <skill-id>` 重新生成 adapters。
4. 用 `./scripts/install` 安装到目标工具。
5. 团队成员后续通过 `git pull && ./scripts/update <tool> <skill-id>` 完成更新。

## 常用命令

```bash
./scripts/create-skill api-error-triage "API 异常排查" "用于诊断重复出现的后端 API 故障。" --style no
./scripts/build frontend-react-rapid-delivery
./scripts/install codex frontend-react-rapid-delivery
./scripts/install claude frontend-react-rapid-delivery --project /path/to/project
./scripts/install cursor frontend-react-rapid-delivery --project /path/to/project
./scripts/update codex frontend-react-rapid-delivery
./scripts/doctor frontend-react-rapid-delivery
./scripts/ingest-claude /path/to/project/CLAUDE.md frontend-react-rapid-delivery
./scripts/init-skill my-new-skill "我的新 Skill"
```

## 安装模型

- `codex`：把生成后的 adapter 目录软链到 `~/.codex/skills/<skill-id>`。
- `claude`：把生成后的 `CLAUDE.md` 软链到目标项目根目录。
- `cursor`：把生成后的 `.mdc` 规则文件软链到目标项目的 `.cursor/rules/`，并同时安装兜底 `AGENTS.md`。

## 约定

- `core/` 是唯一可信源，不要把生成后的 `adapters/` 当作手工维护源。
- `create-skill` 会帮你生成合法 starter 包并更新 `catalog.yaml`，但领域知识和流程规则仍需继续补全。
- `ingest-claude` 当前会把 Claude Code 草稿存放到 `core/imports/`，用于后续人工规范化，而不是直接做有损自动转换。
- 内容层默认中文优先；`skill-id`、目录名、脚本名等结构层保持英文，保证跨工具兼容性。
