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
