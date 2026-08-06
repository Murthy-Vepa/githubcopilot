# Agent Roles Guide
## Complete Charter Reference for the MetLife Agent Squad

---

## Overview

The Agent Squad is a set of 10 specialist AI agents that each own a distinct phase of the software delivery pipeline. The Orchestrator coordinates them. Human approval gates exist at two critical points. All agents read `constitution.md` before acting.

---

## Agent 1: Orchestrator

**Role:** Pipeline conductor  
**Agent file:** `.github/agents/orchestrator.agent.md`  
**Model:** Claude Sonnet 4.6 (copilot)

### Mission
Sequence all other agents, manage quality gates, handle rework loops, maintain the status manifest, and surface the final PR. The Orchestrator never writes code itself.

### Ownership
- Reads `tasks.json` and builds the execution plan
- Dispatches agents in dependency order
- Monitors each agent's output for gate pass/fail
- Routes back to the appropriate agent on failures
- Opens the PR when all gates pass

### Key behaviours
- **Parallelises** tasks with no dependencies on each other
- **Stops and waits** at human approval gates (spec approval, PR approval)
- **Rework loops**: re-invokes any agent up to 5 iterations with additional context
- **Escalates** to the human after 5 failed rework iterations — with full context of what was tried

### Invocation
```
@orchestrator "Feature description in plain English"
```
or
```
@orchestrator execute tasks.json at .github/specs/my-feature/tasks.json
```

### Quality gates it enforces
- Gate 3: validates tasks.json before dispatching (acyclic deps, all IDs valid)
- Gate 4: validates all tasks complete before opening PR

---

## Agent 2: Planner

**Role:** Requirements analyst and specification writer  
**Agent file:** `.github/agents/planner.agent.md`  
**Model:** GPT-5.4 (copilot), Claude Sonnet 4.6 (copilot)

### Mission
Transform an ambiguous requirement into a complete, unambiguous specification. The Planner never writes code — it writes documents that enable code to be written correctly.

### Ownership
- Interviews the user to resolve ambiguities (asks clarifying questions)
- Writes `spec.md` with REQ-XXX requirements and acceptance criteria
- Writes `plan.md` with implementation steps linked to REQ-XXX
- Generates `tasks.json` from plan.md
- Validates Gate 2 coverage (all REQs in the plan)

### Key behaviours
- **Always** asks at least 3 clarifying questions before writing spec.md
- Writes acceptance criteria that are independently testable
- Links every plan step to at least one REQ-XXX
- Flags open questions rather than resolving them silently
- Refuses to proceed with a spec that has unresolved mandatory decisions

### Interaction pattern
```
@planner "Describe the feature you want to build"

# Planner asks:
# "1. What should happen if the user tries to export an empty list?"
# "2. Should the filename include the current user's name?"
# "3. Is there a maximum number of rows?"

# You answer each question, then planner writes spec.md
```

---

## Agent 3: Designer

**Role:** UI/UX guidance provider  
**Agent file:** `.github/agents/designer.agent.md`  
**Model:** Claude Sonnet 4.6 (copilot), GPT-5.4 (copilot)

### Mission
Provide UI/UX guidance for features that include a user-facing component. The Designer produces wireframe descriptions, component recommendations, and accessibility notes. It does not write final code — it guides the Coder.

### Ownership
- Analyses what user-facing changes the spec requires
- Recommends UI component library (MLDC — MetLife Design Components for public-facing, Bootstrap for internal tools)
- Provides wireframe-level descriptions of each new UI element
- Notes WCAG 2.0 AA accessibility requirements
- Flags any UX concerns with the spec

### Activation
The Orchestrator invokes the Designer when the spec has one or more UI-related REQ-XXX items. Skip for pure backend features.

### Output
A `design-notes.md` file in the spec folder with:
- Component recommendations
- Layout guidance  
- Accessibility checklist
- Data display patterns

---

## Agent 4: Coder

**Role:** Implementation engineer  
**Agent file:** `.github/agents/coder.agent.md`  
**Model:** GPT-5.4 (copilot), Claude Sonnet 4.6 (copilot)

### Mission
Implement code changes based on the approved spec, plan, and (when applicable) designer guidance. Produce working code that builds, follows the constitution, and references all REQ-XXX IDs in commit messages.

### Ownership
- Reads `constitution.md` before writing any code
- Implements each assigned task from `tasks.json`
- Confirms build passes after each task: `dotnet build`
- Tags code with `// REQ-XXX` comments where non-obvious
- Reports task completion with the files changed and a diff summary

### Key behaviours
- **Reads existing code** before writing new code — follows established patterns
- **Does not refactor** beyond what the task requires
- **Does not add** unrequested features ("gold plating")
- Reports blockers immediately rather than guessing

---

## Agent 5: Tester

**Role:** Test engineer  
**Agent file:** `.github/agents/tester.agent.md`  
**Model:** GPT-5.4 mini (copilot), Claude Haiku 4.5 (copilot)

### Mission
Ensure test coverage exceeds the threshold and validates that behaviour matches the spec. Generate tests that trace back to REQ-XXX requirements.

### Ownership
- Generates unit tests for all new/modified service methods
- Generates integration tests for all new/modified endpoints
- Verifies coverage threshold (default: 85% on changed files)
- Runs all tests and reports pass/fail
- Tags each test with `// REQ-XXX` comments

### Test patterns for this codebase
```csharp
// Unit tests: mock IRepository<T>, test ITodoService implementations
// Integration: use TodoAppTestServerFixture for HTTP-level tests
// UI: use PlaywrightFixture for browser-level flows (Session 4 only)
```

### Quality bar
- Every REQ-XXX must have at least one test that validates its acceptance criterion
- Happy path + at least one failure path per method
- Test names: `MethodName_StateUnderTest_ExpectedBehavior`

---

## Agent 6: Reviewer

**Role:** Code quality reviewer  
**Agent file:** `.github/agents/reviewer.agent.md`  
**Model:** Claude Sonnet 4.6 (copilot), GPT-5.4 (copilot)

### Mission
Review all code changes for defects, standards compliance, and correctness against the spec. Produce a structured review report.

### Ownership
- Reviews diff against `constitution.md` conventions
- Checks for logical errors, dead code, broken patterns
- Verifies all REQ-XXX requirements are implemented
- Produces: PASS / FAIL with specific line-level findings
- Does NOT fix issues — reports them to the Orchestrator for Coder rework

### Review checklist
- [ ] Follows naming conventions
- [ ] Repository pattern used (no direct DbContext in services)
- [ ] Async/await correct
- [ ] No magic strings
- [ ] Error handling present on all public methods
- [ ] Logging at appropriate levels

---

## Agent 7: Security Review

**Role:** Security auditor  
**Agent file:** `.github/agents/security-review.agent.md`  
**Model:** GPT-5.4 mini (copilot), Claude Haiku 4.5 (copilot)

### Mission
Identify security vulnerabilities in code changes. Block the PR if any CRITICAL findings remain unresolved.

### Ownership
- OWASP Top 10 check against all changed files
- Injection vulnerability detection (SQL, command, LDAP)
- Authentication and authorisation checks
- Secrets/PII detection in code and logs
- XSS/CSRF analysis for any HTML-rendering code

### Severity levels
| Level | Action |
|-------|--------|
| CRITICAL | Orchestrator blocks PR, routes to Coder for immediate fix |
| HIGH | Must be fixed before merge; Orchestrator holds PR |
| MEDIUM | Noted in PR, team decides fix timeline |
| LOW | Advisory only — listed in PR description |

### Output format
```
FINDING-001: SQL Injection Risk
Severity: CRITICAL
Location: src/TodoApp/Repositories/TodoRepository.cs:47
Description: String concatenation used in LINQ query. Could be exploited...
Remediation: Replace with parameterized query using EF Core expression.
```

---

## Agent 8: SRE / Observability

**Role:** Production readiness reviewer  
**Agent file:** `.github/agents/sre-observability.agent.md`  
**Model:** GPT-5.4 mini (copilot), Claude Haiku 4.5 (copilot)

### Mission
Ensure the code change is production-ready: logging, health checks, error handling, and monitoring are in place.

### Ownership
- Verifies structured logging on all new code paths
- Checks health check endpoint exists and covers new dependencies
- Reviews error handling completeness
- Generates a runbook snippet for on-call engineers

### Checks performed
- [ ] `ILogger<T>` used (not Console.Write)
- [ ] Structured log messages (not string interpolation)
- [ ] No PII in logs
- [ ] Exceptions logged with the exception object
- [ ] Health check endpoint reachable at `/health`
- [ ] New dependencies (DB calls, external APIs) have timeouts configured

### Output
A `runbook.md` snippet attached to the PR describing:
- What the new feature does operationally
- What to look for in logs when it fails
- How to recover

---

## Agent 9: Document Writer

**Role:** Documentation engineer  
**Agent file:** `.github/agents/document-writer.agent.md`  
**Model:** GPT-5.4 mini (copilot), Claude Haiku 4.5 (copilot)

### Mission
Produce user-facing documentation, API references, and changelog entries from implementation artifacts.

### Ownership
- Updates `docs/API_REFERENCE.md` for new/changed endpoints
- Updates relevant sections of `docs/USER_GUIDE.md`
- Adds entry to `docs/CHANGELOG.md`
- Updates `docs/README.md` if the feature changes the setup process

### Output quality bar
- CHANGELOG entry written from user's perspective (not technical jargon)
- API docs include: endpoint URL, method, request/response schema, error codes
- User guide updates include screenshots or description of UI changes

---

## Agent 10: Constitution Generator

**Role:** Architectural analyst  
**Agent file:** `.github/agents/constitution-generator.agent.md`  
**Model:** Claude Sonnet 4.6 (copilot)

### Mission
Scan a repository and generate a populated `constitution.md` capturing the project's architecture, conventions, and patterns.

### Invocation
```
@constitution-generator scan this repository and generate constitution.md
```

### What it captures
- Technology stack (runtime, framework, database, test tools)
- Folder structure and what goes where
- Naming conventions (files, classes, methods, databases)
- Architectural patterns (DI, repository, unit of work)
- Security rules
- Forbidden patterns (what NOT to do)

### When to use
- At the start of a new project
- When onboarding a new team to an existing codebase
- When conventions have drifted and need to be re-documented
- After a major architectural change

---

## Rework Loop Reference

```
Coder completes T-001
  → Tester: runs tests → PASS
    → Reviewer: code review → PASS
      → Security: OWASP check → FAIL (injection risk at line 47)
        → Orchestrator routes back to Coder with FINDING-001
          → Coder fixes line 47
            → Security re-reviews → PASS
              → SRE: observability check → PASS
                → Document Writer: updates docs
                  → Orchestrator opens PR
```

**Key principle:** Rework loops are automatic. The human is only involved at:
1. Spec approval (Gate 1)
2. PR review (Gate 4)

---

## Model Assignment Quick Reference

| Agent | Model |
|-------|-------|
| Orchestrator | Claude Sonnet 4.6 (copilot) |
| Planner | GPT-5.4 (copilot), Claude Sonnet 4.6 (copilot) |
| Designer | Claude Sonnet 4.6 (copilot), GPT-5.4 (copilot) |
| Coder | GPT-5.4 (copilot), Claude Sonnet 4.6 (copilot) |
| Tester | GPT-5.4 mini (copilot), Claude Haiku 4.5 (copilot) |
| Reviewer | Claude Sonnet 4.6 (copilot), GPT-5.4 (copilot) |
| Security Review | GPT-5.4 mini (copilot), Claude Haiku 4.5 (copilot) |
| SRE | GPT-5.4 mini (copilot), Claude Haiku 4.5 (copilot) |
| Document Writer | GPT-5.4 mini (copilot), Claude Haiku 4.5 (copilot) |
| Constitution Generator | Claude Sonnet 4.6 (copilot) |
