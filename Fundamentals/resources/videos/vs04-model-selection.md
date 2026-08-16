# Video Script 04 — Model Selection
## Fundamentals Video Series · GitHub Copilot Mastery

**Format:** 2 co-hosts · VS Code screen share + browser · ~12 minutes
**Hosts:** Jordan (male, US English) · Maya (female, US English)
**Target audience:** Developers who want to make intentional model choices — not just use whatever defaults
**Screen setup:** VS Code · model selector dropdown visible · side-by-side comparison of model outputs

---

## PRE-SHOW SETUP CHECKLIST
- [ ] VS Code open · Copilot chat panel open
- [ ] Model selector dropdown accessible (top of chat panel)
- [ ] A complex refactoring task ready to demo with Claude
- [ ] A quick "what does this do" task ready for GPT-4o
- [ ] Architecture diagram or design description ready for Gemini (multimodal demo)

---

## [00:00 – 00:55] COLD OPEN

*[JORDAN on screen — chat panel visible. Model selector shows "GPT-4o"]*

**JORDAN:** Most people have never touched this dropdown.

*[Clicks model selector — shows GPT-4o, Claude Sonnet, Gemini, o1, others]*

**JORDAN:** They installed Copilot, they see the default, they leave it. Forever. And that's a lot like buying a Swiss Army knife and only ever using the toothpick.

**MAYA:** *(on camera — split)* The model you choose changes the quality of results. Significantly. For different types of tasks.

**JORDAN:** Today we're going to show you what each model is actually good at, give you a simple decision framework, and change how you work for the better. I'm Jordan.

**MAYA:** I'm Maya. Video Four — let's pick the right tool.

*[TITLE CARD: "Model Selection" | Module 1 · Fundamentals]*

---

## [00:55 – 02:15] WHY IT MATTERS — DIFFERENT MODELS, DIFFERENT STRENGTHS

*[ON SCREEN: Model comparison overview graphic]*

**MAYA:** First — a little context. All of these models are LLMs — Large Language Models. They all generate text. But they have different training data, different architectures, different context window sizes, and different tuning objectives.

**JORDAN:** Think of it like this. All four people in your team can write code. But one of them is fastest at quick fixes. One is best when the problem requires deep reasoning. One is best when you need to understand something complicated. You'd pick different people for different tasks.

**MAYA:** Same logic applies to models.

**JORDAN:** The three you'll use most in Copilot: **GPT-4o**, **Claude Sonnet**, and **Gemini**. Let's go through each one.

---

## [02:15 – 04:30] GPT-4o — SPEED AND BREADTH

*[JORDAN on screen — model selector, switches to GPT-4o]*

**JORDAN:** GPT-4o. This is the default for most Copilot configurations. And it earns that default — for most everyday tasks it's the right choice.

**MAYA:** What's its strength?

**JORDAN:** Speed. Breadth. It handles a huge range of question types quickly. Code generation, code explanation, documentation, debugging help, shell commands — it handles all of these well with low latency.

*[Types a quick task: "Write a function to validate an email address in C#"]*

*[Response appears in ~3 seconds — clean, correct function]*

**JORDAN:** Three seconds. Good quality. That's GPT-4o at its best — common task, fast answer.

**MAYA:** When does it struggle?

**JORDAN:** Very long documents. Tasks that require deep multi-step reasoning across a large codebase. Complex architectural decisions where the model needs to hold a lot of context simultaneously. For those cases, you want a different model.

**MAYA:** *(voice-over)* When should I reach for GPT-4o?

**JORDAN:** Default choice for everything. Quick explanations. Code generation for well-understood patterns. Debugging common errors. Documentation. CLI commands. If you're not sure which model to use, start here.

---

## [04:30 – 06:30] CLAUDE SONNET — LONG CONTEXT AND REASONING

*[MAYA on screen — model switched to Claude Sonnet 4.5 or latest available]*

**MAYA:** Claude Sonnet. This is the model I reach for when the task is genuinely complex.

**JORDAN:** *(voice-over)* What makes it different?

**MAYA:** Two things. First: **context window**. Claude can hold significantly more context than GPT-4o. That matters when you're working with large codebases, long files, or conversations that have built up a lot of history.

*[Opens a very long file — 500+ lines]*
*[Types: "@workspace explain the full data transformation pipeline from API input to database write — trace through every layer"]*

**MAYA:** This is a question that requires reading many files in sequence and connecting the dots. I'm asking it to trace a flow across the entire application.

*[Response streams in — detailed, multi-file trace]*

**MAYA:** Look at the depth. It's citing specific method calls, explaining how data transforms at each layer, and flagging a potential bug it spotted along the way that I didn't even ask about.

**JORDAN:** *(on camera)* The bug flagging is interesting. That's the second strength of Claude — **reasoning**. It's more likely to notice implications, spot issues you didn't ask about, and think through edge cases.

**MAYA:** Complex refactoring tasks. Architectural reviews. "Look at this and tell me what's wrong." These are Claude tasks.

**JORDAN:** One tradeoff — it's a bit slower than GPT-4o. Not dramatically. But for a ten-second task, you might wait twelve seconds instead of three. Worth it when the question warrants it.

**MAYA:** And Claude is also notably strong at **following complex instructions**. If you have a very detailed, multi-requirement prompt — "do X but not Y, using pattern Z, avoid the following anti-patterns" — Claude tends to honour all the constraints more reliably.

---

## [06:30 – 08:15] GEMINI — MULTIMODAL AND LONG DOCUMENTS

*[JORDAN on screen — model switched to Gemini]*

**JORDAN:** Gemini. The differentiating feature here is **multimodal** — it can reason about images as well as text.

*[Drags an architecture diagram image into the chat input]*
*[Types: "Review this architecture diagram and identify single points of failure"]*

**JORDAN:** I'm asking it to analyse an actual image — not a description of an image.

*[Response appears — identifies specific components in the diagram by visual position]*

**JORDAN:** It's reading the actual diagram. Naming the components it sees. Identifying that the message queue has no redundancy. That's from the image — not from any text I provided.

**MAYA:** *(voice-over)* When would I use that in day-to-day work?

**JORDAN:** Reviewing architecture diagrams with your team. Understanding a UI mockup and generating code from it. Analysing an error screenshot rather than copy-pasting the text. Any task where a visual is the source of truth.

**MAYA:** *(on camera)* Gemini also has a very large context window — competitive with Claude — which makes it strong for very long document analysis. If you have a 200-page specification document and you want Copilot to answer questions about it, Gemini is a good choice.

**JORDAN:** So: Gemini when you have images. Gemini when you have very long text documents. Gemini as an alternative to Claude when you want a second opinion on complex reasoning tasks.

---

## [08:15 – 09:30] THE o1 MODELS — WHEN TO REACH FOR THEM

*[MAYA on screen — model dropdown, highlighting o1 options]*

**MAYA:** There's also the o1 family — o1, o1-mini. These are reasoning-specialised models from OpenAI. They're explicitly designed for tasks that require step-by-step logical reasoning.

**JORDAN:** *(voice-over)* Give me an example.

**MAYA:** A difficult algorithm. A complex performance optimisation where the tradeoffs aren't obvious. A security audit where you need to trace attack vectors through multiple code paths. A data model design decision with conflicting constraints.

*[Types: "Design a caching strategy for this service that balances consistency with performance — the data is updated every 15 minutes by a background job and read thousands of times per second by the API"]*

**MAYA:** That's a real design problem with competing constraints. o1 will reason through the tradeoffs explicitly.

*[Response streams — slower than GPT-4o, but shows step-by-step reasoning]*

**MAYA:** See how it's thinking through it? It's not just giving an answer — it's showing the reasoning chain. Read-through-write strategy versus cache invalidation. Considered the 15-minute update window. Suggested a TTL that slightly exceeds the update interval as a tradeoff.

**JORDAN:** The tradeoff: o1 is significantly slower. For a task that takes GPT-4o 3 seconds, o1 might take 30. Only reach for it when the reasoning quality matters more than the speed. Design decisions. Security analysis. Hard algorithmic problems.

---

## [09:30 – 10:45] DECISION FRAMEWORK — QUICK REFERENCE

*[BOTH ON CAMERA — graphic on screen]*

*[ON SCREEN: Decision tree graphic — keep visible for 45+ seconds]*

**JORDAN:** Here's the framework we use. Four questions.

**JORDAN:** One: **Is this a common task with well-understood patterns?** Quick explanation, code generation, documentation, CLI help? → GPT-4o. Fast and accurate.

**MAYA:** Two: **Does it require deep reasoning across a large codebase, long context, or complex instructions?** → Claude Sonnet. More context, better multi-step reasoning.

**JORDAN:** Three: **Is the input visual, or is it a very long document?** Architecture diagrams, UI mockups, specification PDFs? → Gemini. It can see.

**MAYA:** Four: **Is this a genuine design problem with competing constraints, or a security analysis with multiple threat vectors?** → o1. Pay with time to get better thinking.

**JORDAN:** And the meta-rule: when in doubt, start with GPT-4o. If the response misses something important or loses track of context, switch to Claude and reask.

**MAYA:** Two attempts, two different models. You'll get there.

---

## [10:45 – 12:00] RECAP

*[BOTH ON CAMERA]*

**MAYA:** Model selection is a skill, not a setting you configure once and forget. Different tasks deserve different tools.

**JORDAN:** GPT-4o: speed, breadth, everyday work. The default that earns its default status.

**MAYA:** Claude Sonnet: large context, deep reasoning, complex instructions, architectural questions.

**JORDAN:** Gemini: multimodal — show it images. Long documents. Second-opinion reasoning.

**MAYA:** o1: hard design problems, security analysis, algorithm design. Slow and deliberate.

**JORDAN:** The dropdown is there for a reason. Use it. You'll notice the difference immediately. I'm Jordan.

**MAYA:** I'm Maya. Choose your model. Video Five: the Copilot CLI — bring AI assistance to your terminal. See you there.

*[OUTRO: course hub URL on screen]*

---

## PRODUCTION NOTES

- **Runtime:** ~12 minutes
- **Chapter markers:** 0:00 Cold Open · 0:55 Why It Matters · 2:15 GPT-4o · 4:30 Claude · 6:30 Gemini · 8:15 o1 Models · 9:30 Decision Framework · 10:45 Recap
- **Key demos:** GPT-4o speed demo · Claude multi-file trace with bug flagging · Gemini architecture diagram image analysis · o1 step-by-step reasoning output
- **Model names:** Use whatever model names are current at recording time — these may change. Confirm available models in Copilot chat panel before recording.
- **Graphic:** Decision tree must stay on screen full 45 seconds — this is the key takeaway visual

---
*Spoken word count: ~2,100 · Estimated runtime: ~12 minutes*
