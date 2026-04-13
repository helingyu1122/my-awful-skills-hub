# 安装说明

## Codex

- 生成后的 adapter 路径：`adapters/codex/`
- 安装目标：`~/.codex/skills/frontend-react-rapid-delivery`
- 推荐方式：软链

## Claude Code

- 生成后的 adapter 路径：`adapters/claude/CLAUDE.md`
- 安装目标：目标项目根目录下的 `CLAUDE.md`
- 推荐方式：软链
- 团队使用时，建议把 skill 仓库放在项目外部，再把 adapter 链接进项目

## Cursor

- 生成后的 adapter 路径：`adapters/cursor/`
- 安装目标：
  - `.cursor/rules/frontend-react-rapid-delivery.mdc`
  - 兜底 `AGENTS.md`
- 推荐方式：软链

## 仓库约定

- 修改内容时优先编辑 `core/` 和 `skill.yaml`
- 改完后用 `./scripts/build` 重新生成 `adapters/`
- 不要把生成后的 adapter 当作主源长期手改
