# Episode 03 — Chat Modes: Inline Chat, Chat Panel & Participants
## Copilot Fundamentals Podcast Series · GitHub Copilot Mastery

**Format:** 2 hosts · conversational · ~4.5 minutes
**Voices:** Jordan (male, US English) · Maya (female, US English)
**Audience:** Developers ready to go beyond ghost text

---

**[INTRO MUSIC FADE IN, THEN UNDER]**

**JORDAN:** Welcome back. I'm Jordan.

**MAYA:** And I'm Maya. Okay — episode three, and this is the one that made the biggest difference for me personally. Chat modes. Because once you understand the difference between inline chat and the full chat panel — and once you know about @participants and slash commands — your productivity genuinely shifts gears.

**JORDAN:** Let's start with inline chat because it's the natural next step after completions. Keyboard shortcut — `Ctrl+I` on Windows, `Cmd+I` on Mac.

**MAYA:** What's the typical use case?

**JORDAN:** You've got some code selected, and you want to do *something specific* to it — right there, without leaving the file. Refactor this to use async. Add null checks. Explain what this does. Convert this from a for-loop to LINQ. The inline chat window pops up right at your cursor, you type your request, and Copilot either explains or edits the selected code in place.

**MAYA:** And I love that you can see the diff. It shows you what it's about to change before you accept. You can hit Accept, Discard, or keep tweaking.

**JORDAN:** That review step is important. Get in the habit of reading the diff, not just accepting. You're the engineer — you own the output.

**MAYA:** When do you use inline chat versus completions?

**JORDAN:** Good question. Completions are for *writing new code* — you're building forward. Inline chat is for *working with existing code* — you're modifying, explaining, or fixing something that's already there. If I'm in the middle of a function and want to add a block, completions. If I've got a 30-line method and want to refactor its error handling, inline chat.

**MAYA:** Okay — now the chat panel. This is the full conversational experience. `Ctrl+Shift+I`.

**JORDAN:** And this is where the depth of Copilot really opens up. In the chat panel you're not limited to what's selected or even what's in the current file. You can ask questions about your entire project, ask for architecture recommendations, generate documentation, get explanations — the scope is much broader.

**MAYA:** But the real power unlock in the chat panel is @participants. Can you walk through those?

**JORDAN:** So @participants are special context providers. They tell Copilot *where* to look when answering your question. The most important one — `@workspace`. When you prefix your message with @workspace, Copilot indexes your entire codebase and answers with knowledge of your whole project.

**MAYA:** Give me a concrete example.

**JORDAN:** Sure. Without @workspace: "Where should I add input validation for a new API endpoint?" Copilot gives you a generic answer based on common patterns. With @workspace: "Where should I add input validation for a new API endpoint?" — it reads your actual project, finds your existing validation patterns, points you to the right file and layer. Night and day.

**MAYA:** And the other @participants?

**JORDAN:** `@terminal` gives Copilot visibility into your last terminal command and its output. So if your build just failed, you can type "@terminal fix this build error" and it sees the actual error message — you don't have to copy-paste it. `@github` connects to your GitHub account — it can search your issues, your pull requests, your repositories. Ask it "what issues are assigned to me this sprint?" and it actually goes and looks.

**MAYA:** That last one feels almost like having a GitHub dashboard inside your editor.

**JORDAN:** That's exactly what it is. Now, @participants pair with *slash commands*. These are pre-built, optimized operations that trigger specific behaviors.

**MAYA:** Walk me through the key ones.

**JORDAN:** `/explain` — select some code, type `/explain`, and Copilot gives you a plain-English walkthrough of what it does. Great for onboarding into an unfamiliar codebase. `/fix` — select broken code or paste an error, type `/fix`, and it suggests a fix with an explanation. `/tests` — select a class or function, type `/tests`, and Copilot generates a unit test suite. And `/doc` — select a function, type `/doc`, and it generates documentation comments.

**MAYA:** I want to call out `/tests` specifically because this is the one that saves me real time. I select a service class, hit `/tests`, and I get a test file with cases for the happy path, edge cases, and error scenarios. That would have taken me an hour to write manually.

**JORDAN:** And then your job is to review them, add any cases that are unique to your domain, and run them. The thinking is done — you're editing, not starting from scratch.

**MAYA:** Okay, let me bring up something that trips people up. What's the difference between asking a question in the chat panel with @workspace versus just using inline chat?

**JORDAN:** It comes down to scope and interaction style. Inline chat is *surgical* — you've picked a specific piece of code and you want Copilot to operate on exactly that. Chat panel is *conversational* — you might ask several follow-up questions, build on previous answers, have a back-and-forth to work through a problem.

**MAYA:** And chat panel keeps context across messages in the session. You can say "actually, change that to async" and it knows what "that" refers to from the previous message.

**JORDAN:** The conversation has memory within a session. That's another reason to prefer the chat panel for complex tasks — you can iterate without re-explaining from scratch every time.

**MAYA:** One practical tip before we close — combining them. Use the chat panel to *figure out* what needs to change — "@workspace explain why this service layer is coupled to the database layer." Then use inline chat to *make* the change — select the code, `Ctrl+I`, "decouple this from direct DB calls and use the repository pattern."

**JORDAN:** Research in the panel, surgery with inline. They complement each other perfectly.

**MAYA:** Alright — Episode Three recap. Inline chat is for surgical edits and explanations on selected code — `Ctrl+I`. Chat panel is for broader, conversational interaction — `Ctrl+Shift+I`. @workspace indexes your whole codebase, @terminal sees your terminal output, @github connects to your repos. Slash commands — /explain, /fix, /tests, /doc — unlock pre-built workflows.

**JORDAN:** Next episode — Model Selection. Which AI model should you actually be using, and when does it matter?

**MAYA:** I'm Maya.

**JORDAN:** I'm Jordan. See you then.

**[OUTRO MUSIC]**

---
*Runtime estimate: ~4.5 minutes · Word count: ~870*
