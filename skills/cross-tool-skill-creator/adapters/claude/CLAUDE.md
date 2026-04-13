# Cross Tool Skill Creator

Create platform-agnostic skill source content that can be adapted to Codex, Claude Code, and Cursor.

## Intent

# Intent

This skill is for creating new skills in the `skills-repo` format.

## Use it for

- defining new cross-tool skills
- converting a rough idea into `core/` source files
- normalizing skill drafts from Claude Code or project notes
- enforcing repository structure before adapter generation
- helping team members write reusable skill source content

## Default assumptions

- `core/` is the source of truth
- adapters are generated artifacts
- the goal is cross-tool reuse, not one-platform optimization first
- examples are validation samples, not permanent structure

## Typical outputs

- `skill.yaml`
- `core/intent.md`
- `core/workflow.md`
- `core/prompts.md`
- `core/patterns.md`
- `core/style.md` when relevant
- `core/validation.md`
- `core/install-notes.md`

## Workflow

# Workflow

## Standard flow

1. Understand the requested capability and confirm it is skill-worthy.
2. Collect the minimum creation inputs:
   - skill id
   - display name
   - one-line summary
   - whether style rules are needed
3. Call `./scripts/create-skill <skill-id> <display-name> <summary> [--style yes|no]`.
4. Open the generated starter files under `skills/<skill-id>/core/`.
5. Replace the starter TODO blocks with real reusable source content.
6. Re-run `./scripts/build <skill-id>` after refinement.
7. Re-run `./scripts/doctor <skill-id>` and report readiness.

## Skill-worthiness check

Create a skill when at least one of these is true:

- the workflow is repeated often
- the workflow has non-obvious steps or decision rules
- the team needs consistent outputs across projects
- adapters or tooling differ by platform but the core knowledge is shared

Do not create a skill when the content is just a one-off project note.

## Orchestration rule

Do not ask the user to create files manually when the repository scripts can do it.

Prefer this order:

1. call `create-skill`
2. refine generated `core/*.md`
3. rebuild
4. doctor check

## Output contract

When helping create a new skill, produce in this order:

1. creation inputs
2. confirmation that `create-skill` should be called
3. refined `core/*.md` content
4. validation scenarios
5. readiness summary

## Prompts

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

## Patterns

# Patterns

## File-by-file responsibility

### intent.md

Write:

- what the skill is for
- use cases
- boundaries
- default assumptions
- typical outputs

Avoid:

- long tool-specific syntax
- adapter instructions

### workflow.md

Write:

- the stable process
- ordering rules
- key decision points
- output contract

Avoid:

- lots of examples with no procedural value

### prompts.md

Write:

- user input templates
- short prompts that can be copied directly
- intake templates for rough drafts or imports

### patterns.md

Write:

- reusable patterns
- archetypes
- classification rules
- common structures or decomposition rules

### style.md

Only use when the skill needs visual intake, visual presets, image interpretation, or design constraints.

### validation.md

Write:

- test scenarios
- scoring criteria
- pass/fail or rubric rules

### install-notes.md

Write:

- adapter differences
- install targets
- repository policy for source vs generated files

## Cross-tool writing rule

If a rule is only true for one platform, it does not belong in the main core files unless you clearly mark it as install or adapter guidance.

## Example rule

Good:

- `produce a visual decision card before page prototype when style matters`

Bad:

- `put this section under CLAUDE.md exactly like this`

## Style

# Style

Most skills do not need `style.md`.

Create `style.md` only if the skill depends on:

- visual direction
- style translation from plain language
- reference-image interpretation
- output aesthetics or design constraints

If the skill is not visual in nature, omit style-specific complexity and keep the file minimal.

## If style is needed

Keep it reusable:

- visual intake rules
- presets
- translation of plain-language style requests
- image-to-style extraction rules

Do not fill `style.md` with project-specific brand details unless the skill is explicitly brand-bound.

## Validation

# Validation

## Minimum checklist

A new skill passes minimum quality only if:

- `skill.yaml` is complete
- all required `core/` files exist
- core files are platform-agnostic
- at least one validation scenario exists
- adapter generation can happen without rewriting the core files

## Review questions

- Is the skill solving a repeatable problem?
- Is the source content reusable across projects?
- Did we accidentally mix platform adapter content into core files?
- Are examples short and clearly subordinate to the rules?
- Could another teammate maintain this skill without asking the original author?

## Suggested validation scenarios

- ideal input scenario
- vague input scenario
- imported rough-draft scenario

## Failure conditions

Refine the source content before build if:

- the skill is really just a project note
- core files duplicate one another heavily
- prompts are too vague to be reusable
- the workflow depends on one tool's syntax

## Install Notes

# Install Notes

## Purpose

This skill is a repository maintainer skill. It should orchestrate repository scripts instead of asking teammates to create files manually.

## Repository policy

- call `./scripts/create-skill` for new skills
- edit `core/` and `skill.yaml`
- do not treat generated adapters as the primary source
- run `./scripts/build <skill-id>` after edits
- run `./scripts/doctor <skill-id>` before marking the skill ready

## Team usage

Recommended sequence:

1. `./scripts/create-skill <skill-id> <display-name> <summary>`
2. use this meta skill to replace the starter TODO blocks
3. review and adjust `catalog.yaml` if needed
4. `./scripts/build <skill-id>`
5. `./scripts/doctor <skill-id>`
