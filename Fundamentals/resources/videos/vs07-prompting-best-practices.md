# Video Script 07 — Prompting Best Practices
## Fundamentals Video Series · GitHub Copilot Mastery

**Format:** 2 co-hosts · VS Code screen share · ~15 minutes
**Hosts:** Jordan (male, US English) · Maya (female, US English)
**Target audience:** All developers — the series closer that ties everything together with actionable habits
**Screen setup:** VS Code · chat panel · a practical project with realistic prompting scenarios

---

## PRE-SHOW SETUP CHECKLIST
- [ ] VS Code open · Copilot chat panel
- [ ] A project with realistic code ready (not toy examples)
- [ ] Three "bad prompt" examples prepared — to live-demo improvement
- [ ] `#file:` and `#selection` examples ready
- [ ] A team prompt library folder visible (`/.prompts/` or similar)

---

## [00:00 – 00:55] COLD OPEN

*[JORDAN at screen — chat panel open. Types:]*
*`help me with my code`*

*[Response is generic — "I'd be happy to help! What would you like to do?"]*

**JORDAN:** *(reads the response, sighs)* Helpful. Thank you. Very helpful.

*[Types again:]*
*`Refactor the CreateInvoiceAsync method in #file:InvoiceService.cs to extract the tax calculation into a private method. The tax rules are in #file:TaxRules.cs. Do not change the public interface.`*

*[Response: precise, specific refactor proposal with code diff]*

**JORDAN:** Same AI. Same model. Wildly different response. The difference is the prompt.

**MAYA:** *(on camera — split)* Prompting is a skill. And like any skill, there are techniques that work and mistakes that don't. I'm Maya.

**JORDAN:** I'm Jordan. Video Seven — the final video in this series. Prompting best practices. Let's make your prompts work as hard as you do.

*[TITLE CARD: "Prompting Best Practices" | Module 1 · Fundamentals]*

---

## [00:55 – 02:30] THE ATCV FRAMEWORK

*[ON SCREEN: ATCV graphic — four components laid out clearly]*

**MAYA:** Every good Copilot prompt has four ingredients. We call it ATCV.

**MAYA:** **A — Action.** What do you want Copilot to do? Generate, refactor, explain, test, document, debug. Be explicit. "Help me with" is not an action. "Refactor this method to use the builder pattern" is an action.

**JORDAN:** **T — Target.** What code, file, or system is in scope? Use `#file:`, `#selection`, or @workspace to make this concrete. Without a target, Copilot has to guess — and the guess is often too broad or too narrow.

**MAYA:** **C — Constraints.** What rules apply? Don't change the public interface. Use our existing logging library. Must work with .NET 6. Follow our error handling pattern. Constraints are what separate a generic answer from an answer that fits your codebase.

**JORDAN:** **V — Verify.** How should you validate the result? "Include a unit test for the happy path and null input case." "Show me the diff so I can review before applying." Adding a verification step to your prompt means you get evidence the suggestion works, not just code that looks plausible.

**MAYA:** *(types a full ATCV example in the chat)*:
*`Refactor [Action] the CalculatePremium method in #file:PricingService.cs [Target] to use the strategy pattern. Do not modify the public signature or the existing ILogger calls [Constraints]. Show me the diff and generate one unit test for each strategy class [Verify].`*

**JORDAN:** That's one prompt. Complete, specific, testable. Versus "help me refactor this."

---

## [02:30 – 04:30] THE #FILE AND #SELECTION CONTEXT TOOLS

*[JORDAN on screen — VS Code, multi-file project]*

**JORDAN:** The `#file:` and `#selection` references deserve their own spotlight because they're the most impactful context tools you have.

*[Types a prompt using #file:]*
*`Compare the error handling pattern in #file:TodoService.cs with #file:InvoiceService.cs — identify inconsistencies and suggest how to align them to a single pattern`*

*[Response: side-by-side comparison with specific line call-outs]*

**JORDAN:** I didn't paste any code. I referenced the files by path. Copilot read both files and compared them. This works for comparisons, consistency checks, pattern transfer — any task that spans multiple files.

**MAYA:** *(voice-over)* What about #selection?

**JORDAN:** `#selection` refers to whatever code you currently have highlighted in the editor. Great for quick, focused tasks on a block you're actively looking at.

*[Highlights 15 lines of code in the editor]*
*[Types in chat: "Explain the intent of #selection and suggest how to improve its readability"]*

*[Response: explains the selected code specifically, offers three readability improvements]*

**JORDAN:** The key discipline: always tell Copilot exactly what to look at. Don't make it search. When you're explicit with `#file:` and `#selection`, the response quality jumps measurably.

**MAYA:** *(on camera)* And you can combine them.

*[Types: "Rewrite #selection to follow the error handling pattern in #file:ErrorHandling.cs"]*

**MAYA:** Tell it what to change. Tell it what pattern to follow. Combine them for precision.

---

## [04:30 – 06:30] THE SEVEN MOST COMMON MISTAKES

*[BOTH ON CAMERA — list appears on screen, one item at a time]*

**JORDAN:** Let's go through the most common mistakes. I've committed all of these. So has Maya.

**MAYA:** Every single one.

**JORDAN:** **Mistake One: Vague action words.** "Help me," "fix this," "make it better." These force Copilot to guess what "better" means. Replace with specific verbs: refactor, extract, generate, test, document, explain.

**MAYA:** **Mistake Two: No target.** Saying "refactor the service" without specifying which file or which method. Always include a `#file:` or select the code first. No guessing.

**JORDAN:** **Mistake Three: Missing constraints.** Getting a beautiful refactor back that changes the public interface — which you needed to keep stable. Constraints prevent this. Say what's off limits.

**MAYA:** **Mistake Four: Too many asks at once.** "Refactor this, generate tests, add documentation, and check for security issues." Four asks. Copilot will attempt all four and do none of them as well as if you'd asked one at a time. One task per prompt. Run in sequence.

**JORDAN:** **Mistake Five: Not iterating.** Taking the first response as final. Copilot is a conversation partner. "That's close — now change X to Y." "Good, but also handle the case where Z is null." Iterating to a better result is expected and normal.

**MAYA:** **Mistake Six: Pasting sensitive data.** Pasting real connection strings, API keys, customer data, employee records — into the chat prompt. This sends that data to the LLM. Use placeholders. Use fake example data. Never the real thing.

**JORDAN:** **Mistake Seven: Trusting without reading.** Accepting a suggestion without reading it. This is the one that causes bugs in production. Always read the generated code before accepting. Every time.

**MAYA:** Seven mistakes. If you stop making three of them this week, your Copilot results will improve noticeably.

---

## [06:30 – 08:15] THE ITERATION HABIT

*[MAYA on screen — chat panel, a previous response visible]*

**MAYA:** Let's talk about iteration — because it's the habit that separates experienced Copilot users from beginners.

*[A response is visible that's close but not quite right]*

**MAYA:** This response is 80% there. The method is correct but the variable names are too terse and it's missing the logging call I need. Option A: dismiss it, rewrite the whole prompt. Option B: iterate.

*[Types in the same conversation:]*
*`Good structure. Two changes: 1) rename the loop variable from "t" to "task" for clarity. 2) Add a debug log call after the null check using our existing _logger field.`*

*[Response: updated version with both changes]*

**MAYA:** Two small corrections. One follow-up prompt. The result is now what I wanted.

**JORDAN:** *(voice-over)* Iteration is cheaper than starting over. Use it.

**MAYA:** *(on camera)* The conversation model means every message builds on the last. You can push Copilot closer to what you need step by step. Think of it as code review — you're reviewing the output, noting what needs to change, and requesting an update.

**JORDAN:** *(takes screen)* And here's the other iteration trick: ask for alternatives.

*[Types: "Show me an alternative approach that doesn't use LINQ — using a traditional foreach loop instead"]*

*[Response: alternative implementation]*

**JORDAN:** Same task, different implementation style. Now I can pick which one fits better, or blend elements from both.

---

## [08:15 – 10:00] BUILDING TEAM PROMPT HABITS

*[JORDAN on screen — shows a folder structure with `.prompts/` directory]*

**JORDAN:** Individual prompting skills matter. Team prompt habits matter more.

**MAYA:** *(voice-over)* What do you mean by team habits?

**JORDAN:** If everyone on your team writes prompts differently, you get inconsistent results, inconsistent code quality, and no collective improvement. If you build shared habits — everyone benefits from what anyone figured out.

*[Shows a `.prompts/` folder with named `.prompt.md` files]*

**JORDAN:** A shared prompt library. Your team maintains a folder of proven, reusable prompt templates. When someone figures out a prompt that reliably produces correct service class stubs, they save it here. Everyone else uses it.

*[Opens one of the files — shows an ATCV-structured prompt template with placeholders]*

**JORDAN:** This is a `.prompt.md` file. It's a prompt template with named variables — `{ServiceName}`, `{RepositoryInterface}`, `{HandledExceptions}`. Anyone on the team fills in the variables and runs the prompt.

**MAYA:** *(on camera — takes screen)* The Prompt Engineering module goes deep on `.prompt.md` files and `.instructions.md` files. But the habit I want you to leave with is this: **when a prompt works, save it.** Don't let it live only in your chat history.

*[Shows a simple Markdown file — a prompt that worked, saved with a descriptive filename]*

**MAYA:** One file. The prompt that works, the context it needs, the outcome you can expect. Saved. Sharable. Reusable.

**JORDAN:** *(on camera)* The three-week quickstart for teams: Week one, everyone saves their best three prompts in a shared folder. Week two, the team reviews and curates — picks the five most generally useful. Week three, those five become the recommended starting points for common tasks. A library emerges from practice.

---

## [10:00 – 11:30] ENTERPRISE-SPECIFIC TIPS

*[MAYA on screen — VS Code with copilot-instructions.md visible in the file explorer]*

**MAYA:** A few tips specific to our MetLife context.

**JORDAN:** *(voice-over)* Go ahead.

**MAYA:** First: use `.github/copilot-instructions.md`. This file tells Copilot about your project's specific conventions — once. Every chat interaction in the workspace inherits these instructions.

*[Opens the file — shows brief conventions: logging library, error handling pattern, naming conventions]*

**MAYA:** We've told Copilot our logging library, our naming conventions, our error handling pattern. Now every prompt gets these as baseline context without us repeating them.

**JORDAN:** *(on camera)* If you're onboarding to a team that doesn't have this file — ask. Creating it is one of the highest-value things you can do in an afternoon.

**MAYA:** Second: **@workspace for project questions, #file: for precise requests.** Remember this distinction from Video Three. When you want Copilot to find relevant context — @workspace. When you know exactly what to look at — #file:.

**JORDAN:** Third: **never include PII in prompts.** Patient data, financial records, HR data, employee information — none of it into the chat. If you're working on code that handles sensitive data, describe it with fake data. "Assume the user object has a firstName field of 'Alice' and an accountBalance of 1000." Fake. Safe.

**MAYA:** Fourth: **watch the context window for long conversations.** Start a new chat when you switch tasks. Stale context from earlier in the conversation can corrupt your responses.

---

## [11:30 – 13:00] PUTTING IT ALL TOGETHER — A REAL WORKFLOW

*[JORDAN on screen — realistic task: building a new endpoint]*

**JORDAN:** Let me show you what this all looks like in a real workflow. I need to add a new endpoint — `PATCH /tasks/{id}/status` — to an existing API.

*[Step 1: copilot-instructions.md open — Copilot already knows conventions]*

**JORDAN:** Conventions already loaded — nothing to repeat.

*[Step 2: Types a targeted prompt using ATCV]*
*`Generate [Action] a controller action and corresponding service method [Target: see #file:TasksController.cs and #file:TodoService.cs for existing patterns] for PATCH /tasks/{id}/status. Accept a body with a single "status" field. Validate that status is one of: Active, Paused, Completed. Use existing error handling pattern from #file:TodoService.cs. Include a unit test for each invalid status case [Verify].`*

**JORDAN:** Action — generate. Target — references both the controller and service. Constraints — validation rules, use existing patterns. Verify — tests for each invalid case.

*[Response streams — controller action, service method update, three unit tests]*

**JORDAN:** *(reads through response)* Controller action — correct. Service update — using the right repository pattern. Three tests — Active, Paused, Completed invalid case. *(pauses)* One gap — it didn't add a 404 case for an unknown task ID.

*[Iterates: types "Also add a test for when the task ID doesn't exist — should return 404"]*

*[Response: adds the 404 test case]*

**JORDAN:** Done. Endpoint and tests. One ATCV prompt and one iteration. Under two minutes.

**MAYA:** *(on camera)* And the code follows your team's patterns because the instructions file and the #file: references gave Copilot the context it needed. No generic code that has to be heavily edited.

---

## [13:00 – 14:15] THE PROMPTING MINDSET

*[BOTH ON CAMERA]*

**JORDAN:** We want to leave you with a mindset, not just a checklist.

**MAYA:** Copilot is not an oracle. It's a thought partner. It produces a first draft based on what you tell it. Your job is to tell it well, review what it produces, and iterate.

**JORDAN:** The developers who get the most value from Copilot are the ones who write clearer prompts, not the ones who type faster. Every minute you spend writing a precise prompt saves five minutes editing a generic result.

**MAYA:** And your prompting improves over time. The habits in this video — ATCV, #file:, constraints, iteration, saving what works — these compound. In six months you won't recognise how you used to work.

**JORDAN:** The tool rewards the people who treat it as a skill to develop.

---

## [14:15 – 15:00] RECAP — SERIES CLOSE

*[BOTH ON CAMERA — energy up, this is the finale]*

**MAYA:** Seven videos. Let's land the whole series.

**JORDAN:** Video One: what Copilot is and how it fits into your workflow. Video Two: ghost text and keyboard shortcuts. Video Three: the chat panel and slash commands. Video Four: choosing the right model. Video Five: the CLI. Video Six: MCP and external system integrations.

**MAYA:** And this video: prompting as a skill. ATCV — Action, Target, Constraints, Verify. Use #file: and #selection. Iterate, don't restart. Save what works. Build team habits. Protect sensitive data.

**JORDAN:** You now have the full foundation. The rest of the course — Prompt Engineering, AI-Assisted Engineering & Spec-Driven Development, AI Agents — builds on everything in these seven videos. Come back here if you need a refresher.

**MAYA:** Thank you for making it through the Fundamentals series. I'm Maya.

**JORDAN:** And I'm Jordan. Go build something great — and let Copilot help.

*[OUTRO: course hub URL · module 2 preview cards on screen]*

---

## PRODUCTION NOTES

- **Runtime:** ~15 minutes
- **Chapter markers:** 0:00 Cold Open · 0:55 ATCV Framework · 2:30 #file and #selection · 4:30 Seven Mistakes · 6:30 Iteration Habit · 8:15 Team Habits · 10:00 Enterprise Tips · 11:30 Full Workflow Demo · 13:00 Mindset · 14:15 Series Close
- **Key demos:** Bad-to-good prompt transformation (cold open) · Full ATCV prompt construction · #file: comparison across two service files · Iteration workflow — prompt → review → one follow-up → done · copilot-instructions.md context loading
- **Series finale feel:** More energy in the recap section — this is the payoff. Consider adding "what's next" graphics linking to Module 2.
- **ATCV graphic:** Must be clean and memorable. Consider making it a standalone downloadable reference card (PDF) for course participants.

---
*Spoken word count: ~2,500 · Estimated runtime: ~15 minutes*
