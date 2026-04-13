# skills-repo

A team-shared, GitHub-backed skills repository for cross-tool installation into Codex, Claude Code, and Cursor.

## Goals

- Keep one platform-agnostic core source of truth per skill.
- Generate adapter artifacts for Codex, Claude Code, and Cursor.
- Let team members install or update skills with one command after `git pull`.
- Support ingesting a Claude Code draft back into the repository for normalization.
- Support one-command creation of a new starter skill package.

## Repository layout

```text
skills-repo/
  README.md
  catalog.yaml
  docs/
    skill-format.md
  skills/
    <skill-id>/
      skill.yaml
      core/
      adapters/
  scripts/
    build
    create-skill
    install
    update
    doctor
    ingest-claude
    init-skill
```

## Main workflow

1. Create a new starter package with `./scripts/create-skill`.
2. Use `cross-tool-skill-creator` to replace the starter TODO content with real reusable source content.
3. Run `./scripts/build <skill-id>` to regenerate adapters after edits.
4. Install into the target tool with `./scripts/install`.
5. Team members update with `git pull && ./scripts/update <tool> <skill-id>`.

## Commands

```bash
./scripts/create-skill api-error-triage "API Error Triage" "Diagnose recurring backend API failures." --style no
./scripts/build frontend-react-rapid-delivery
./scripts/install codex frontend-react-rapid-delivery
./scripts/install claude frontend-react-rapid-delivery --project /path/to/project
./scripts/install cursor frontend-react-rapid-delivery --project /path/to/project
./scripts/update codex frontend-react-rapid-delivery
./scripts/doctor frontend-react-rapid-delivery
./scripts/ingest-claude /path/to/project/CLAUDE.md frontend-react-rapid-delivery
./scripts/init-skill my-new-skill "My New Skill"
```

## Installation model

- `codex`: symlink the generated adapter folder into `~/.codex/skills/<skill-id>`.
- `claude`: symlink the generated adapter `CLAUDE.md` into the target project root.
- `cursor`: symlink generated `.mdc` rules into the target project's `.cursor/rules/` and also install a fallback `AGENTS.md`.

## Notes

- `core/` is the source of truth. Do not hand-edit generated `adapters/` unless debugging the generator.
- `create-skill` creates a valid starter package and updates `catalog.yaml`, but it intentionally leaves domain-specific TODO blocks for the meta skill or maintainer to refine.
- `ingest-claude` currently stages imported Claude content under `core/imports/` for manual normalization instead of attempting lossy auto-parsing.
