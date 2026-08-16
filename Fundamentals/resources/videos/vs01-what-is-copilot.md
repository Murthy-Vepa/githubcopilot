# Video Script 01 — What is GitHub Copilot?
## Fundamentals Video Series · GitHub Copilot Mastery

**Format:** 2 co-hosts · VS Code screen share + talking head split · ~12 minutes
**Hosts:** Jordan (male, US English) · Maya (female, US English)
**Target audience:** Developers who have never used GitHub Copilot
**Screen setup:** VS Code open with a sample .NET project · Chat panel pinned on right

---

## PRE-SHOW SETUP CHECKLIST
- [ ] VS Code open · default dark theme · font size 16
- [ ] Sample project loaded (TodoApp or equivalent)
- [ ] Copilot extension installed and signed in
- [ ] Chat panel open on right side
- [ ] Notifications silenced · Do Not Disturb on

---

## [00:00 – 00:45] COLD OPEN

*[SPLIT SCREEN: Jordan left, Maya right. Both face camera. Casual, energetic tone.]*

**JORDAN:** Here's a question. When was the last time you typed a for-loop from scratch?

**MAYA:** *(smiling)* Or Googled "how to sort a list in C#"... for the fourth time this month.

**JORDAN:** Right. We spend a surprising amount of time on things that aren't actually the hard part of our jobs. The hard part is the logic. The architecture. Understanding what the business needs. The boilerplate? The repetitive patterns? That stuff just gets in the way.

**MAYA:** GitHub Copilot is an AI pair programmer built directly into your editor that handles the repetitive parts — so you can spend your energy on the parts that actually require you.

**JORDAN:** In this video, we're covering everything you need to know to go from zero to productive with Copilot today. I'm Jordan.

**MAYA:** And I'm Maya. Let's get into it.

*[TITLE CARD: "What is GitHub Copilot?" | Module 1 · Fundamentals]*

---

## [00:45 – 02:30] WHAT IS COPILOT — THE REAL ANSWER

*[SWITCH TO: Jordan screen share — VS Code visible]*

**JORDAN:** Before we touch the tool, I want to give you an accurate mental model. Because the wrong mental model will frustrate you.

**MAYA:** *(voice-over, Jordan's screen visible)* What's the wrong mental model?

**JORDAN:** Thinking of it as autocomplete. Or search. Or a code database. Copilot is not looking things up. It's a large language model — the same kind of AI behind ChatGPT — that has been specifically trained on billions of lines of code. It doesn't retrieve answers. It *generates* them.

*[ON SCREEN: simple diagram — "Your Code Context" → arrow → "Language Model" → arrow → "Generated Suggestion"]*

**MAYA:** Which means the quality of what it produces depends heavily on the context you give it. Your file. Your project. The comment you wrote above the function.

**JORDAN:** Exactly. Context in, quality out. We'll talk a lot about context throughout this series. For now — here's the key thing. Copilot can see what you're doing in your editor, and it generates the most likely useful next thing to write.

**MAYA:** And "most likely" is doing a lot of work in that sentence. It's probabilistic. It can be wrong. Always review what it produces.

**JORDAN:** Always. We say this once here, and we'll say it every video. You are the engineer. Copilot is the assistant. You review everything.

---

## [02:30 – 04:15] THREE MODES — THE OVERVIEW

*[MAYA takes over screen share — VS Code with a file open]*

**MAYA:** Three ways to interact with Copilot. Each one has a different purpose.

*[ON SCREEN: slide overlay — "Mode 1: Inline Completions" highlighted]*

**MAYA:** Mode one: **inline completions**. This is the ghost text — the greyed-out suggestion that appears as you type. You accept it with Tab. You see the next word with Ctrl+Right. You dismiss it with Escape.

*[DEMO: Maya types a comment `// Get all overdue tasks ordered by due date` and pauses. Ghost text appears.]*

**MAYA:** I wrote one comment. Copilot is already suggesting the entire method. Let me hit Tab.

*[Tab to accept — full method appears]*

**JORDAN:** *(voice-over)* That was about two seconds of effort.

**MAYA:** Two seconds. And it matches the patterns in our project — it's using the same repository interface, the same return type, the same async conventions. Because Copilot read the rest of the file.

*[ON SCREEN: slide overlay — "Mode 2: Inline Chat" highlighted]*

**JORDAN:** *(takes over)* Mode two: **inline chat**. Select some code, hit Ctrl+I on Windows — or Cmd+I on Mac. A chat box appears right in the editor, attached to that code.

*[DEMO: Jordan selects a method, presses Ctrl+I, types "add null-guard at the top"]*

**JORDAN:** I didn't open a separate window. I didn't copy-paste. I selected the code, asked a question, and the change happens in place.

*[ON SCREEN: slide overlay — "Mode 3: Chat Panel" highlighted]*

**MAYA:** *(takes back over)* Mode three: **the chat panel**. Ctrl+Shift+I. This is the conversation mode. You can ask questions about your entire codebase, explain code, generate documentation, plan features. It's like having a senior colleague on call.

*[DEMO: Maya opens chat, types "@workspace how is authentication handled in this project?"]*

**MAYA:** The @workspace participant searches your entire project and answers based on the actual code. Not generic internet results. Your code.

*[Show response referencing specific files in the project]*

---

## [04:15 – 05:45] PRIVACY & SECURITY — THE HONEST CONVERSATION

*[BOTH HOSTS on camera — no screen share. More serious tone.]*

**JORDAN:** Okay. Let's talk about something important before we go further. Privacy.

**MAYA:** Because this comes up in every team we talk to, and there are a lot of misconceptions.

**JORDAN:** Here's what's true. When you use Copilot, your code — the files you have open, the context window — is sent to GitHub's API for processing. That is how it works. There's no getting around that.

**MAYA:** But — and this is the part that matters for MetLife — on our Copilot Business plan, your code is **not** used to train the model. It's processed, the suggestion is returned, and it's not stored for training.

**JORDAN:** GitHub's enterprise data handling agreement guarantees this. Your proprietary code stays proprietary.

**MAYA:** That said — three things you should never put into Copilot. One: passwords, API keys, or connection strings. Two: PII — customer names, emails, account numbers, social security numbers. Three: unreleased financial data or M&A information.

**JORDAN:** If you need to ask Copilot a question that involves sensitive data, sanitise the example first. Replace the real values with fake ones. The code pattern is what Copilot needs — not the real data.

**MAYA:** That's a habit worth building from day one.

---

## [05:45 – 07:30] YOUR FIRST REAL DEMO — END TO END

*[JORDAN at screen — new file, starting from scratch]*

**JORDAN:** Let me show you a real workflow. Not a contrived example. We're building a method to calculate the average priority of overdue tasks in a to-do list.

*[Screen: empty class, cursor at top]*

**JORDAN:** Step one — I'm going to write a clear, descriptive comment.

*[Types: `// Calculates the average priority score of all overdue tasks.`]*
*[Types: `// Returns 0 if there are no overdue tasks.`]*

**JORDAN:** Two lines. That's my specification.

*[Ghost text appears — full method with null check, LINQ query, return 0 edge case]*

**JORDAN:** Look at that. It found the overdue filter by understanding the existing `TodoItem` model in my project. It's using the existing `Priority` property. It handled the edge case I described.

**MAYA:** *(voice-over)* Can you walk through it?

**JORDAN:** Sure. *(highlights each part)* Line by line. Null check for the list parameter — correct. LINQ Where clause filtering `IsOverdue` — correct, that's a property that exists in this project. Average of Priority — correct data type. Return zero if the collection is empty — exactly what my comment said. This is production-quality code.

**MAYA:** And it took...

**JORDAN:** Literally ten seconds. Comment writing included.

**MAYA:** Now — do you just ship it?

**JORDAN:** Absolutely not. I read it. I verify it matches my intent. I check the edge cases. Then I run the tests. *(pauses)* Actually — let me generate the tests too.

*[Opens inline chat, types "/tests"]*

*[Test method skeleton appears with happy path, null input, empty list, and zero-priority list cases]*

**JORDAN:** Four test cases. Five seconds. Read them, verify them, run them. That's the workflow.

---

## [07:30 – 09:00] WHAT COPILOT WORKS BEST ON

*[SPLIT SCREEN: both hosts on camera]*

**MAYA:** I want to talk about where Copilot shines — and where it doesn't. Because setting the right expectations is important.

**JORDAN:** Good call. Let's do it.

**MAYA:** Copilot is excellent at: boilerplate that follows a clear pattern — CRUD operations, service methods, data classes. It's excellent at things that have a lot of training data — standard algorithms, common library usage, well-known design patterns.

**JORDAN:** It's good at things where the intent is clear from the context. If your file already has five methods that follow the same structure, the sixth will follow automatically.

**MAYA:** It's also really good at explaining unfamiliar code. If someone hands you a 300-line file you've never seen, you can ask Copilot to explain it section by section. That's a huge time-saver.

**JORDAN:** Where it's less strong: highly domain-specific logic that requires business knowledge Copilot doesn't have. Anything that requires understanding your organisation's processes, your specific data model nuances, or edge cases that are unique to your application.

**MAYA:** And security decisions. Copilot can suggest code that compiles and works but has a security flaw. Not because it's trying to — just because it's generating what's statistically likely, not what's provably secure. Security review is always a human responsibility.

**JORDAN:** The mental model: Copilot handles the *how*. You handle the *what* and the *whether*.

---

## [09:00 – 10:30] SETTING UP — QUICK WALKTHROUGH

*[MAYA on screen — VS Code Extensions tab]*

**MAYA:** Alright, quick setup for anyone who hasn't done this yet. Three steps.

*[Screen: Extensions sidebar open]*

**MAYA:** Step one — search for "GitHub Copilot" in Extensions. Install it. You'll see two extensions — the base Copilot extension and the Copilot Chat extension. Install both.

*[Screen: GitHub sign-in prompt]*

**MAYA:** Step two — sign in with your GitHub account. If you're on MetLife's enterprise plan, use your corporate GitHub credentials. You'll get a browser pop-up, sign in, come back to VS Code.

*[Screen: VS Code with Copilot icon in status bar]*

**MAYA:** Step three — look for the Copilot icon in your status bar at the bottom. If it's there, you're connected. If it shows an error, check that your organisation has assigned you a Copilot seat — IT can help with that.

**JORDAN:** That's it. Three steps. Most people are up and running in under five minutes.

**MAYA:** And to verify it's working — open any code file, type a comment describing a function, and wait a second. If ghost text appears, you're live.

---

## [10:30 – 11:30] QUICK RECAP — WHAT WE COVERED

*[BOTH ON CAMERA — relaxed, wrap-up energy]*

**JORDAN:** Alright. Let's land the plane. What did we cover?

**MAYA:** Copilot is a generative AI — it generates code based on your context, not a lookup engine. Three interaction modes: inline completions, inline chat, and the chat panel.

**JORDAN:** Privacy: on our enterprise plan, your code is not used for training. Never put real secrets or PII into prompts.

**MAYA:** Copilot is strongest on patterns, boilerplate, and familiar code. It needs your review for correctness and your judgment for security.

**JORDAN:** And setup is three steps — install the extension, sign in, verify.

**MAYA:** What's next in this series?

**JORDAN:** Next video: we go deep on inline completions. The ghost text you saw today is just the surface. There are keyboard shortcuts, trigger techniques, and ways to shape suggestions that most people don't know about.

**MAYA:** Including the single habit that makes Copilot suggestions dramatically better — and most people skip it.

**JORDAN:** That's Video Two. See you there. I'm Jordan.

**MAYA:** I'm Maya. Happy coding.

*[OUTRO: course hub URL on screen · subscribe/bookmark prompt]*

---

## PRODUCTION NOTES

- **Runtime:** ~12 minutes
- **Chapter markers:** 0:00 Cold Open · 0:45 What Is Copilot · 2:30 Three Modes · 4:15 Privacy · 5:45 Demo · 7:30 Strengths/Limits · 9:00 Setup · 10:30 Recap
- **B-roll needed:** Extension install screen recording · Status bar verification · Copilot icon states
- **Captions:** Auto-generate, manually correct all technical terms (Copilot, LINQ, MCP, PII)
- **Key on-screen graphics:** Mode comparison slide · Privacy bullet list · Setup steps numbered overlay

---
*Spoken word count: ~2,000 · Estimated runtime: ~12 minutes*
