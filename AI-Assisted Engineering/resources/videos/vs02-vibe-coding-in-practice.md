# Video Script 02 — AI-Assisted Engineering in Practice
## AI-Assisted Engineering & Spec-Driven Development Video Series · GitHub Copilot Mastery

**Format:** 2 co-hosts · VS Code screen share · ~13 minutes
**Hosts:** Jordan (male, US English) · Maya (female, US English)
**Target audience:** Developers who want to use AI-assisted development effectively — and know when to stop
**Screen setup:** VS Code · Copilot Chat panel open · a real exploration session in progress

---

## PRE-SHOW SETUP CHECKLIST
- [ ] VS Code open · Copilot Chat panel visible
- [ ] An unfamiliar API to explore (e.g., a new Azure SDK or public REST API)
- [ ] A clean project folder ready for the live exploration demo
- [ ] Terminal visible for running quick experiments
- [ ] A "vibe session journal" file open for capture notes

---

## [00:00 – 01:00] COLD OPEN

*[MAYA on screen — Copilot Chat panel open. She types a question.]*

**MAYA:** *(typing while talking)* "I need to build a CSV export for our todos app. The user clicks a button, a file downloads. How should I structure this in our Express backend?"

*[Copilot responds — suggests a route, a response header, a streaming approach]*

**MAYA:** *(reading the response)* Interesting. It's suggesting a streaming approach. I wasn't expecting that. Let me ask why.

*[Types: "Why streaming instead of building the full CSV in memory?"]*

*[Copilot explains: large datasets, memory pressure, time-to-first-byte]*

**MAYA:** Oh. That's actually a design decision I would not have made on my own. I would've built the whole string and sent it. This is better for large datasets.

*[Types: "Show me a minimal implementation of this in Express"]*

*[Code appears — 15 lines, clean, streaming CSV response]*

**MAYA:** Twenty minutes in, I have a working CSV export and I understand *why* it works. That's AI-assisted development at its best.

**JORDAN:** *(on camera — split)* The key phrase: "I understand why it works." That's what separates effective AI-assisted development from cargo-culting AI output. I'm Jordan.

**MAYA:** I'm Maya. Video Two — AI-assisted development in practice. Let's go deep.

*[TITLE CARD: "AI-Assisted Engineering in Practice" | Module 3 · AI-Assisted Engineering & Spec-Driven Dev]*

---

## [01:00 – 03:00] WHAT VIBE CODING ACTUALLY IS

*[JORDAN on screen — Copilot Chat open, about to type]*

**JORDAN:** "AI-Assisted Engineering" gets a bad reputation because people conflate it with "lazy coding" or "copy-paste coding." That's not what it is.

**JORDAN:** AI-Assisted Engineering is *conversational AI-assisted development* — an iterative dialogue between you and Copilot where the code emerges from a back-and-forth exploration rather than a pre-specified plan.

**JORDAN:** The "vibe" refers to the fluid, intuitive quality of the session. You're not filling in a spec. You're thinking out loud with an AI partner, and the conversation shapes the output.

*[ON SCREEN: Diagram — linear spec → code vs. iterative conversation → code]*

**JORDAN:** Contrast that with spec-driven development, where you define everything upfront and then execute. AI-Assisted Engineering is non-linear. You discover as you go. Each Copilot response gives you new information that shapes your next question.

**MAYA:** *(voice-over)* What makes it effective?

**JORDAN:** Three things. First — low friction to start. You don't need a plan. You don't need complete requirements. You have an idea and a keyboard. The conversation begins.

**JORDAN:** Second — rapid feedback. You generate code, you run it, you see what happens, you iterate. The cycle is minutes, not hours. This is extremely valuable in the early stages of a problem — when you're still figuring out what you're actually solving.

**JORDAN:** Third — Copilot as research partner. In a vibe session, you're not just generating code. You're learning. You can ask *why*. "Why is this pattern better?" "What are the trade-offs of this approach?" "What would break if I scaled this to 10,000 records?" Copilot explains while it builds.

**MAYA:** *(on camera)* The mindset shift: think of a vibe session as a conversation with a very knowledgeable colleague, not as a code generation machine. You're exploring together. The code is a byproduct of the thinking.

---

## [03:00 – 05:30] THE VIBE CODING LOOP — TECHNIQUE

*[MAYA on screen — live demo, building a feature conversationally]*

**MAYA:** Let me show you the actual loop. I'm going to build something from scratch in vibe mode so you can see the rhythm.

**MAYA:** Starting scenario: I need to add rate limiting to an API endpoint. I've never used a rate-limiting library in Node.js before. No plan. No spec. Let's explore.

*[Types in chat:]*
```
I need to add rate limiting to an Express API endpoint.
The endpoint handles user authentication — so I want to protect it
from brute force attacks. What are my options in Node.js?
```

*[Copilot responds: `express-rate-limit`, `rate-limiter-flexible`, built-in logic — with trade-offs]*

**MAYA:** It's given me three options with trade-offs. I didn't know `rate-limiter-flexible` existed. Let me ask about that one specifically.

*[Types: "When would I prefer rate-limiter-flexible over express-rate-limit?"]*

*[Copilot explains: distributed systems, Redis backend, more granular control]*

**MAYA:** Okay. We're on a single server right now. `express-rate-limit` is probably the right call. Let me get a working example.

*[Types: "Show me a minimal setup of express-rate-limit protecting a POST /login endpoint. 5 attempts per 15-minute window."]*

*[Code appears — 20 lines, complete, ready to paste]*

**MAYA:** *(reads the code)* I see it's using a memory store by default. Let me ask about that.

*[Types: "What happens to the memory store if the server restarts?"]*

*[Copilot: resets — all rate limit counters lost — could be abused]*

**MAYA:** Important. If I were building this for production, I'd want a persistent store. But for this spike — I just want to verify the library works. Good enough.

*[Pastes code into the project, runs a quick curl test in terminal]*

```bash
curl -X POST http://localhost:3000/login -H "Content-Type: application/json" \
  -d '{"email":"test@test.com","password":"wrong"}' -i
```

*[Shows 6 requests — first 5 get 401, 6th gets 429 Too Many Requests]*

**MAYA:** It works. In about ten minutes, I've learned about two libraries, understood the trade-off, implemented the simpler one, and verified it with a live test. That's AI-assisted development working well.

**JORDAN:** *(voice-over)* Notice what Maya did at each step. She didn't just accept the output — she asked follow-up questions. "What happens if the server restarts?" That curiosity is what makes AI-assisted development educational, not just fast.

---

## [05:30 – 07:15] THE CONVERSATIONAL TECHNIQUES — HOW TO VIBE WELL

*[JORDAN on screen — Copilot Chat, demonstrating prompt patterns]*

**JORDAN:** Not all vibe sessions are equally effective. Here are the techniques that separate good AI-assisted development from frustrated copy-paste loops.

**JORDAN:** **Technique 1: Ask "why" as often as "how."**

Most people ask "how do I do X?" Great vibe coders also ask "why is this better than Y?" and "what are the trade-offs?" The explanation changes how you use the code.

*[Shows: "Why async/await here instead of callbacks?" — Copilot explains readable error handling, stack traces]*

**JORDAN:** **Technique 2: Constrain the scope with specifics.**

"How do I build authentication?" is too broad. "Show me JWT token generation for an Express route using the jsonwebtoken library" is specific. Specificity gets you code you can actually use.

*[Shows the difference in response quality between vague and specific prompts]*

**MAYA:** *(voice-over)* **Technique 3: Iterate on what you have, don't start over.**

If Copilot gives you something 80% right, don't throw it away and rephrase your entire question. Say: "This is close, but it doesn't handle the case where the user is not found — add that." Iteration is faster than restart.

**JORDAN:** **Technique 4: Use `#file:` to add context.**

Even in a vibe session, referencing your actual code makes Copilot's responses much more relevant.

*[Types: "Given our existing `#file:src/middleware/auth.js`, how would I add role-based access control?"]*

**JORDAN:** Copilot now sees your existing patterns, your variable names, your middleware structure. The output will fit your codebase, not a generic template.

**MAYA:** *(on camera)* **Technique 5: Run and verify constantly.**

Paste the code. Run it. See what happens. Don't accumulate 10 generated snippets and then run them together. Each snippet gets verified immediately. This is the fastest path to understanding what's actually working.

**JORDAN:** **Technique 6: Capture your discoveries.**

Keep a simple `notes.md` file open during a vibe session. Paste the key insights. "Discovered: express-rate-limit memory store resets on server restart — production would need Redis." That note survives the vibe session and becomes input to your spec later.

*[Shows a simple notes.md with 5 bullet points from the session]*

---

## [07:15 – 09:00] THE TRAPS — WHEN VIBE CODING GOES WRONG

*[MAYA on screen — showing a messy codebase that resulted from too much vibing]*

**MAYA:** Let's be honest about the failure modes. Because AI-assisted development, done without awareness, creates real problems.

**MAYA:** **Trap 1: The infinite iteration loop.**

You ask Copilot to build something. It's not quite right. You ask it to fix it. Still not right. You rephrase and ask again. And again. An hour later, you have five different approaches, none of them complete, and you're less clear on what you want than when you started.

*[Shows chat history with 12 variations of the same request]*

**MAYA:** The signal: if you've rephrased the same request more than three times, stop and ask yourself whether you actually know what "right" looks like. If you don't — you need a requirement, not another Copilot prompt.

**JORDAN:** *(voice-over)* **Trap 2: Cargo-culting output.**

You paste code without understanding it. It works — until it doesn't. Then you have no idea what to change. You can't debug it because you don't understand the mechanism.

**MAYA:** The rule: if you can't explain the code to a colleague in one sentence, you don't understand it yet. Ask Copilot to explain it before you move on. "Walk me through what this code is doing, line by line."

**JORDAN:** *(on camera)* **Trap 3: Scope drift.**

You start building a CSV export. An hour later you've added filtering, sorting, column selection, and email delivery — none of which were in the original request. Copilot helpfully suggested these "improvements" and you followed along.

**MAYA:** The rule: write down your starting question on a sticky note before you begin. Check every 20 minutes: is this still solving the original problem?

**MAYA:** **Trap 4: The "vibed forever" codebase.**

You ship vibe-coded features to production. They work. But six months later — no one can understand how they fit together. Requirements and decisions are buried in a chat history that no one can find.

**JORDAN:** This is the most important trap to avoid. AI-Assisted Engineering is not a strategy for production systems. It's a strategy for exploration. When the exploration is done and you're building for keeps — spec first.

---

## [09:00 – 10:45] LIVE FULL-SESSION DEMO — VIBE CODING A FEATURE SPIKE

*[BOTH HOSTS narrating — Maya drives, Jordan observes and comments]*

**MAYA:** Let me do a complete vibe session so you can see the full rhythm from start to finish. Starting question: "I want to add full-text search to our todo items. I don't know what's available in our stack."

*[Types in chat, referencing the existing codebase:]*
```
@workspace We have a Node/Express app with a PostgreSQL database managed by Sequelize.
I want to add full-text search to the todos table so users can search by title and description.
What are my realistic options? I want to understand the trade-off before I pick one.
```

*[Copilot responds: PostgreSQL built-in full-text search, pg_trgm, Elasticsearch, MeiliSearch — with trade-offs]*

**JORDAN:** It gave four options. Notice it's framing this as a decision, not a directive. That's the right starting point for a vibe session.

**MAYA:** I like that PostgreSQL native search requires no new infrastructure. Let me explore that one.

*[Types: "Show me how to implement PostgreSQL full-text search on the todos table using Sequelize. Start with the migration."]*

*[Migration code appears — adds a generated column, creates a GIN index]*

**MAYA:** *(reading)* A GIN index — I've heard of that but never set one up. Let me ask about the performance implications.

*[Types: "What's the query performance difference with and without the GIN index on this?"]*

*[Copilot explains: sequential scan vs. index scan — dramatic difference on large tables]*

**MAYA:** Good. That confirms the index is worth the migration complexity. Let me see the query now.

*[Types: "Now show me the Sequelize query to search by the full-text index, returning results ranked by relevance."]*

*[Query code appears — uses `ts_rank`, `to_tsquery`]*

**JORDAN:** *(commenting)* Look at the `ts_rank` — ranking by relevance, not just matching. That's production-quality behaviour from a vibe session.

**MAYA:** Thirty minutes in. I understand the mechanism, I've seen the migration, I've seen the query. Now — do I ship this? No.

**JORDAN:** Right. Now Maya takes what she's learned and writes the spec. The vibe session informed the requirements. "REQ-001: Full-text search returns results ranked by relevance. Given a user enters a search term. When they submit. Then results appear ordered by PostgreSQL ts_rank." That came from the vibe session — she now knows what ts_rank is and why it matters.

**MAYA:** The vibe session is the research. The spec is the brief. This is the pattern.

---

## [10:45 – 12:00] RECAP & WHAT'S NEXT

*[BOTH ON CAMERA]*

**JORDAN:** AI-Assisted Engineering is conversational AI-assisted development — iterative, exploratory, intuitive. Powerful for discovery, prototyping, and learning.

**MAYA:** The six techniques that make it work: ask why, constrain with specifics, iterate on what you have, use `#file:` for context, run and verify constantly, and capture your discoveries.

**JORDAN:** The four traps: the infinite iteration loop, cargo-culting output you don't understand, scope drift, and building production code in permanent vibe mode.

**MAYA:** The pattern that combines both: vibe to discover, spec to deliver. Research with Copilot. Write requirements from what you learn. Implement against them.

**JORDAN:** Video Three: spec-driven development — how to write a great spec, the Given/When/Then requirement format, and why non-goals matter as much as goals. I'm Jordan.

**MAYA:** I'm Maya. See you in Video Three.

*[OUTRO: course hub URL on screen]*

---

## PRODUCTION NOTES

- **Runtime:** ~13 minutes
- **Chapter markers:** 0:00 Cold Open · 1:00 What AI-Assisted Engineering Is · 3:00 The Vibe Loop Demo · 5:30 Techniques · 7:15 Traps · 9:00 Full Demo · 10:45 Recap
- **Cold open demo:** The streaming CSV explanation is the hook — "I wouldn't have made this decision on my own." Must feel genuine and unscripted.
- **Rate limiting demo:** Pre-stage the Express project so curl tests run cleanly in one take.
- **Full-text search demo:** This needs real Copilot responses — the ts_rank explanation is the payoff moment. Allow time for reading responses naturally.
- **Traps section:** High energy — the infinite loop and cargo-culting failure modes are relatable. Add visual examples of the messy chat history.

---
*Spoken word count: ~2,300 · Estimated runtime: ~13 minutes*
