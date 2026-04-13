# Workflow

## Standard flow

Use this flow when the user wants speed and reuse from short prompts.

1. Interpret the business request.
2. Convert it into a frontend-facing brief.
3. Convert visual input into a visual decision card when needed.
4. Produce a prototype summary before heavy coding.
5. Confirm or revise the prototype.
6. Generate scaffold or page code.
7. Leave clear API docking points for later backend integration.
8. Evaluate the result against the validation checklist and feed learnings back into the skill.

## Frontend-facing brief

From a short business request, derive:

- user roles
- page modules
- main entities
- core actions
- high-risk interactions
- permission-sensitive areas
- table-heavy vs form-heavy vs dashboard-heavy ratio
- whether the workflow contains `draft`, `validate`, `publish`, `rollback`, or `audit` states
- whether the workflow contains `assignment`, `SLA`, `timeout`, `review action`, or `material preview` states

## Visual intake

If the user expresses style in plain language, example products, or images, normalize it before prototyping.

Translate inputs such as:

- `稳重`
- `像飞书后台`
- `不要太丑`
- `高级一点`
- `参考这张图`

into a visual decision card with:

- style keywords
- density level
- navigation style
- surface style
- table and form treatment
- chart temperament
- forbidden visual traits

## Prototype output contract

Before writing a lot of code, produce:

- one-sentence product goal
- visual decision card when style matters
- page map
- route tree
- page archetype mapping
- each page's purpose
- key components
- key interactions
- design tone

When listing components, split them into:

- shared reusable components
- business assembly components

This reduces accidental overfitting to one domain.

## Visual decision card contract

When included, keep it compact and concrete.

Recommended fields:

- `style keywords`
- `reference feel`
- `palette direction`
- `typography tone`
- `density`
- `navigation choice`
- `table/form style`
- `chart style`
- `do not do`

Example shape:

```md
Goal: Build an operations dashboard for merchant onboarding.

Routes:
- /dashboard
- /merchants
- /merchants/:id
- /approvals

Pages:
- Dashboard: KPI cards + trend charts + pending queue
- Merchants: filterable table + bulk actions
- Merchant Detail: profile, risk notes, operation log
- Approvals: review queue + detail drawer
```

## Code generation order

Generate in this order unless the user requests otherwise:

1. app shell
2. routes
3. shared layout
4. token file and theme rules
5. base business components
6. page skeletons
7. mock service layer
8. tests for critical pages

## API separation rules

Keep front/back-end separation explicit:

- isolate request clients under `src/services`
- isolate types under `src/types` or generated contracts
- never spread raw fetch logic across pages
- keep mock data and live API adapters swappable

Preferred request split:

- `services/http`
- `services/modules/*`
- `mocks/*`

## Prototype-first rule

When the prompt is vague, do not jump straight into polished code. First create a compact prototype plan. This reduces churn and makes later code generation more stable.

## Reuse-first rule

Do not treat each request as a brand-new design exercise. First map the request to reusable archetypes such as:

- list + filters + bulk actions
- detail + tabs + timeline
- form + steps + validation
- dashboard + KPI + trend + ranking
- review queue + drawer + audit log

Only add custom structures when the archetypes do not cover the need.

## Admin system defaults

For admin pages, prefer:

- clear information density
- obvious filter and search zones
- stable table behavior
- detail drawers and modals used sparingly
- action grouping by task priority

For users without design background, prefer to explain visual choices in plain language instead of abstract design jargon.

For configuration-heavy pages, additionally check:

- should the page use grouped sections, tabs, steps, or split workspace layout
- where draft save, validation, publish, and rollback actions belong
- whether change logs and version history are first-class pages rather than afterthoughts

For review-queue pages, additionally check:

- whether assignee, SLA, timeout, and priority should appear in the queue
- whether review actions belong in a side panel, sticky footer, or dedicated action block
- whether material preview should be inline, in a drawer, or on a dedicated route

Avoid:

- decorative layout noise
- oversized hero sections
- animation-heavy interactions
- consumer-app visual tropes

## Trial output review

After a prototype or sample page is generated, evaluate:

- Did it stay within enterprise admin conventions?
- Did it produce a route tree and page map before code?
- Did it use reusable page archetypes instead of one-off compositions?
- Did it keep front/back-end separation explicit?
- Did it leave a scaffold path that can be repeated on the next project?

If the answer is no, refine the skill instructions before refining the sample again.

## Marketing page exception

If the user explicitly asks for a marketing or content page:

- allow stronger visual direction
- allow richer typography and backgrounds
- consider SSR/SSG only if SEO is a real goal

Do not let this override the default admin baseline for the whole skill.
