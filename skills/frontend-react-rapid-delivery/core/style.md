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
