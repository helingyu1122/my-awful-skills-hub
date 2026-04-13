# Prompt Templates

## Template 1: One-shot skill creation

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

## Template 2: Convert rough draft into a full skill

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

## Template 3: Ingest Claude draft and normalize

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
