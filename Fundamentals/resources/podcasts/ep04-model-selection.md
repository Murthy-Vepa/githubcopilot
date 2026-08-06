# Episode 04 — Model Selection: Picking the Right AI for the Job
## Copilot Fundamentals Podcast Series · GitHub Copilot Mastery · MetLife 2026

**Format:** 2 hosts · conversational · ~4 minutes
**Voices:** Jordan (male, US English) · Maya (female, US English)
**Audience:** Developers wanting smarter, faster, or more accurate responses

---

**[INTRO MUSIC FADE IN, THEN UNDER]**

**MAYA:** Welcome back to Copilot Fundamentals. I'm Maya.

**JORDAN:** And I'm Jordan. Today — model selection. And I want to start with the thing that surprises most people: GitHub Copilot is not one AI. It's a platform that can run multiple different AI models, and you choose which one you want.

**MAYA:** Right — and this sounds like a nerdy detail, but it genuinely changes the quality and speed of what you get. So let's break it down.

**JORDAN:** First — how do you even change the model? In VS Code, it's right there in the chat panel. There's a model selector dropdown at the bottom of the chat. Click it, you see the available models, you pick one. That's it.

**MAYA:** And different models are available at different subscription tiers. Copilot Business, which is what MetLife runs, gives you a solid range to work with.

**JORDAN:** Okay, let's talk about the models themselves. The most commonly used one is GPT-4o from OpenAI. Think of this as the reliable everyday driver. Fast, capable, handles most coding tasks really well — completions, explanations, refactoring, test generation. When in doubt, start here.

**MAYA:** And when should you move away from it?

**JORDAN:** Two main reasons. Speed — and depth. If you want faster responses and you're doing something relatively simple, GPT-4o mini is a great choice. Same model family, smaller and faster, great for quick answers, generating boilerplate, explaining short functions.

**MAYA:** Like the express lane.

**JORDAN:** Exactly. But then on the other end of the spectrum — Claude Sonnet from Anthropic. This is my go-to for complex, large-context tasks. And the reason is the *context window*. Claude Sonnet can hold around 200,000 tokens of context. That means you can feed it an entire large file — or multiple files — and it keeps track of everything.

**MAYA:** Give me a scenario where that context window actually matters.

**JORDAN:** You're refactoring a service that's 600 lines long. You want Copilot to understand the *entire* file — every method, every dependency, every edge case — when it suggests changes. GPT-4o has a smaller context window, so it might miss something at the top of the file by the time it's answering about code at the bottom. Claude Sonnet holds the whole thing.

**MAYA:** So for deep refactors, long documents, complex architecture analysis — Claude is the stronger choice.

**JORDAN:** And it tends to write cleaner, more thoughtful explanations too. If you're generating documentation or writing a detailed design proposal, Claude's output quality on long-form text is excellent.

**MAYA:** What about Gemini? Because Google's model is also available.

**JORDAN:** Gemini 1.5 Pro is particularly strong for multimodal tasks — meaning it can work with images as well as code and text. If you're building something where the visual output matters — UI components, data visualizations, design reviews — Gemini can look at a screenshot and reason about it. It also has a massive context window and handles very large codebases well.

**MAYA:** So — speed-first, use mini. Large context or deep refactors, use Claude. Multimodal or giant codebases, use Gemini. Everyday everything, use GPT-4o.

**JORDAN:** That's a solid rule of thumb. And here's the thing — switching is free and instant. If a response from one model isn't landing, switch and try again. Different models have different strengths and even different *personalities* in terms of how verbose or concise they are.

**MAYA:** Let me ask a real question: how much does the model actually matter for day-to-day coding?

**JORDAN:** Honestly, for most tasks the difference is smaller than you'd think. GPT-4o handles 80% of daily coding tasks excellently. Where model choice becomes important is the edge cases — very long files, very complex problems, tasks that need precise reasoning about subtle bugs, or tasks where you want exceptional output quality. For those, spend ten seconds switching models.

**MAYA:** I'll share my personal pattern. I start everything on GPT-4o. If I'm not satisfied after one or two tries — I switch to Claude Sonnet and re-run the same prompt. More often than not, Claude gives me something better for anything complex.

**JORDAN:** That's a great workflow. And one thing to be aware of — different models have different knowledge cutoff dates. If you're asking about a very recently released library or framework, one model might have more up-to-date training data than another. This is another reason to verify outputs against the actual current documentation.

**MAYA:** And this is where MCP and the browser tool become valuable — you can have the agent check the live docs. But that's a future episode.

**JORDAN:** Right. Let me also mention the model picker in the context of *agent mode*. When the agent is running a multi-step task — reading files, writing code, running tests — the model matters even more. You want a model with a large context window and strong reasoning. Claude Sonnet or GPT-4o are the typical choices there.

**MAYA:** So the model selection is not just a chat preference — it affects how well the agent executes longer workflows.

**JORDAN:** Exactly. Same underlying principle: more context, better reasoning, better results.

**MAYA:** Okay — quick summary for Episode Four. Copilot is a multi-model platform. GPT-4o is the solid everyday choice. GPT-4o mini is faster for simple tasks. Claude Sonnet excels at large context and complex reasoning. Gemini handles multimodal and very large codebases. Switch models freely — it's one click and instant. And for agent workflows, prefer large-context, strong-reasoning models.

**JORDAN:** Next up — Copilot CLI. This is how you bring AI assistance into the terminal and stop Googling shell commands forever.

**MAYA:** I'm Maya.

**JORDAN:** I'm Jordan. See you next episode.

**[OUTRO MUSIC]**

---
*Runtime estimate: ~4.5 minutes · Word count: ~830*
