# Frontend React Rapid Delivery

React-first enterprise frontend design, prototype, and page delivery workflow.

## Intent

# Intent

This skill is for React-first enterprise frontend work in front/back-end separated projects.

## Use it for

- enterprise admin-system scaffolding
- page prototypes from short prompts
- page-to-code delivery
- design-token based UI rules
- stable workflows for React admin apps
- optional marketing pages when secondary to admin needs

## Default assumptions

- Prefer `React + TypeScript + Vite`
- Primary target is `admin/back-office SPA`
- Secondary target is `marketing/content pages`
- Keep backend concerns out unless explicitly requested
- Treat concrete projects as validation samples, not as the skill's permanent shape

## Typical outputs

- visual decision card
- stack and scaffold proposal
- route and module tree
- page prototype description
- component inventory
- API docking assumptions

## Workflow

# Workflow

## Standard flow

Use this flow when the user wants speed and reuse from short prompts.

1. Interpret the business request.
2. Convert it into a frontend-facing brief.
3. Convert visual input into a visual decision card when needed.
4. Produce a prototype summary before heavy coding.
5. Confirm or revise the prototype.
6. Generate scaffold or page code.
7. Leave clear API docking points for later backend integration.
8. Evaluate the result against the validation checklist and feed learnings back into the skill.

## Frontend-facing brief

From a short business request, derive:

- user roles
- page modules
- main entities
- core actions
- high-risk interactions
- permission-sensitive areas
- table-heavy vs form-heavy vs dashboard-heavy ratio
- whether the workflow contains `draft`, `validate`, `publish`, `rollback`, or `audit` states
- whether the workflow contains `assignment`, `SLA`, `timeout`, `review action`, or `material preview` states

## Visual intake

If the user expresses style in plain language, example products, or images, normalize it before prototyping.

Translate inputs such as:

- `稳重`
- `像飞书后台`
- `不要太丑`
- `高级一点`
- `参考这张图`

into a visual decision card with:

- style keywords
- density level
- navigation style
- surface style
- table and form treatment
- chart temperament
- forbidden visual traits

## Prototype output contract

Before writing a lot of code, produce:

- one-sentence product goal
- visual decision card when style matters
- page map
- route tree
- page archetype mapping
- each page's purpose
- key components
- key interactions
- design tone

When listing components, split them into:

- shared reusable components
- business assembly components

This reduces accidental overfitting to one domain.

## Visual decision card contract

When included, keep it compact and concrete.

Recommended fields:

- `style keywords`
- `reference feel`
- `palette direction`
- `typography tone`
- `density`
- `navigation choice`
- `table/form style`
- `chart style`
- `do not do`

Example shape:

```md
Goal: Build an operations dashboard for merchant onboarding.

Routes:
- /dashboard
- /merchants
- /merchants/:id
- /approvals

Pages:
- Dashboard: KPI cards + trend charts + pending queue
- Merchants: filterable table + bulk actions
- Merchant Detail: profile, risk notes, operation log
- Approvals: review queue + detail drawer
```

## Code generation order

Generate in this order unless the user requests otherwise:

1. app shell
2. routes
3. shared layout
4. token file and theme rules
5. base business components
6. page skeletons
7. mock service layer
8. tests for critical pages

## API separation rules

Keep front/back-end separation explicit:

- isolate request clients under `src/services`
- isolate types under `src/types` or generated contracts
- never spread raw fetch logic across pages
- keep mock data and live API adapters swappable

Preferred request split:

- `services/http`
- `services/modules/*`
- `mocks/*`

## Prototype-first rule

When the prompt is vague, do not jump straight into polished code. First create a compact prototype plan. This reduces churn and makes later code generation more stable.

## Reuse-first rule

Do not treat each request as a brand-new design exercise. First map the request to reusable archetypes such as:

- list + filters + bulk actions
- detail + tabs + timeline
- form + steps + validation
- dashboard + KPI + trend + ranking
- review queue + drawer + audit log

Only add custom structures when the archetypes do not cover the need.

## Admin system defaults

For admin pages, prefer:

- clear information density
- obvious filter and search zones
- stable table behavior
- detail drawers and modals used sparingly
- action grouping by task priority

For users without design background, prefer to explain visual choices in plain language instead of abstract design jargon.

For configuration-heavy pages, additionally check:

- should the page use grouped sections, tabs, steps, or split workspace layout
- where draft save, validation, publish, and rollback actions belong
- whether change logs and version history are first-class pages rather than afterthoughts

For review-queue pages, additionally check:

- whether assignee, SLA, timeout, and priority should appear in the queue
- whether review actions belong in a side panel, sticky footer, or dedicated action block
- whether material preview should be inline, in a drawer, or on a dedicated route

Avoid:

- decorative layout noise
- oversized hero sections
- animation-heavy interactions
- consumer-app visual tropes

## Trial output review

After a prototype or sample page is generated, evaluate:

- Did it stay within enterprise admin conventions?
- Did it produce a route tree and page map before code?
- Did it use reusable page archetypes instead of one-off compositions?
- Did it keep front/back-end separation explicit?
- Did it leave a scaffold path that can be repeated on the next project?

If the answer is no, refine the skill instructions before refining the sample again.

## Marketing page exception

If the user explicitly asks for a marketing or content page:

- allow stronger visual direction
- allow richer typography and backgrounds
- consider SSR/SSG only if SEO is a real goal

Do not let this override the default admin baseline for the whole skill.

## Prompts

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

## Patterns

# Admin Patterns

## Purpose

Use these patterns to avoid reinventing enterprise admin pages for every request.

## Core page archetypes

### 1. List page

Use when the task is management, querying, operation, reconciliation, or reporting entry.

Default structure:

- page title
- filter/search area
- summary strip when useful
- data table
- row actions
- batch actions
- pagination

### 2. Detail page

Use when the task is record inspection, drill-down, or traceability.

Default structure:

- primary summary card
- status and key identifiers
- tabs or grouped sections
- timeline or operation log
- related records

### 3. Form page

Use when the task is create/edit/configure/submit.

Default structure:

- concise guidance area
- grouped fields
- inline validation
- sticky action bar
- change history when needed

When the page is configuration-dense, explicitly decide one of these layouts:

- grouped form sections
- tabbed configuration
- step form
- split workspace with left source panel and right configuration panel

If versioning or publishing is involved, also surface:

- draft state
- validation state
- publish action
- rollback or compare entry

### 4. Dashboard page

Use when the task is monitoring, governance, or executive overview.

Default structure:

- filter area
- KPI cards
- one or two main trend charts
- ranking or distribution panels
- action-oriented alerts

Do not turn dashboards into decorative cockpits unless the user explicitly wants that style.

### 5. Review queue page

Use when the task is approval, review, audit, or exception handling.

Default structure:

- queue filters
- result table
- detail drawer or side panel
- audit information
- explicit next actions

Also consider:

- assignee
- SLA or timeout marker
- priority marker
- reason selector for reject/return actions
- material preview strategy

## Layout defaults

For enterprise admin systems, prefer:

- left navigation or top navigation with clear hierarchy
- shallow visual hierarchy
- white or light neutral surfaces
- dense but readable tables
- restrained color usage focused on state and alerts

## Component defaults

Map archetypes to reusable components:

- list page -> `FilterBar`, `SummaryStrip`, `DataTable`
- detail page -> `ProfileCard`, `InfoGrid`, `Timeline`
- form page -> `SectionForm`, `FieldRow`, `ActionBar`
- dashboard page -> `MetricCard`, `TrendPanel`, `RankingPanel`, `AlertList`
- review queue -> `QueueTable`, `DetailDrawer`, `AuditPanel`

## Decision rule

When a request contains multiple page types, identify the primary archetype for each route before designing visuals or code.
# Scaffold Standards

## Default workspace layout

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

If the request is small, a single-app layout is acceptable:

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

## Recommended page/module split

- `app`: providers, router, bootstrapping
- `pages`: route-level pages
- `features`: business modules
- `components`: shared UI pieces
- `services`: API access and adapters
- `mocks`: fixture data and mock handlers

## Styling rules

- use tokens for color, spacing, radius, and typography
- keep utility classes readable and composable
- extract repeated UI patterns into components early
- avoid random one-off CSS blocks for each page

## Component layers

1. `primitive`
2. `shared component`
3. `business component`
4. `page composition`

Example:

- primitive: button, dialog, input
- shared component: data-table, search-form, stat-card
- business component: order-status-timeline, approval-panel
- page composition: order list page

Naming rule:

- prefer reusable names at the `shared component` layer, such as `DataTable`, `FilterBar`, `SummaryStrip`
- allow domain-specific names only at the `business component` or `page composition` layer
- avoid treating domain-specific tables or panels as globally reusable components

## State rules

- remote data: `TanStack Query`
- form state: `React Hook Form`
- validation: `Zod`
- local UI state: `useState` first

Only add a global store when there is real cross-page client state that does not belong to the server cache.

## Quality gates

Minimum:

- type check passes
- build passes
- unit/component tests for shared critical parts
- one Playwright smoke test for major flows

Preferred:

- Storybook stories for reusable business components
- visual review of core pages before API integration

## Naming rules

- use business language, not vague UI names
- routes and feature folders should map to modules the business can recognize
- avoid folders like `misc`, `common2`, `temp-ui`

## Deliverable checklist

When generating a scaffold or page code, make sure the output includes:

- route structure
- layout structure
- reusable component candidates
- request layer placeholders
- mock strategy
- test entry points
- clear follow-up docking points for backend APIs

## Style

# Visual Intake

## Purpose

Use this file when the user is not a designer and describes style in plain language.

The job is to translate fuzzy visual intent into concrete frontend constraints before prototyping.

## Input types

The user may describe style through:

- plain adjectives
- example products
- screenshots or UI images
- rejection statements such as `不要花哨`

## Translation rule

Do not ask the user for design jargon.

Translate everyday language into concrete decisions.

Examples:

- `稳重`
  - low saturation
  - light neutral backgrounds
  - restrained accent color usage
  - regular spacing rhythm
- `专业`
  - clear hierarchy
  - readable table/form structure
  - limited decorative elements
- `高级一点`
  - fewer colors
  - more consistent spacing
  - lighter shadows
  - tighter typography hierarchy
- `像后台`
  - strong filter zone
  - table-first layouts
  - clear navigation
  - compact interaction patterns
- `不要大屏感`
  - avoid dark cockpit look
  - avoid oversized charts
  - avoid glowing gradients
  - avoid visual over-decoration
- `不要太丑`
  - reduce randomness
  - unify radius and spacing
  - avoid mixed visual languages
- `蓝色忧郁`
  - low-saturation blue-gray palette
  - calm and slightly cool emotional tone
  - medium density instead of empty luxury layout
  - restrained highlights, not neon blue
- `不要太土`
  - avoid cheap-looking gradients
  - avoid too many unrelated colors
  - reduce decorative chart treatments
  - keep typography and spacing consistent

## Reference products

When the user mentions a known product, do not imitate branding. Extract only reusable traits.

Examples:

- `飞书后台`
  - calm enterprise productivity feel
  - clean spacing
  - moderate density
  - practical cards and tables
- `阿里云控制台`
  - strong platform feel
  - dense navigation and management structure
  - clear state display
  - strong operational orientation

## Output format

Prefer this shape:

```md
Visual Decision Card
- Style keywords:
- Reference feel:
- Palette direction:
- Typography tone:
- Density:
- Navigation:
- Table style:
- Form style:
- Chart style:
- Do not do:
```

## Rule for non-design users

If the user only says `你帮我定`, do not stop. Choose a safe enterprise-admin preset from `style-presets.md`, state the choice clearly, and continue.
# Style Presets

Use these presets when the user gives broad style goals but does not specify detailed visual rules.

## Preset A: Calm Enterprise

Use when the user says:

- 稳重
- 专业
- 企业中后台
- 不要花哨

Traits:

- light neutral background
- blue or slate accent
- medium information density
- restrained cards
- clear filter areas
- readable tables
- weak shadow, moderate radius

Avoid:

- giant hero areas
- dark cockpit visuals
- colorful gradients

## Preset B: Platform Console

Use when the user says:

- 平台型
- 控制台
- 像云平台
- 运维后台

Traits:

- stronger navigation hierarchy
- denser layout
- state-first visual emphasis
- compact cards
- heavier table usage
- stronger secondary panels

Avoid:

- marketing-style storytelling blocks
- oversized whitespace

## Preset C: Light Operations

Use when the user says:

- 轻量
- 简洁
- 日常运营
- 不要太重

Traits:

- more breathing room
- fewer border layers
- smaller number of KPI cards
- simpler chart treatment

Avoid:

- heavy control-panel density
- too many stacked cards

## Preset D: Review Workspace

Use when the user says:

- 审核
- 审批
- 可追溯
- 风控

Traits:

- queue plus detail split
- explicit action panels
- timeline and audit emphasis
- status and risk indicators
- calm but serious color language

Avoid:

- hiding actions inside generic dropdowns
- decorative dashboards replacing work surfaces

## Preset E: Configuration Workspace

Use when the user says:

- 配置
- 映射
- 模板
- 版本

Traits:

- grouped form sections or split workspace
- sticky action bar
- validation state visibility
- version and audit visibility
- form density handled through grouping

Avoid:

- giant ungrouped forms
- burying validation and publish actions

## Preset F: Blue Dusk Admin

Use when the user says:

- 蓝色忧郁
- 冷一点
- 不要太土
- 偏蓝灰
- 想要克制一点

Traits:

- low-saturation blue-gray palette
- medium information density
- calm enterprise-admin temperament
- soft glassy or misty surfaces used sparingly
- charts and cards kept restrained
- ledger or governance-console feel

Avoid:

- neon blue
- loud gradients
- dashboard cockpit visuals
- overly playful rounded consumer-app styling
# Image To Style Rules

Use this file when the user provides screenshots or reference images.

## Goal

Do not copy the reference literally.

Extract reusable style signals and turn them into implementable frontend rules.

## What to inspect

For each image, inspect:

- background brightness
- navigation layout
- spacing density
- card borders vs shadows
- table density
- form density
- primary accent color
- radius strength
- chart temperament

## What to output

After inspecting the images, summarize:

- what to borrow
- what not to borrow
- what to convert for enterprise admin use

## Example transformation

If the reference image has:

- large gradient hero
- oversized cards
- low information density

and the target is admin backend:

- borrow the color restraint if useful
- do not borrow the hero layout
- compress spacing
- convert cards into tables or practical panels

## Safety rule

If an image is visually attractive but structurally bad for enterprise admin work, say so clearly and only borrow the useful parts.

## Output shape

```md
Image Style Summary
- Borrow:
- Do not borrow:
- Convert for admin use:

Visual Decision Card
- Style keywords:
- Palette direction:
- Density:
- Navigation:
- Table/Form treatment:
- Do not do:
```

## Validation

# Validation Checklist

Use this after running the skill on a real prompt.

## Output quality

- Did the output classify the scene correctly as `admin`, `marketing`, or `mixed`?
- When style was mentioned, did it first produce a visual decision card?
- Did it produce a route tree before large code output?
- Did it identify reusable page archetypes?
- Did it keep the visual direction aligned with enterprise admin norms?
- Did it avoid drifting into one-off demo styling?

## Reusability

- Can the scaffold or page structure be reused on another admin project with minimal changes?
- Are component boundaries reusable rather than domain-named one-offs?
- Are request, mock, and type layers clearly separated?
- Can backend APIs be connected later without rewriting page composition?

## Skill health

- Did the result reveal a missing instruction in the skill?
- Did the result reveal an over-specific instruction that should be generalized?
- Did the result depend on unstated assumptions that should be added to the prompt templates?
- Did the result require repeated manual correction in the same area?
- Did the skill translate plain-language visual intent into implementable visual rules without needing design jargon from the user?

## Action after review

If the trial mainly exposed a local page issue, fix the sample.

If the trial exposed a recurring workflow issue, update the skill.
# Validation Rubric

Use this rubric after each validation scenario.

## Scoring method

For each dimension, score:

- `2`: solid
- `1`: partial
- `0`: weak or missing

Total score:

- `10-12`: usable baseline
- `7-9`: promising but needs refinement
- `0-6`: skill instructions need rework before further expansion

## Dimension 1: Structure first

Check whether the output produced:

- product goal
- route tree
- page map

before jumping into code or visual detail.

## Dimension 2: Archetype mapping

Check whether the output correctly mapped routes to reusable admin page archetypes such as:

- list
- detail
- form
- dashboard
- review queue

## Dimension 3: Enterprise admin fit

Check whether the output stayed aligned with enterprise admin norms:

- clear information hierarchy
- obvious filter/search zones
- restrained visual style
- no decorative cockpit drift

If style was requested, also check whether the visual decision card translated plain-language intent into concrete choices.

## Dimension 4: Reusable components

Check whether the component list is reusable across projects, for example:

- `FilterBar`
- `DataTable`
- `DetailDrawer`
- `ActionBar`
- `AuditTimeline`

Weak score signs:

- too many domain-specific component names
- page-level one-offs disguised as reusable components

## Dimension 5: Front/back-end separation

Check whether the output preserved:

- service layer boundary
- mock/data adapter boundary
- clear future API docking points

## Dimension 6: Scaffoldability

Check whether the result can naturally continue into:

- project scaffold
- route files
- shared layout
- base business components

If the output is interesting but hard to continue into code, score this low.

## After scoring

If one dimension repeatedly scores `0` or `1` across scenarios, update the skill references or prompt templates before testing more samples.
# Validation Scenarios

Use these as standard repeatable prompts to test the skill itself.

The goal is not to produce the final business system. The goal is to see whether the skill can reliably convert short business requests into stable enterprise frontend outputs.

## Scenario 1: List management

### Purpose

Tests whether the skill can reliably generate a classic management backend centered on list, filter, detail, and batch operations.

### Prompt

```text
把下面这个需求当成一次 skill 验证样本，而不是单次项目交付。
请按 React-first 企业中后台流程输出：
1. 产品目标
2. 路由树
3. 页面原型
4. 页面模式归类
5. 组件清单
6. 后续脚手架建议

需求：
做一个商户管理后台。
主要给运营和风控使用。
需要商户列表、筛选、标签管理、详情查看、批量冻结、操作记录。
风格偏企业中后台，不要做成大屏驾驶舱。
先出原型，不接后端。
```

### What this should expose

- list page archetype quality
- filter zone completeness
- detail page structure
- batch action awareness
- operation log and traceability awareness

## Scenario 2: Configuration form

### Purpose

Tests whether the skill can generate a configuration-heavy admin system instead of only table pages.

### Prompt

```text
把下面这个需求当成一次 skill 验证样本，而不是单次项目交付。
请按 React-first 企业中后台流程输出：
1. 产品目标
2. 路由树
3. 页面原型
4. 页面模式归类
5. 组件清单
6. 后续脚手架建议

需求：
做一个渠道接入配置后台。
主要给实施和配置运营使用。
需要渠道列表、渠道新增、字段映射、模板配置、版本管理、启停控制、变更记录。
页面会有很多表单和配置项。
先出原型，不写后端。
```

### What this should expose

- form page archetype quality
- grouped field design
- configuration information density control
- versioning and audit awareness
- action bar and validation thinking

## Scenario 3: Review queue

### Purpose

Tests whether the skill can produce approval and review workflows instead of plain CRUD pages.

### Prompt

```text
把下面这个需求当成一次 skill 验证样本，而不是单次项目交付。
请按 React-first 企业中后台流程输出：
1. 产品目标
2. 路由树
3. 页面原型
4. 页面模式归类
5. 组件清单
6. 后续脚手架建议

需求：
做一个资质审核后台。
主要给审核员和主管使用。
需要待审核队列、审核详情、材料预览、风险标签、审核意见、驳回原因、审批历史。
要求结构清晰，强调效率和可追溯。
先出原型，不接后端。
```

### What this should expose

- review queue archetype quality
- drawer or side panel decisions
- audit trail awareness
- action priority clarity
- detail and queue split quality

## Recommended test order

1. `Scenario 1`
2. `Scenario 2`
3. `Scenario 3`

Reason:

- first validate the most common list management case
- then validate form-heavy configuration complexity
- finally validate workflow-heavy approval complexity

## Install Notes

# Install Notes

## Codex

- Generated adapter path: `adapters/codex/`
- Install target: `~/.codex/skills/frontend-react-rapid-delivery`
- Preferred install mode: symlink

## Claude Code

- Generated adapter path: `adapters/claude/CLAUDE.md`
- Install target: target project root `CLAUDE.md`
- Preferred install mode: symlink
- For team use, keep the repository outside project code and link the adapter into the project

## Cursor

- Generated adapter path: `adapters/cursor/`
- Install targets:
  - `.cursor/rules/frontend-react-rapid-delivery.mdc`
  - fallback `AGENTS.md`
- Preferred install mode: symlink

## Repository policy

- Edit `core/` and `skill.yaml`
- Regenerate `adapters/` with `./scripts/build`
- Do not treat generated adapters as the primary source of truth
