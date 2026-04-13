# Prompt Templates

## Template 1: Short business prompt

Use this when you want the skill to infer most of the structure.

```text
做一个 [系统名称] 的中后台。
主要给 [角色] 使用。
核心模块有 [模块A]、[模块B]、[模块C]。
重点页面包括 [列表/详情/表单/审批/报表]。
风格希望 [稳重/专业/轻量/数据密集]。
先给我原型方案，不要急着接后端。
```

## Template 2: Prototype-first prompt

Use this when you want a more controlled prototype output.

```text
请用 React-first 的企业中后台方案，给我设计一个 [系统名称]。
目标用户: [角色]
业务目标: [一句话]
模块: [模块列表]
关键动作: [新增/编辑/审批/导出/查询/统计]
页面类型: [表格多 / 表单多 / 仪表盘多]
输出要求:
1. 先给路由树
2. 再给页面原型说明
3. 再给组件清单
4. 不写后端
```

## Template 2A: Prototype with style guidance

Use this when you want the skill to translate visual intent before prototyping.

```text
请用 React-first 的企业中后台方案，给我设计一个 [系统名称]。
目标用户: [角色]
业务目标: [一句话]
模块: [模块列表]
关键动作: [新增/编辑/审批/导出/查询/统计]
页面类型: [表格多 / 表单多 / 仪表盘多]
风格要求:
- 希望气质: [稳重 / 专业 / 平台型 / 轻量]
- 参考产品: [飞书后台 / 阿里云控制台 / 其他]
- 不希望出现: [大屏感 / 花哨渐变 / 消费级卡片感]
输出要求:
1. 先给视觉决策卡
2. 再给路由树
3. 再给页面原型说明
4. 再给组件清单
5. 不写后端
```

## Template 2C: Blue-toned admin prompt

Use this when you want a calm blue-gray enterprise backend style.

```text
请用 React-first 的企业中后台方案，给我设计一个 [系统名称]。
业务目标: [一句话]
模块: [模块列表]
风格要求:
- 蓝色忧郁
- 信息密度适中
- 偏蓝灰，不要太土
- 不要大屏感，不要炫技图表

输出要求:
1. 先给视觉决策卡
2. 再给路由树
3. 再给页面原型
4. 再给组件清单
```

## Template 2B: Image-driven style prompt

Use this when you have screenshots or reference images.

```text
我会给你 1 到 3 张参考图。
请不要照抄页面内容，只提炼风格。

输出要求:
1. 提炼这些图片的风格特征
2. 输出视觉决策卡
3. 再按这个风格给我设计 [系统名称] 的页面原型

要求:
- 主要用于企业中后台
- 保持可实现，不要追求炫技
- 明确告诉我哪些元素应该借鉴，哪些不要照搬
```

## Template 3: Scaffold prompt

Use this when you want project structure and starter code.

```text
基于 React + TypeScript + Vite + TanStack Query + React Hook Form + Zod + Tailwind，
帮我生成一个企业级中后台前端脚手架方案。
需要包含:
- 目录结构
- 路由结构
- 登录后布局
- 一个列表页
- 一个详情页
- 一个表单页
- mock 数据层
- 测试基线
```

## Template 4: From prototype to code

Use this after the prototype is accepted.

```text
按刚才确认的原型，开始生成前端页面代码。
要求:
- 前后端分离
- API 先用 mock 和占位 service
- 页面先做 [模块名]
- 保持设计风格统一
- 组件尽量可复用
```

## Template 5: Skill validation prompt

Use this when the goal is to test and improve the skill itself, not just produce one page.

```text
把下面这个需求当成一次 skill 验证样本，而不是单次项目交付。
请按 React-first 企业中后台流程输出：
1. 产品目标
2. 路由树
3. 页面原型
4. 页面模式归类
5. 组件清单
6. 后续脚手架建议

需求:
[在这里放业务描述]
```

## Expected output order

For vague prompts, the skill should respond in this order:

1. visual decision card if style is mentioned
2. product goal
3. route tree
4. module breakdown
5. page prototype notes
6. component inventory
7. implementation suggestion

Do not start with large amounts of code unless the user explicitly asks for code first.
