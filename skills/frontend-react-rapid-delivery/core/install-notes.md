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
