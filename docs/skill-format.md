# Skill Format

Each skill keeps one platform-agnostic source of truth under `core/` and one or more generated platform adapters under `adapters/`.

## Fast creation path

Use this sequence:

1. `./scripts/create-skill <skill-id> <display-name> <summary>`
2. refine the starter `core/*.md` files with `cross-tool-skill-creator`
3. run `./scripts/build <skill-id>`
4. run `./scripts/doctor <skill-id>`

## Required files

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
name: Frontend React Rapid Delivery
version: 0.1.0
summary: React-first enterprise frontend workflow
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

## Core design rules

- `core/` stores platform-neutral knowledge and workflow.
- `adapters/` are generated artifacts.
- Platform-specific phrasing belongs in the adapter template or build script, not in the core files.
- Team edits should prefer `core/` and `skill.yaml`.
- `create-skill` can generate a starter package, but real reusable content still needs refinement.
