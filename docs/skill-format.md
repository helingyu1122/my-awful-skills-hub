# Skill 格式说明

每个 skill 在 `core/` 下维护一份平台无关的源内容，在 `adapters/` 下维护一份或多份由脚本生成的适配产物。

## 快速创建路径

推荐按下面的顺序走：

1. `./scripts/create-skill <skill-id> <display-name> <summary>`
2. 使用 `cross-tool-skill-creator` 补全 starter `core/*.md`
3. `./scripts/build <skill-id>`
4. `./scripts/doctor <skill-id>`

## 必需文件

```text
skills/<skill-id>/
  skill.yaml
  core/
    intent.md
    workflow.md
    prompts.md
    patterns.md
    style.md
    validation.md
    install-notes.md
```

## skill.yaml

```yaml
id: frontend-react-rapid-delivery
name: React 企业前端快速交付
version: 0.1.0
summary: 面向企业中后台的 React 前端设计、原型与页面交付工作流。
platforms:
  codex: true
  claude: true
  cursor: true
core:
  intent: core/intent.md
  workflow: core/workflow.md
  prompts: core/prompts.md
  patterns: core/patterns.md
  style: core/style.md
  validation: core/validation.md
  install_notes: core/install-notes.md
adapters:
  codex:
    enabled: true
  claude:
    enabled: true
  cursor:
    enabled: true
```

## 设计规则

- `core/` 存放平台无关的知识、工作流、提示模板和校验规则。
- `adapters/` 是生成产物，不是长期手工维护的主源。
- 平台特有的话术，应该放在 build 脚本或 adapter 模板中，而不是塞进 `core/`。
- 团队协作时，优先修改 `core/` 和 `skill.yaml`。
- `create-skill` 只负责生成 starter 包；真正能复用的规则和模板，需要继续完善。

## 语言约定

- 面向团队阅读的说明内容默认用中文。
- `skill-id`、目录名、脚本名、命令参数名保持英文。
- 如果需要兼顾中英术语，优先采用中文说明 + 英文关键字并列的写法。
