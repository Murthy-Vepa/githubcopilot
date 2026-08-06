# Episode 01 — Introduction to Prompt Engineering
## Prompt Engineering Podcast Series · GitHub Copilot Mastery · MetLife 2026

**Format:** 2 hosts · conversational · ~4 minutes
**Voices:** Jordan (male, US English) · Maya (female, US English)
**Audience:** Developers new to GitHub Copilot who want better results faster

---

**[INTRO MUSIC FADE IN, THEN UNDER]**

**MAYA:** You're listening to the GitHub Copilot Mastery series. I'm Maya.

**JORDAN:** And I'm Jordan. And today we're kicking off a brand-new mini-series on Prompt Engineering.

**MAYA:** Now, before anyone tunes out because "prompt engineering" sounds like something only AI researchers need to know — stay with us. This series is about one thing: getting dramatically better results from GitHub Copilot every single day.

**JORDAN:** And we mean dramatically. I've seen the same developer, same codebase, get completely useless output from Copilot one minute — and then get production-ready code thirty seconds later. The only thing that changed was how they asked.

**MAYA:** Which is a weird thing to say about software, right? I'm used to the idea that "getting better at a tool" means learning keyboard shortcuts or configuration options. Not... how to *talk* to it.

**JORDAN:** It is different. And that's the shift we need to make. Copilot isn't a compiler. It doesn't process your intent precisely like a function call. It processes language. Which means the quality of your language determines the quality of the output.

**MAYA:** So prompt engineering is really just... communicating well with a system that understands natural language.

**JORDAN:** Exactly. And the good news? The core skills transfer. Being clear about what you want, specifying your constraints, giving context. Those are good practices whether you're talking to a colleague or to Copilot.

**MAYA:** Let's ground this. What's a prompt?

**JORDAN:** In the Copilot context, everything you type into a chat is a prompt. The comment above a function that Copilot completes is a prompt. The message in Copilot chat is a prompt. Even the filename and surrounding code are silent prompts — context Copilot reads without you typing it.

**MAYA:** So prompting is happening whether we're intentional about it or not.

**JORDAN:** Right. The question is whether we're doing it well. And most developers — at least when they start — are prompting reactively. "Write a function to sort users." "Fix this error." "Add a login page." Vague, minimal, no constraints.

**MAYA:** And the output they get back reflects that vagueness.

**JORDAN:** It does. Copilot fills the gaps with its own assumptions. Sometimes those assumptions are right. Often they're not — wrong framework version, wrong patterns for your codebase, missing error handling. And then the developer says "Copilot isn't that useful."

**MAYA:** But the problem isn't Copilot. The problem is the prompt.

**JORDAN:** The problem is the prompt. And this series is about fixing that systematically.

**MAYA:** Let's preview what's ahead. What are we covering?

**JORDAN:** Episode Two: the anatomy of a great prompt. There's a simple four-part formula — action, target, constraints, verification — that makes almost any prompt significantly better. We'll go through it piece by piece with real examples.

**MAYA:** Episode Three?

**JORDAN:** Instructions files. How to give Copilot a permanent memory of your team's patterns, tech stack, and conventions so you're not re-explaining context every single conversation.

**MAYA:** Episode Four?

**JORDAN:** Prompt templates — `.prompt.md` files. How to write reusable prompt programs that your whole team can run with a click. We'll look at real templates from the MetLife prompt library — test generation, CRUD scaffolding, security reviews.

**MAYA:** Episode Five?

**JORDAN:** SKILL.md packages. These are domain knowledge capsules — specialist procedures that Copilot loads on demand. Perfect for deployment workflows, compliance checks, anything that needs step-by-step domain expertise.

**MAYA:** Six?

**JORDAN:** Anti-patterns and prompt security. The most common mistakes developers make — asking Copilot to do too much at once, forgetting to specify constraints, accidentally leaking PII into prompts. We'll go through what to avoid and why.

**MAYA:** And the finale?

**JORDAN:** Building a team prompt library. How to move from individual prompts to shared, version-controlled, governed prompt infrastructure that the whole organisation benefits from.

**MAYA:** That's a lot of ground in seven episodes.

**JORDAN:** And every episode is under five minutes. No fluff. Each one is one concept, worked through with real examples.

**MAYA:** One concept I want to flag for first-time listeners: prompt engineering for Copilot is not about gaming the AI or tricking it. It's not about finding secret magic words.

**JORDAN:** It really isn't. It's about being a clear, precise communicator. The developers who get the best results from Copilot are the ones who think clearly about what they want before they type. And who know what context Copilot needs to help them effectively.

**MAYA:** That's a skill worth developing regardless of which AI tool you're using.

**JORDAN:** The principles transfer. The vocabulary varies. The underlying discipline is the same.

**MAYA:** Alright. Next episode — the anatomy of a great prompt. Four parts that change everything.

**JORDAN:** See you there. I'm Jordan.

**MAYA:** I'm Maya. Let's get prompting.

**[OUTRO MUSIC]**

---
*Runtime estimate: ~4 minutes · Word count: ~760*
