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
