# 跨工具 Skill 创建器

创建可同时适配 Codex、Claude Code 和 Cursor 的跨工具 skill 源内容。

## 意图

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

## 工作流

# 工作流

## 标准流程

1. 先理解用户要沉淀的能力，确认这件事是否值得做成 skill。
2. 收集最小创建输入：
   - skill id
   - 展示名称
   - 一句话摘要
   - 是否需要视觉风格规则
3. 调用 `./scripts/create-skill <skill-id> <display-name> <summary> [--style yes|no]`。
4. 打开生成后的 `skills/<skill-id>/core/` starter 文件。
5. 用真实、可复用的规则替换 starter 里的 TODO 块。
6. 执行 `./scripts/build <skill-id>` 重新生成 adapters。
7. 执行 `./scripts/doctor <skill-id>` 做完整性检查，并汇报 readiness。

## 是否值得做成 skill

当满足以下任一条件时，应该做成 skill：

- 这个工作流会被重复执行
- 工作流里存在不明显的步骤或判断规则
- 团队希望在不同项目里保持产出一致
- 不同工具的 adapter 形式不同，但核心知识是共享的

如果内容只是一次性项目笔记，不要硬做成 skill。

## 编排规则

当仓库脚本可以完成结构化动作时，不要再让用户手工建文件。

推荐顺序永远是：

1. 先调用 `create-skill`
2. 再补全 `core/*.md`
3. 然后 rebuild
4. 最后 doctor 检查

## 输出约定

当你帮助用户创建新 skill 时，优先按这个顺序组织结果：

1. 创建输入确认
2. 确认将调用 `create-skill`
3. 补全后的 `core/*.md` 内容
4. 校验场景
5. readiness 总结

## Prompt 模板

# Prompt 模板

## 模板 1：一次性创建新 skill

```text
请用 cross-tool-skill-creator 直接帮我创建一个新 skill。
skill id: [skill-id]
显示名称: [display name]
一句话说明: [summary]
目标用户: [谁会用]
典型场景: [哪些情况下使用]
输入方式: [用户通常会提供什么]
输出方式: [希望产出什么]
是否涉及视觉风格: [yes/no]

要求:
1. 调用 create-skill 创建 starter package
2. 填充 core 源内容
3. build
4. doctor
5. 告诉我结果
```

## 模板 2：把草稿直接落成 skill

```text
请用 cross-tool-skill-creator 把这份草稿直接落成一个新 skill。
skill id: [skill-id]
显示名称: [display name]
一句话说明: [summary]
是否涉及视觉风格: [yes/no]

草稿内容:
[粘贴内容]

要求:
- 先调用 create-skill
- 再把 core 文件补全
- 最后 build 和 doctor
```

## 模板 3：导入 Claude 草稿并规范化

```text
请用 cross-tool-skill-creator 处理这份从 Claude Code 导出的内容。
skill id: [skill-id]
显示名称: [display name]
一句话说明: [summary]
是否涉及视觉风格: [yes/no]

要求:
1. 如 skill 不存在，先调用 create-skill
2. 规范化填充 core 文件
3. 指出哪些内容属于 adapter 层
4. build 和 doctor
```

## 模式

# 模式

## 各文件职责

### intent.md

应写：

- skill 的用途
- 适用场景
- 边界
- 默认假设
- 典型产出

不要写：

- 大段平台专属语法
- adapter 级安装细节

### workflow.md

应写：

- 稳定流程
- 顺序规则
- 关键判断点
- 输出约定

不要写：

- 只有展示作用、没有流程价值的大量示例

### prompts.md

应写：

- 用户输入模板
- 可以直接复制使用的简短 prompt
- 面向 rough draft 或导入内容的 intake 模板

### patterns.md

应写：

- 可复用模式
- 分类方法
- 常见结构
- 拆解规则

### style.md

只有在 skill 真正依赖视觉输入、风格预设、图片理解或设计约束时才需要写复杂内容。

### validation.md

应写：

- 测试场景
- 评分或通过规则
- pass/fail 条件

### install-notes.md

应写：

- 不同 adapter 的差异
- 安装目标
- 仓库中“源文件”和“生成文件”的边界规则

## 跨工具写作规则

如果某条规则只在单个平台成立，就不要直接写进 `core/` 主源，除非你明确标记它属于安装或 adapter 指南。

## 示例规则

好的规则：

- `风格相关时，先输出视觉决策卡，再进入页面原型`

不好的规则：

- `CLAUDE.md 必须逐字写成这个样子`

## 风格

# 风格

大多数 skill 并不需要复杂的 `style.md`。

只有当 skill 明确依赖这些能力时，才应该把 `style.md` 写成完整模块：

- 视觉方向定义
- 白话风格翻译
- 参考图或截图风格提炼
- 审美或设计约束

如果 skill 本身并非视觉类，请保持 `style.md` 极简，避免引入无意义复杂度。

## 当确实需要 style.md 时

优先保证内容可复用：

- 视觉输入规则
- 风格预设
- 白话风格到设计约束的映射
- 图片到风格特征的提炼规则

除非 skill 本身就是品牌专属，否则不要在这里写死项目品牌细节。

## 校验

# 校验

## 最低通过条件

一个新 skill 只有在满足以下条件时，才算达到最低质量：

- `skill.yaml` 完整
- 必需的 `core/` 文件齐全
- `core/` 内容保持平台无关
- 至少存在一个可复现的校验场景
- 生成 adapters 时不需要反过来重写 `core/`

## 复盘问题

- 这个 skill 解决的是不是一个重复出现的问题？
- 源内容是否真的能跨项目复用？
- 有没有把某个平台的 adapter 内容误塞进 `core/`？
- 示例是否足够短，并且从属于规则本身？
- 另一个团队成员接手时，能否不依赖原作者继续维护？

## 推荐校验场景

- 理想输入场景
- 模糊输入场景
- 导入草稿场景

## 失败信号

如果出现下面情况，应先回改源内容，再 build：

- 这个所谓 skill 实际上只是项目笔记
- `core/` 文件之间高度重复
- prompt 模板过于模糊，不具备可复用性
- 工作流强依赖单个平台语法

## 安装说明

# 安装说明

## 目的

这是一个仓库维护型 skill。它的职责是编排仓库脚本，而不是要求团队成员手工创建目录和文件。

## 仓库约定

- 新建 skill 时优先调用 `./scripts/create-skill`
- 平时主要编辑 `core/` 和 `skill.yaml`
- 不要把生成后的 adapters 当作主源
- 改完后执行 `./scripts/build <skill-id>`
- 标记 ready 前执行 `./scripts/doctor <skill-id>`

## 团队推荐顺序

1. `./scripts/create-skill <skill-id> <display-name> <summary>`
2. 用这个 meta skill 替换 starter 里的 TODO 内容
3. 必要时检查并调整 `catalog.yaml`
4. `./scripts/build <skill-id>`
5. `./scripts/doctor <skill-id>`
