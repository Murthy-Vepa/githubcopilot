# SpecKit Guide — Spec-Driven Development
## Complete Walkthrough

---

## What is SpecKit?

SpecKit is a lightweight, file-based specification framework that sits between a user story and code. Instead of developers interpreting vague requirements on the fly, SpecKit forces requirements into a structured format that:

1. **Agents can execute** — every task has an owner, dependencies, and traceability
2. **Humans can review** — structured enough to spot gaps before code is written
3. **QA can verify** — every test can trace back to a REQ-XXX requirement
4. **PRs self-document** — spec files travel with the code in the same commit

SpecKit is not a heavyweight methodology. It's three files and four quality gates.

---

## The Three Files

### 1. `spec.md` — What to build

The specification document. Written by the Planner agent with human review. Contains:

- **Feature name and summary** — one paragraph max
- **Requirements** — numbered `REQ-001`, `REQ-002`… with clear acceptance criteria
- **Out of scope** — explicit exclusions (critical for preventing scope creep)
- **Open questions** — unresolved decisions that block implementation

**Format rules:**
- Every requirement must be independently verifiable (can you write a test for it?)
- Acceptance criteria must be specific: "Returns 200 with CSV attachment" not "Works correctly"
- Out-of-scope items are as important as in-scope items

**Example:**
```markdown
# Feature: CSV Export for TodoItems

## Summary
Users can export all their todo items as a downloadable CSV file from the Index page.

## Requirements

REQ-001: Users can trigger a CSV export from the Index page via an "Export CSV" button.
  - Acceptance: A button labelled "Export CSV" appears on the Index page above the table.
  - Acceptance: Clicking the button initiates a file download.

REQ-002: The exported CSV contains all todo items with columns: ID, Title, IsComplete, CreatedAt.
  - Acceptance: CSV file has header row: id,title,is_complete,created_at
  - Acceptance: Every item in the database appears in the export.

REQ-003: The download filename is todos-{YYYY-MM-DD}.csv where the date is today.
  - Acceptance: Response Content-Disposition header includes the dated filename.

## Out of Scope
- Filtering items before export
- Excel (.xlsx) format
- Scheduled/automated exports

## Open Questions
- Q1: Should completed todos be included? [RESOLVED: yes, all todos]
- Q2: Date format for CreatedAt? [RESOLVED: ISO 8601]
```

---

### 2. `plan.md` — How to build it

The implementation plan. Written by the Planner agent after the spec is approved. Contains:

- **Phases** — logical groupings of work (Backend, Frontend, Tests)
- **Steps** — numbered, each linked to one or more `REQ-XXX` IDs
- **Technical notes** — key implementation decisions, patterns to follow

**Format rules:**
- Every REQ-XXX must appear in at least one step (this is validated by Gate 2)
- Steps must be small enough to be a single Git commit
- Each step should reference the file(s) to change

**Example:**
```markdown
# Implementation Plan: CSV Export

## Phase 1: Service Layer
1. Add `ExportTodosAsCsvAsync()` to `ITodoService` and `TodoService` [REQ-002]
   - Returns `byte[]` or `Stream`
   - Columns: id,title,is_complete,created_at (ISO 8601)
   
2. Write unit tests for `ExportTodosAsCsvAsync` [REQ-002]

## Phase 2: Controller/Page
3. Add `/todos/export` route to Index page handler [REQ-001, REQ-003]
   - Returns `FileContentResult` with `text/csv` content type
   - Content-Disposition: attachment; filename=todos-YYYY-MM-DD.csv

## Phase 3: UI
4. Add "Export CSV" button to `Index.cshtml` above the table [REQ-001]
   - Standard Bootstrap button style matching existing buttons

## Phase 4: Integration Tests
5. Add integration test: GET /todos/export returns 200 with text/csv [REQ-001, REQ-003]
6. Add integration test: exported CSV contains all seeded items [REQ-002]
```

---

### 3. `tasks.json` — What each agent does

The executable task list. Generated from `plan.md` by the Planner agent. This file is what the Orchestrator reads to dispatch work.

**Required fields per task:**
- `id` — unique identifier (T-001, T-002…)
- `title` — imperative verb + description
- `agent` — which agent executes this (coder, tester, reviewer…)
- `reqs` — array of REQ-XXX IDs this task satisfies
- `depends` — task IDs that must complete before this starts
- `status` — `not-started` | `in-progress` | `completed` | `failed`

**Example:**
```json
[
  {
    "id": "T-001",
    "title": "Add ExportTodosAsCsvAsync to ITodoService and TodoService",
    "agent": "coder",
    "reqs": ["REQ-002"],
    "depends": [],
    "status": "not-started"
  },
  {
    "id": "T-002",
    "title": "Add /todos/export route to IndexModel",
    "agent": "coder",
    "reqs": ["REQ-001", "REQ-003"],
    "depends": ["T-001"],
    "status": "not-started"
  },
  {
    "id": "T-003",
    "title": "Add Export CSV button to Index.cshtml",
    "agent": "coder",
    "reqs": ["REQ-001"],
    "depends": ["T-002"],
    "status": "not-started"
  },
  {
    "id": "T-004",
    "title": "Write unit tests for ExportTodosAsCsvAsync",
    "agent": "tester",
    "reqs": ["REQ-002"],
    "depends": ["T-001"],
    "status": "not-started"
  },
  {
    "id": "T-005",
    "title": "Write integration tests for CSV export endpoint",
    "agent": "tester",
    "reqs": ["REQ-001", "REQ-003"],
    "depends": ["T-002"],
    "status": "not-started"
  }
]
```

---

## The Four Quality Gates

Quality gates are checkpoints that block progression until criteria are met. They prevent the classic failure mode: discovering at PR review time that the feature doesn't match the requirements.

### Gate 1 — Spec Quality (before plan.md)
**Question:** Is the spec specific enough to implement?

**Checklist:**
- [ ] Every REQ-XXX has at least one acceptance criterion that can be tested
- [ ] No ambiguous language: "works correctly", "handles errors", "is fast"
- [ ] Out-of-scope section is non-empty
- [ ] Open questions are resolved or explicitly deferred

**Who approves:** Human (you) — read the spec and sign off before the planner writes plan.md

**How to invoke:**
```
@workspace run quality gate on spec at .github/specs/csv-export/spec.md — check Gate 1 criteria
```

---

### Gate 2 — Spec→Plan Coverage (before tasks.json)
**Question:** Does the plan address every requirement?

**Checklist:**
- [ ] Every REQ-XXX appears in at least one plan step
- [ ] No plan steps without a REQ-XXX citation
- [ ] Test steps present for each requirement
- [ ] Technical approach is consistent with constitution.md

**Who approves:** Automated (Planner agent checks coverage) then human review

---

### Gate 3 — Plan→Task Decomposition (before coding starts)
**Question:** Is tasks.json complete and executable?

**Checklist:**
- [ ] Every plan step has a corresponding task(s)
- [ ] Dependency graph is acyclic (no circular dependencies)
- [ ] Agent assignments are appropriate for each task type
- [ ] Tasks are small enough (< 1 day of work each)

**Who approves:** Automated (Orchestrator validates before dispatching)

---

### Gate 4 — Completeness (before PR opens)
**Question:** Is everything done?

**Checklist:**
- [ ] All tasks have `status: "completed"`
- [ ] All tests pass (`dotnet test`)
- [ ] Code review complete
- [ ] Security review passed
- [ ] Documentation updated

**Who approves:** Human (PR review) — the orchestrator opens the PR only after this gate passes

---

## File Locations

```
.github/
└── specs/
    └── csv-export/           ← one folder per feature
        ├── spec.md
        ├── plan.md
        └── tasks.json
```

Name the folder after the feature slug (kebab-case). This makes specs browseable in GitHub.

---

## Step-by-Step Walkthrough: CSV Export Feature

### Step 1: Write the user story
```
As a TodoApp user, I want to export all my todos to CSV so I can open them in Excel.
```

### Step 2: Invoke the Planner
```
@planner "Add CSV export to the TodoApp. Users should be able to download all their todos as a CSV file from the Index page."
```

The planner will:
1. Ask clarifying questions (filename format? filtering? encoding?)
2. Write `spec.md` with REQ-XXX requirements
3. Wait for your approval (Gate 1)

### Step 3: Approve the spec
Read `spec.md`. Check:
- Does it capture everything you asked for?
- Is anything missing or wrong?
- Is the out-of-scope section accurate?

Reply "approved" or provide corrections.

### Step 4: Planner writes plan.md
After spec approval, the planner writes the implementation plan. Review:
- Every REQ-XXX is addressed
- Technical approach is sensible (uses our patterns, not reinventing wheels)

### Step 5: Planner generates tasks.json
After plan approval, the planner decomposes into tasks. Scan the JSON:
- Dependencies look correct?
- Agent assignments make sense?

### Step 6: Hand off to Orchestrator
```
@orchestrator execute tasks.json at .github/specs/csv-export/tasks.json
```

The orchestrator takes it from here — dispatching to coder, tester, reviewer, security, doc-writer.

### Step 7: Human Gate — Approve PR
When all gates pass, the orchestrator opens a PR. Review it in GitHub. All agent reports are in the PR description. Merge when satisfied.

---

## constitution.md — The Foundation

Before running SpecKit, ensure `.github/memory/constitution.md` exists. This file defines:
- Technology stack
- Folder structure conventions
- Naming rules
- Forbidden patterns
- Security requirements

Every agent reads this file before acting. It ensures that no matter which agent writes code, it follows the same standards.

**Generate it automatically:**
```
@constitution-generator "scan this repo and generate constitution.md"
```

---

## Common Mistakes

| Mistake | Why it happens | Fix |
|---------|---------------|-----|
| Vague requirements | "Users can export data" | Add acceptance criteria: specific columns, formats, responses |
| No out-of-scope section | Forgot | Always add — it prevents feature creep |
| REQ-XXX not in plan | Missed requirement | Run Gate 2 check before approving plan |
| Tasks too large | "Implement the whole feature" | Split: one task = one file or one method |
| Missing test tasks | Forgot testing | Every code task needs a paired test task |

---

## Quick Reference

```
User story 
  → @planner → spec.md
     → Gate 1 (human)
       → plan.md  
          → Gate 2 (automated + human)
            → tasks.json
               → Gate 3 (automated)
                 → @orchestrator dispatches agents
                    → Gate 4 (human PR review)
                       → Merged ✓
```
