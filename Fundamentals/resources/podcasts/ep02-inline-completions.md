# Episode 02 — Inline Completions: The Ghost Text Superpower
## Copilot Fundamentals Podcast Series · GitHub Copilot Mastery

**Format:** 2 hosts · conversational · ~4 minutes
**Voices:** Jordan (male, US English) · Maya (female, US English)
**Audience:** Developers learning to get real value from completions

---

**[INTRO MUSIC FADE IN, THEN UNDER]**

**MAYA:** Welcome back to Copilot Fundamentals. I'm Maya.

**JORDAN:** And I'm Jordan. Episode Two — inline completions. The ghost text. This is the feature everyone sees first, and honestly the one most people underuse because they don't know the tricks.

**MAYA:** And I'll admit — when I first turned Copilot on, I saw the grey suggestion text appear, I hit Tab a couple of times, thought "okay, neat," and moved on. I didn't realize how powerful it was until I changed a few habits.

**JORDAN:** That's a really common experience. So let's fix it. First — what's actually happening when ghost text appears?

**MAYA:** Copilot is reading everything in your current file, plus other open files in your editor, and generating what it thinks you're most likely to write next. The more relevant context it has, the better the suggestion.

**JORDAN:** And the number one thing that improves completions is — the name of your function or variable. Copilot reads intent from names. If you're in a function called `processData`, it gives you generic code. If you're in a function called `calculateMonthlyPremiumWithLoyaltyDiscount`, it generates code that understands *exactly* what you're building.

**MAYA:** So naming things clearly isn't just good practice for your teammates — it's literally making your AI better.

**JORDAN:** Exactly. The second big driver — comments. Write a comment that describes what the next block of code should do, press Enter, and Copilot will try to implement it. This is one of my most-used patterns.

**MAYA:** Give me an example.

**JORDAN:** Sure. You write: `// Filter out expired policies and sort by premium amount descending`. Press Enter. Copilot generates the filter and sort logic. You review it, maybe tweak it, and move on. Instead of writing ten lines, you wrote one comment.

**MAYA:** And you still understood exactly what was generated because you *told it* what to generate.

**JORDAN:** That's the key — you're in control. You described the outcome. Now let's talk keyboard shortcuts because most people only know Tab.

**MAYA:** Tab accepts the whole suggestion. What else is there?

**JORDAN:** Big one — `Ctrl+Right` on Windows, `Cmd+Right` on Mac. That accepts the suggestion *word by word*. So if the first few words are right but then it goes off track, you don't have to accept the whole thing or reject it — you accept word by word and let it course-correct.

**MAYA:** That is genuinely useful. I wish I'd known that in week one.

**JORDAN:** Also — `Alt+]` and `Alt+[` cycle through *alternative* suggestions. Copilot often generates multiple options. If the first one isn't right, cycle through the others before deciding to reject.

**MAYA:** So it's not just one guess — there are multiple options behind the scenes.

**JORDAN:** Right. And you access them with those bracket keys. Now — Escape rejects the current suggestion. And if you start typing, Copilot regenerates based on what you've written. So you can start a function signature and let it complete the body, then Tab, or just keep typing to steer it.

**MAYA:** Let's talk about the context window. What files does Copilot see?

**JORDAN:** It sees what you have open. Open the files that are relevant to your current task. If you're implementing a method in a service class, open the interface file, open the data model, open a related test file. The more relevant context is visible, the better the completions.

**MAYA:** It's like working on a whiteboard with a colleague. The more of your system they can see, the better their suggestions.

**JORDAN:** Great analogy. And here's a pattern that really clicks once you get it — leading line completion. You write the first line of what you want, and Copilot completes the rest. You're not starting from zero — you're starting from your intent and letting it do the repetitive part.

**MAYA:** What about repetitive patterns? Like, if I have a list of similar cases to handle?

**JORDAN:** This is where Copilot shines. Write the first two or three cases yourself, following your exact style. Copilot learns the pattern and starts completing the rest. It's like an accelerator — once it sees the pattern, it can continue it.

**MAYA:** Okay — common mistake time. What do people get wrong with completions?

**JORDAN:** Three big ones. One: accepting without reading. The code looks plausible, you Tab through it, and you haven't actually verified it does what you think. Copilot is confident but not infallible. Read every suggestion.

**MAYA:** Two?

**JORDAN:** Not giving enough context. One file open, vague function name, no comments. You get generic output. The fix is easy — open more files, name things clearly, drop a comment before you start.

**MAYA:** And three?

**JORDAN:** Expecting it to work with no context at all. A blank file with no imports, no existing code, a function called `main` — you'll get generic boilerplate. Start with some structure, some imports, some existing code nearby. Completions need a runway.

**MAYA:** Build the runway, then let it fly.

**JORDAN:** Exactly. One more pro tip — Tab is not your only acceptance move. Sometimes you want to accept a suggestion and immediately modify it. Tab to accept, then edit. The accepted code is just code — you own it from that moment.

**MAYA:** Don't think of it as "Copilot's code." Think of it as a first draft you're responsible for.

**JORDAN:** Always. Okay — to summarize Episode Two. Clear naming and comments drive better completions. Know your keyboard shortcuts — Tab, Ctrl+Right, Alt+bracket keys, Escape. Open relevant files to give Copilot more context. Read every suggestion. And treat completions as first drafts, not final answers.

**MAYA:** Next up — Chat Modes. Inline chat and the full chat panel. Where things get seriously powerful.

**JORDAN:** I'm Jordan.

**MAYA:** I'm Maya. See you next episode.

**[OUTRO MUSIC]**

---
*Runtime estimate: ~4.5 minutes · Word count: ~830*
