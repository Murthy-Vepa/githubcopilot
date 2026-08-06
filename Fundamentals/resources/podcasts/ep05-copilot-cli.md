# Episode 05 — Copilot CLI: AI in the Terminal
## Copilot Fundamentals Podcast Series · GitHub Copilot Mastery · MetLife 2026

**Format:** 2 hosts · conversational · ~3.5 minutes
**Voices:** Jordan (male, US English) · Maya (female, US English)
**Audience:** Developers who live in the terminal

---

**[INTRO MUSIC FADE IN, THEN UNDER]**

**JORDAN:** Hey, welcome back. I'm Jordan.

**MAYA:** And I'm Maya. Today's episode is short and practical — Copilot CLI. Because while most people think of Copilot as a VS Code thing, there's a powerful extension for the terminal that a lot of developers overlook entirely.

**JORDAN:** And once you start using it, you wonder how you ever survived without it. Let me set the scene. You're in the terminal, you need a shell command — maybe a complex git operation, a find command, a curl request with specific headers. What do you do?

**MAYA:** Historically — Google it. Or dig through your shell history hoping you ran it before. Or try to remember the flags and get it wrong twice first.

**JORDAN:** With Copilot CLI — you just *describe what you want* in plain English.

**MAYA:** Okay let's get into the practical stuff. How do you install it?

**JORDAN:** You need the `gh` CLI first — the GitHub CLI — which you can install from cli.github.com. Then you run: `gh extension install github/gh-copilot`. That's it. Log in with your GitHub account and you're set.

**MAYA:** And then two commands unlock most of the value. `gh copilot suggest` and `gh copilot explain`.

**JORDAN:** Let's do `suggest` first. You run `gh copilot suggest` followed by what you want to do, in quotes. For example: `gh copilot suggest "undo my last commit but keep the files"`. Copilot responds with `git reset HEAD~1 --soft`. You can run it directly, copy it, or ask for alternatives.

**MAYA:** I remember the first time I used it. I needed to find all TypeScript files modified in the last week, and I knew it was a `find` command but I could never remember the date syntax. I typed `gh copilot suggest "find all TypeScript files modified in the last 7 days"` and got the exact command. No Googling.

**JORDAN:** And it handles the context-sensitive stuff too — it asks you whether you're running a git command, a shell command, or a GitHub CLI command, so it gives you the right flavor.

**MAYA:** What about `gh copilot explain`?

**JORDAN:** That's the opposite direction. You give it a command and it tells you what it does. So you've inherited a deployment script from three years ago and there's this line nobody understands — `find . -name "*.log" -mtime +30 -exec rm {} \;`. You paste that into `gh copilot explain` and get a plain-English breakdown: "This finds all .log files older than 30 days and deletes them." Now you know. Now you can make a decision about whether to keep it.

**MAYA:** That is invaluable when you're onboarding to a new codebase or inheriting scripts from someone who's left the team.

**JORDAN:** And for security — before running *any* unfamiliar script from the internet, run it through `gh copilot explain` first. Know what it does before it runs.

**MAYA:** That's a really good safety habit, actually. Understand before you execute.

**JORDAN:** There's also a shorthand alias you can set up. If you put `ghcs` as an alias for `gh copilot suggest` and `ghce` for explain, you can type `ghcs "list all running docker containers with their ports"` and get an answer in seconds. One alias, dramatically less Googling.

**MAYA:** Let me bring up a workflow I use a lot — combining the CLI with VS Code. I'll be working on something in the editor, pop into the integrated terminal, use `gh copilot suggest` to figure out the right git command or deployment command, run it, and switch back. The AI stays with me across the whole workflow, not just the code.

**JORDAN:** That's the key insight. Development isn't just writing code. It's git operations, build commands, deployment scripts, environment setup. All of that is in the terminal. Copilot CLI brings the AI assistant into all of those moments.

**MAYA:** What's the one scenario where developers most often tell you Copilot CLI saved them?

**JORDAN:** Git. Complex git operations. Rebasing interactively, cherry-picking across branches, resetting to a specific commit while keeping staged changes, undoing a merge — these are the commands people get wrong and dread. `gh copilot suggest "interactively rebase the last 4 commits"` gives you `git rebase -i HEAD~4`. No risk of getting the flags backwards.

**MAYA:** And the confidence that comes with knowing the command is right before you run it — that's worth a lot.

**JORDAN:** Especially for anything that modifies history on a shared branch.

**MAYA:** Alright — Episode Five in a nutshell. Install with `gh extension install github/gh-copilot`. `gh copilot suggest` turns plain English into shell commands. `gh copilot explain` turns scary commands into plain English. Set up short aliases for even faster use. And use it for git, find, curl, docker — any command you'd normally Google.

**JORDAN:** Short episode, big impact. Next — MCP and Tools. How Copilot connects to live external systems to give agents real-world reach.

**MAYA:** I'm Maya.

**JORDAN:** I'm Jordan. See you in the next one.

**[OUTRO MUSIC]**

---
*Runtime estimate: ~3.5 minutes · Word count: ~710*
