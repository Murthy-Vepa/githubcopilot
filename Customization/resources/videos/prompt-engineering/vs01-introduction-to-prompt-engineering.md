# Video Script 01 — Introduction to Prompt Engineering
## Prompt Engineering Video Series · GitHub Copilot Mastery

**Format:** 2 co-hosts · VS Code screen share · ~10 minutes
**Hosts:** Jordan (male, US English) · Maya (female, US English)
**Target audience:** Developers who use Copilot but want dramatically better results
**Screen setup:** VS Code · Copilot Chat panel open · two prompts side-by-side — weak vs. strong

---

## PRE-SHOW SETUP CHECKLIST
- [ ] VS Code open · Copilot Chat visible
- [ ] A simple feature file open (e.g., a service class in .NET or Node.js)
- [ ] Two chat windows ready — one with a weak prompt, one with a strong prompt
- [ ] "What Copilot reads" diagram ready as a graphic

---

## [00:00 – 01:00] COLD OPEN

*[JORDAN on screen — side-by-side chat panels visible]*

**JORDAN:** Same developer. Same codebase. Same feature request. Thirty seconds apart.

*[Left panel — types:]*
```
Write a function to get users from the database.
```

*[Copilot responds — synchronous code, raw SQL, no error handling, no logging]*

**JORDAN:** That's the output. It compiles. It would technically work. But it uses raw SQL when our team uses Entity Framework. No error handling. No logging. And it's synchronous on a method that touches the database.

*[Right panel — types a complete ATCV prompt — 5 lines]*

*[Copilot responds — async, EF Core LINQ, ILogger, exception handling, matches existing patterns]*

**JORDAN:** Same request. Thirty seconds later. Completely different result. Production-quality output.

**MAYA:** *(voice-over)* The code didn't change. The tool didn't change. The prompt changed. Everything else followed.

**JORDAN:** *(on camera — split)* That's prompt engineering. Not a research topic. Not a specialised skill. It's the difference between Copilot being mildly useful and Copilot being your most effective team member. I'm Jordan.

**MAYA:** *(on camera — split)* I'm Maya. Module Two, Video One. Let's start from the beginning.

*[TITLE CARD: "Introduction to Prompt Engineering" | Module 2 · Prompt Engineering]*

---

## [01:00 – 02:45] WHAT IS A PROMPT — EVERYTHING COPILOT READS

*[MAYA on screen — VS Code with a diagram showing all prompt sources]*

**MAYA:** Let's define the term properly. A prompt is everything Copilot reads when it generates a response. And that's more than just the words you type.

*[ON SCREEN: Diagram — sources of prompts flowing into Copilot]*

**MAYA:** **Source 1: Your chat message.** The explicit text you type in the chat panel. This is what most people think of when they hear "prompt."

**MAYA:** **Source 2: The open file.** Whatever file you have open in VS Code. Copilot reads the surrounding code — the imports, the class structure, the other methods in the file. Even if you haven't referenced the file, it's part of the context.

**MAYA:** **Source 3: Attached context.** Anything you explicitly attach with `#file:`, `#selection`, `#editor`, or `@workspace`. You're intentionally expanding what Copilot sees.

**JORDAN:** *(voice-over)* Source 4?

**MAYA:** **Source 4: Instructions files.** The `copilot-instructions.md` in your repository root, and any scoped `.instructions.md` files that match the current file path. These are loaded automatically — always present in the background, even when you don't reference them.

**MAYA:** **Source 5: Prompt templates.** If you invoke a `.prompt.md` file, its content becomes part of the prompt — including all its constraints and specifications.

**JORDAN:** *(on camera)* **Source 6: Conversation history.** The previous messages in the current chat thread. Copilot uses this context to understand what you've already established.

**JORDAN:** The takeaway: prompting isn't just the one sentence you type. It's the sum of everything in Copilot's context window. Understanding that changes how you think about getting good output.

**MAYA:** If you're getting bad output — the answer is almost always "something in the context is missing or misleading." Not "Copilot is bad."

---

## [02:45 – 04:30] WHY PROMPTING MATTERS — THE COMMUNICATION MODEL

*[JORDAN on screen — showing the communication gap metaphor]*

**JORDAN:** Let me address the question I hear sometimes: "Why should I have to learn how to talk to my own tools? Shouldn't the AI just understand what I mean?"

**JORDAN:** Fair question. And the answer requires understanding how Copilot works. Copilot is not a precise function. You don't call it with parameters. You communicate with it in natural language — and natural language is inherently ambiguous.

*[Shows a diagram: developer intent → language → Copilot interpretation]*

**JORDAN:** When you say "write a function to get users from the database" — Copilot has to interpret what "get" means (all users? active users? paginated?), what "database" means in your context (SQL? Entity Framework? raw ADO.NET?), how you expect errors to be handled (throw? return null? return an empty list?), and what the output should look like (async? what naming convention?).

**JORDAN:** Copilot makes a guess for all of those. And guesses are, by definition, not guaranteed to be right.

**MAYA:** *(voice-over)* Prompt engineering is about closing that interpretation gap.

**JORDAN:** Exactly. Every word of specification you add is a gap you're closing. Every constraint removes a dimension of guessing. A well-crafted prompt leaves very little for Copilot to guess — because you've told it what it needs to know.

**MAYA:** *(on camera)* And here's the encouraging part: you don't need to become an AI expert. You need to learn one framework. One formula. Four parts. We cover it in the next video — but we'll give you a taste right now.

---

## [04:30 – 06:15] THE QUALITY GAP — LIVE DEMONSTRATION

*[MAYA on screen — live demonstration comparing 3 prompt quality levels]*

**MAYA:** Let me show the quality gap across three levels. Same request. Three prompt qualities.

**MAYA:** **Level 1: Minimal.** *(types in chat:)*
```
Fix this code.
```
*[Pastes a code snippet with a bug — no context]*

*[Copilot response: generic advice, may not identify the actual issue, offers multiple guesses]*

**MAYA:** Copilot is guessing what "fix" means. Is it a bug fix? A style fix? A performance fix? And it doesn't know what the code is supposed to do, so it can't verify its fix is correct.

**MAYA:** **Level 2: Better.** *(types:)*
```
Fix the null reference exception in the GetUserById method.
The exception occurs when userId is null.
```

*[Copilot response: targeted — adds a null check at the method entry]*

**MAYA:** Much better. Copilot knows what to fix and where. But notice — it added a null check, but it doesn't know *what* we should do when the ID is null. Throw an exception? Return null? Return a default object?

**JORDAN:** *(voice-over)* Level 3?

**MAYA:** **Level 3: Complete.** *(types:)*
```
Fix the null reference exception in GetUserById in UserService.cs.
When userId is null or whitespace, throw ArgumentNullException with message
"userId cannot be null or empty" — do not return null.
Add defensive null check at method entry, before any database call.
Verify: existing xUnit tests in UserServiceTests.cs still pass after the change.
```

*[Copilot response: precise — adds ArgumentNullException with exact message, at method entry, with guidance on which tests to run]*

**MAYA:** Three prompts. Three quality levels. The Level 3 prompt is 52 words. It took about 20 seconds to write. And it produced output you can ship.

**JORDAN:** *(on camera)* That's the return on investment of learning to write good prompts. Seconds of additional typing. Hours of rework avoided.

---

## [06:15 – 07:45] THE THREE LAYERS — HOW THIS MODULE IS STRUCTURED

*[BOTH ON CAMERA — layer diagram on screen]*

**JORDAN:** Before we go deeper, let me show you how this module builds up. Because prompt engineering for Copilot has three layers — and they build on each other.

*[Layer diagram: 1. Individual prompts → 2. Team standards → 3. Institutional knowledge]*

**JORDAN:** **Layer 1: Individual prompts.** The ATCV formula. How to write any single prompt that gets consistently good output. Videos 1 and 2.

**MAYA:** **Layer 2: Team standards.** How to encode your team's conventions so every developer gets consistent output without re-typing them every time. Instructions files and prompt templates. Videos 3 and 4.

**JORDAN:** **Layer 3: Institutional knowledge.** How to package specialist domain expertise — deployment workflows, security checks, compliance procedures — as on-demand skills that anyone can invoke. SKILL.md packages and the team prompt library. Videos 5 and 7.

**MAYA:** And between the layers — Video 6: what not to do. The anti-patterns that waste effort, and the security risks that can create real problems if you're not aware of them.

**JORDAN:** Seven videos. Each one is a standalone concept. But they build. Mastering Layer 1 makes Layer 2 more powerful. Mastering Layer 2 makes Layer 3 more effective.

**MAYA:** By Video 7, you'll have the full picture — from individual prompts to organisation-scale prompt infrastructure.

---

## [07:45 – 09:15] THE MINDSET SHIFT — FROM TOOL USER TO COMMUNICATOR

*[JORDAN on screen — reflective, direct-to-camera style]*

**JORDAN:** I want to close with a mindset shift. Because for most developers, this is the hardest part.

**JORDAN:** We're used to thinking of tools as precise. I call a function with arguments. It returns a value. The arguments are defined. The return type is defined. There's no ambiguity.

**JORDAN:** Copilot isn't like that. It's more like a conversation with a very capable colleague who happens to know everything in your codebase, every framework ever written, and every pattern in modern software development — but who also doesn't know what you're trying to do until you tell them.

**MAYA:** *(voice-over)* So the skill is communication. Not just typing.

**JORDAN:** Communication. And specifically — communication that reduces ambiguity. Be clear about the action. Be specific about the target. State your constraints. Tell it how to verify it's done.

**JORDAN:** When a developer says "Copilot isn't that useful for me" — I don't assume the tool is failing them. I ask to see their prompt. And almost every time, the prompt is underspecified. The output is exactly as good as the input asked for.

**MAYA:** *(on camera)* The encouraging thing: this is a learnable skill. Not a talent. Not something you need years of experience to master. One framework — which we cover in the next video — and you'll feel the difference immediately.

**JORDAN:** The next video is the most important one in this series. The ATCV formula. Every other concept in this module builds on it.

---

## [09:15 – 10:00] RECAP

*[BOTH ON CAMERA]*

**MAYA:** A prompt is everything Copilot reads — your message, the open file, attached context, instructions files, templates, conversation history.

**JORDAN:** The quality gap is real and dramatic. A 52-word Level 3 prompt outperforms a 4-word Level 1 prompt consistently. The difference is specification, not intelligence.

**MAYA:** Copilot fills in what you don't specify — with guesses. Every detail you add closes a gap and reduces a guess.

**JORDAN:** Three layers: individual prompts, team standards, institutional knowledge. This module covers all three.

**MAYA:** The mindset shift: you're not calling a function. You're communicating with a capable colleague who needs good context to do their best work.

**JORDAN:** Video Two: the ATCV formula — the four-part structure that makes any prompt significantly better. I'm Jordan.

**MAYA:** I'm Maya. See you in Video Two.

*[OUTRO: course hub URL]*

---

## PRODUCTION NOTES

- **Runtime:** ~10 minutes
- **Chapter markers:** 0:00 Cold Open · 1:00 What Is a Prompt · 2:45 The Communication Model · 4:30 Quality Gap Demo · 6:15 Three Layers · 7:45 Mindset Shift · 9:15 Recap
- **Cold open:** The side-by-side comparison must be the same feature request — visual clarity is everything. Pre-stage both chat panels. The weak/strong contrast is the hook.
- **Quality gap demo:** All 3 levels must run live. The Level 1 response's vagueness should be visually apparent. The Level 3 response's specificity is the payoff.
- **Layer diagram:** A clean three-layer graphic that returns in future video intros to show "we are here." Creates visual continuity across the series.

---
*Spoken word count: ~1,800 · Estimated runtime: ~10 minutes*
