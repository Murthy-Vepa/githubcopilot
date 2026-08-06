# Video Script 05 — Vibe vs. Spec: Choosing Your Mode
## AI-Assisted Development & Spec-Driven Development Video Series · GitHub Copilot Mastery · MetLife 2026

**Format:** 2 co-hosts · VS Code screen share · ~12 minutes
**Hosts:** Jordan (male, US English) · Maya (female, US English)
**Target audience:** Developers who understand both modes and want a practical decision framework
**Screen setup:** VS Code · decision framework on screen · real scenario examples ready to walk through

---

## PRE-SHOW SETUP CHECKLIST
- [ ] VS Code open · decision framework graphic visible
- [ ] 5 real-world scenario cards prepared (product manager style feature requests)
- [ ] A simple scoring rubric on screen (7 questions, yes/no, tally the score)
- [ ] Examples of "vibe → spec handoff" showing notes becoming requirements

---

## [00:00 – 00:55] COLD OPEN

*[JORDAN on screen — 5 feature request cards on screen, like sticky notes]*

**JORDAN:** Five scenarios. Let's sort them quickly.

*[Reads them aloud, one by one, while sorting them into two columns]*

**JORDAN:** "Write a quick script to reformat 500 CSV rows into our database import format. One-time use." *(puts left — vibe)*

**JORDAN:** "Add role-based access control to the PolicyManagement API. Roles: Admin, ReadOnly, Underwriter. Production feature, audit trail required." *(puts right — spec)*

**JORDAN:** "I want to explore whether we can use WebSockets instead of polling for our notification system." *(puts left — vibe)*

**JORDAN:** "Implement premium calculation changes per the new state regulations. Due next quarter. Compliance review required." *(puts right — spec)*

**JORDAN:** "I need to show a proof-of-concept demo of AI-powered claim categorisation for the board presentation on Friday." *(puts left — vibe)*

**MAYA:** *(voice-over)* The sorting was fast. Because the signals were clear. But real scenarios are rarely that clear. Most fall somewhere in the middle.

**JORDAN:** *(on camera)* The decision framework in this video makes those middle cases clear too. I'm Jordan.

**MAYA:** *(on camera — split)* I'm Maya. Video Five — choosing your mode. Let's build the framework.

*[TITLE CARD: "Vibe vs. Spec: Choosing Your Mode" | Module 3]*

---

## [00:55 – 03:00] THE SEVEN QUESTIONS — A DECISION RUBRIC

*[MAYA on screen — a scoring rubric appears, 7 yes/no questions]*

**MAYA:** The decision between vibe and spec comes down to seven questions. For each one, a "yes" adds one point to the "spec" column. Count the points. The score tells you where to set the dial.

*[ON SCREEN: Questions appear one by one]*

**MAYA:** **Question 1: Will this code go to production?**
If yes — that's one point toward spec. Production code has users, SLAs, and maintenance implications. Spec first.

**MAYA:** **Question 2: Does it involve security, compliance, or personal data?**
Authentication, authorisation, personal information, financial records, regulatory requirements — any of these — one point toward spec. At MetLife, this catches most of the work we do.

**JORDAN:** *(voice-over)* **Question 3: Will more than one developer or agent work on this?**
If yes — they need a shared map. The spec is that map. One point toward spec.

**MAYA:** **Question 4: Will this code be maintained for more than one sprint?**
If the code will be changed, extended, or debugged by anyone other than you, right now — one point toward spec. Maintainability requires traceability.

**JORDAN:** *(on camera)* **Question 5: Does the feature require an audit trail or sign-off?**
Compliance workflows, security reviews, regulatory approvals — these require documentation that can be reviewed. The spec is that documentation. One point.

**MAYA:** **Question 6: Do you already know what "done" looks like?**
If you can state the acceptance criteria before writing a line of code — you're ready to spec. If you honestly don't know yet — the spec will be vague and unhelpful. Vibe first to discover what "done" is.

*[Note: this question is INVERTED — "no" adds a spec point because clarity is a spec signal]*

*[Correction shown on screen: "Yes to this question = you already know — lean spec. No = you're still discovering — lean vibe."]*

**JORDAN:** **Question 7: Is the risk of doing this wrong high?**
Financial calculations, claims processing, customer-facing data — wrong is expensive. High-risk work needs the discipline of a spec and quality gates. One point.

---

## [03:00 – 04:30] READING THE SCORE

*[JORDAN on screen — score interpretation chart]*

**JORDAN:** Count your "yes" answers. Here's how to read the score.

*[Chart on screen:]*

| Score | Mode |
|-------|------|
| 0–1 | Pure vibe — explore freely |
| 2–3 | Vibe with a capture strategy — take notes, document decisions |
| 4–5 | Hybrid — vibe to discover, then write a lightweight spec |
| 6–7 | Full spec-driven — spec first, plan second, implement third |

**JORDAN:** Let me apply this to our five cold-open scenarios.

*[Walks through each scenario:]*

**JORDAN:** "One-time CSV reformatting script." Score: 0. Not production, no compliance, no handoff, no maintenance, no audit trail, risk low. Pure vibe.

**JORDAN:** "Role-based access control on PolicyManagement API." Score: 7. Production, security, multi-developer, multi-sprint, audit required, risk very high. Full spec-driven.

**MAYA:** *(voice-over)* "WebSocket exploration spike." Score: 1. Not production (it's a spike), no compliance, solo work, throwaway. Pure vibe — but take notes on your findings.

**JORDAN:** "Premium calculation per state regulations." Score: 7. Production, compliance, multi-developer, multi-sprint, regulatory sign-off, very high risk if wrong. Full spec-driven.

**MAYA:** *(on camera)* "AI proof-of-concept for Friday." Score: 2. Not production, no compliance, solo, disposable, but — you might need to explain decisions after the demo. Score 2: vibe with a capture strategy. Build fast, keep notes, document the key decisions you made.

**JORDAN:** The rubric removes gut-feel from the decision. It's a consistent, team-sharable framework.

---

## [04:30 – 06:30] THE HYBRID WORKFLOW IN DETAIL

*[MAYA on screen — showing the vibe → spec handoff live]*

**MAYA:** Score 4 or 5 is the most common zone for real work. Let me show you what the hybrid workflow looks like in practice.

**MAYA:** Scenario: "Add a smart search to our claims list — users want to search by claimant name, claim number, and status simultaneously." Score: 4. Going to production. But it's a new capability — I don't fully know what "done" looks like yet. Hybrid.

**MAYA:** **Phase 1: Vibe session — 30 minutes.**

*[Opens Copilot chat:]*
```
@workspace I need to add a combined search to our claims list.
Users should be able to search by claimant name, claim number, and status.
Looking at our existing data model, what are my realistic implementation options?
What are the trade-offs between client-side filtering and a backend search endpoint?
```

*[Copilot responds — compares approaches, recommends backend with debouncing]*

**MAYA:** I'm learning. I now know: client-side filtering won't work at scale, I need a backend endpoint, and debouncing the search input is important for performance.

*[Opens a scratchpad notes.md:]*
```markdown
## Search spike findings
- Client-side filtering: works for < 500 rows, not scalable to our 10,000+ claims
- Backend endpoint needed: GET /api/claims/search?q=
- Debounce the input: 300ms recommended to avoid API hammering
- Status filter: enum — OPEN, CLOSED, PENDING, APPROVED, DENIED
- Combined search: use PostgreSQL ILIKE for name + exact match for claim number
```

**MAYA:** Five minutes of notes-taking. Those discoveries are now the foundation of my spec.

**MAYA:** **Phase 2: Write the spec — 25 minutes.**

*[Opens spec.md — starts from the notes]*

**MAYA:** My notes become my requirements. "Backend needed" → REQ-001: A GET /api/claims/search endpoint accepts query parameters. "Debounce" → REQ-002: Frontend debounces input by 300ms before triggering a request. "Status filter" → REQ-003: Status filter accepts OPEN, CLOSED, PENDING, APPROVED, DENIED. "Combined" → REQ-004: A search term matches claimant name (partial) OR exact claim number.

**JORDAN:** *(voice-over)* The vibe session was the research. The spec is the brief. Thirty minutes of exploration produced thirty minutes of spec writing that's grounded in reality — not wishful thinking.

**MAYA:** This is the hybrid mode in action. You didn't vibe forever. You didn't spec something you didn't understand yet. You explored until you understood. Then you formalised.

---

## [06:30 – 08:15] THE SWITCHING SIGNALS — WHEN TO CHANGE MODES MID-SESSION

*[JORDAN on screen — showing recognisable signal moments]*

**JORDAN:** The hardest decision isn't the initial mode choice — it's recognising mid-session that you're in the wrong mode. Here are the signals.

**JORDAN:** **Signals that you should STOP VIBING and write a spec:**

*[ON SCREEN: signals appear as a list]*

**JORDAN:** You've been in a conversation loop for more than 90 minutes and you still can't state what "done" looks like. That's not exploration — that's drift. Stop. Write down what you've learned. Write the spec.

**JORDAN:** You're about to start implementing because the vibe session showed you it's feasible — but now you're realising it will take more than one day. Anything taking more than one day needs a spec so others can pick it up.

**JORDAN:** You've discovered that the feature has security implications you didn't realise when you started. REQ on compliance needs to be written before the feature goes further.

**MAYA:** *(voice-over)* And the signals that you should STOP SPECCING and just vibe:

**JORDAN:** You're writing acceptance criteria for edge cases you haven't even established the happy path for yet. You're speccing things you haven't explored — you're writing fiction, not requirements.

**JORDAN:** Your open questions list has 10 unanswered items and the spec is still growing. The spec is growing because you're using it as a thinking tool, not a documentation tool. Switch to vibe mode to answer those questions through experimentation.

**JORDAN:** You've been writing the spec for two hours and haven't written a single line of code. The spec is a means, not an end. Time-box it.

**MAYA:** *(on camera)* The signal in both directions is the same: are you productive? Are you moving toward "done"? If you're spinning — switch modes.

---

## [08:15 – 10:00] TEAM ALIGNMENT — A SHARED DECISION FRAMEWORK

*[BOTH ON CAMERA]*

**MAYA:** The decision framework is more valuable when the whole team uses it consistently. Because one developer vibing on a feature that needed a spec affects everyone downstream — the testers, the reviewers, the next developer who maintains it.

**JORDAN:** How do you align a team? Three things.

**JORDAN:** **First — share the rubric.** Put the seven questions in your team wiki. Reference it in your ticket templates. "Score this feature before starting." A shared rubric means consistent decisions across the team.

**MAYA:** **Second — add the spec/plan question to your sprint ceremonies.** During planning: "Is this a spec-first feature or a vibe-first feature?" For anything scoring 4 or above — who is writing the spec? When is Gate One review? These become planning items, not afterthoughts.

**JORDAN:** **Third — make spec files part of the pull request.** When a spec-first feature is implemented — the PR should include the spec.md and plan.md alongside the code. Reviewers review the spec alongside the code. This creates the habit and the documentation together.

**MAYA:** And for vibe-first work — a simple rule: before the branch gets merged, a brief ADR (Architecture Decision Record) documents the key decisions made during the vibe session. Not a full spec — just the choices that could confuse a future developer.

**JORDAN:** The goal isn't bureaucracy. The goal is enough documentation that someone can pick up the work six months later without needing to reconstruct the original developer's mental model from scratch.

**MAYA:** Which, in a world of AI-accelerated development, is more important than ever. Code is fast. Context is the bottleneck.

---

## [10:00 – 11:30] RECAP

*[BOTH ON CAMERA]*

**JORDAN:** Seven questions. Score 0–1: pure vibe. Score 2–3: vibe with notes. Score 4–5: hybrid. Score 6–7: full spec-driven.

**MAYA:** The hybrid workflow: vibe to discover what you don't know, then write the spec from what you learned. Thirty minutes of exploration → thirty minutes of spec writing → fully grounded requirements.

**JORDAN:** Switching signals: 90 minutes in a loop, security implications discovered, multi-day scope — stop vibing, write the spec. Writing edge cases you haven't explored, 10 unanswered open questions, two hours of spec with no code — stop speccing, go explore.

**MAYA:** Team alignment: share the rubric, add mode decisions to sprint ceremonies, include spec files in pull requests, write brief ADRs for vibe-first merges.

**JORDAN:** Video Six: the GitHub Spec Kit — the tooling that automates the spec-driven workflow at scale. Three files, automated quality gates, multi-agent orchestration. I'm Jordan.

**MAYA:** I'm Maya. One more video to go. See you there.

*[OUTRO]*

---

## PRODUCTION NOTES

- **Runtime:** ~12 minutes
- **Chapter markers:** 0:00 Cold Open · 0:55 Seven Questions · 3:00 Reading the Score · 4:30 Hybrid Workflow Demo · 6:30 Switching Signals · 8:15 Team Alignment · 10:00 Recap
- **Cold open card sorting:** This must feel fast and decisive — the rapid sorting is the hook. Visually satisfying with sticky note cards or a simple drag-and-drop graphic.
- **Scoring table:** Put the score-to-mode table on screen during the entire "reading the score" section. Reference it as each scenario is scored.
- **Hybrid demo:** The notes.md → spec.md transformation is the core demo of this video. Show the notes first, then show how each note becomes a requirement. This is the money moment.
- **Team alignment section:** Consider a brief graphic of a team calendar with "spec review" as a planning item — normalises the practice visually.

---
*Spoken word count: ~2,050 · Estimated runtime: ~12 minutes*
