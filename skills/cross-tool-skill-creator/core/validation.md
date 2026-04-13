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
