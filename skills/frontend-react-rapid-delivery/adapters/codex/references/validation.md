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
