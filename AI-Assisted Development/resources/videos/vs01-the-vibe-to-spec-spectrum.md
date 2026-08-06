# Video Script 01 — The AI-Assisted Development-to-Spec Spectrum
## AI-Assisted Development & Spec-Driven Development Video Series · GitHub Copilot Mastery · MetLife 2026

**Format:** 2 co-hosts · VS Code screen share · ~12 minutes
**Hosts:** Jordan (male, US English) · Maya (female, US English)
**Target audience:** Developers who use Copilot and want to understand when to explore freely vs when to plan first
**Screen setup:** VS Code · a `spec.md` file on the right · a messy "vibed" file on the left

---

## PRE-SHOW SETUP CHECKLIST
- [ ] VS Code open · split view: a clean spec.md on right, a messy exploratory file on left
- [ ] A feature spec already written to show what the "right end" of the spectrum looks like
- [ ] A browser or VS Code chat open showing a conversational back-and-forth (AI-assisted development session)
- [ ] A "spectrum dial" graphic ready for the key analogy section

---

## [00:00 – 00:55] COLD OPEN

*[JORDAN on screen — split editor view. Left: a JavaScript file with 8 functions, random naming, no comments, one function rewrites another's logic. Right: a clean `spec.md` with numbered requirements.]*

**JORDAN:** Two developers. Same feature. Same AI tool. Same week. Left side — they vibed. Right side — they specced.

*[Scrolls left file — chaotic, working code, no clear structure]*

**JORDAN:** Left side: working code. Probably. Mostly. The developer isn't quite sure if the edge cases are handled. There's no way to trace this back to the original requirements. Refactoring it next month will be painful.

*[Scrolls right file — clean spec, numbered requirements, testable acceptance criteria]*

**JORDAN:** Right side: production-ready, maintainable, fully auditable. Every line of code that gets written from this spec will trace to a numbered requirement.

**MAYA:** *(voice-over)* Here's the thing — neither of those developers was wrong. They were building different things, at different moments in a project's life. One needed to explore. One needed to deliver.

**JORDAN:** *(on camera — split with Maya)* Knowing which approach to take — and when to switch — is one of the most valuable skills you can develop with AI-assisted development. I'm Jordan.

**MAYA:** I'm Maya. Module Three, Video One — the AI-assisted-development-to-spec spectrum. Let's map it.

*[TITLE CARD: "The AI-Assisted Development-to-Spec Spectrum" | Module 3 · AI-Assisted Development & Spec-Driven Dev]*

---

## [00:55 – 02:30] WHY THIS QUESTION MATTERS NOW

*[BOTH ON CAMERA — timeline graphic on screen]*

**MAYA:** This tension between exploration and planning has always existed in software development. Agile vs. waterfall. Prototyping vs. architecture-first. It's not new.

**JORDAN:** What's new is the speed of AI. With GitHub Copilot, you can generate a thousand lines of code in an afternoon. That's incredible. But that speed amplifies everything — including mistakes.

**MAYA:** If you're going in the right direction — you arrive fast. If you're going in the wrong direction — you arrive at the wrong place, very quickly, with a lot of code to undo.

**JORDAN:** Before AI, a developer writing the wrong feature for a week produced maybe 500 lines of wrong code. With Copilot, they can produce 3,000 lines in the same time. The cost of going in the wrong direction has gone up.

**MAYA:** So AI makes the need for intentionality *higher*, not lower. More speed means more consequence when the direction is wrong.

**JORDAN:** That's the paradox. The tool gives you more power. More power means you need more judgment about when to use which mode.

**MAYA:** And that judgment — when to vibe, when to spec — is exactly what this module is about.

---

## [02:30 – 04:30] THE SPECTRUM — TWO ENDS, ONE DIAL

*[ON SCREEN: Spectrum dial graphic — "Vibe" on left, "Spec" on right, a dial in the middle]*

**JORDAN:** Imagine a dial. All the way to the left: pure AI-assisted development. All the way to the right: full spec-driven development. Most real work sits somewhere between the two.

**MAYA:** Left end — AI-assisted development. You open Copilot. You describe roughly what you want. You iterate conversationally. No formal plan. No structured requirements. You're exploring, experimenting, building intuition. The AI is your thought partner and you're figuring out the destination together.

*[Shows a chat conversation in VS Code — conversational back-and-forth building a small feature]*

**MAYA:** This is fast. Fluid. Exciting. You can build something working in thirty minutes.

**JORDAN:** Right end — spec-driven development. You start with a written specification. Clear requirements with testable acceptance criteria. A numbered list. An implementation plan where every task traces back to a requirement. Quality gates that verify coverage before any code is written. Only then does the agent start implementing.

*[Shows the spec.md file — structured, numbered, auditable]*

**JORDAN:** This is more structured. More predictable. Every line of code that gets written can be justified. The output is maintainable.

**MAYA:** Both of those descriptions are accurate — and both are incomplete. Because AI-assisted development isn't reckless, and spec-driven isn't slow, if you do each one right.

**JORDAN:** They're tools for different jobs. The skill is matching the tool to the job.

---

## [04:30 – 06:15] THE LEFT SIDE — WHEN VIBE CODING IS THE RIGHT CALL

*[MAYA on screen — VS Code, showing a Copilot chat conversation building a proof-of-concept]*

**MAYA:** Let's talk about when the dial should be on the left. When AI-assisted development is genuinely the right mode.

**MAYA:** **Early exploration of an unfamiliar API or technology.** You've never worked with a particular cloud service, a new SDK, a third-party library. You don't yet know what's possible. Vibe with Copilot. Ask questions. Build small experiments. Let Copilot show you the API surface.

*[Shows: typing "how do I authenticate with the Azure Blob Storage SDK?" in chat — conversational exploration]*

**MAYA:** You're not building for production. You're building for understanding.

**JORDAN:** *(voice-over)* What else?

**MAYA:** **Throwaway scripts with no production SLA.** A data transformation script you'll run once. A quick tool to automate something locally. A test data generator. These don't need requirements. They need to work right now.

**MAYA:** **Solo spikes.** A time-boxed investigation to answer a specific technical question — "Can we integrate X with Y? How hard is it?" You build to find out. You throw it away or you spec it properly if the answer is "yes, let's do it."

**JORDAN:** *(on camera)* **Learning sessions.** Build something and ask Copilot to explain it. "Why did you use a closure here?" "What does this decorator pattern give us?" The conversation IS the value. Code is a teaching tool.

**MAYA:** **Tight demo deadlines.** A demo that lives for 24 hours and will never see production. Ship it. Vibe it. It doesn't need to be maintainable — it needs to be impressive, today.

*[ON SCREEN: "When to Vibe" checklist]*

**JORDAN:** The common thread: the output is disposable, the goal is discovery, or the timeline is so short that planning cost exceeds implementation cost. In those cases — turn the dial left.

---

## [06:15 – 07:45] THE RIGHT SIDE — WHEN THE SPEC COMES FIRST

*[JORDAN on screen — showing a spec.md file]*

**JORDAN:** Now the right side. When does the dial go right — when does spec-driven development earn its overhead?

**JORDAN:** **Any code going to production.** The moment code is going to live in a production system, be used by real users, or handle real data — the spec earns its cost. "Ship and pray" is not a viable strategy for production features at MetLife.

*[ON SCREEN: Production checklist]*

**JORDAN:** **Security, compliance, or data privacy implications.** If the feature touches personal data, financial data, authentication, authorisation, or regulatory requirements — you need a spec. You need an audit trail. The spec IS the compliance artifact.

**MAYA:** *(voice-over)* At MetLife, many features fall into this category. Insurance data. Premium calculations. Customer records. These must be built from a spec.

**JORDAN:** **Multi-developer or multi-agent implementation.** If more than one person — or more than one agent — is working on the feature, they need a shared map. The spec is that map. Without it, two developers will make incompatible assumptions about requirements.

**JORDAN:** **Features that will be maintained for more than one sprint.** If the code will be changed, extended, or supported by developers who weren't in the original conversation — they need the spec. The spec is the documentation that survives the development conversation.

**MAYA:** *(on camera)* And finally — **features that need a handoff**. Handing code to QA, to a security reviewer, to a different team. They need context. The spec provides it without requiring the original developer to be present for every question.

---

## [07:45 – 09:30] THE WARNING SIGNS — RECOGNISING THE WRONG MODE

*[BOTH ON CAMERA — warning sign graphics on screen]*

**MAYA:** Both modes have failure patterns. Recognising them early saves you from a bad experience.

**JORDAN:** Warning signs you've been vibing too long when you needed a spec:

*[List appears on screen]*

**JORDAN:** You've been in a conversational loop for more than two hours and don't have a clear mental model of what the code actually does. That's not exploration — that's drift.

**MAYA:** You can't explain what the code does to a colleague without a ten-minute walk-through. If the feature needs a ten-minute explanation, it needed a one-page spec.

**JORDAN:** You've rewritten the same function three times from scratch because it "wasn't quite right." That's not iteration — that's unclear requirements. A requirement would have told you what "right" means.

**MAYA:** Your code is working but you're not sure if it handles the edge cases. Because edge cases weren't specified.

**JORDAN:** You realise mid-implementation that two parts of the feature make incompatible assumptions about how a shared piece of data should work.

*[Second list — warning signs you're over-speccing when you should just vibe]*

**MAYA:** You spent two days writing a spec for a script that would have taken twenty minutes to build.

**JORDAN:** The spec keeps growing — adding more requirements, more edge cases, more dependencies — and the first line of code hasn't been written.

**MAYA:** You're writing acceptance criteria for a throwaway prototype that will never see a user.

**JORDAN:** You're paralysed because you're trying to spec every edge case before you know what the core feature even looks like.

**MAYA:** These are signals to move the dial — in either direction.

---

## [09:30 – 10:45] THE HYBRID — VIBE TO DISCOVER, SPEC TO DELIVER

*[JORDAN on screen — showing a workflow: chat exploration → spec.md creation → plan.md → agent]*

**JORDAN:** The most effective pattern isn't choosing one mode for a whole project. It's using them sequentially. Vibe to discover. Spec to deliver.

**JORDAN:** Here's the workflow. You get a new feature idea. You don't fully understand the scope — that's normal. So you spend thirty minutes AI-assisted development with Copilot. You ask questions. You build a quick prototype. You explore the problem space.

*[Shows the conversational chat — "what's the best way to implement X?" — building quick experiments]*

**JORDAN:** Now you understand the problem. You have intuitions about the edge cases. You've discovered the hard parts. You know what "done" actually means.

**JORDAN:** Now you write the spec. You take what you learned in the vibe session and turn it into requirements. Specific, testable, numbered requirements. Non-goals that came from the exploration — "we tried X and it's out of scope because Y." Open questions that surfaced during AI-assisted development that need answers before implementation.

*[Shows: vibe session notes → spec.md being written]*

**JORDAN:** Then the plan. Then the agent implements against the spec.

**MAYA:** *(on camera)* You get the discovery benefits of AI-assisted development — fast, fluid, intuitive — and the delivery benefits of spec-driven development — structured, maintainable, auditable.

**JORDAN:** The vibe session is research. The spec is the brief. The agent is the developer. All three play a role.

---

## [10:45 – 12:00] RECAP

*[BOTH ON CAMERA]*

**JORDAN:** The AI-assisted-development-to-spec spectrum exists because different contexts need different modes. Vibe for exploration, discovery, prototypes, and learning. Spec for production, compliance, multi-developer, and multi-sprint work.

**MAYA:** AI amplifies speed — which means it amplifies the cost of going in the wrong direction. More speed requires more judgment about direction.

**JORDAN:** The warning signs of being in the wrong mode: confusion, rewriting the same thing, unable to explain what the code does, or paralysis from over-planning.

**MAYA:** The most powerful pattern: vibe to discover, spec to deliver. Let exploration inform your requirements. Then implement against them with precision.

**JORDAN:** Video Two: AI-assisted development in depth — the techniques, the conversational loop, and how to get the most out of unstructured AI-assisted development. I'm Jordan.

**MAYA:** I'm Maya. See you in Video Two.

*[OUTRO: course hub URL on screen]*

---

## PRODUCTION NOTES

- **Runtime:** ~12 minutes
- **Chapter markers:** 0:00 Cold Open · 0:55 Why It Matters Now · 2:30 The Spectrum · 4:30 When to Vibe · 6:15 When to Spec · 7:45 Warning Signs · 9:30 The Hybrid Workflow · 10:45 Recap
- **Cold open:** Side-by-side files is the visual hook — must be clearly contrasted (chaotic vs clean)
- **Spectrum dial graphic:** Keep it visible and return to it multiple times throughout — it's the central metaphor
- **Warning signs section:** Consider making these on-screen callout cards — memorable and shareable

---
*Spoken word count: ~2,100 · Estimated runtime: ~12 minutes*
