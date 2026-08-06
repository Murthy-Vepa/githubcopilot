# Video Script 06 — GitHub Spec Kit: Automating Spec-Driven Development at Scale
## AI-Assisted Development & Spec-Driven Development Video Series · GitHub Copilot Mastery · MetLife 2026

**Format:** 2 co-hosts · VS Code screen share · ~15 minutes
**Hosts:** Jordan (male, US English) · Maya (female, US English)
**Target audience:** Developers and teams ready to operationalise spec-driven development with tooling
**Screen setup:** VS Code · `.github/specs/csv-export/` folder · Planner agent running · tasks.json updating live

---

## PRE-SHOW SETUP CHECKLIST
- [ ] VS Code open · `.github/specs/` folder with an existing completed spec as reference
- [ ] A new feature description ready (we'll run the Planner agent on it live)
- [ ] Planner agent pre-loaded and ready to accept input
- [ ] `tasks.json` updating in real-time as tasks complete (pre-staged or live)
- [ ] Traceability report example ready to show as the capstone artifact

---

## [00:00 – 01:00] COLD OPEN

*[MAYA on screen — the `.github/specs/csv-export/` folder visible in the file explorer]*

**MAYA:** Five videos in. You've written a spec. You've built a plan. You understand the four quality gates. You've run agents against the tasks.

*[Opens each file briefly: spec.md → plan.md → tasks.json]*

**MAYA:** Here's the question: what if all of this happened automatically, from a single feature description, in under ten minutes?

*[Opens a blank VS Code chat panel. Types:]*
```
Feature: Add push notification support for claim status updates.
Authenticated users should receive real-time browser notifications
when their claim status changes. This is a production feature.
```

*[Presses Enter — Planner agent activates]*

**MAYA:** The Planner agent is reading that description right now. In about two minutes, it will produce a draft `spec.md`, a draft `plan.md`, and a `tasks.json`. Gate One review is still human — but everything else is generated.

**JORDAN:** *(voice-over)* That's the GitHub Spec Kit. The same workflow we've been building manually — but automated.

**MAYA:** I'm Maya.

**JORDAN:** *(on camera — split)* I'm Jordan. Video Six — the finale. The GitHub Spec Kit.

*[TITLE CARD: "GitHub Spec Kit: Automating Spec-Driven Development" | Module 3]*

---

## [01:00 – 02:30] WHAT IS THE GITHUB SPEC KIT

*[JORDAN on screen — showing the folder structure and the three core files]*

**JORDAN:** The GitHub Spec Kit is a lightweight, file-based specification framework that sits between a feature description and code. It doesn't require new tools, new platforms, or new infrastructure. Everything lives in files — in the repo — versioned, reviewable, and auditable like any other code artifact.

*[Shows folder:]*
```
.github/
  specs/
    csv-export/
      spec.md
      plan.md
      tasks.json
    notification-service/
      spec.md
      plan.md
      tasks.json
```

**JORDAN:** Three files per feature. That's the entire Spec Kit. `spec.md` defines intent. `plan.md` defines approach. `tasks.json` enables execution.

**MAYA:** *(voice-over)* Why three separate files?

**JORDAN:** Three audiences. `spec.md` is for humans and AI to align on *what* and *why*. It's reviewed in Gate One by a human. It's attached as context when the agent implements. `plan.md` is for humans to review the approach. Is the order of implementation correct? Are the dependencies right? Are there missing steps? `tasks.json` is for the orchestrator — the automated system that dispatches tasks to specialised agents.

**JORDAN:** Three formats, three audiences, one source of truth. The spec drives everything.

---

## [02:30 – 04:30] THE PLANNER AGENT — SPEC GENERATION LIVE

*[MAYA on screen — watching the Planner agent output build in real time]*

**MAYA:** Let's watch the Planner agent work. We submitted our push notification feature description. It's generating now.

*[spec.md draft appears — sections building progressively]*

**MAYA:** *(reading as it generates)* The summary is solid. "Allow authenticated users to receive real-time browser notifications when their claim status changes, without polling." Good — it captured "without polling" even though I didn't specify that. It inferred that from the "real-time" requirement.

*[Requirements section appears: REQ-001 through REQ-005]*

**MAYA:** Five requirements. Let me read them.

*[Reads:]*
```markdown
- REQ-001: Authenticated users can opt into claim status notifications.
  - Acceptance: Given an authenticated user. When they enable notifications.
    Then the browser requests permission and the preference is persisted.

- REQ-002: Users receive a browser notification when their claim status changes.
  - Acceptance: Given a user has notifications enabled. When claim C-001 changes
    from PENDING to APPROVED. Then a browser notification appears within 10 seconds.

- REQ-003: Notifications include claim number and the new status.
  - Acceptance: Given a notification is displayed. When the user reads it.
    Then the notification body contains the claim number and the new status value.

- REQ-004: Unauthenticated users cannot subscribe to the notification endpoint.
  - Acceptance: Given an unauthenticated request to POST /api/notifications/subscribe.
    When received. Then a 401 response is returned.

- REQ-005: Users can disable notifications at any time.
  - Acceptance: Given a user with notifications enabled. When they toggle off.
    Then no further notifications are sent and the preference is updated.
```

**MAYA:** REQ-002 has a specific time bound — "within 10 seconds." I need to verify that's correct with the product team. That goes in an open question.

*[Non-goals section appears]*

**MAYA:** Non-goals: mobile push notifications, email notifications, notification history/inbox. All correct — those are next-version concerns.

**JORDAN:** *(voice-over)* Gate One question: is this spec ready?

**MAYA:** Almost. I'm going to add one open question and sharpen REQ-002's acceptance criterion. *[Types directly in the draft]* Ten seconds might be too tight if we're using a polling fallback. Let me note that.

*[Edits REQ-002 acceptance: changes "within 10 seconds" to "within 30 seconds on a standard connection (subject to Q1 resolution)"]*
*[Adds: "Q1: WebSocket or Server-Sent Events? This affects delivery time SLA. Owner: Backend Arch team. Due: 2026-07-15"]*

**MAYA:** Now Gate One passes. The spec is specific enough to plan against.

---

## [04:30 – 06:30] PLAN AND TASKS GENERATION

*[JORDAN on screen — plan.md being generated]*

**JORDAN:** With Gate One signed off, the Planner agent moves to `plan.md`. Watch.

*[plan.md builds — 3 phases, 7 steps, each with REQ citations and done-when criteria]*

**JORDAN:** *(reading the plan)* Phase 1 — backend. Step 1: implement the WebSocket or SSE endpoint for claim status events. REQ-001, REQ-004. Step 2: connect claim status changes to the event emitter. REQ-002. Step 3: unit tests. REQ-001 through REQ-005.

**JORDAN:** Phase 2 — frontend. Step 4: browser notification permission flow. REQ-001. Step 5: notification display on event receipt. REQ-002, REQ-003. Step 6: disable notifications UI. REQ-005.

**JORDAN:** Phase 3 — integration. Step 7: end-to-end test — trigger a claim status change, verify notification appears within the SLA.

**JORDAN:** Gate Two check: does the plan cover every requirement?

*[Shows the cross-reference visually: each REQ-ID checked against plan steps]*

**JORDAN:** REQ-001 through REQ-005 — all present. Gate Two passes.

*[tasks.json generates]*

**JORDAN:** Now the machine-readable format. 7 tasks. Each with an ID, agent assignment, REQ citations, dependency chain, done-when criterion, and status "not-started."

*[Shows tasks.json — scrolls through]*

**JORDAN:** Notice the dependency structure. T002 (connect status changes to event emitter) depends on T001 (the endpoint). T004, T005, T006 can all start in parallel once T001 is complete — they're independent frontend concerns. T007 (end-to-end) depends on all others.

**MAYA:** *(voice-over)* The orchestrator reads this dependency graph and dispatches tasks to agents automatically — respecting the dependency chain, parallelising wherever possible.

---

## [06:30 – 08:15] AUTOMATED QUALITY GATES IN THE SPEC KIT

*[MAYA on screen — showing automated gate checks]*

**MAYA:** In the Spec Kit, Gate Two and Gate Three can be partially automated. Let me show you what that looks like.

**MAYA:** Gate Two automation: the Spec Kit tooling scans `spec.md` for all REQ-IDs and cross-references them against all REQ citations in `plan.md`. If any REQ-ID appears in the spec but not in the plan — it generates a warning.

*[Shows a terminal command:]*
```bash
speckit check coverage --spec spec.md --plan plan.md
```

*[Output:]*
```
✓ REQ-001 → covered by T001, T004
✓ REQ-002 → covered by T002, T005, T007
✓ REQ-003 → covered by T005
✓ REQ-004 → covered by T001
✓ REQ-005 → covered by T006
Coverage: 5/5 requirements covered.
Gate 2: PASS
```

**MAYA:** That check that would take a human 10 minutes to do manually — done in one second. And it's repeatable. Run it every time the plan changes.

**JORDAN:** *(voice-over)* Gate Three — traceability — is enforced through commit conventions.

**MAYA:** Every commit that implements a task references the task ID and REQ-IDs:

*[Shows a commit message:]*
```
feat(T002): Connect claim status changes to notification event emitter

Implements REQ-002.
When ClaimService.updateStatus() is called, a 'claim:status:changed'
event is emitted to the notification bus.
Integration test: claim-notification.spec.ts — 2 tests passing.
```

*[Shows the traceability report generated from commit history:]*
```
Spec: notification-service/spec.md

REQ-001  →  T001  →  commit abc123 (feat: WebSocket endpoint)
                  →  commit def456 (feat: permission flow)
REQ-002  →  T002  →  commit ghi789 (feat: status event emitter)
              T007  →  commit jkl012 (test: e2e notification)
REQ-003  →  T005  →  commit mno345 (feat: notification display)
REQ-004  →  T001  →  commit abc123 (feat: WebSocket endpoint with auth)
REQ-005  →  T006  →  commit pqr678 (feat: disable notifications UI)

Gate 3: All requirements traced to commits. ✓
```

**MAYA:** An auditor reviewing this feature can trace any requirement to the exact code that implements it. That's compliance documentation that writes itself — through disciplined commit conventions.

---

## [08:15 – 10:00] GATE FOUR — COMPLETENESS AT SCALE

*[JORDAN on screen — showing the completeness check]*

**JORDAN:** Gate Four — Completeness. The Spec Kit can generate a final sign-off report from three data sources: `tasks.json` status fields, test results, and the traceability report.

*[Shows the command:]*
```bash
speckit report completeness --spec spec.md --tasks tasks.json --coverage coverage.xml
```

*[Report appears:]*
```
Feature: notification-service

Tasks:
  ✓ T001 — completed
  ✓ T002 — completed
  ✓ T003 — completed
  ✓ T004 — completed
  ✓ T005 — completed
  ✓ T006 — completed
  ✓ T007 — completed
  All 7 tasks: COMPLETE

Requirements:
  ✓ REQ-001 — 2 test cases passing
  ✓ REQ-002 — 3 test cases passing (including e2e)
  ✓ REQ-003 — 1 test case passing
  ✓ REQ-004 — 1 test case passing
  ✓ REQ-005 — 1 test case passing
  All 5 requirements: TESTED

Coverage: 94% (threshold: 80%) — PASS

Gate 4: COMPLETE — Ready for human final approval.
```

**JORDAN:** The tooling did all the audit work. Every task complete. Every requirement tested. Coverage above threshold. The human role now: read the summary, review the key diffs, give final approval. Not hunting through 7 tasks and 5 requirements manually — the system did that.

**MAYA:** *(on camera)* This is the critical distinction: the Spec Kit is not replacing human judgment. It's replacing human tedium. You're still the engineer who decides whether the feature is right. The tooling handles the systematic checks that would otherwise be error-prone.

---

## [10:00 – 11:45] THE FULL WORKFLOW — END TO END IN ONE VIEW

*[BOTH ON CAMERA — workflow diagram showing the complete lifecycle]*

**JORDAN:** Let's see the complete Spec Kit workflow in one view.

*[Workflow diagram on screen — each step visible as Jordan narrates]*

**JORDAN:** **Step 1: Describe the feature.** Plain English. One paragraph. What does it do? Who benefits? Is it production?

**MAYA:** **Step 2: Planner agent generates `spec.md`.** Draft ready in under two minutes. You review, sharpen acceptance criteria, add domain knowledge, resolve open questions.

**JORDAN:** **Step 3: Gate One review.** Human. Is every requirement testable? Non-goals populated? Open questions owned? Thirty minutes of your time.

**MAYA:** **Step 4: Planner generates `plan.md` and `tasks.json`.** Phases, steps, dependencies, agent assignments. Automated Gate Two coverage check runs immediately.

**JORDAN:** **Step 5: Orchestrator dispatches tasks.** Coder agent gets implementation tasks. Tester agent gets test tasks. Security reviewer gets security audit tasks. All working in parallel where dependencies allow.

**MAYA:** **Step 6: Each agent completes a task.** Reads its task, reads the spec for the relevant REQ-IDs, implements, verifies against the done-when criterion, commits with the task ID and REQ-IDs, marks the task complete in tasks.json.

**JORDAN:** **Step 7: Gate Three traceability is maintained automatically** through commit conventions. The traceability report builds itself.

**MAYA:** **Step 8: Gate Four completeness report.** Automated. All tasks complete? All requirements tested? Coverage above threshold? Then human final approval.

**JORDAN:** **Step 9: Ship.** The spec, plan, and tasks.json are committed alongside the code. The PR contains the complete history of intent, approach, and implementation. Future developers — and future agents — have everything they need.

**MAYA:** Feature description on Monday. Spec reviewed by Tuesday. Implementation complete by Thursday. Gate Four Friday morning. Ship Friday afternoon. With an audit trail that documents every decision.

---

## [11:45 – 13:30] GETTING STARTED — ADOPTION AT YOUR TEAM'S PACE

*[JORDAN on screen — showing a progressive adoption path]*

**JORDAN:** You don't have to implement the full Spec Kit workflow on Monday. There's a progressive adoption path.

**JORDAN:** **Week 1 — Just the spec.** Start writing `spec.md` for new features. No tooling required. Just the five sections, the REQ-IDs, the Given/When/Then acceptance criteria. Get the team comfortable with structured requirements.

**MAYA:** *(voice-over)* **Week 2 — Add the plan.** Once the spec habit is established, add `plan.md`. Gate One and Gate Two reviews as a team activity. Five minutes in sprint planning for each spec-first feature.

**JORDAN:** **Week 3 — Add tasks.json.** Convert plan steps to tasks for the features that will use multi-agent execution. Start using the coverage check command to automate Gate Two.

**MAYA:** *(on camera)* **Month 2 — Add the Planner agent.** Let the Planner draft specs from feature descriptions. Your role shifts from writer to reviewer. Faster to first draft. Same quality standards.

**JORDAN:** **Month 3 — Full workflow.** Planner generates specs and plans. Orchestrator dispatches tasks. Automated gates run on every commit. Gate Four report auto-generated. Your team is running production-grade spec-driven development at scale.

**MAYA:** Each step adds value independently. You don't need step 6 to benefit from step 1. Start with the spec habit. Build from there.

---

## [13:30 – 15:00] SERIES CLOSE — WHAT YOU'VE BUILT

*[BOTH ON CAMERA — warm close]*

**JORDAN:** This is the final video in Module Three. Let's look at what you've built over these six videos.

**MAYA:** You understand the spectrum — and you have a seven-question rubric to place any feature on it, consistently.

**JORDAN:** You know how to vibe code effectively — the conversational loop, the six techniques, the failure traps, and when to stop.

**MAYA:** You know how to write a spec — five sections, testable requirements, non-goals that prevent scope creep, open questions that surface ambiguity before code is written.

**JORDAN:** You know how to write a plan — traceable steps, done-when criteria, dependency chains, the task format that agents can execute.

**MAYA:** You understand the four quality gates — and how to use automation to enforce them at scale without adding manual overhead.

**JORDAN:** And you've seen how the GitHub Spec Kit ties it all together — from a one-paragraph feature description to a shipped, auditable, traceable feature with a full documentation trail.

**MAYA:** What's next?

**JORDAN:** Module Four — the Agents module. Everything you've built in this module — specs, plans, tasks — becomes the input to a multi-agent system. The planner, coder, tester, reviewer, security analyst, and documentation writer — all coordinated, all working from the same spec-driven source of truth.

**MAYA:** The spec you write in Module Three becomes the mission briefing for the agents in Module Four. These modules are connected. Spec-driven development is what makes agent-driven development safe at scale.

**JORDAN:** I'm Jordan. Thank you for being here for Module Three.

**MAYA:** I'm Maya. Go write a spec.

*[OUTRO: Course hub URL · Module 4 preview · share this series]*

---

## PRODUCTION NOTES

- **Runtime:** ~15 minutes
- **Chapter markers:** 0:00 Cold Open · 1:00 What Is Spec Kit · 2:30 Planner Agent Live · 4:30 Plan & Tasks Generation · 6:30 Automated Gates · 8:15 Gate Four Completeness · 10:00 Full Workflow View · 11:45 Adoption Path · 13:30 Series Close
- **Planner agent demo:** The live generation is the centrepiece. Run this in real time — the moment Maya edits the acceptance criterion and adds an open question is the key human-in-the-loop moment. Don't skip it.
- **Traceability report:** This is the most visually impactful artifact. Make it a clean, readable terminal output. Consider a split view: the spec on the left, the traceability report on the right.
- **Progressive adoption diagram:** A simple visual timeline (Week 1 → Month 3) makes the adoption path feel achievable. Not overwhelming.
- **Series close:** This is the emotional close of a full module — both hosts on camera, warm, forward-looking. The line "Go write a spec" should feel earned, not cheesy.
- **Module 4 tease:** Briefly show the Agents module opening screen or folder structure. Visual continuity for learners who continue immediately.

---
*Spoken word count: ~2,650 · Estimated runtime: ~15 minutes*
