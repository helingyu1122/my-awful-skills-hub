# Admin Patterns

## Purpose

Use these patterns to avoid reinventing enterprise admin pages for every request.

## Core page archetypes

### 1. List page

Use when the task is management, querying, operation, reconciliation, or reporting entry.

Default structure:

- page title
- filter/search area
- summary strip when useful
- data table
- row actions
- batch actions
- pagination

### 2. Detail page

Use when the task is record inspection, drill-down, or traceability.

Default structure:

- primary summary card
- status and key identifiers
- tabs or grouped sections
- timeline or operation log
- related records

### 3. Form page

Use when the task is create/edit/configure/submit.

Default structure:

- concise guidance area
- grouped fields
- inline validation
- sticky action bar
- change history when needed

When the page is configuration-dense, explicitly decide one of these layouts:

- grouped form sections
- tabbed configuration
- step form
- split workspace with left source panel and right configuration panel

If versioning or publishing is involved, also surface:

- draft state
- validation state
- publish action
- rollback or compare entry

### 4. Dashboard page

Use when the task is monitoring, governance, or executive overview.

Default structure:

- filter area
- KPI cards
- one or two main trend charts
- ranking or distribution panels
- action-oriented alerts

Do not turn dashboards into decorative cockpits unless the user explicitly wants that style.

### 5. Review queue page

Use when the task is approval, review, audit, or exception handling.

Default structure:

- queue filters
- result table
- detail drawer or side panel
- audit information
- explicit next actions

Also consider:

- assignee
- SLA or timeout marker
- priority marker
- reason selector for reject/return actions
- material preview strategy

## Layout defaults

For enterprise admin systems, prefer:

- left navigation or top navigation with clear hierarchy
- shallow visual hierarchy
- white or light neutral surfaces
- dense but readable tables
- restrained color usage focused on state and alerts

## Component defaults

Map archetypes to reusable components:

- list page -> `FilterBar`, `SummaryStrip`, `DataTable`
- detail page -> `ProfileCard`, `InfoGrid`, `Timeline`
- form page -> `SectionForm`, `FieldRow`, `ActionBar`
- dashboard page -> `MetricCard`, `TrendPanel`, `RankingPanel`, `AlertList`
- review queue -> `QueueTable`, `DetailDrawer`, `AuditPanel`

## Decision rule

When a request contains multiple page types, identify the primary archetype for each route before designing visuals or code.
# Scaffold Standards

## Default workspace layout

```text
frontend-app/
  package.json
  pnpm-workspace.yaml
  apps/
    admin-web/
  packages/
    ui/
    tokens/
    utils/
    api-contract/
```

If the request is small, a single-app layout is acceptable:

```text
src/
  app/
  pages/
  components/
  features/
  services/
  hooks/
  types/
  styles/
  mocks/
```

## Recommended page/module split

- `app`: providers, router, bootstrapping
- `pages`: route-level pages
- `features`: business modules
- `components`: shared UI pieces
- `services`: API access and adapters
- `mocks`: fixture data and mock handlers

## Styling rules

- use tokens for color, spacing, radius, and typography
- keep utility classes readable and composable
- extract repeated UI patterns into components early
- avoid random one-off CSS blocks for each page

## Component layers

1. `primitive`
2. `shared component`
3. `business component`
4. `page composition`

Example:

- primitive: button, dialog, input
- shared component: data-table, search-form, stat-card
- business component: order-status-timeline, approval-panel
- page composition: order list page

Naming rule:

- prefer reusable names at the `shared component` layer, such as `DataTable`, `FilterBar`, `SummaryStrip`
- allow domain-specific names only at the `business component` or `page composition` layer
- avoid treating domain-specific tables or panels as globally reusable components

## State rules

- remote data: `TanStack Query`
- form state: `React Hook Form`
- validation: `Zod`
- local UI state: `useState` first

Only add a global store when there is real cross-page client state that does not belong to the server cache.

## Quality gates

Minimum:

- type check passes
- build passes
- unit/component tests for shared critical parts
- one Playwright smoke test for major flows

Preferred:

- Storybook stories for reusable business components
- visual review of core pages before API integration

## Naming rules

- use business language, not vague UI names
- routes and feature folders should map to modules the business can recognize
- avoid folders like `misc`, `common2`, `temp-ui`

## Deliverable checklist

When generating a scaffold or page code, make sure the output includes:

- route structure
- layout structure
- reusable component candidates
- request layer placeholders
- mock strategy
- test entry points
- clear follow-up docking points for backend APIs
