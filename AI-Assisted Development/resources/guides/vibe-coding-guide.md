# AI-Assisted Development & Spec Driven Development — Guide
**Module 03 · GitHub Copilot Mastery · MetLife 2026**

---

## Overview
This guide covers the conceptual framework and practical patterns for choosing between AI-assisted development (exploratory, AI-conversational development) and spec-driven development (requirements-first, traceable implementation).

---

## The Spectrum

| | AI-Assisted Development | Spec-Driven |
|---|---|---|
| **Planning** | Minimal / none | Upfront spec + plan |
| **Speed to first output** | Very fast | Moderate (spec overhead) |
| **Traceability** | Low | High (REQ-IDs) |
| **Maintainability** | Variable | High |
| **Best for** | Exploration, prototypes | Production, team, compliance |
| **Risk** | Scope drift, hidden bugs | Slower initial velocity |

---

## When to Vibe Code
- Early exploration of an API or technology
- Throwaway scripts with no production SLA
- Solo spikes to estimate feasibility
- Learning sessions — build and ask Copilot to explain
- Tight demo deadlines (ship and discard)

**Warning signs you've been vibing too long:**
- Over 2 hours with no clear mental model
- You can't explain to a colleague what the code does at a high level
- You've rewritten the same function 3+ times

---

## When to Go Spec-First
- Any code destined for production
- Features with security, compliance, or data privacy implications
- Multi-developer or multi-agent implementation
- Code that will be maintained for more than one sprint
- Features that need audit trails or sign-off workflows

---

## Writing spec.md

A good spec has these sections:

```markdown
# Feature: [Name]

## Summary
One-paragraph description of the feature and its business value.

## Requirements
- REQ-001: [Requirement] — **Acceptance:** Given [context] When [action] Then [outcome]
- REQ-002: ...

## Non-Goals
- This spec does NOT cover [X]
- Out of scope: [Y]

## Open Questions
- [ ] Q1: [Question] — Owner: [Name] — Due: [Date]
- [ ] Q2: ...

## Dependencies
- Depends on [System/API/Feature]
```

### Tips for Great Requirements
- One requirement = one verifiable behaviour
- Acceptance criteria use Given/When/Then
- Non-goals are as important as goals — they prevent scope creep
- Keep requirements implementation-agnostic (what, not how)

---

## Writing plan.md

```markdown
# Plan: [Feature Name]

## Tasks

### Task 1: [Name]
- **REQ:** REQ-001, REQ-002
- **Description:** [What to implement]
- **Done when:** [Acceptance criteria met]
- **Estimated time:** 2h

### Task 2: [Name]
- **REQ:** REQ-003
- **Depends on:** Task 1
- ...
```

### Rules for Good Tasks
- Each task ≤ 4 hours
- Every task traces to ≥1 REQ-ID
- Tasks have explicit "done when" criteria
- Dependency chain is explicit

---

## Quality Gates

### Gate 1 — Spec Quality
Verify before handing to implementer:
- [ ] All REQ-IDs present and numbered sequentially
- [ ] Each requirement has Given/When/Then acceptance criteria
- [ ] Non-goals section populated
- [ ] Open questions have owners and due dates

### Gate 2 — Spec → Plan Coverage
- [ ] Every REQ-ID appears in at least one plan task
- [ ] No orphaned requirements (required but unplanned)

### Gate 3 — Plan → Code Traceability
- [ ] Every task has a corresponding commit/PR
- [ ] Commit messages or code comments reference Task # and REQ-IDs

### Gate 4 — Completeness
- [ ] All requirements verified against acceptance criteria
- [ ] Tests pass
- [ ] Documentation updated
- [ ] Sign-off from feature owner

---

## Copilot Prompts for This Workflow

### Draft a spec
```
I want to build [feature description]. Help me write spec.md with:
- Requirements (REQ-001, REQ-002, ...) with Given/When/Then acceptance criteria
- Non-goals
- Open questions
Do NOT write any code yet.
```

### Generate a plan from spec
```
Using the attached spec.md, generate plan.md with:
- Numbered tasks, each ≤ 4 hours
- Each task mapped to REQ-IDs from the spec
- Dependencies between tasks
- "Done when" criteria per task
```

### Run Gate 1
```
Review spec.md and report:
1. Requirements missing acceptance criteria
2. Any non-goals section issues
3. Unanswered open questions
```

### Run Gate 2
```
Compare spec.md and plan.md. List any REQ-IDs in the spec
that do not appear in any plan task. These are orphaned requirements.
```

### Retroactive spec from vibe code
```
Review the code in [file]. Extract the functional requirements it
satisfies as REQ-001, REQ-002, etc. with acceptance criteria.
Then generate a spec.md.
```

---

## Common Mistakes

| Mistake | Fix |
|---|---|
| Requirements that say "the system should be fast" | Add measurable criteria: "p95 latency < 200ms" |
| No non-goals section | Always define what's out of scope |
| Tasks too large (1 task = entire feature) | Split until each task is ≤ 4h |
| Skipping the spec for "small" features | Even 5 requirements beats zero |
| Writing spec after code | Write spec first — retroactive specs often miss edge cases |

---

*Module 03 · AI-Assisted Development & Spec Driven Development · GitHub Copilot Mastery · MetLife 2026*
