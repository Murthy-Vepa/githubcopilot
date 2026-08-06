# Episode 01 — What Are Copilot Agents?
## Copilot Agents Podcast Series · GitHub Copilot Mastery · MetLife 2026

**Format:** 2 hosts · conversational · ~4 minutes
**Voices:** Jordan (male, US English) · Maya (female, US English)
**Audience:** Developers new to agent mode

---

**[INTRO MUSIC FADE IN, THEN UNDER]**

**JORDAN:** Hey everyone, welcome to the Copilot Agents series. I'm Jordan.

**MAYA:** And I'm Maya. And today we're starting from the very beginning — what even *is* an agent? Because this word gets thrown around a lot, and I think a lot of people are still fuzzy on it.

**JORDAN:** Totally. So let me give you the quick version. GitHub Copilot started as an autocomplete tool. You write code, it suggests the next line. That was version one. Then we got chat — you ask a question, it answers. Still useful, but it's still you doing all the work.

**MAYA:** Right, Copilot gives you the recipe, but you still have to cook the meal.

**JORDAN:** Exactly. Now with agent mode — Copilot *cooks the meal*. You tell it the outcome you want, and it plans, executes, and verifies, all on its own. That's the big shift.

**MAYA:** So what does "plans, executes, and verifies" actually look like in practice?

**JORDAN:** Great question. Say you ask the agent: "Add proper error handling to all the API routes in this project, and make sure the tests pass." Here's what happens. The agent doesn't just start typing. First, it generates a *plan*. Step one — read all the route files. Step two — identify which ones are missing try-catch blocks. Step three — add the error handling. Step four — write tests. Step five — run the test suite.

**MAYA:** And you can see that plan before anything happens.

**JORDAN:** That's the key part. There's a human checkpoint. You review the plan, and you approve it. Only then does the agent start acting.

**MAYA:** I love that. Because this is one of the fears people have, right — "is the AI just going to go do whatever it wants?"

**JORDAN:** And the answer is no. At every step — every file it reads, every file it writes, every terminal command it runs — you see it. You can pause it. You can cancel it. You're still the pilot. The agent is just doing the flying.

**MAYA:** Love that analogy. So walk me through the loop — what does the agent actually *do* during execution?

**JORDAN:** So the agent runs in a loop. It reads context — your files, your workspace. It forms an action. It calls a tool — maybe it reads a file, or writes a change, or runs a terminal command. It sees the output. And then it decides the next action. And it keeps going until it hits the goal state or asks you for input.

**MAYA:** And the self-correction piece — can you talk about that?

**JORDAN:** That's one of my favorite parts. Say it adds error handling, runs the tests, and two tests fail. It doesn't just stop and say "oops." It reads the error output, figures out what's wrong, fixes the code, and runs the tests again. It iterates until they pass. That's the self-verification pattern, and it's incredibly powerful.

**MAYA:** Okay, so this raises a question for developers who are new to this. How should they *think* differently about prompts in agent mode?

**JORDAN:** This is everything. In chat mode, you ask *how* to do something. "How do I add authentication?" In agent mode, you describe *what done looks like*. "Add JWT authentication to all protected routes. Don't change the public routes. Verify by running the existing auth tests."

**MAYA:** Outcome over steps.

**JORDAN:** Outcome over steps. And explicit constraints — tell it what *not* to touch. "Don't modify any route signatures." "Don't change the database schema." Those guardrails make all the difference.

**MAYA:** And since you're in a Git repo, everything is reversible anyway, right?

**JORDAN:** Always. Agent-generated changes are just code. You review them like any other PR. You can reject, modify, or roll back. The safety net is built in.

**MAYA:** Okay, so if someone is listening to this on their commute and they want to try agent mode today — what's the first thing they should do?

**JORDAN:** Open VS Code, open a project you know well. Click the chat icon, switch the mode to "Agent." Then pick one concrete task — something you've been putting off because it's tedious. Maybe it's adding docstrings to a bunch of functions, or cleaning up a messy config file. Give the agent a precise outcome. Watch what it does. Review the plan. Approve it. And see what comes back.

**MAYA:** Start small, build trust in the tool.

**JORDAN:** Exactly. You wouldn't hand a new hire the keys on day one. You give them small tasks, you review the output, and you build confidence over time. Same thing here.

**MAYA:** Solid advice. Alright, that's Episode One. We covered what agents are, how the loop works, the self-verification pattern, and how to think about prompts differently.

**JORDAN:** Next episode, we're going deep on the tools agents use — file system, terminal, browser. How each one works and when you'd use them.

**MAYA:** Subscribe so you don't miss it. I'm Maya.

**JORDAN:** I'm Jordan. See you in the next one.

**[OUTRO MUSIC]**

---
*Runtime estimate: ~4 minutes · Word count: ~700*
