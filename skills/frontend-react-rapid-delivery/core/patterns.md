# 中后台模式

## 目的

这些模式用于避免每次都从零发明企业中后台页面结构。

## 核心页面类型

### 1. 列表页

适用于：管理、查询、操作入口、对账、统计入口。

默认结构：

- 页面标题
- 筛选/搜索区
- 摘要条（需要时）
- 数据表格
- 行内操作
- 批量操作
- 分页

### 2. 详情页

适用于：记录查看、下钻分析、可追溯场景。

默认结构：

- 主摘要卡
- 状态与关键标识
- Tabs 或分组区块
- 时间线或操作日志
- 关联记录

### 3. 表单页

适用于：新增、编辑、配置、提交。

默认结构：

- 简洁引导区
- 分组字段
- 行内校验
- 吸底操作栏
- 变更历史（需要时）

当页面配置项很多时，要明确判断更适合哪种布局：

- 分组表单区块
- Tabs 配置
- 分步表单
- 左侧来源、右侧配置的工作台布局

如果存在版本、发布、回滚，也要显式暴露：

- 草稿状态
- 校验状态
- 发布动作
- 回滚或比对入口

### 4. 仪表盘页

适用于：监控、治理、概览、经营看板。

默认结构：

- 筛选区
- KPI 卡片
- 一到两个主趋势图
- 排名或分布面板
- 可执行告警

除非用户明确要求，不要把仪表盘做成装饰性驾驶舱。

### 5. 审核队列页

适用于：审批、复核、审核、异常处理。

默认结构：

- 队列筛选区
- 结果表格
- 详情抽屉或侧边详情面板
- 审计信息
- 明确的下一步动作

额外关注：

- 指派人
- SLA 或超时标识
- 优先级
- 驳回/退回原因选择器
- 材料预览策略

## 布局默认值

对企业中后台，优先采用：

- 左侧导航或顶部导航，层级清楚
- 克制但清晰的视觉层级
- 白色或浅中性色表面
- 信息密度适中偏高但仍可读的表格
- 颜色主要用于状态和提醒，而不是装饰

## 组件默认映射

把页面类型映射到可复用组件：

- 列表页 -> `FilterBar`、`SummaryStrip`、`DataTable`
- 详情页 -> `ProfileCard`、`InfoGrid`、`Timeline`
- 表单页 -> `SectionForm`、`FieldRow`、`ActionBar`
- 仪表盘页 -> `MetricCard`、`TrendPanel`、`RankingPanel`、`AlertList`
- 审核队列 -> `QueueTable`、`DetailDrawer`、`AuditPanel`

## 脚手架标准

默认工作区结构：

```text
frontend-app/
  package.json
  pnpm-workspace.yaml
  apps/
    admin-web/
  packages/
    ui/
    tokens/
    utils/
    api-contract/
```

如果需求较小，也可采用单应用结构：

```text
src/
  app/
  pages/
  components/
  features/
  services/
  hooks/
  types/
  styles/
  mocks/
```

## 模块拆分建议

- `app`：providers、router、bootstrapping
- `pages`：路由级页面
- `features`：业务模块
- `components`：共享 UI 组件
- `services`：API 访问和 adapter
- `mocks`：fixture 数据和 mock handlers

## 样式规则

- 用 tokens 管理颜色、间距、圆角、字体
- utility class 要可读、可组合
- 重复出现的 UI 形态尽早抽成组件
- 避免每个页面都写一堆一次性 CSS

## 组件层级

1. primitive
2. shared component
3. business component
4. page composition

示例：

- primitive：button、dialog、input
- shared component：data-table、search-form、stat-card
- business component：approval-panel、risk-tag-list、merchant-profile
- page composition：商户列表页、审核工作台

命名规则：

- 在 `shared component` 层尽量使用可复用名称，例如 `DataTable`、`FilterBar`、`SummaryStrip`
- 只有 `business component` 或 `page composition` 层才允许明显的领域语义
- 不要把领域专用面板误标成全局共享组件

## 状态管理规则

- 远程数据：`TanStack Query`
- 表单状态：`React Hook Form`
- 校验：`Zod`
- 本地 UI 状态：优先 `useState`

只有出现真正跨页面、且不属于服务端缓存的客户端状态时，再考虑全局 store。

## 质量门槛

最低要求：

- type check 通过
- build 通过
- 共享关键组件具备单元/组件测试
- 关键流程至少一条 Playwright smoke test

加分项：

- 为高复用业务组件补 Storybook
- 在 API 对接前先做核心页面视觉复核
