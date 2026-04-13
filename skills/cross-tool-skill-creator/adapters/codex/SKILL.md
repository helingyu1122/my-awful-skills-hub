---
name: cross-tool-skill-creator
description: 创建可同时适配 Codex、Claude Code 和 Cursor 的跨工具 skill 源内容。
---

# 跨工具 Skill 创建器

当用户希望创建一个符合 `skills-repo` 规范、可跨工具复用的新 skill 源包时，使用这个 skill。

## 默认输出顺序

1. skill 名称与一句话说明
2. 适用边界与使用场景
3. `skill.yaml` 草稿
4. `core/*.md` 源文件草稿
5. 校验场景
6. adapter 生成后的下一步动作

## 参考资料

- [workflow](references/workflow.md)
- [prompts](references/prompts.md)
- [patterns](references/patterns.md)
- [style](references/style.md)
- [validation](references/validation.md)
- [install-notes](references/install-notes.md)
