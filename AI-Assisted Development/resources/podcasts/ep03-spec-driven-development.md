# Episode 03 — Spec-Driven Development: Building With Intent
## AI-Assisted Development & Spec-Driven Development Podcast Series · GitHub Copilot Mastery · MetLife 2026

**Format:** 2 hosts · conversational · ~4.5 minutes
**Voices:** Jordan (male, US English) · Maya (female, US English)
**Audience:** Developers ready to bring structure to AI-assisted development

---

**[INTRO MUSIC FADE IN, THEN UNDER]**

**JORDAN:** Welcome back. I'm Jordan.

**MAYA:** And I'm Maya. Episode Three — spec-driven development. And I want to start with the objection I hear most: "This sounds like it's going back to the old waterfall days. Write a 50-page requirements document before touching a keyboard."

**JORDAN:** And the answer is: absolutely not. Spec-driven development in the AI era is *lightweight by design*. We're talking about a document you can write in 30 to 45 minutes that prevents days of rework. That's not overhead — that's an investment with a fast return.

**MAYA:** So let's define it properly. What is spec-driven development?

**JORDAN:** At its core, it's this: you capture *intent* before you write code. You answer three questions upfront. What are you building — precisely? What does success look like — testably? What are you *not* building — explicitly? Answer those three, and you have the foundation of a spec.

**MAYA:** And the key word there is *testably*. Because this is what separates a good requirement from a vague wish.

**JORDAN:** Exactly. "The system should handle errors gracefully" is a wish. "When a downstream API call fails, the service returns a 503 response with a retry-after header and logs the error at the WARNING level" — that's a requirement. You can write a test for it. You can verify it. You can ask the agent to implement it and know whether it did.

**MAYA:** The Given-When-Then format is really useful here.

**JORDAN:** Standard pattern from behavior-driven development, and it works perfectly. "Given a user is logged in. When they click 'Export CSV.' Then a file download begins within two seconds." Clear. Testable. Unambiguous. And you just described the acceptance criterion for that feature.

**MAYA:** Okay — what does a good spec actually contain?

**JORDAN:** Five sections. First — the summary. One paragraph. What is this feature and what business problem does it solve? Not how it works — what it does and why it matters.

**MAYA:** Second?

**JORDAN:** Requirements. Numbered. REQ-001, REQ-002, REQ-003. Each one is a single verifiable behavior. Each has at least one acceptance criterion in Given-When-Then format. The numbering matters because you're going to trace everything back to these numbers.

**MAYA:** Why does traceability matter so much?

**JORDAN:** Because it makes every downstream decision auditable. When a developer asks "why is this code here?" the answer is "it implements REQ-007." When a tester asks "what should I test?" the answer is "everything in the requirements list." When a security reviewer asks "what data does this feature handle?" the spec tells them. The spec is the single source of truth for all of those conversations.

**MAYA:** At MetLife — where we have compliance requirements, audit trails, data privacy obligations — that traceability is not just helpful, it's essential.

**JORDAN:** Non-negotiable. Third section of the spec — Non-Goals. What this spec explicitly does *not* cover. This is the section most people skip and it's critical. Non-goals prevent scope creep. If you don't say "we are not building bulk export" — someone will ask "why doesn't it support bulk export?" and the conversation derails. Explicit exclusions end that conversation before it starts.

**MAYA:** "Out of scope by design" is a complete answer when it's written in the spec.

**JORDAN:** Exactly. Fourth section — Open Questions. Things you don't know yet that could affect the implementation. Who's the owner? What's the due date for the answer? This section surfaces ambiguities before code is written, not after.

**MAYA:** And fifth?

**JORDAN:** Dependencies. What external systems, APIs, or other features does this depend on? What must be true in the environment before this can work?

**MAYA:** That's the full spec. Summary, requirements with acceptance criteria, non-goals, open questions, and dependencies.

**JORDAN:** And again — for a focused feature, this takes 30 to 45 minutes to write. Copilot can help you draft it. You describe the feature in plain English, ask Copilot to draft the spec.md, and then you review and sharpen it. You're not writing it from scratch alone.

**MAYA:** That's a key point. AI helps you write the spec too. It's not a manual artifact — it's a collaborative document.

**JORDAN:** And reviewing a spec draft is faster than writing it cold. Copilot gets you 70% of the way there quickly. You add the domain knowledge and edge cases it doesn't know.

**MAYA:** Let me bring up why spec-driven development specifically changes AI-assisted development. Because in traditional development, a developer might hold the requirements in their head and just know what they're building. With an AI agent, that's not possible.

**JORDAN:** This is so important. An AI agent has no implicit knowledge of your intent. It only knows what you tell it. In vibe mode, you're continuously providing direction through the conversation. In agent mode — when the agent is running autonomously, writing code, running tests, making decisions — there's no ongoing conversation. The spec *is* the conversation. The spec tells the agent what success looks like.

**MAYA:** Without a spec, an autonomous agent is guessing at your requirements.

**JORDAN:** And guessing at scale. If an agent writes 500 lines of code against a vague understanding of requirements — and then you realize the requirements were wrong — you're throwing away 500 lines. With a clear spec, the agent knows exactly what to implement. And when it's done, you can check the output against the acceptance criteria.

**MAYA:** The spec is the contract between the human and the agent.

**JORDAN:** Well said. And it's the contract between developers on a team, between developers and QA, between the team and the product owner. One document, multiple audiences, all aligned.

**MAYA:** Before we close — a quick note on spec length. People sometimes think more is better.

**JORDAN:** Resist that temptation. The best specs are concise and complete. If a requirement can't be described in two or three sentences, it's probably too large — break it into two requirements. Each requirement should represent a single, independently verifiable behavior. If your spec is 20 pages, you're writing a design document, not a spec.

**MAYA:** Specific, testable, concise. Those are the three qualities of a great requirement.

**JORDAN:** And the whole spec should fit comfortably on one screen. If you can't read it in five minutes, it's too long.

**MAYA:** Perfect. Episode Three done. Spec-driven development is lightweight intent-capture before coding. A good spec has five sections: summary, numbered requirements with Given-When-Then acceptance criteria, non-goals, open questions, and dependencies. AI helps you *write* the spec — you don't do it alone. The spec is the contract that makes autonomous agent execution reliable. And keep specs concise — if one requirement needs a page to describe, split it.

**JORDAN:** Next episode — the second half of the spec-driven workflow. Writing the plan, connecting tasks to requirements, and the four quality gates that ensure nothing slips through.

**MAYA:** I'm Maya.

**JORDAN:** I'm Jordan. See you in the next one.

**[OUTRO MUSIC]**

---
*Runtime estimate: ~5 minutes · Word count: ~1000*
