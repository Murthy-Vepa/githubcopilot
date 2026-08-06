# Episode 04 — Plans, Tasks & Quality Gates: From Spec to Execution
## AI-Assisted Development & Spec-Driven Development Podcast Series · GitHub Copilot Mastery · MetLife 2026

**Format:** 2 hosts · conversational · ~4.5 minutes
**Voices:** Jordan (male, US English) · Maya (female, US English)
**Audience:** Developers bridging the gap between a written spec and actual implementation

---

**[INTRO MUSIC FADE IN, THEN UNDER]**

**MAYA:** Welcome back to the series. I'm Maya.

**JORDAN:** And I'm Jordan. Last episode we covered writing the spec — the *what*. Today is about the *how*: turning that spec into an implementation plan, breaking it into tasks, and using quality gates to make sure nothing slips through.

**MAYA:** So you have a finished spec. What's the next step?

**JORDAN:** You write `plan.md`. This is the implementation plan — the bridge between "here's what we need" and "here's how we build it." The plan takes each requirement and maps it to one or more concrete implementation steps.

**MAYA:** What does a plan step look like?

**JORDAN:** Every step in the plan has three things. First — a clear action. An imperative statement: "Add `ExportTodosAsCsvAsync` to the TodoService class." Not "we should probably add the export method" — specific, actionable language. Second — a REQ citation. Every step must reference at least one REQ-ID from the spec. This is the traceability link. Third — a "done when" criterion. How do you know this step is finished? "Done when: method returns a byte array containing valid CSV with header row."

**MAYA:** That last part — the done-when — is what makes a plan executable by an agent.

**JORDAN:** Exactly. An agent without a done-when criterion doesn't know when to stop iterating. A done-when criterion gives it a verifiable target. Write code, run test, verify the criterion, move to the next task.

**MAYA:** How do you organize the plan?

**JORDAN:** By phases. Typically: service layer first, then controller or API layer, then UI if there is one, then tests. The dependency chain matters — you implement bottom-up so each layer has something to build on. The plan makes those dependencies explicit: "This step depends on Step 2 completing first."

**MAYA:** And the plan is what prevents two developers — or two agents — from working on conflicting assumptions at the same time.

**JORDAN:** Right. The plan is a shared map. Everyone on the team — human or AI — is working from the same map.

**MAYA:** Now, beyond the plan — you mentioned tasks. What are tasks and how do they differ from plan steps?

**JORDAN:** A task is a plan step formatted for execution. In a multi-agent workflow — which is what the GitHub Spec Kit supports — you convert the plan into a structured `tasks.json` file where each task has an ID, a description, which agent should execute it, which REQ-IDs it satisfies, which tasks it depends on, and a status field.

**MAYA:** So a plan is human-readable, and tasks are machine-readable.

**JORDAN:** Exactly. The plan is for your team to review and understand. Tasks are what the orchestrator uses to dispatch work to agents. You get both — readability and automation.

**MAYA:** Okay — let's talk quality gates. This is a concept I think a lot of people have heard but aren't sure what it means in practice.

**JORDAN:** Quality gates are checkpoints that block progression until a defined set of criteria are met. They're not a bureaucratic hurdle — they're a systematic way to catch problems at the cheapest possible moment. A bug caught in the spec is free. A bug caught in code review costs a day. A bug caught in production costs a week and your weekend.

**MAYA:** Four gates in spec-driven development. Walk us through them.

**JORDAN:** Gate One — Spec Quality. This runs before you write `plan.md`. The question is: is the spec specific enough to implement? The checklist: every requirement has at least one testable acceptance criterion. No vague language — "handles errors correctly" fails this gate. "Works as expected" fails this gate. Non-goals section is populated. Open questions are resolved or explicitly deferred with an owner and a due date.

**MAYA:** Who approves Gate One?

**JORDAN:** A human. You read the spec and sign off. You can use Copilot to *help* you check it — attach the spec and ask "does every requirement have a testable acceptance criterion?" — but the final approval is yours. Because the spec represents your intent, and only you can verify that.

**MAYA:** Gate Two?

**JORDAN:** Spec-to-Plan Coverage. This runs after `plan.md` is written but before implementation starts. The question: does the plan address *every* requirement? The checklist: every REQ-ID appears in at least one plan step. No plan steps without a REQ citation — if a step doesn't trace to a requirement, why is it in the plan? Test steps are present for each requirement. If you've specified behavior, there must be a task to verify that behavior.

**MAYA:** This gate catches orphaned requirements — things that were specified but never planned for.

**JORDAN:** Which is a surprisingly common failure mode. Someone writes a great spec, writes a plan, ships the feature, and then in QA someone reads REQ-007 and says "wait, where is this in the code?" Gate Two catches that before a single line is written.

**MAYA:** Gate Three?

**JORDAN:** Plan-to-Code Traceability. This runs during implementation. Every task that's marked complete should have a corresponding commit or pull request. You can look at any REQ-ID and trace it to the exact code change that implements it. This is the audit trail — and in enterprise environments with compliance requirements, this is often mandatory.

**MAYA:** And at MetLife, traceability isn't optional for many of our features.

**JORDAN:** It's built into the workflow by design with this approach. Gate Four?

**MAYA:** Completeness — the final sign-off. End of implementation. Every requirement in the spec is verified against the acceptance criteria. Every task is marked complete. Test coverage meets the threshold. No open questions remain unresolved. The human reviews and approves.

**JORDAN:** Gate Four is basically your Definition of Done, made explicit and traceable back to the spec.

**MAYA:** A quick practical note — can you run these gates manually without automation?

**JORDAN:** Yes. You can do Gate One by reading the spec. Gate Two by asking Copilot to cross-reference the spec and plan: "Are there any REQ-IDs in spec.md that don't appear in plan.md?" Gate Three by reviewing commit messages and PR descriptions for REQ citations. Gate Four by going through the acceptance criteria one by one and verifying. The gates work as a manual checklist, and they work automated through the GitHub Spec Kit — which we cover in the final episode.

**MAYA:** The key is — you have gates at all. Even manual gates are better than no gates.

**JORDAN:** Every gate is a moment where you *stop and verify* instead of just hoping everything went right.

**MAYA:** That's the discipline that separates professional spec-driven development from chaos with a plan on top.

**JORDAN:** Well said. Alright — Episode Four summary. `plan.md` bridges the spec and the code with phased, REQ-traced implementation steps that include explicit "done when" criteria. Tasks are machine-readable plan steps for agent orchestration. Four quality gates checkpoint the workflow: Spec Quality before planning, Coverage before coding, Traceability during implementation, and Completeness at sign-off. Gates can run manually or automatically, and even manual gates dramatically reduce late-stage surprises.

**MAYA:** Next — the decision framework. How do you actually choose between AI-assisted development and spec-driven for any given situation?

**JORDAN:** I'm Jordan.

**MAYA:** I'm Maya. See you then.

**[OUTRO MUSIC]**

---
*Runtime estimate: ~5 minutes · Word count: ~1000*
