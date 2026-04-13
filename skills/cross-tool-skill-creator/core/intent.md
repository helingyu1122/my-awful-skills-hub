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
