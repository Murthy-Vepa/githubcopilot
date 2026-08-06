# Video Script 01 — What Are Copilot Agents?
## Agents Video Series · GitHub Copilot Mastery · MetLife 2026

**Format:** 2 co-hosts · VS Code screen share · ~12 minutes
**Hosts:** Jordan (male, US English) · Maya (female, US English)
**Target audience:** Developers who know Copilot chat and completions — ready for the next level
**Screen setup:** VS Code · Agent mode selector visible · a realistic multi-file project open

---

## PRE-SHOW SETUP CHECKLIST
- [ ] VS Code open · dark theme · font size 16
- [ ] Copilot in Agent mode (not Chat) — mode selector visible top of chat panel
- [ ] A multi-file project open (e.g., a Node/Express or .NET API with controllers, services, tests)
- [ ] Git repo initialised — so agent changes are always reversible
- [ ] A real agent task pre-typed but not yet submitted (for cold open demo)

---

## [00:00 – 00:55] COLD OPEN

*[JORDAN on screen — VS Code. Agent mode selected. He types into the chat panel:]*

```
Add proper error handling to all API routes in src/routes/.
Do not change any route signatures or response shapes.
Run: npm test after each file and fix any failures.
```

*[He presses Enter. The agent starts generating a plan — Jordan steps back]*

**JORDAN:** I did not tell it *how* to do this. I described what *done looks like*. Watch what happens next.

*[Agent outputs a plan — numbered steps: 1. Read all route files. 2. Identify missing try-catch. 3. Add error handling per route. 4. Run tests. 5. Fix failures.]*

**JORDAN:** Before it touches a single file — it shows me the plan.

*[A "Continue" / approval step is visible]*

**JORDAN:** And I approve it. Or I don't. The agent doesn't move until I say so.

**MAYA:** *(voice-over)* That's not autocomplete. That's not a chatbot. That's an autonomous developer waiting for your approval.

**JORDAN:** *(on camera — split with Maya)* Welcome to agent mode. I'm Jordan.

**MAYA:** I'm Maya. This is the Agents video series — Module Four of GitHub Copilot Mastery. And this first video is going to reframe how you think about AI assistance entirely.

*[TITLE CARD: "What Are Copilot Agents?" | Module 4 · Agents]*

---

## [00:55 – 02:30] THE THREE GENERATIONS OF COPILOT

*[ON SCREEN: Timeline graphic — three stages]*

**MAYA:** To understand what agents are, you need to understand what came before. GitHub Copilot has gone through three distinct generations of capability, and each one is a meaningful step up.

**JORDAN:** Generation one: **inline completions**. You type, Copilot suggests the next line or the next block. It's reactive — you lead, it follows. Excellent for writing code faster when you already know what to write.

*[Brief clip — ghost text appearing in the editor]*

**MAYA:** Generation two: **chat and edit modes**. Now you can ask questions, get explanations, request changes to selected code. Copilot gives you the recipe. But you still cook the meal. Every suggestion requires you to read, accept, and integrate it.

*[Brief clip — chat panel with a response, user clicking Accept]*

**JORDAN:** Generation three: **agent mode**. You describe the outcome. The agent plans, executes, verifies, and self-corrects — autonomously. It cooks the meal. You're the head chef who approves the menu.

**MAYA:** Each generation builds on the previous one. Agents don't replace chat — they add a new capability tier. The right tool depends on the task.

**JORDAN:** And the shift in thinking is the hard part. In chat mode, you think in *questions*. "How do I add authentication?" In agent mode, you think in *outcomes*. "Add JWT authentication to all protected routes. Don't touch the public routes. Verify by running the auth tests."

**MAYA:** Outcome over steps. That's the mantra for agent mode.

---

## [02:30 – 04:30] THE AGENT LOOP — HOW IT ACTUALLY WORKS

*[ON SCREEN: Agent loop diagram — Plan → Approve → Execute → Verify → Report]*

**JORDAN:** Let's look at what's happening under the hood when an agent runs. Five phases.

**JORDAN:** Phase one: **Plan**. You submit your prompt. The agent doesn't immediately start editing files. It reads the relevant context — your files, your workspace structure — and generates a plan. A numbered list of steps it intends to take.

*[Screen shows the agent's plan output from the cold open]*

**JORDAN:** Phase two: **Approve**. You read the plan. Does it make sense? Is the scope right? Are there any steps you'd want to change? You approve to continue, or you edit the prompt and start again. This is the human checkpoint.

**MAYA:** *(voice-over)* And this is important. If the plan looks wrong — stop here. Changing a plan takes seconds. Undoing ten files of wrong changes takes much longer.

**JORDAN:** Phase three: **Execute**. The agent runs its plan step by step. At each step, it uses a tool — reads a file, writes a change, runs a terminal command. You see each tool call as it happens in the execution log.

*[Screen: execution log scrolling — read_file → write_file → run_in_terminal]*

**JORDAN:** Phase four: **Verify**. If you included a verification instruction — "run the tests" — the agent runs it. It reads the output. If tests pass: done. If tests fail: it reads the error, understands what broke, fixes the code, runs tests again. The loop continues until verification passes.

**MAYA:** That self-correction loop is what makes this feel genuinely autonomous.

**JORDAN:** Phase five: **Report**. The agent summarises what it did. Which files changed. What tests passed. Whether any decisions required judgment calls. It's a mini pull-request description, generated automatically.

**MAYA:** *(on camera)* And throughout all of this — you can pause it at any time. You can cancel. You can jump in and make a manual edit. The agent always yields to the human.

---

## [04:30 – 06:15] WHAT TOOLS DOES THE AGENT HAVE?

*[JORDAN on screen — VS Code, agent execution log visible]*

**JORDAN:** The agent can only do things through its tools. Understanding the tools helps you understand what's possible — and what to ask for.

*[ON SCREEN: Tool categories graphic]*

**JORDAN:** **File system tools.** Read any file. Write and modify files. Search files by name pattern. Search file contents. List directory contents. These are the foundation — the agent can explore your entire workspace.

**MAYA:** *(voice-over)* It doesn't just work on the files you mention — it can research your codebase the way a new developer would.

**JORDAN:** Exactly. If you ask it to add validation and it finds three different existing validators to learn from — it reads all three before writing a single line. It builds context.

**JORDAN:** **Terminal tools.** Run shell commands. This is how it builds your project, runs tests, executes linters, and installs packages. Every terminal command is shown to you before execution. You can deny any command you're not comfortable with.

*[Shows the approval prompt for a terminal command]*

**JORDAN:** **Browser tools.** When enabled — open web pages, read their content, interact with elements. Useful for docs lookups, testing a local web UI, or pulling reference data from a public source.

**JORDAN:** **MCP tools** — Model Context Protocol. External systems — GitHub, Azure, databases, internal APIs — exposed as callable tools. The agent asks a question like "what are the open critical bugs?" and the GitHub MCP server answers it with live data.

**MAYA:** *(on camera)* We have full dedicated videos on MCP and browser tools later in this series. Today we're focused on the core agent loop.

---

## [06:15 – 08:00] WHAT MAKES A GREAT AGENT PROMPT

*[MAYA on screen — chat panel, blank input]*

**MAYA:** Everything rests on the quality of the prompt. Three elements make a great agent prompt.

**MAYA:** Element one: **a clear, verifiable outcome**. Not "improve the code." Not "make it better." "Add input validation to all public methods in validators.ts." Something you can look at and know definitively: done, or not done.

*[Types on screen:]*
```
Add input validation to all public methods in src/validators.ts.
```

**MAYA:** Element two: **explicit constraints**. What must *not* change? This is as important as what should change. Without constraints, the agent has to guess your intent.

*[Adds to the prompt:]*
```
Do not modify the method signatures.
Do not change the return types.
Use our existing ValidationResult class — see src/types/ValidationResult.ts.
```

**MAYA:** Element three: **a verification instruction**. Something the agent can run to confirm its changes are correct. This turns the agent from "I made changes" to "I made changes and I know they work."

*[Completes the prompt:]*
```
Run: npm test -- --testPathPattern=validators after making changes.
Fix any test failures before finishing.
```

**JORDAN:** *(voice-over)* That's the full prompt. Three elements.

**MAYA:** Let me contrast this with a weak prompt for the same task.

*[Types separately:]*
```
Fix the validators.
```

**MAYA:** *(reads it)* What does "fix" mean? Which validators? What's wrong with them? What should I not touch? How do I know when it's done? The agent will attempt something — and it'll probably be wrong, or at least not what you intended.

**JORDAN:** *(on camera)* Precise prompts. Precise results. The extra thirty seconds writing the prompt saves twenty minutes reviewing the output.

---

## [08:00 – 09:30] AGENT MODE VS CHAT MODE — THE DECISION

*[BOTH ON CAMERA — comparison graphic on screen]*

**JORDAN:** A question we get a lot: "When do I use agent mode versus just using the chat panel?"

**MAYA:** The answer is about task scope and autonomy.

**JORDAN:** Use **chat mode** when you want to think together. Design discussion, code explanation, debugging hypothesis, generating a snippet you'll integrate yourself. You're collaborating on an answer.

**MAYA:** Use **agent mode** when you have a well-defined task with clear boundaries. Something that would take you thirty minutes to do manually — reading multiple files, making consistent changes across them, running tests, verifying the result. Let the agent do the execution.

**JORDAN:** A useful test: can you write a clear acceptance criterion? "When this is done, X will be true." If yes — agent mode. If the task is still fuzzy and you're not sure what done looks like — chat mode first, until you have enough clarity for an agent prompt.

**MAYA:** And there's a middle ground many people miss. Use chat to *plan*, then agent to *execute*. Chat with Copilot: "What's the best approach for adding caching to this service?" Once you agree on the approach, hand it to the agent: "Implement Redis caching on TodoService using the strategy we just discussed in #file:discussion.md."

**JORDAN:** Planning in chat, execution in agent. Best of both.

---

## [09:30 – 10:45] SAFETY — THE HUMAN IN THE LOOP

*[JORDAN on screen — showing the agent execution log in VS Code]*

**JORDAN:** Let's be direct about safety. Because this is the question everyone has when they hear "autonomous agent."

**JORDAN:** The agent cannot do anything without tools. Every action — reading a file, writing a file, running a command — goes through a visible tool call. Nothing happens invisibly.

*[Shows the live execution log — each tool call shown with parameters]*

**JORDAN:** You can watch every step in the execution log. You see the file it read. You see the change it's proposing. You see the terminal command before it runs. There is no hidden execution.

**MAYA:** *(voice-over)* And you're always in a Git repo, right?

**JORDAN:** Always work with agents in a Git repository. This is the most important safety net. If the agent makes 20 changes and they're all wrong — `git reset --hard HEAD` and you're back to where you started. Irreversible? No such thing when you have Git.

**MAYA:** *(on camera)* Review the plan before approving. That's the checkpoint that catches 90% of wrong directions before any code is touched.

**JORDAN:** And for anything touching production systems — databases, deployed environments, live APIs — use MCP servers with read-only credentials unless you specifically need write access. The agent's permissions are exactly your permissions. Nothing more.

---

## [10:45 – 12:00] RECAP

*[BOTH ON CAMERA]*

**MAYA:** Let's land it. Agents are the third generation of Copilot — past inline completions, past chat, into autonomous multi-step execution.

**JORDAN:** The agent loop: plan, approve, execute, verify, report. You stay in control at every checkpoint.

**MAYA:** A great agent prompt has three elements: a verifiable outcome, explicit constraints, and a verification instruction.

**JORDAN:** Agent mode for well-defined execution tasks. Chat mode for thinking and design. Use them together — plan in chat, execute with agent.

**MAYA:** Always work in a Git repo. Review the plan. Watch the execution log. Never give the agent more permissions than the task requires.

**JORDAN:** Video Two: the full tool set — file system, terminal, browser, and how they combine in real workflows. I'm Jordan.

**MAYA:** I'm Maya. See you in Video Two.

*[OUTRO: course hub URL on screen]*

---

## PRODUCTION NOTES

- **Runtime:** ~12 minutes
- **Chapter markers:** 0:00 Cold Open · 0:55 Three Generations · 2:30 Agent Loop · 4:30 Tools Overview · 6:15 Great Agent Prompts · 8:00 Agent vs Chat · 9:30 Safety · 10:45 Recap
- **Cold open setup:** Pre-stage the project and the prompt — the cold open must be smooth and fast. The agent plan appearing is the visual hook.
- **Key graphic:** Agent loop diagram (Plan→Approve→Execute→Verify→Report) — keep on screen during the explanation section
- **Git safety demo:** Show `git diff` after the agent runs — the concrete proof that all changes are reviewable

---
*Spoken word count: ~2,100 · Estimated runtime: ~12 minutes*
