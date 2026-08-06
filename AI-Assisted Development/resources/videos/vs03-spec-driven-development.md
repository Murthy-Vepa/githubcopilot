# Video Script 03 — Spec-Driven Development: Building With Intent
## AI-Assisted Development & Spec-Driven Development Video Series · GitHub Copilot Mastery · MetLife 2026

**Format:** 2 co-hosts · VS Code screen share · ~14 minutes
**Hosts:** Jordan (male, US English) · Maya (female, US English)
**Target audience:** Developers moving from exploration to production-grade, traceable feature delivery
**Screen setup:** VS Code · `spec.md` being built live · split view with a vague requirement on the left

---

## PRE-SHOW SETUP CHECKLIST
- [ ] VS Code open · empty `spec.md` ready to write from scratch
- [ ] A vague "feature request" on screen (plain text, as a manager might write it)
- [ ] Copilot Chat open — will be used to help draft spec sections
- [ ] Finished `spec.md` example ready to reveal at the end as a reference

---

## [00:00 – 00:55] COLD OPEN

*[MAYA on screen — a plain-text feature request visible in the editor]*

**MAYA:** *(reading from the screen)* "Add export functionality to the dashboard. Users should be able to get their data out."

*[Long pause]*

**MAYA:** That's the whole brief. "Get their data out." Which data? In what format? For which users? From which page? Under what conditions? With what size limits?

*[Opens a new file — starts writing a spec.md]*

**MAYA:** Seven questions. None of them answered. And if I hand this to Copilot as-is and say "implement it" — Copilot will make guesses for all seven. It'll make reasonable guesses. And they might be completely wrong for what the stakeholder actually wanted.

**JORDAN:** *(voice-over)* The spec is what turns "get their data out" into something an agent — or a developer — can implement precisely and verify completely.

**MAYA:** I'm Maya.

**JORDAN:** *(on camera — split)* I'm Jordan. Video Three — spec-driven development. How to write a spec that actually works.

*[TITLE CARD: "Spec-Driven Development: Building With Intent" | Module 3]*

---

## [00:55 – 02:15] THE CASE FOR SPEC-DRIVEN — LIGHTWEIGHT BY DESIGN

*[JORDAN on screen]*

**JORDAN:** Let me address the objection head-on. "Spec-driven development sounds like waterfall. 50-page requirements documents before a single line of code."

**JORDAN:** Not even close. Spec-driven development in the AI era is *lightweight by design*. We're talking about a document you can write in thirty to forty-five minutes — that prevents days of rework. That's not overhead. That's an investment with a fast return.

**MAYA:** *(voice-over)* How fast?

**JORDAN:** I've seen developers spend three days building a feature that missed the requirement, shipping it to QA, getting it rejected, and spending another two days rebuilding it. That's five days of work for something that could have been caught in a 30-minute spec review.

**JORDAN:** The spec doesn't slow you down. It redirects the time you would have spent reworking things.

**MAYA:** *(on camera)* And Copilot helps you write the spec. This isn't a manual, from-scratch writing exercise. You describe the feature in plain English. Copilot drafts the spec.md. You review and sharpen it. You're not doing it alone — you're using the same AI that will later implement it to first articulate what "it" even means.

**JORDAN:** That's the key insight. Reviewing a spec draft is significantly faster than writing one from scratch. Copilot gets you 70% there quickly. You add the domain knowledge, the edge cases, the MetLife-specific constraints. Thirty minutes total.

---

## [02:15 – 04:00] THE FIVE SECTIONS — ANATOMY OF A GREAT SPEC

*[MAYA on screen — typing a spec.md live, section by section]*

**MAYA:** Every good spec has five sections. Let me build one for the "export functionality" brief we started with.

*[Types at the top:]*
```markdown
# Feature: CSV Export for Dashboard Todos

## Summary
```

**MAYA:** Section one — **Summary**. One paragraph. What is this feature and what business problem does it solve? Not implementation details — business value.

*[Types:]*
```markdown
Allow authenticated users to download their Todo list as a CSV file
from the Dashboard page. This enables users to import their tasks
into spreadsheet tools for reporting and offline planning.
```

**MAYA:** Twelve seconds to write. That paragraph alone resolves two of the seven ambiguities from the brief — who can use it, and from where.

*[Types:]*
```markdown
## Requirements
```

**JORDAN:** *(voice-over)* Section two — the most important one.

**MAYA:** Requirements. Numbered. REQ-001, REQ-002. Each requirement is a single verifiable behaviour. Each has at least one acceptance criterion. The numbering matters — everything downstream will reference these numbers.

*[Types:]*
```markdown
- **REQ-001:** Authenticated users can initiate a CSV download from the Dashboard.
  - **Acceptance:** Given an authenticated user is on the Dashboard. When they click
    "Export CSV." Then a file download begins within 3 seconds.

- **REQ-002:** The exported CSV includes all active todos for the user.
  - **Acceptance:** Given a user has 50 active todos. When they export.
    Then the downloaded file contains exactly 50 data rows plus a header row.

- **REQ-003:** The CSV includes columns: Title, Description, Priority, Due Date, Status.
  - **Acceptance:** Given any exported file. When opened in a spreadsheet tool.
    Then the first row contains exactly the headers: Title, Description, Priority,
    Due Date, Status.

- **REQ-004:** Unauthenticated users cannot access the export endpoint.
  - **Acceptance:** Given an unauthenticated request to POST /api/todos/export.
    When the request is received. Then a 401 Unauthorized response is returned.
```

**MAYA:** Four requirements. In about four minutes. Each one has a Given-When-Then acceptance criterion — a testable statement of what "done" looks like.

**JORDAN:** *(on camera)* Given-When-Then comes from behaviour-driven development and it's perfect for specs. "Given" sets the context. "When" describes the action. "Then" describes the expected outcome. If the then-statement isn't observable and testable — rewrite it.

---

## [04:00 – 05:30] NON-GOALS — THE MOST SKIPPED SECTION

*[MAYA continues typing in spec.md]*

**MAYA:** Section three — Non-Goals. This is the most frequently skipped section. And it's critical.

*[Types:]*
```markdown
## Non-Goals
- This spec does NOT cover bulk export of multiple users' data (admin use case).
- Filtering or sorting the exported data is out of scope.
- Email delivery of the CSV file is out of scope.
- PDF export format is out of scope.
- Real-time progress indicator for large exports is out of scope.
```

**MAYA:** Why does this matter? Imagine shipping this feature. A stakeholder reviews it and says: "Oh, can you add filtering? Can you add PDF support?" Without a non-goals section — those sound like reasonable additions, maybe even expected.

**JORDAN:** With a non-goals section — "filtering is explicitly out of scope in the spec" is a complete answer. You protect your timeline and your implementation from scope creep that wasn't agreed on.

**MAYA:** Non-goals also reveal something important: if a stakeholder says "PDF support being out of scope is wrong — we need that" — that conversation happens before development, not after. Which is exactly where you want it.

**JORDAN:** The non-goals section turns "we're not doing X" from an oversight into an explicit, deliberate decision. That's a completely different posture.

---

## [05:30 – 06:45] OPEN QUESTIONS & DEPENDENCIES

*[MAYA still in spec.md]*

**MAYA:** Sections four and five are shorter but equally important.

*[Types:]*
```markdown
## Open Questions
- [ ] Q1: What is the maximum number of todos a user can have?
      If this can exceed 10,000, we need streaming — not in-memory CSV.
      **Owner:** Backend team · **Due:** 2026-07-15

- [ ] Q2: Should completed todos be included in the export, or only active todos?
      **Owner:** Product team · **Due:** 2026-07-14

- [ ] Q3: Should the CSV filename include the export date?
      (e.g., todos-2026-07-13.csv vs todos.csv)
      **Owner:** UX team · **Due:** 2026-07-14
```

**MAYA:** Three open questions. All three would have caused implementation detours if discovered during development. An engineer builds the whole thing, ships it, and then product says "wait — we also wanted completed todos in here." That's a missed requirement discovered late.

**JORDAN:** The open questions section makes all outstanding decisions visible with owners and due dates. They get resolved before the plan is written, not during implementation.

*[Types:]*
```markdown
## Dependencies
- Requires authenticated session (auth middleware already in place).
- Requires access to the `todos` table — Sequelize model already exists.
- No new infrastructure required if todo count per user is below 10,000
  (pending Q1 resolution).
```

**JORDAN:** Dependencies tell the implementer what must be in place before this work can begin. And they tell the reviewer what assumptions the spec is making.

---

## [06:45 – 09:15] USING COPILOT TO DRAFT THE SPEC

*[JORDAN on screen — Copilot Chat open, demonstrating spec drafting]*

**JORDAN:** Let me show you how Copilot accelerates spec writing. We use Copilot to get to that 70% first draft quickly, then we sharpen it.

*[Opens chat, attaches `#file:src/routes/todos.js`]*

**JORDAN:** *(types:)*
```
We need to add CSV export functionality to this todos app.
Using the existing codebase as context, draft a spec.md for this feature.
The spec should include:
- A one-paragraph summary
- At least 4 numbered requirements in REQ-NNN format, each with a
  Given/When/Then acceptance criterion
- A non-goals section
- Open questions that need answers before implementation
- Dependencies on existing systems

Focus on what a developer needs to implement this precisely.
```

*[Copilot generates a spec draft — reads through it]*

**JORDAN:** *(reading the draft)* The summary is solid. REQ-001 through REQ-004 look good. Look at this — REQ-004 says "returns a valid CSV file with proper MIME type `text/csv`." I wouldn't have thought to specify the MIME type. That's a testable detail that matters for browser downloads.

**MAYA:** *(voice-over)* And the non-goals?

**JORDAN:** It listed five non-goals. One of them is "filtering by date range" — which is something our stakeholders actually do want eventually. This belongs in the non-goals with a note: "filtering is out of scope for this version — planned for v2."

**JORDAN:** See what's happening? Copilot's draft surfaces things I haven't decided yet. I either answer them in the spec — or I add them to open questions. The draft is a forcing function for clear thinking.

**MAYA:** *(on camera)* The workflow is: describe the feature → get the draft → review it critically → add domain knowledge and MetLife-specific constraints → sharpen the acceptance criteria → done.

**JORDAN:** Total time: thirty to forty-five minutes. For a feature that will take days to implement. The ROI on that investment is enormous.

---

## [09:15 – 11:00] WRITING GREAT REQUIREMENTS — COMMON MISTAKES

*[MAYA on screen — showing examples of weak vs. strong requirements]*

**MAYA:** Let's talk about requirement quality. Because a bad requirement is worse than no requirement — it gives false confidence while hiding the real ambiguity.

*[ON SCREEN: Side-by-side comparisons]*

**MAYA:** **Mistake 1: Vague language.**

Weak: "The system should handle errors gracefully."
Strong: "When a database connection times out during CSV generation, the endpoint returns a 503 response with body: `{error: 'Export temporarily unavailable. Try again in 60 seconds.'}`"

**JORDAN:** *(voice-over)* "Gracefully" means something different to every developer. The strong version is specific enough to write a test for.

**MAYA:** **Mistake 2: Implementation in requirements.**

Weak: "Use a Node.js stream and pipe the CSV data to the HTTP response using the `csv-writer` npm package."

**MAYA:** The requirement specifies *what*, not *how*. "Exports up to 100,000 rows without the server running out of memory" — that's a requirement. How you achieve it is the plan.

**JORDAN:** *(on camera)* **Mistake 3: Untestable acceptance criteria.**

Weak acceptance: "The export works well for most users."
Strong acceptance: "Given a user with 1,000 active todos. When they initiate export. Then the file download begins within 5 seconds and the file contains exactly 1,001 rows (1 header + 1,000 data rows)."

**MAYA:** "Works well" cannot be verified. Numbers can be verified. Specific outputs can be verified. If you can't write a test for your acceptance criterion — rewrite the criterion.

**JORDAN:** **Mistake 4: Mixing multiple behaviours in one requirement.**

Weak: "Users can export their todos as CSV or PDF, and the system emails the file if it's over 10MB."

**JORDAN:** That's three requirements in one. Break them apart. CSV export — REQ-001. PDF export — REQ-002. Email delivery for large files — REQ-003. Now each one is independently verifiable and independently implementable.

---

## [11:00 – 12:30] WHAT HAPPENS AFTER THE SPEC

*[BOTH ON CAMERA — workflow diagram on screen]*

**JORDAN:** The spec is step one. Once it's written and reviewed — what comes next?

**JORDAN:** Step two: **Gate One review**. A human reads the spec and answers: Is every requirement testable? Are non-goals populated? Are open questions owned and dated? Does this spec represent what we actually intend to build?

*[Shows the Gate One checklist briefly]*

**MAYA:** This is the cheapest possible moment to catch a problem. A requirement that doesn't survive Gate One is caught before a single task is planned, let alone implemented.

**JORDAN:** Step three: **`plan.md`**. The spec defines *what*. The plan defines *how* — ordered implementation steps, each traced to REQ-IDs, each with a done-when criterion. We'll cover this in detail in the next video.

**MAYA:** Step four: **`tasks.json`** (if using the GitHub Spec Kit). The plan converted to machine-readable format so an orchestrating agent can dispatch tasks to specialised agents. Coder agent, tester agent, security reviewer — all getting their assignments from the same source of truth.

**JORDAN:** Step five: **implementation against the spec**. Every line of code the agent writes is in service of a specific REQ-ID. Every agent prompt can reference the spec. "Implement REQ-002 from `#file:.github/specs/csv-export/spec.md`."

**MAYA:** Step six: **Gate Four — Completeness**. After implementation — does every requirement have a corresponding test? Do all tests pass? Is the acceptance criterion for each REQ-ID met? The spec is your verification checklist.

**JORDAN:** The spec travels with the feature through its entire lifecycle. It's not a document you write and discard. It's a living artifact that gets committed alongside the code.

---

## [12:30 – 13:30] RECAP

*[BOTH ON CAMERA]*

**MAYA:** Spec-driven development is lightweight by design. Thirty to forty-five minutes to write. Days of rework prevented.

**JORDAN:** Five sections: Summary, Requirements with Given/When/Then acceptance criteria, Non-Goals, Open Questions with owners, Dependencies.

**MAYA:** Use Copilot to draft the spec — review critically, add domain knowledge, sharpen acceptance criteria.

**JORDAN:** The four common mistakes: vague language, implementation in requirements, untestable acceptance criteria, and multiple behaviours in one requirement.

**MAYA:** The spec is step one. After it — Gate One review, plan.md, tasks.json, implementation, Gate Four completeness. All downstream work traces back to the spec.

**JORDAN:** Video Four: plans, tasks, and quality gates — turning a good spec into executable work. I'm Jordan.

**MAYA:** I'm Maya. See you in Video Four.

*[OUTRO]*

---

## PRODUCTION NOTES

- **Runtime:** ~14 minutes
- **Chapter markers:** 0:00 Cold Open · 0:55 The Case for Spec · 2:15 Five Sections · 4:00 Non-Goals · 5:30 Open Questions · 6:45 Copilot-Assisted Drafting · 9:15 Common Mistakes · 11:00 After the Spec · 12:30 Recap
- **Cold open:** The "get their data out" brief is the hook — keep the 7 unanswered questions on screen while Maya lists them. Pacing matters — let the silence land.
- **Spec building sequence:** Type each section at a natural pace — this should feel like a real work session, not a sped-up demo.
- **Copilot draft demo:** Use actual Copilot — the MIME type detail ("I wouldn't have thought to specify this") must be authentic. If Copilot doesn't include it, pick a different detail it does surface.
- **Common mistakes table:** Make the weak/strong comparisons a visual side-by-side graphic — highly shareable.

---
*Spoken word count: ~2,500 · Estimated runtime: ~14 minutes*
