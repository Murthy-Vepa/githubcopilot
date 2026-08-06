# Episode 06 — GitHub Spec Kit: Automating Spec-Driven Development
## AI-Assisted Development & Spec-Driven Development Podcast Series · GitHub Copilot Mastery · MetLife 2026

**Format:** 2 hosts · conversational · ~5 minutes
**Voices:** Jordan (male, US English) · Maya (female, US English)
**Audience:** Developers and teams ready to operationalize spec-driven development at scale

---

**[INTRO MUSIC FADE IN, THEN UNDER]**

**MAYA:** Welcome to the final episode of the AI-Assisted Development and Spec-Driven Development series. I'm Maya.

**JORDAN:** And I'm Jordan. We've covered the full picture — what AI-assisted development is, what spec-driven development is, how to write specs and plans, how quality gates work, and how to choose between the modes. Today we close the loop with the tooling: the GitHub Spec Kit.

**MAYA:** And I want to frame this clearly. Everything we've covered in the previous five episodes works without the Spec Kit. The framework, the documents, the quality gates — you can run all of it manually. The Spec Kit just automates and accelerates what's already proven to work.

**JORDAN:** Think of it as going from a manual process to a power tool. The power tool doesn't change *what* you're building — it just makes it faster and less error-prone.

**MAYA:** So what exactly is the GitHub Spec Kit?

**JORDAN:** It's a lightweight, file-based specification framework that sits between a user story and code. The core idea: instead of developers interpreting vague requirements on the fly, the Spec Kit provides structure that agents can execute, humans can review, QA can verify, and PRs self-document. Everything lives in files — in the repo — versioned and reviewable like any other code artifact.

**MAYA:** Three files at the heart of it. Let's go through each one.

**JORDAN:** File one — `spec.md`. This is the specification document. We covered what goes in it in Episode Three: feature summary, numbered requirements with acceptance criteria, out-of-scope items, open questions, and dependencies. In the Spec Kit context, this file lives at `.github/specs/[feature-name]/spec.md`. It travels with the feature through its entire lifecycle.

**MAYA:** File two?

**JORDAN:** `plan.md`. The implementation plan. We covered this in Episode Four — phased steps, each traced to one or more REQ-IDs, with explicit "done when" criteria and dependency chains. Same location, same folder as the spec. They travel together.

**MAYA:** And file three — the one that's new if you've been thinking about manual spec-driven development.

**JORDAN:** `tasks.json`. This is `plan.md` converted to a machine-readable format. Each task has an ID, a title, which agent should execute it — coder, tester, reviewer, security-reviewer — which REQ-IDs it satisfies, which tasks it depends on, and a status field. This is what the orchestrating agent reads to dispatch work.

**MAYA:** So `spec.md` is for humans and AI to align on intent. `plan.md` is for humans to review the approach. `tasks.json` is for the agent to execute.

**JORDAN:** Three audiences, three formats, one source of truth.

**MAYA:** Let's talk about the agent workflow. Because this is where the Spec Kit becomes powerful at scale.

**JORDAN:** In an automated Spec Kit workflow, you have a Planner agent and a team of specialized agents. The Planner reads your feature description, drafts `spec.md`, generates `plan.md`, converts it to `tasks.json`. You review and approve — that's Gate One and Gate Two. Then an Orchestrator agent picks up `tasks.json` and dispatches tasks to specialized agents based on the agent field in each task.

**MAYA:** So the Coder agent gets the implementation tasks, the Tester agent gets the test tasks, the Security Reviewer gets the security audit tasks.

**JORDAN:** All in parallel where dependencies allow. The Orchestrator manages the dependency chain, making sure tasks don't start before their prerequisites are complete.

**MAYA:** And each agent knows exactly what it's doing because the task has the REQ-IDs, the done-when criteria, and the dependency context.

**JORDAN:** No ambiguity. No coordination overhead. The spec defines success, the plan defines the approach, the tasks define the assignments.

**MAYA:** Let's talk about the four quality gates in the automated context. Because in the Spec Kit, these can be partially or fully automated.

**JORDAN:** Gate One — Spec Quality — is still a human gate. You read the draft spec, you verify the requirements are testable and complete, you approve it. This is intentional. The spec represents human intent. A human must sign off.

**MAYA:** Gate Two?

**JORDAN:** Spec-to-Plan Coverage — this can be automated. The Spec Kit tooling can cross-reference all REQ-IDs in `spec.md` against all REQ citations in `plan.md` and flag any orphaned requirements. "REQ-005 appears in the spec but no plan step references it." Caught automatically, before a single line of code is written.

**MAYA:** That kind of systematic check is hard to do reliably by hand on a large spec.

**JORDAN:** Especially when the spec has 20 or 30 requirements. Automation catches what human eyes miss. Gate Three — Plan-to-Code Traceability — is enforced through commit conventions. Commit messages reference task IDs and REQ-IDs. The Spec Kit can generate a traceability report showing you exactly which commits implement which requirements. Invaluable for compliance audits.

**MAYA:** And Gate Four?

**JORDAN:** Completeness — the final sign-off. The Spec Kit checks that all tasks are marked complete, all acceptance criteria have corresponding test cases, and coverage meets the defined threshold. A human does the final approval, but the tooling does the audit work.

**MAYA:** So you're not replacing human judgment — you're replacing human tedium.

**JORDAN:** Exactly. The humans focus on the decisions that require context and domain knowledge. The tools handle the systematic checks that would otherwise be error-prone and time-consuming.

**MAYA:** Let me bring up the constitution. Because the Spec Kit has one more important artifact — `constitution.md`.

**JORDAN:** Great call. The constitution is a living document that captures your team's technical identity — the codebase patterns, the conventions, the tech stack, the non-negotiable standards. It's what every agent on the team reads before starting any task. Think of it as the onboarding document for the AI team members.

**MAYA:** So while the spec tells agents *what* to build, the constitution tells them *how* to build it in a way that fits your codebase.

**JORDAN:** The agent that implements a feature will follow the patterns in the constitution — naming conventions, error handling patterns, preferred libraries, test framework conventions. You write the constitution once and it improves every task the agents run.

**MAYA:** And it's version-controlled. It improves over time as the team refines its practices.

**JORDAN:** And it's reviewable. If someone adds "always skip security validation for performance" to the constitution — that change goes through a PR review. The same governance that protects your code protects your agent instructions.

**MAYA:** Let me close with the big picture. We've gone from AI-assisted development to the GitHub Spec Kit in six episodes. What does it all mean for a developer at MetLife?

**JORDAN:** It means you have a complete toolkit. For exploration and learning — vibe code freely. For production features — write a spec, generate a plan, run the quality gates. For team or multi-agent work — use the Spec Kit to coordinate, trace, and automate. For all of the above — Copilot is your partner at every step. Writing the spec, reviewing the plan, checking the gates, implementing the tasks.

**MAYA:** The methodology scales with the complexity of the work.

**JORDAN:** That's the design. A throwaway script needs 0% of this framework. A compliance-critical, team-built, production feature benefits from 100% of it. And everything in between lands somewhere on the spectrum — as it should.

**MAYA:** Pick the right tool for the job. Know when to be fluid and when to be structured.

**JORDAN:** And use AI throughout — not just for the code, but for the spec, the plan, the review, the gates. Copilot isn't just a coding tool. It's a development workflow tool.

**MAYA:** That's the real shift.

**JORDAN:** And now you have the framework to make it work.

**MAYA:** That's the complete series. Six episodes covering the AI-assisted-development-to-spec spectrum, AI-assisted development best practices and warning signs, spec-driven development and what makes a great requirement, plans and quality gates, the decision framework, and the GitHub Spec Kit as automation layer. Thank you for listening.

**JORDAN:** Go write a spec for something that's been bugging you. Even a mini one. You'll feel the difference. I'm Jordan.

**MAYA:** I'm Maya. Happy coding — vibe or spec, or somewhere brilliantly in between.

**[OUTRO MUSIC]**

---

## Series Summary

| Episode | Title | Runtime |
|---------|-------|---------|
| Ep 01 | Introduction: The AI-Assisted Development-to-Spec Spectrum | ~4 min |
| Ep 02 | AI-Assisted Development: Exploring at the Speed of Thought | ~4.5 min |
| Ep 03 | Spec-Driven Development: Building With Intent | ~5 min |
| Ep 04 | Plans, Tasks & Quality Gates | ~5 min |
| Ep 05 | AI-Assisted Development vs Spec-Driven: The Decision Framework | ~5 min |
| Ep 06 | GitHub Spec Kit: Automating Spec-Driven Development | ~5 min |

**Total series runtime: ~28 minutes**

---
*Runtime estimate: ~5 minutes · Word count: ~1050*
