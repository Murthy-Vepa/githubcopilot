# Episode 07 — Prompting Best Practices: Getting More From Every Interaction
## Copilot Fundamentals Podcast Series · GitHub Copilot Mastery · MetLife 2026

**Format:** 2 hosts · conversational · ~5 minutes
**Voices:** Jordan (male, US English) · Maya (female, US English)
**Audience:** All Copilot users — this episode makes everything else better

---

**[INTRO MUSIC FADE IN, THEN UNDER]**

**JORDAN:** Welcome to the final episode of Copilot Fundamentals. I'm Jordan.

**MAYA:** And I'm Maya. We saved this one for last intentionally — because prompting is the multiplier. If you understand everything else in this series but you write bad prompts, you'll consistently get mediocre results. If you write great prompts, everything we've covered gets dramatically better.

**JORDAN:** So let's build a mental model first. Copilot responds to *what you give it*. It has no hidden knowledge of what you actually want. It works with exactly the context and the words you provide. So the quality of your prompt directly determines the quality of the response.

**MAYA:** What are the core components of a strong prompt?

**JORDAN:** I think of it in four parts. First — the *action*. What do you want Copilot to do? Use a clear verb. "Refactor." "Generate." "Explain." "Fix." "Add." Be specific about the operation.

**MAYA:** Second?

**JORDAN:** The *target*. What is it acting on? Not "the code" — "the `UserService.cs` class" or "the `calculatePremium` method" or "the authentication middleware in `src/auth/`." The more specific the target, the more focused the output.

**MAYA:** Third?

**JORDAN:** Constraints. What must be true about the result? "Don't change the public API." "Only use the existing error handling pattern." "No new dependencies." "Maintain backward compatibility." Constraints are what keep the agent from doing technically correct things that break your other requirements.

**MAYA:** And fourth?

**JORDAN:** Verification. How do you know it worked? "Run `npm test` and fix any failures." "Make sure it still builds with `dotnet build --no-restore`." "Verify the endpoint still returns the same shape." This is especially powerful in agent mode — you're telling the agent not just to write code, but to confirm it works.

**MAYA:** So a full prompt looks like: action + target + constraints + verification.

**JORDAN:** Every time. Let me give a bad prompt and a good prompt for the same task. Bad: "Add validation to the user service." Good: "Add input validation to the `CreateUserAsync` method in `UserService.cs`. Validate that name is not null or empty, email matches the standard email format, and age is between 18 and 120. Throw an `ArgumentException` for each failed validation — don't catch them in this method. Run `npm test -- --testPathPattern=UserService` and fix any failures."

**MAYA:** The good version is four times longer. But the result is four times more likely to be what you actually wanted.

**JORDAN:** And you won't need to follow up with corrections. The time you spend on a good prompt saves more time than it costs.

**MAYA:** Let's talk about context. Because the quality of the prompt isn't just about what you type — it's also about what Copilot can *see*.

**JORDAN:** This is critical. Copilot works with what's in its context window. In the chat panel, that includes the conversation history and what you explicitly reference. Use @workspace when you want it to draw on the whole codebase. Paste in relevant code snippets if @workspace isn't picking up the right context automatically. Open related files in the editor before asking about them.

**MAYA:** Think of it like briefing a colleague. If I say "fix that bug," and you've never seen the code, that's not enough. But if I say "here's the function, here's the error message, here's what it should do instead" — you can help me.

**JORDAN:** Same principle with Copilot. Give it the brief.

**MAYA:** Let's cover the three most common mistakes.

**JORDAN:** Mistake one: vague tasks. "Improve this code." Improve how? Performance? Readability? Security? Error handling? Copilot will guess. Sometimes right, often not. Be specific about what dimension you're improving.

**MAYA:** Mistake two?

**JORDAN:** Not iterating. First response isn't perfect — you close the panel and give up, or worse, you accept something you're not happy with. Copilot is a conversation. Follow up. "That's good, but can you also handle the case where the input is empty?" "Change the error message to match our existing pattern." Iterate until you have what you need.

**MAYA:** Mistake three — the big one.

**JORDAN:** Security. Do not paste credentials, API keys, connection strings, personally identifiable information, or confidential business data into Copilot prompts. Copilot Business does not train on your data, but your prompts are still sent to an external API. Treat every prompt like you're sending it to an external service — because you are.

**MAYA:** And this applies to code too. Don't include hardcoded secrets in the code you paste. Redact them first.

**JORDAN:** At MetLife specifically — any data classified as sensitive under our data handling policy should never enter a Copilot prompt. When in doubt, redact it.

**MAYA:** Okay — let's talk about a few power patterns. First one?

**JORDAN:** The comment-first pattern. Before writing a function, write a detailed comment describing what it should do. Press Enter. Let the completion propose the implementation. Review it. This is faster than writing code and then asking Copilot to clean it up.

**MAYA:** Second pattern?

**JORDAN:** Example-driven prompting. Show Copilot what you want by giving an example. "Generate three more test cases like this one:" then paste an existing test. It matches your style, your framework, your naming conventions. The output fits your codebase.

**MAYA:** Third pattern — and this is a big one for teams.

**JORDAN:** The reusable prompt. If you find yourself typing the same long prompt repeatedly — "review this code for security issues, performance anti-patterns, and naming convention violations" — turn it into a saved `.prompt.md` file. Now anyone on the team can invoke it with one command. We covered this in the Agents series, but it applies here too.

**MAYA:** Build the prompt once, share it forever.

**JORDAN:** And one final thing — treat Copilot output as a first draft. Not as finished code. Review it with the same critical eye you'd apply to a pull request from a capable but junior colleague. Test it. Understand it. Own it.

**MAYA:** Because at the end of the day, it's your codebase. Copilot accelerates the writing — but you're still the engineer.

**JORDAN:** Always. Alright — final episode summary. Great prompts have four parts: action, target, constraints, and verification. Context determines quality — open the right files, use @workspace, paste relevant snippets. Avoid vague tasks, not iterating, and pasting sensitive data. Use comment-first, example-driven, and reusable prompt patterns. And always treat output as a first draft you're responsible for.

**MAYA:** That's the Copilot Fundamentals series. Seven episodes, covering the full foundation — from what Copilot is, through completions, chat modes, model selection, the CLI, MCP and tools, and now prompting best practices.

**JORDAN:** If you made it through all seven — you have everything you need to use Copilot at a level that most developers take months to reach. Go put it into practice.

**MAYA:** And check out the Copilot Agents series for the next level — agent mode, custom agents, MCP deep dive, and more.

**JORDAN:** I'm Jordan.

**MAYA:** I'm Maya. Thanks for listening — and happy coding.

**[OUTRO MUSIC]**

---

## Fundamentals Series Summary

| Episode | Title | Runtime |
|---------|-------|---------|
| Ep 01 | Introduction to GitHub Copilot | ~4 min |
| Ep 02 | Inline Completions: The Ghost Text Superpower | ~4.5 min |
| Ep 03 | Chat Modes: Inline Chat, Chat Panel & Participants | ~4.5 min |
| Ep 04 | Model Selection: Picking the Right AI for the Job | ~4.5 min |
| Ep 05 | Copilot CLI: AI in the Terminal | ~3.5 min |
| Ep 06 | MCP & Tools: Connecting Copilot to the World | ~4.5 min |
| Ep 07 | Prompting Best Practices | ~5 min |

**Total series runtime: ~30 minutes**

---
*Runtime estimate: ~5 minutes · Word count: ~990*
