# 意图

这个 skill 用于创建符合 `skills-repo` 规范、可被 Codex、Claude Code、Cursor 共同消费的新 skill 源内容。

## 适用场景

- 定义新的跨工具 skill
- 把一个模糊想法落成 `core/` 源文件
- 把 Claude Code 或项目笔记里的草稿规范化整理
- 在生成 adapters 之前，先把仓库结构和边界理顺
- 帮助团队成员持续产出可复用的 skill 内容，而不是一次性说明文档

## 默认假设

- `core/` 是唯一可信源
- adapters 是生成产物
- 目标是跨工具复用，而不是先为某个平台做过度定制
- 示例只是验证样本，不是永久写死的结构

## 典型产出

- `skill.yaml`
- `core/intent.md`
- `core/workflow.md`
- `core/prompts.md`
- `core/patterns.md`
- `core/style.md`（仅在确实需要视觉规则时）
- `core/validation.md`
- `core/install-notes.md`
