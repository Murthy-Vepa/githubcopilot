# Video Script 04 — Plans, Tasks & Quality Gates: From Spec to Execution
## AI-Assisted Development & Spec-Driven Development Video Series · GitHub Copilot Mastery · MetLife 2026

**Format:** 2 co-hosts · VS Code screen share · ~14 minutes
**Hosts:** Jordan (male, US English) · Maya (female, US English)
**Target audience:** Developers who have a spec and need to turn it into executable, agent-ready work
**Screen setup:** VS Code · `spec.md` (finished from Video 3) · `plan.md` being written live · quality gate checklist visible

---

## PRE-SHOW SETUP CHECKLIST
- [ ] VS Code open · the finished `spec.md` from the CSV export example
- [ ] Empty `plan.md` ready to write
- [ ] A `tasks.json` skeleton available to show as the machine-readable format
- [ ] Quality gate checklist graphic (4 gates, each with pass/fail criteria)
- [ ] Terminal available for the "run tests against REQ-IDs" demo

---

## [00:00 – 00:55] COLD OPEN

*[JORDAN on screen — the finished spec.md is open on the left, a blank plan.md is open on the right]*

**JORDAN:** You've written the spec. Four requirements, each with a Given-When-Then acceptance criterion. Non-goals section. Open questions with owners. Gate One passed — a human reviewed it and signed off.

*[Reads from spec.md: "REQ-001, REQ-002, REQ-003, REQ-004"]*

**JORDAN:** Now what? "Implement it" isn't a prompt. "Implement it" with no plan produces vibe-coded output. We need structure between the spec and the code.

*[Types in the blank plan.md:]*
```markdown
# Plan: CSV Export for Dashboard Todos
```

**JORDAN:** This is `plan.md`. The bridge from *what* to *how*. Four requirements in the spec will become a sequence of implementation steps. Each step traces back to a REQ-ID. Each step has a "done when" criterion so the agent knows when to stop.

**MAYA:** *(voice-over)* The plan is what makes the spec executable.

**JORDAN:** *(on camera)* I'm Jordan.

**MAYA:** *(on camera — split)* I'm Maya. Video Four — plans, tasks, and quality gates. Let's build.

*[TITLE CARD: "Plans, Tasks & Quality Gates" | Module 3]*

---

## [00:55 – 03:15] WRITING PLAN.MD — THE STRUCTURE

*[MAYA on screen — writing plan.md from the CSV export spec]*

**MAYA:** A plan is a sequence of implementation steps organized by phase. Bottom-up by dependency: the innermost layer first — services — then the API layer, then the UI, then tests.

**MAYA:** Let me build this plan for our CSV export feature. The spec has four requirements. I'll map each to one or more plan steps.

*[Types:]*
```markdown
## Phase 1 — Service Layer

### Step 1: Add exportTodosAsCsvAsync to TodoService
- **REQ:** REQ-002, REQ-003
- **Description:** Implement `exportTodosAsCsvAsync(userId: string)` that queries
  all active todos for the user and returns a Buffer containing a valid CSV string.
  Columns in order: Title, Description, Priority, Due Date, Status.
- **Done when:** Method returns a Buffer. Running
  `await exportTodosAsCsvAsync('test-user-id')` in a test returns a Buffer
  where the first line is `Title,Description,Priority,Due Date,Status`.
- **Estimated time:** 1.5 hours

### Step 2: Unit test exportTodosAsCsvAsync
- **REQ:** REQ-002, REQ-003
- **Depends on:** Step 1
- **Description:** Write unit tests covering: (a) user with multiple todos exports
  all of them, (b) empty todo list exports header row only, (c) column order
  matches spec exactly.
- **Done when:** `npm test -- --grep exportTodosAsCsvAsync` passes with 3 tests green.
- **Estimated time:** 1 hour
```

**JORDAN:** *(voice-over)* Notice the structure. Every step has: the REQ-IDs it satisfies, a description, a "done when" criterion, and an estimated time. And Step 2 explicitly depends on Step 1. That dependency matters for agent orchestration — Step 2 cannot start until Step 1 is complete.

**MAYA:** Now Phase 2 — the API layer.

*[Continues typing:]*
```markdown
## Phase 2 — API Layer

### Step 3: Add POST /api/todos/export route
- **REQ:** REQ-001, REQ-004
- **Depends on:** Step 1
- **Description:** Add a new authenticated route that calls `exportTodosAsCsvAsync`,
  sets response headers (`Content-Type: text/csv`,
  `Content-Disposition: attachment; filename="todos.csv"`),
  and pipes the Buffer to the response.
- **Done when:** `curl -X POST http://localhost:3000/api/todos/export -H "Authorization: Bearer [valid-token]"`
  returns a file download with Content-Type text/csv.
- **Estimated time:** 1 hour

### Step 4: Verify unauthenticated requests return 401
- **REQ:** REQ-004
- **Depends on:** Step 3
- **Description:** Add integration test verifying that POST /api/todos/export
  without a valid auth token returns 401 Unauthorized.
- **Done when:** `npm run test:integration -- --grep export` passes.
- **Estimated time:** 30 minutes
```

**MAYA:** Phase 3 — the UI.

*[Types:]*
```markdown
## Phase 3 — UI

### Step 5: Add "Export CSV" button to Dashboard
- **REQ:** REQ-001
- **Depends on:** Step 3
- **Description:** Add an "Export CSV" button to the Dashboard header.
  On click, POST to /api/todos/export with the user's auth token and
  trigger a file download.
- **Done when:** Clicking the button in the browser triggers a file download.
- **Estimated time:** 1 hour
```

**JORDAN:** *(on camera)* Five steps. Four requirements fully covered. Every step traceable. Every step independently verifiable. This plan can be handed to a developer — human or agent — with complete confidence that they have everything they need.

---

## [03:15 – 05:00] TASKS.JSON — THE MACHINE-READABLE FORMAT

*[JORDAN on screen — creating tasks.json]*

**JORDAN:** The plan is for humans. Tasks are for machines. When you're working with the GitHub Spec Kit or a multi-agent workflow, you convert `plan.md` into `tasks.json` — a structured file the orchestrating agent can parse and dispatch.

*[Types:]*
```json
{
  "feature": "csv-export",
  "spec": ".github/specs/csv-export/spec.md",
  "tasks": [
    {
      "id": "T001",
      "title": "Add exportTodosAsCsvAsync to TodoService",
      "agent": "coder",
      "req": ["REQ-002", "REQ-003"],
      "depends_on": [],
      "done_when": "Method returns Buffer; first line is 'Title,Description,Priority,Due Date,Status'",
      "status": "not-started"
    },
    {
      "id": "T002",
      "title": "Unit test exportTodosAsCsvAsync",
      "agent": "tester",
      "req": ["REQ-002", "REQ-003"],
      "depends_on": ["T001"],
      "done_when": "npm test passes with 3 green tests for exportTodosAsCsvAsync",
      "status": "not-started"
    },
    {
      "id": "T003",
      "title": "Add POST /api/todos/export route",
      "agent": "coder",
      "req": ["REQ-001", "REQ-004"],
      "depends_on": ["T001"],
      "done_when": "curl with valid token returns text/csv file download",
      "status": "not-started"
    },
    {
      "id": "T004",
      "title": "Integration test: unauthenticated returns 401",
      "agent": "tester",
      "req": ["REQ-004"],
      "depends_on": ["T003"],
      "done_when": "Integration test suite passes",
      "status": "not-started"
    },
    {
      "id": "T005",
      "title": "Add Export CSV button to Dashboard",
      "agent": "coder",
      "req": ["REQ-001"],
      "depends_on": ["T003"],
      "done_when": "Button click triggers file download in browser",
      "status": "not-started"
    }
  ]
}
```

**MAYA:** *(voice-over)* Three things the orchestrator reads from this file: which agent gets the task, which tasks this one depends on, and what "done" looks like. That's all it needs to dispatch work correctly.

**JORDAN:** The `status` field updates as tasks complete. `not-started` → `in-progress` → `completed`. The orchestrator manages the dependency chain — T002 and T003 don't start until T001 is complete. T004 and T005 don't start until their respective dependencies are done.

**MAYA:** *(on camera)* So T001 and its dependents T002 and T003 can all start as soon as T001 completes. T002 (testing) and T003 (the route) can run in parallel. The orchestrator knows this because of the dependency graph in the JSON.

---

## [05:00 – 08:30] THE FOUR QUALITY GATES — LIVE WALKTHROUGH

*[BOTH ON CAMERA — quality gate graphic on screen, 4 gates visible]*

**JORDAN:** Quality gates are checkpoints that block progression until defined criteria are met. Four gates. Each one catches problems at the cheapest possible moment.

*[Gate 1 highlighted on graphic]*

**MAYA:** **Gate One: Spec Quality.** Runs after the spec is written, before the plan is written. A human review. The checklist:

*[Checklist appears on screen as Maya reads]*

**MAYA:** Every requirement has a testable acceptance criterion. "Gracefully handles errors" fails. "Returns HTTP 503 with retry-after header" passes.

**MAYA:** No vague language — "should work for most users" is a fail. "Works for all users with fewer than 100,000 todos" is a pass.

**MAYA:** Non-goals section is populated. If it's empty — was this intentional? Or did you just forget?

**MAYA:** Every open question has an owner and a due date. "TBD" is not an answer.

**JORDAN:** Who approves Gate One? A human. This is intentional. The spec represents human intent. AI can help you write it. A human must verify it captures the right intent.

**JORDAN:** The cost of a problem at Gate One: zero lines of code. The cost at production: days of rework.

*[Gate 2 highlighted]*

**JORDAN:** **Gate Two: Spec-to-Plan Coverage.** After `plan.md` is written, before implementation begins.

**JORDAN:** The question: does the plan cover *every* requirement?

*[Shows a coverage check — opens spec.md and plan.md side by side]*

**JORDAN:** REQ-001 — in Step 3 and Step 5. ✓
REQ-002 — in Step 1 and Step 2. ✓
REQ-003 — in Step 1 and Step 2. ✓
REQ-004 — in Step 3 and Step 4. ✓

**JORDAN:** Every requirement appears in at least one plan step. Gate Two passes.

**MAYA:** *(voice-over)* What does a Gate Two failure look like?

**JORDAN:** You have REQ-005 in the spec — "The export should include a timestamp in the filename" — but no plan step mentions it. Gate Two catches this before any developer starts coding. Caught here: free. Caught in QA: a sprint of rework.

*[Gate 3 highlighted]*

**MAYA:** **Gate Three: Plan-to-Code Traceability.** During implementation, every commit references a task ID and the REQ-IDs it satisfies.

*[Shows a commit message:]*
```
feat(T001): Add exportTodosAsCsvAsync to TodoService

Implements REQ-002, REQ-003.
All active todos for the user are returned as a Buffer.
Column order: Title, Description, Priority, Due Date, Status.
Tests: 3 passing.
```

**MAYA:** This commit message tells a complete story. What was changed. Why it was changed. Which requirements it satisfies. Which task it belongs to. A compliance auditor can look at any requirement and trace it to the exact commit that implements it.

**JORDAN:** At MetLife — where audit trails matter — this isn't optional ceremony. It's how you demonstrate compliance.

*[Gate 4 highlighted]*

**JORDAN:** **Gate Four: Completeness.** After implementation is finished, before the feature is shipped.

**JORDAN:** The final checklist: every task is marked `completed` in `tasks.json`. Every REQ-ID has a corresponding test case. All tests pass with no failures. Coverage meets the defined threshold for the project.

**MAYA:** A human does the final approval. The tooling does the audit work — generating the traceability report, flagging untested requirements, counting coverage. You focus on the final judgment: is this ready to ship?

---

## [08:30 – 10:30] RUNNING AN AGENT AGAINST THE PLAN

*[MAYA on screen — agent mode in VS Code, using the plan to drive implementation]*

**MAYA:** Let me show you how the plan and spec work together in an actual agent task.

*[Switches to agent mode — types:]*
```
Implement T001 from #file:.github/specs/csv-export/tasks.json.

The spec is at #file:.github/specs/csv-export/spec.md.
The service file to modify is #file:src/services/TodoService.js.
Follow our existing patterns for async service methods.

Done when: Running the unit test for exportTodosAsCsvAsync returns green.
```

*[Agent plan appears — reads the existing service, drafts the new method, writes the test, runs it]*

**MAYA:** Watch what the agent is doing. It reads `tasks.json` to understand what T001 is. It reads the spec to understand what REQ-002 and REQ-003 require — specifically, column order and "all active todos." It reads the existing service to match patterns.

*[Method is generated — `exportTodosAsCsvAsync` with streaming, correct columns]*

*[Unit test runs — 3 green]*

**MAYA:** T001 complete. The agent updates the status field in tasks.json — `"status": "completed"`. Now T002 and T003 are unblocked.

**JORDAN:** *(voice-over)* This is what the plan enables. Not "here's a vague feature request, figure it out" — but "here is precisely what to build, which requirement it satisfies, and how to know when you're done." The agent has everything it needs to succeed without ambiguity.

**MAYA:** And notice — I can now run T002 and T003 simultaneously. Two agent windows, two tasks, neither blocking the other, both working from the same source of truth.

*[Shows two VS Code windows side by side — agent writing tests in one, implementing the route in the other]*

**JORDAN:** *(on camera)* That's the power of structured plans. Parallelism — which is impossible when the "plan" lives only in someone's head.

---

## [10:30 – 12:15] COMMON PLAN MISTAKES — WHAT NOT TO DO

*[JORDAN on screen — showing examples of bad plan steps]*

**JORDAN:** Not all plans are equally useful. Here are the common mistakes.

**JORDAN:** **Mistake 1: Steps without REQ-IDs.**

"Step 4: Refactor the TodoService for better performance."

No REQ-ID. This step came from where? It's not in the spec. If it's not in the spec, it shouldn't be in the plan — or it means the spec needs a new requirement. A plan step without a REQ citation is a red flag.

**MAYA:** *(voice-over)* **Mistake 2: Steps that are too large.**

"Step 1: Implement the entire feature."

One step, hours of work, no intermediate checkpoint. If an agent runs this step and fails mid-way — where did it stop? What's done and what isn't? Tasks should be small enough that "done" is verifiable within 1–2 hours.

**JORDAN:** **Mistake 3: Missing "done when" criteria.**

"Step 2: Write tests."

Done when what? The file exists? The tests run? The tests pass? Without a done-when criterion, the agent doesn't know when to stop iterating. It might keep adding tests forever. "Done when: `npm test -- --grep exportTodosAsCsvAsync` passes with minimum 3 tests" — specific and verifiable.

**MAYA:** *(on camera)* **Mistake 4: Missing dependency declarations.**

If Step 3 depends on Step 1 but that dependency isn't declared — an orchestrator might dispatch them simultaneously. Step 3 starts before the method it's calling exists. It fails. Dependency chains must be explicit.

**JORDAN:** **Mistake 5: Plan without tests.**

Every feature requirement should have a corresponding test step in the plan. If the plan has 5 implementation steps and 0 test steps — Gate Two should fail. "It worked on my machine" is not a quality gate.

---

## [12:15 – 13:30] RECAP

*[BOTH ON CAMERA]*

**MAYA:** The plan bridges the spec and the code. Five elements per step: REQ-IDs, description, done-when criterion, estimated time, and dependencies.

**JORDAN:** Plan.md is human-readable. Tasks.json is machine-readable. Both come from the same spec — they're the same plan in two formats.

**MAYA:** Four quality gates: Spec Quality before planning, Spec-to-Plan Coverage before implementation, Plan-to-Code Traceability during implementation, Completeness before shipping.

**JORDAN:** Each gate catches problems at the cheapest possible moment. Gate One: free. Gate Four: you're still ahead of production.

**MAYA:** The agent needs a plan to work effectively. Not because agents can't be autonomous — because even the best autonomous actor needs a map to deliver the right destination.

**JORDAN:** Video Five: choosing your mode — the full decision framework for when to vibe and when to spec, including how to recognise the moment to switch. I'm Jordan.

**MAYA:** I'm Maya. See you in Video Five.

*[OUTRO]*

---

## PRODUCTION NOTES

- **Runtime:** ~14 minutes
- **Chapter markers:** 0:00 Cold Open · 0:55 Writing plan.md · 3:15 tasks.json · 5:00 Four Quality Gates · 8:30 Agent Against the Plan · 10:30 Common Mistakes · 12:15 Recap
- **plan.md writing demo:** Show typing at normal speed — this is meant to be instructive. Pause briefly after each step to let the structure land.
- **tasks.json reveal:** Consider a before/after: show the plan step first, then show how it maps to the JSON task. Side-by-side.
- **Quality gates section:** The gate graphic must remain visible throughout this section. Return to it between gates. The visual continuity reinforces the framework.
- **Dual-agent demo:** The two-window simultaneous execution is the visual climax. Must be pre-staged and run cleanly.

---
*Spoken word count: ~2,450 · Estimated runtime: ~14 minutes*
