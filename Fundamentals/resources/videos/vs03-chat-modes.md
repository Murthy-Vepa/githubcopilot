# Video Script 03 — Chat Modes & Slash Commands
## Fundamentals Video Series · GitHub Copilot Mastery

**Format:** 2 co-hosts · VS Code screen share · ~15 minutes
**Hosts:** Jordan (male, US English) · Maya (female, US English)
**Target audience:** Developers who know ghost text — ready to unlock the full chat experience
**Screen setup:** VS Code · project with multiple files · Chat panel open on right side

---

## PRE-SHOW SETUP CHECKLIST
- [ ] VS Code open · dark theme · font size 16
- [ ] Multi-file project loaded (service + repository + controller)
- [ ] Copilot Chat panel open (right side)
- [ ] Terminal panel open (bottom) — pre-run a failing test so @terminal has context
- [ ] A function with an obvious bug in one file (for /fix demo)

---

## [00:00 – 00:55] COLD OPEN

*[MAYA on screen — Chat panel visible, types a question]*
*`@workspace why does the CreateTask endpoint return 500 when the title is null?`*

*[MAYA steps back from keyboard, looks at camera while response streams in]*

**MAYA:** I didn't search Stack Overflow. I didn't grep through the codebase. I asked a question. In plain English. And Copilot is going to find the bug by reading the actual code in our project — the controller, the service, the validation layer.

*[Response appears, pointing to a specific file and line]*

**MAYA:** *(reads)* "The `CreateTaskAsync` method in `TodoService.cs` line 47 does not validate the title before passing to the repository. The repository's `AddAsync` method assumes a non-null title and throws a `DbUpdateException` when the value is null." *(looks at camera)* Line 47. Exact file. Exact cause.

**JORDAN:** *(voice-over)* That took about eight seconds.

**MAYA:** Eight seconds, compared to twenty minutes of code spelunking. Welcome to chat mode. I'm Maya.

**JORDAN:** *(on camera — split screen)* And I'm Jordan. Video Three — the chat panel, inline chat, and slash commands. The part of Copilot that turns it from a code generator into an actual thought partner.

*[TITLE CARD: "Chat Modes & Slash Commands" | Module 1 · Fundamentals]*

---

## [00:55 – 02:30] THE TWO CHAT SURFACES — WHEN TO USE WHICH

*[BOTH ON CAMERA — diagram on screen]*

*[ON SCREEN: side-by-side comparison diagram — Inline Chat vs Chat Panel]*

**JORDAN:** Two separate surfaces. Different purposes. People mix them up and use the wrong one — then wonder why it doesn't work as well.

**MAYA:** Chat surface one: **inline chat**. You select code, press Ctrl+I, and a small chat box appears attached to that code. The context is that selection. The output is changes to that selection.

**JORDAN:** Use inline chat when you're focused on a specific block of code. You want to refactor this function. Add a null check here. Convert this to async. The scope is local — one function, one block, one file section.

**MAYA:** Chat surface two: **the chat panel**. Ctrl+Shift+I. This is the full conversation window. It can reason about your entire workspace, multiple files, architectural decisions.

**JORDAN:** Use the chat panel when you're thinking about something bigger. How does authentication work? What's the best way to add caching to this service? Help me understand why this test is failing.

**MAYA:** The mental model: inline chat is a scalpel. The chat panel is a consultant's meeting room.

**JORDAN:** Scalpel for precise edits. Consultant room for thinking and planning.

---

## [02:30 – 05:00] THE CHAT PANEL DEEP DIVE — @PARTICIPANTS

*[JORDAN on screen — Chat panel open]*

**JORDAN:** The chat panel becomes dramatically more powerful when you use **@participants** — those are the `@` prefixed keywords that focus Copilot on a specific data source.

*[ON SCREEN: list of participants overlay]*

**JORDAN:** First — **@workspace**. This is the big one. It tells Copilot to search your entire codebase for relevant context. Without @workspace, Copilot answers from its training data. With @workspace, it answers from your actual code.

*[Types: `@workspace how is the repository pattern implemented in this project?`]*

**JORDAN:** *(waits for response)* Look — it's naming actual files. `ITodoRepository.cs`, `TodoRepository.cs`, `AppDbContext.cs`. It found our implementation and is explaining it based on our code, not a generic pattern.

**MAYA:** *(voice-over)* When should you use @workspace?

**JORDAN:** Whenever your question is about *this* codebase — not about C# in general. "How does X work in this project" — @workspace. "How does X work in .NET" — no @workspace needed, it knows .NET.

**JORDAN:** Second participant — **@terminal**. This reads the output of your last terminal command. Incredibly useful for debugging build failures and test errors.

*[Shows terminal with a failing test output]*
*[Types in chat: `@terminal why did my test run fail?`]*

**JORDAN:** *(response streams in)* See — it read the test output directly and is explaining the assertion failure. I didn't copy-paste a single thing.

**MAYA:** *(on camera now)* The copy-paste debugging workflow should be dead. @terminal kills it.

**JORDAN:** Third participant — **@vscode**. This answers questions about VS Code itself. Settings, extensions, keyboard shortcuts, editor configuration.

*[Types: `@vscode how do I configure the editor to show whitespace characters?`]*

**JORDAN:** It gives you the exact setting name and how to change it. For people who are always Googling VS Code things — this one pays off fast.

---

## [05:00 – 07:30] SLASH COMMANDS — YOUR POWER SHORTCUTS

*[MAYA on screen — a function selected in the editor]*

**MAYA:** Now slash commands. These are shortcuts for the most common tasks. You can use them in both inline chat and the chat panel.

*[ON SCREEN: slash commands overlay — keeping it on screen for 30+ seconds]*

**MAYA:** **/explain** — explains what the selected code does. Perfect for code you inherited or haven't seen before.

*[Selects a complex LINQ expression, opens inline chat, types `/explain`]*

**MAYA:** *(reads response)* It's breaking down this LINQ chain step by step — the Where clause, the GroupBy, the Select. In plain English. No Stack Overflow, no regex translation websites.

**JORDAN:** *(voice-over)* Next one.

**MAYA:** **/fix** — analyses the selected code for bugs and suggests a fix.

*[Selects the buggy CreateTask method from the cold open, inline chat, `/fix`]*

**MAYA:** It found the null check issue. And it's proposing a fix inline. I can accept it with a single click.

*[Shows accept/discard buttons in inline chat UI]*

**MAYA:** One click. The null check is added. Done.

**JORDAN:** *(on camera)* **/tests** — generates unit tests for the selected code. This is my most-used slash command.

*[Takes screen — selects a service method, Ctrl+I, `/tests`]*

**JORDAN:** Watch what it generates. *(reads)* Happy path test — correct. Null input test — correct. Empty list test — covers the edge case. Exception path test — when the repository throws, does the service handle it? Yes.

**MAYA:** *(voice-over)* Does it actually run?

**JORDAN:** Let me find out. *(copies generated tests, opens test file, pastes)*. They compile. Running them... *(terminal)* Three pass, one needs a dependency. I'll add a mock. That's thirty seconds of fix. But I got four test methods in ten seconds instead of writing them from scratch.

**MAYA:** **/doc** — generates XML documentation comments for the selected method.

*[Selects an undocumented public method, inline chat, `/doc`]*

**MAYA:** Summary, params, returns, exceptions. Correct content, standard format. For anyone who has to write documentation — this one is a gift.

**JORDAN:** **/new** — in the chat panel — starts a new conversation from scratch. Use this when you're switching topics and don't want the previous context bleeding into the new question.

---

## [07:30 – 09:45] COMBINING PARTICIPANTS AND SLASH COMMANDS

*[JORDAN on screen — chat panel]*

**JORDAN:** Here's where things get really powerful. You can combine @participants with slash commands.

*[Types: `@workspace /tests for the TodoService class — cover null inputs, empty collections, and concurrent modification`]*

**JORDAN:** That's one command. It's going to find the TodoService class, understand its dependencies, and generate tests that cover the specific cases I asked for.

*[Response streams in — comprehensive test file]*

**JORDAN:** *(scrolling through)* Look at the test count. Twelve test methods. Covering the cases I specified plus a few it inferred from the code. Each test is named correctly, using the right mocking library, following our existing test patterns.

**MAYA:** How did it know which mocking library to use?

**JORDAN:** Because @workspace read our existing test files. It saw we use Moq. It used Moq.

**MAYA:** That's the combinatorial power. @workspace gives it your project context. The slash command gives it the task. The result is specific and accurate to your codebase.

**MAYA:** *(takes screen)* Another combination: asking about architecture.

*[Types: `@workspace explain the data flow from the HTTP request to the database for creating a new task — include all layers`]*

**MAYA:** *(reads response)* It's describing the exact layer chain in this codebase. Controller → Service → Repository → DbContext. And it's referencing the actual class names and method signatures. This is documentation of *our* architecture — generated in seconds.

**JORDAN:** This is the feature I show people who are onboarding to a new codebase. "Open Copilot chat, @workspace, ask 'explain how X works in this project.' " In an hour, you understand the codebase better than reading it for a week.

---

## [09:45 – 11:30] INLINE CHAT ADVANCED — EDIT IN PLACE

*[MAYA on screen — a long service method visible]*

**MAYA:** Let's go back to inline chat and look at more advanced uses. Because it's not just for simple fixes.

*[Selects an entire method — 25 lines]*

**MAYA:** I can select a large block and ask for a significant refactor.

*[Opens Ctrl+I, types: "Refactor this method to use the strategy pattern. Extract the three conditional branches into separate strategy classes."]*

**MAYA:** *(response appears — shows before/after diff)* Look at the diff view. Red for removed, green for added. I can see exactly what changed before I commit to it. This is the safety net.

**JORDAN:** *(voice-over)* And if you don't like it?

**MAYA:** Hit Discard. *(presses Discard button)* We're back to the original. No harm done. This is one of my favourite things about inline chat — it's non-destructive until you accept.

*[Tries again with a slightly different prompt]*
*[Types: "Refactor to reduce nesting depth — max 2 levels deep"]*

**MAYA:** Simpler ask. *(response appears — guard clauses replace nested ifs)* Guard clauses. Early returns. Nesting depth reduced to two levels. That's a real code quality improvement and it took me one sentence.

**JORDAN:** *(on camera)* The edit-in-place experience is what makes inline chat feel different from copy-pasting from the chat panel. You see the change in context. You accept or reject with one click. It's a tight loop.

---

## [11:30 – 13:00] REFERENCE FILES WITH #FILE

*[JORDAN on screen — chat panel]*

**JORDAN:** One more feature that not enough people know about — the `#file:` reference syntax.

*[Types in chat: "Compare the pattern used in `#file:TodoService.cs` and suggest how to apply the same pattern to `#file:InvoiceService.cs`"]*

**JORDAN:** I'm giving Copilot two specific files as context — telling it exactly what to compare. I'm not relying on @workspace search. I'm being explicit.

*[Response appears — specific comparison with line references]*

**JORDAN:** And here's another use. I can reference a file as an example:

*[Types: "Generate a service class for the Invoice entity following the same structure as `#file:TodoService.cs`"]*

**JORDAN:** It reads TodoService as a template and generates InvoiceService with the same patterns. Constructor injection, same method signatures adapted for Invoice, same error handling pattern, same logging conventions.

**MAYA:** *(voice-over)* Is that different from what @workspace would do?

**JORDAN:** Subtly, yes. @workspace searches for relevant context. `#file:` says "use exactly this file, explicitly." When you want Copilot to learn from a specific file — not just whatever it finds — use `#file:`. When you want it to find relevant context on its own, use @workspace.

---

## [13:00 – 14:15] CONTEXT MANAGEMENT — WHEN TO CLEAR HISTORY

*[MAYA on screen — chat panel with long conversation history]*

**MAYA:** Something important that bites people. The chat panel keeps history. Every message in the conversation becomes context for the next one.

**JORDAN:** *(voice-over)* That sounds helpful.

**MAYA:** It is — until it isn't. If you spent the last ten messages debugging a completely unrelated problem, all of that is still in the context window when you ask your next question. It can confuse the responses.

**MAYA:** The fix: use the "New Conversation" button — or type `/new` — when you switch topics. Fresh context, clean slate, better responses.

*[Presses New Chat button in panel]*

**MAYA:** I do this every time I switch from debugging to feature work. Feature work to architecture questions. Any significant topic shift — new conversation.

**JORDAN:** *(on camera)* Think of it like a new meeting. You wouldn't start a planning session by summarising the bug you fixed at 9 AM. New agenda, new meeting.

**MAYA:** New question, new conversation. That simple.

---

## [14:15 – 15:00] RECAP

*[BOTH ON CAMERA]*

**JORDAN:** Let's land this. Inline chat — Ctrl+I — is for precise, local edits. Select code, ask, accept or reject. The chat panel — Ctrl+Shift+I — is for broader questions and planning.

**MAYA:** @workspace brings in your actual codebase. @terminal reads your last command output. @vscode answers VS Code questions.

**JORDAN:** Slash commands: /explain, /fix, /tests, /doc, /new. Combine them with @participants for maximum power.

**MAYA:** Use #file: to give Copilot explicit file context. Clear conversation history when you switch topics.

**JORDAN:** Next video: model selection. GPT-4o, Claude, Gemini — which one should you use and when? The answer might surprise you. I'm Jordan.

**MAYA:** I'm Maya. Talk to your code.

*[OUTRO: course hub URL on screen]*

---

## PRODUCTION NOTES

- **Runtime:** ~15 minutes
- **Chapter markers:** 0:00 Cold Open · 0:55 Two Surfaces · 2:30 @Participants · 5:00 Slash Commands · 7:30 Combining Them · 9:45 Inline Edit · 11:30 #file Syntax · 13:00 Context Management · 14:15 Recap
- **Key demos:** @workspace codebase question · @terminal test failure · /tests generation with 12 methods · edit-in-place diff view · #file: pattern copy
- **Pre-record setup:** Make sure failing test is the last terminal output before recording starts — @terminal will read it

---
*Spoken word count: ~2,500 · Estimated runtime: ~15 minutes*
