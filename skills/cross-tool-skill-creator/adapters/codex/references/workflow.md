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
