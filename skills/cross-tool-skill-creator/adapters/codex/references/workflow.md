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
