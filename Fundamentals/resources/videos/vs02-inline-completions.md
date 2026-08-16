# Video Script 02 — Inline Completions & Ghost Text
## Fundamentals Video Series · GitHub Copilot Mastery

**Format:** 2 co-hosts · VS Code screen share · ~13 minutes
**Hosts:** Jordan (male, US English) · Maya (female, US English)
**Target audience:** Developers who installed Copilot and want to get dramatically more out of it
**Screen setup:** VS Code · a .NET service class file open · no chat panel (this video is completions only)

---

## PRE-SHOW SETUP CHECKLIST
- [ ] VS Code open · dark theme · font size 16
- [ ] A service class file open (e.g., `TodoService.cs`)
- [ ] Chat panel closed — this video focuses on editor completions only
- [ ] Copilot signed in and active (status bar icon visible)

---

## [00:00 – 00:50] COLD OPEN

*[JORDAN at screen — VS Code visible. He types a single word: `Get`]*

**JORDAN:** Watch this. I'm going to type one word.

*[Ghost text immediately appears suggesting a full method signature]*

**JORDAN:** I haven't described anything. I haven't written a comment. I just typed "Get" — and Copilot already has a prediction. *(dismisses with Escape)* Here's the question: why? And more importantly, how do you make that prediction useful — not just fast?

*[MAYA on camera — split screen with Jordan]*

**MAYA:** There's a lot of developer folklore around ghost text. "Just hit Tab and ship it." Or on the other end — "I tried it once, the suggestion was wrong, it's useless." Neither of those is the right relationship with this tool.

**JORDAN:** In this video we're going deep on inline completions. The keyboard shortcuts. The trigger mechanics. The habits that make suggestions dramatically better. I'm Jordan.

**MAYA:** And I'm Maya. Video Two of the Fundamentals series — let's go.

*[TITLE CARD: "Inline Completions & Ghost Text" | Module 1 · Fundamentals]*

---

## [00:50 – 02:30] HOW COPILOT READS YOUR FILE

*[JORDAN on screen — `TodoService.cs` open. Clean class with 3 existing methods.]*

**JORDAN:** Before we talk about keyboard shortcuts — let's talk about context. Because this is the single thing that separates useful Copilot suggestions from random noise.

**MAYA:** *(voice-over)* What context does Copilot actually have access to?

**JORDAN:** Three categories. First — the **current file**. Every method, every class, every variable name in this file is context. Copilot reads it all.

*[Scroll through the file slowly]*

**JORDAN:** See these three existing methods? They all follow a pattern. Async. ILogger injection. Repository call. Try-catch. Copilot has absorbed that pattern. Every new method I write in this file will tend to follow it.

**MAYA:** Even without me telling it to.

**JORDAN:** Even without telling it. That's the implicit context. The second category: **open files**. The files you have open in your editor are also available to Copilot — not as deeply as the current file, but it reads them. So if your interface definition is open in another tab, Copilot knows about it.

*[Show a second tab — the interface file]*

**JORDAN:** Third category: **the cursor position and surrounding lines**. The few lines above where you're typing are the strongest signal. This is why what you write immediately above a new method matters so much.

**MAYA:** That last point leads to something I want to flag right away — the single habit that changes everything.

---

## [02:30 – 04:00] THE ONE HABIT — DESCRIBE BEFORE YOU CODE

*[MAYA takes screen — new blank method area, cursor positioned]*

**MAYA:** Here's a bad approach I used to take. I'd start typing the method signature and hope Copilot would figure out what I wanted.

*[Types: `public async Task<`...] — ghost text appears with something generic]*

**MAYA:** Generic. Not wrong, but not helpful for my specific intent. Here's the better approach.

*[Deletes what she typed. Types a comment instead:]*
*`// Retrieves all active tasks assigned to a specific user, sorted by priority descending.`*
*`// Returns an empty list if the user has no active tasks — never null.`*

**MAYA:** Now I press Enter and wait one second.

*[Ghost text appears — full async method with filtering by userId, ordering by Priority, and an empty list fallback]*

**MAYA:** Look at that. Same method, completely different quality. It filtered by user. It ordered by priority descending. It explicitly handles the empty case. All of that came from my two-line comment.

**JORDAN:** *(voice-over)* The comment is your specification. It's the most important thing you write before a new piece of code.

**MAYA:** And notice what else happened. The method name was generated from the comment. The parameter was named `userId` because I said "specific user." The return type is `IEnumerable<TodoItem>` because it knows this class works with TodoItems. The comment gave Copilot everything it needed.

---

## [04:00 – 06:15] KEYBOARD SHORTCUTS — THE FULL SET

*[JORDAN takes screen — VS Code with ghost text visible]*

**JORDAN:** Now let's go through every keyboard shortcut you need. I'm going to put these on screen and demonstrate each one.

*[ON SCREEN: keyboard shortcut table overlay]*

**JORDAN:** **Tab** — accept the entire suggestion. The one most people know.

*[Demo: ghost text visible → Tab → accepted]*

**JORDAN:** **Escape** — dismiss. You don't want that suggestion.

*[Demo: Escape → ghost text gone]*

**JORDAN:** **Ctrl+Right Arrow** — accept only the next word. This is the one most people miss.

*[Demo: ghost text visible → Ctrl+Right → accepts one word at a time]*

**JORDAN:** This is powerful when the suggestion is mostly right but not perfectly right. Accept the parts you want, word by word, and retype the parts you don't.

**MAYA:** *(voice-over)* Can you slow down on that one?

**JORDAN:** Sure. Watch. The suggestion says "returns filtered tasks ordered by due date." I want "ordered by priority" not "due date." So I accept up to "ordered by" with Ctrl+Right a few times, then I type "priority" myself. Partial acceptance.

*[Demo: accept first four words of suggestion, then retype last two]*

**MAYA:** *(on camera now)* My favourite shortcut. Next one?

**JORDAN:** **Alt+]** and **Alt+[** — cycle through alternative suggestions. This is huge. Copilot often has multiple completions in mind. Alt+] shows you the next one.

*[Demo: trigger a suggestion, then press Alt+] to cycle through three different implementations]*

**JORDAN:** Same method, three different approaches. I can pick the one that matches my style.

**MAYA:** When is that useful?

**JORDAN:** When the first suggestion uses a pattern you don't want. Maybe it used a for-loop and you prefer LINQ. Cycle. Or it used `FirstOrDefault` and you need `SingleOrDefault`. Cycle. Two keystrokes to see a completely different implementation.

**JORDAN:** Last shortcut — **Ctrl+Enter** — opens the Copilot completions panel. You see up to ten alternative suggestions at once in a side panel.

*[Demo: Ctrl+Enter → side panel opens with numbered suggestions]*

**JORDAN:** This is the "give me options" mode. More visual. Good when you're genuinely unsure which approach to take.

---

## [06:15 – 08:00] TRIGGERS — CONTROLLING WHEN SUGGESTIONS APPEAR

*[MAYA on screen]*

**MAYA:** Ghost text doesn't just appear randomly. There are things you can do to trigger better suggestions and things that accidentally suppress them.

**JORDAN:** *(voice-over)* Let's start with what triggers suggestions.

**MAYA:** **Pausing after typing.** If you type quickly without pausing, suggestions may not appear until you stop. A half-second pause is enough. You don't have to wait long.

**MAYA:** **Writing a comment.** As we just saw — a descriptive comment is the most reliable suggestion trigger, and it improves quality dramatically.

**MAYA:** **Open curly brace.** Inside a method body — `{` followed by Enter triggers a suggestion for the body.

*[Demo: write method signature and open brace, press Enter, see body suggestion]*

**JORDAN:** *(voice-over)* And things that suppress suggestions?

**MAYA:** **Typing too fast.** If you're already on the next line, the suggestion for the previous line is gone. **Having the wrong file open** — if Copilot is reading a file full of unrelated patterns, suggestions will drift. **Syntax errors in the current file** — if there's a compiler error above where you're typing, suggestions get noisy.

**JORDAN:** That last one surprises people. Fix your syntax errors first. Copilot works much better in a clean file.

**MAYA:** And there's a setting worth knowing about: Copilot's suggestion delay. In VS Code settings — search "Copilot" — you can see and adjust editor-level options. Most people leave the defaults, but it's there if suggestions feel too slow or too eager.

---

## [08:00 – 09:30] NAMING IS A SUPERPOWER

*[JORDAN on screen — empty class file]*

**JORDAN:** Here's something that blew my mind when I first discovered it. The names you give to things have an enormous impact on suggestion quality.

*[Types: `private readonly IRepo _r;`]*

**JORDAN:** Now I'll add a method.

*[Types `Get` — generic suggestion appears]*

**JORDAN:** Now watch what happens when I rename that field.

*[Changes to: `private readonly ITodoRepository _todoRepository;`]*
*[Types `Get` again — much more specific suggestion appears, using the right repository methods]*

**JORDAN:** Same method stub. Different field name. Copilot's suggestion went from generic to specifically using ITodoRepository's actual interface methods.

**MAYA:** *(on camera)* Because the name `_todoRepository` contains information. It tells Copilot what kind of object it's working with.

**JORDAN:** Naming is context. `data`, `obj`, `r`, `temp` — these names are signal-free. `_todoRepository`, `_currentUserService`, `_emailNotificationSender` — these tell Copilot exactly what the variable does. And it generates accordingly.

**MAYA:** This is also why AI-written code with single-letter variable names is a red flag. Bad names make future suggestions worse for everyone.

**JORDAN:** And it compounds. A class with good names generates better next-line suggestions, which generate methods with better internal variable names, which generate better method body suggestions. Good naming creates a virtuous cycle.

---

## [09:30 – 11:00] REAL SCENARIO — BUILDING A METHOD FROM SCRATCH

*[MAYA on screen — service class, cursor at new method position]*

**MAYA:** Let's put it all together. Real scenario. I need to write a method that deactivates all tasks for a user when they leave the organisation. Here's my process.

*[Step 1: Write the comment]*
*`// Deactivates all tasks owned by the specified userId.`*
*`// Sets IsActive = false and records the deactivation timestamp.`*
*`// Does nothing if the user has no tasks.`*

**MAYA:** Three lines. My full intent is documented.

*[Step 2: Press Enter — ghost text appears]*

**MAYA:** First suggestion. Let me read it. *(reads)* It's using a LINQ query to get all tasks, then a foreach to set IsActive false. That's correct. But it's not setting the timestamp.

*[Presses Alt+] to cycle]*

**MAYA:** Second suggestion. *(reads)* This one uses ExecuteUpdateAsync — a newer EF Core pattern that does it in a single database call, more efficient. And it sets the timestamp. I prefer this approach.

*[Accepts with Tab]*

**MAYA:** Now I need to verify. *(reads through accepted code)* Repository call — correct. ExecuteUpdateAsync with both properties — correct. Async pattern — correct. Does nothing if no tasks exist — ExecuteUpdateAsync handles an empty set gracefully, so correct.

**JORDAN:** *(voice-over)* What would you change?

**MAYA:** I'd add logging — Copilot didn't add it this time. Let me do that.

*[Opens inline chat — Ctrl+I — on the accepted method]*
*[Types: "Add ILogger at Debug for method entry and Information when tasks are updated"]*

*[Logging lines added in place]*

**MAYA:** Done. Method is complete. Total keyboard typing: one comment, two keystrokes to cycle suggestions, one Tab to accept, one inline chat command. Maybe thirty seconds.

---

## [11:00 – 12:15] WHEN TO SKIP GHOST TEXT

*[BOTH ON CAMERA]*

**JORDAN:** Before we wrap, let's talk about when *not* to use ghost text.

**MAYA:** It's not always the right tool.

**JORDAN:** Correct. Ghost text is best for code that follows a pattern — things that are similar to what's already in the file. For greenfield code — brand new architecture, new patterns, new abstractions — ghost text often produces wrong suggestions because there's no pattern to extrapolate from.

**MAYA:** In those cases, use the chat panel. Describe what you're building, ask Copilot to help you think through the design, then start writing the code. The chat establishes context that completions can then build on.

**JORDAN:** Also — ghost text is not great for debugging. If your code has a bug, Copilot may suggest fixes that look right but don't address the root cause. For debugging, again: chat panel. Describe the symptoms, paste the error, ask for an explanation.

**MAYA:** The general rule: ghost text for *execution* — writing code that follows established patterns. Chat for *thinking* — designing, debugging, exploring.

---

## [12:15 – 13:00] RECAP

*[BOTH ON CAMERA]*

**MAYA:** Let's recap. Comments are your most powerful tool — write them before you code, not after.

**JORDAN:** Keyboard shortcuts: Tab to accept, Escape to dismiss, Ctrl+Right for word-by-word, Alt+] and Alt+[ to cycle alternatives, Ctrl+Enter for the suggestion panel.

**MAYA:** Good naming multiplies suggestion quality. Name your variables and fields as if Copilot is reading them — because it is.

**JORDAN:** Trigger ghost text by pausing, writing comments, and opening method bodies. Keep your file free of syntax errors.

**MAYA:** Use ghost text for pattern-following code. Use the chat panel for design and debugging.

**JORDAN:** Video Three: the Chat Panel and all its power — @workspace, @terminal, slash commands, inline chat at scale. See you there. I'm Jordan.

**MAYA:** I'm Maya. Keep writing great comments.

*[OUTRO: course hub URL on screen]*

---

## PRODUCTION NOTES

- **Runtime:** ~13 minutes
- **Chapter markers:** 0:00 Cold Open · 0:50 How Copilot Reads Files · 2:30 The One Habit · 4:00 Keyboard Shortcuts · 6:15 Triggers · 8:00 Naming · 9:30 Full Scenario · 11:00 When to Skip · 12:15 Recap
- **Key demos:** Comment-first workflow · Alt+] cycling through 3 alternatives · word-by-word acceptance · field naming impact · inline chat logging addition
- **Graphic overlays:** Keyboard shortcut table (keep on screen 30+ seconds) · Context source diagram · Good vs bad naming examples

---
*Spoken word count: ~2,200 · Estimated runtime: ~13 minutes*
