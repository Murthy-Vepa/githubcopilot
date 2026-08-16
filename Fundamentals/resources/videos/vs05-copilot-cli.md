# Video Script 05 — Copilot CLI
## Fundamentals Video Series · GitHub Copilot Mastery

**Format:** 2 co-hosts · Terminal screen share · ~12 minutes
**Hosts:** Jordan (male, US English) · Maya (female, US English)
**Target audience:** Developers who live in the terminal and want AI assistance without leaving it
**Screen setup:** Terminal (PowerShell or bash) · VS Code in background but terminal is the star

---

## PRE-SHOW SETUP CHECKLIST
- [ ] `gh` (GitHub CLI) installed and authenticated
- [ ] `gh extension install github/gh-copilot` completed
- [ ] Aliases configured: `ghcs` → `gh copilot suggest` · `ghce` → `gh copilot explain`
- [ ] A complex git scenario ready (merge conflict history, or rebase demo)
- [ ] A PowerShell script with a bug for the explain demo

---

## [00:00 – 00:50] COLD OPEN

*[MAYA at terminal — no VS Code visible. Pure terminal.]*

**MAYA:** I'm going to ask Copilot something without opening VS Code. Without opening a browser. Without leaving this terminal.

*[Types: `gh copilot suggest "find all files changed in the last 24 hours and show their sizes in human readable format"`]*

*[Result appears — an `ls` / `find` command with `-mtime -1 -exec ls -lh` flags]*

**MAYA:** One sentence. I got the command. I can see it, confirm it looks right, and run it.

**JORDAN:** *(voice-over)* That's the Copilot CLI. AI assistance built into your shell — without touching a mouse, without switching windows.

**MAYA:** *(looks at camera)* For the developers who live in the terminal, this changes your workflow. I'm Maya.

**JORDAN:** *(on camera — split)* I'm Jordan. Video Five — the Copilot CLI. Let's never leave the terminal again.

*[TITLE CARD: "Copilot CLI" | Module 1 · Fundamentals]*

---

## [00:50 – 02:00] INSTALLATION — TWO COMMANDS

*[JORDAN on screen — fresh terminal]*

**JORDAN:** Installing the Copilot CLI requires two things. First — the GitHub CLI. If you don't have it, install it through the GitHub CLI docs. It's a one-command install on any platform.

*[Types (already installed, shows the output of): `gh --version`]*
*[Output: `gh version 2.x.x`]*

**JORDAN:** Already installed. Second step: install the Copilot extension for `gh`.

*[Types: `gh extension install github/gh-copilot`]*

*[Simulated output: Installing... ✓ Installed github/gh-copilot]*

**JORDAN:** That's it. One command. The extension is now available as `gh copilot`.

**MAYA:** *(voice-over)* And authentication?

**JORDAN:** If you're already authenticated to `gh` — which most people using GitHub are — you're done. Same credentials. If not, `gh auth login` walks you through it in under two minutes.

**MAYA:** No separate Copilot credentials. No new tokens. It uses your existing GitHub Copilot licence.

---

## [02:00 – 04:00] GH COPILOT SUGGEST — THE MAIN COMMAND

*[MAYA on screen — terminal]*

**MAYA:** Two primary commands. First: `gh copilot suggest`. This is your "I want to do something but I don't know the command" tool.

*[Types: `gh copilot suggest "archive all log files older than 30 days into a tar.gz"`]*

*[Response appears — a `find` + `tar` pipeline]*

**MAYA:** *(reads)* It suggested a `find` command piped into `tar`. That looks correct. But notice the flags — it used the GNU version of `find`. On macOS, those flags are slightly different. The CLI actually knows about this and it's going to ask me something.

*[Follow-up prompt appears: "What type of shell are you using?" with options: bash, zsh, PowerShell, fish]*

**MAYA:** This is one of the things I love about `gh copilot suggest`. It doesn't just dump a command — it asks for your environment first.

*[Selects zsh]*

*[Command updates slightly — macOS-compatible flags]*

**JORDAN:** *(voice-over)* Does it run the command for you?

**MAYA:** No. It shows you the command. You can inspect it before running anything. Which is exactly the right behaviour.

*[Another option visible: "Run this command"]*

**MAYA:** If you confirm "run this command," it executes. But you always see it first. Never surprise execution.

*[Shows another suggest example]*
*[Types: `gh copilot suggest "squash the last 4 commits into one with a clean commit message" -t git`]*

**MAYA:** The `-t git` flag tells it I want a Git command specifically. The options are: `shell`, `git`, and `gh` — for GitHub CLI commands.

*[Response: `git rebase -i HEAD~4`]*

**JORDAN:** *(on camera)* That `-t` flag is important. It narrows the model's search space. A git command suggestion and a shell command suggestion are very different things.

---

## [04:00 – 06:00] GH COPILOT EXPLAIN — UNDERSTAND ANYTHING

*[JORDAN on screen — a complex shell script visible in the terminal via `cat`]*

**JORDAN:** Second command: `gh copilot explain`. You give it a command or script, it explains it in plain English.

*[Types: `gh copilot explain "find . -type f -name '*.log' -mtime +30 -exec gzip {} \;"`]*

*[Response appears — full explanation of each flag and the exec clause]*

**JORDAN:** *(reads)* "Searches the current directory recursively for regular files named with a .log extension. Filters for files older than 30 days. Runs gzip on each matching file in place." Every flag explained. The `{}` and `\;` syntax explained. The semicolon escape explained.

**MAYA:** *(voice-over)* When is that actually useful?

**JORDAN:** Three scenarios. You inherited a Bash script that no one commented. You Googled a command and the Stack Overflow answer uses flags you don't recognise. Or you ran something from memory and want to verify it does what you think before running it somewhere important.

**MAYA:** *(on camera — takes screen)* Here's a scenario that actually happened to me. A pipeline script in our CI had this in it:

*[Types: `gh copilot explain "git log --oneline --no-merges --follow -p -- $FILE | grep '^+' | wc -l"`]*

*[Response streams — explains the git log flags, the follow option, the grep pattern, and what the wc output means]*

**MAYA:** *(reads)* It told me that command counts the total number of lines ever added to a specific file across all commits, excluding merges. I did not know that from reading it. I know it now.

**JORDAN:** Copilot explain as a learning tool. Every complex command you encounter becomes a free tutorial.

---

## [06:00 – 07:45] SETTING UP ALIASES — THE QUALITY OF LIFE UPGRADE

*[MAYA on screen — terminal, shell config file being edited]*

**MAYA:** `gh copilot suggest` and `gh copilot explain` are the commands. But they're wordy. Most people who use these daily set up aliases.

*[Shows alias setup for bash/zsh]*

```bash
# Add to ~/.bashrc or ~/.zshrc
alias ghcs='gh copilot suggest'
alias ghce='gh copilot explain'
```

*[Shows PowerShell equivalent]*

```powershell
# Add to $PROFILE
function ghcs { gh copilot suggest @args }
function ghce { gh copilot explain @args }
```

**MAYA:** Now instead of `gh copilot suggest "..."` I can just type `ghcs "..."`. Two characters instead of seventeen. That's the difference between a tool you use and a tool you use ten times a day.

**JORDAN:** *(voice-over)* Any other workflow tips?

**MAYA:** Yes. **Pipe errors into explain.** This is my favourite trick.

*[Shows example: running a failing command, then piping the error to explain]*

```bash
# Run the failing command, capture stderr, then explain it
npm run build 2>&1 | tail -20 | gh copilot explain
```

**MAYA:** I piped the last 20 lines of build output — including the error — directly into `gh copilot explain`. It reads the error message and explains what caused it.

*[Explanation appears — identifies the specific error type, explains the cause, suggests a fix path]*

**JORDAN:** *(on camera)* No copy-pasting. No switching to the browser. The error explanation comes to the terminal.

---

## [07:45 – 09:30] REAL WORKFLOW — GIT AND TERMINAL IN TANDEM

*[JORDAN on screen — a complex git situation visible: merge conflict markers in terminal output]*

**JORDAN:** Let's walk through a real workflow. I'm in the middle of a rebase. Something went wrong. I have merge conflicts and I'm not completely sure what state the index is in.

*[Types: `git status`]*
*[Output: complex state — some staged, some not, some conflicts]*

**JORDAN:** I understand the basic git commands. But this particular state — rebase in progress, staged changes, conflict markers — the right resolution sequence is not obvious to me. Let me ask.

*[Types: `ghcs "I'm in the middle of git rebase with merge conflicts — staged and unstaged changes — what's the correct sequence to resolve and continue?"`]*

*[Response: step-by-step sequence — `git diff`, resolve specific files, `git add`, `git rebase --continue`]*

**JORDAN:** *(reads through it)* Clear. Ordered. Correct. And specific to my situation — it's saying rebase --continue, not commit, because it knows I'm in a rebase.

**MAYA:** *(voice-over)* That's not a general answer. It's specific to what you described.

**JORDAN:** Exactly. And here's the key thing: I didn't leave the terminal to get it. My flow didn't break. I stayed in the terminal, got the answer, executed the steps, continued the rebase.

*[Runs through the suggested steps one by one — simulated but shows the flow]*

**JORDAN:** For complex git operations in particular — the ones you only do a few times a year and always have to Google — the Copilot CLI is the faster path.

---

## [09:30 – 10:45] LIMITATIONS AND SECURITY NOTES

*[MAYA on screen — back on camera]*

**MAYA:** Before we wrap, a few important limitations.

**JORDAN:** *(voice-over)* Go ahead.

**MAYA:** First: **the Copilot CLI does not have access to your codebase.** Unlike @workspace in VS Code, `gh copilot suggest` and `explain` work from what you tell them in the command. They don't read your files. They're answering from general knowledge.

**JORDAN:** *(on camera)* So if you ask "what does the test script in my package.json do" — it can't look at your package.json. You'd need to `cat` the file and pipe the output.

**MAYA:** Right. The context window is the terminal. You can pipe things in, but you have to be explicit. It's different from VS Code's @workspace magic.

**MAYA:** Second: **don't paste sensitive data.** If you're building a command involving connection strings, tokens, or passwords — use placeholders in your prompt. Ask Copilot to write the command structure, then fill in the real values yourself.

*[ON SCREEN: Example — asking for a command with `<CONNECTION_STRING>` placeholder, not the real value]*

**JORDAN:** Same principle as the chat panel. The model doesn't need your actual credentials to help you write the command.

**MAYA:** Third: **always read the suggested command before running it.** Even on confirm. Thirty seconds of reading prevents a bad day.

**JORDAN:** If the command touches files, databases, or remote systems — read every flag.

---

## [10:45 – 12:00] RECAP

*[BOTH ON CAMERA]*

**JORDAN:** The Copilot CLI lives in your terminal. Two commands: `gh copilot suggest` for generating commands you don't know. `gh copilot explain` for understanding commands you didn't write.

**MAYA:** Use the `-t` flag to narrow to shell, git, or gh commands. Set up aliases — `ghcs` and `ghce` — so you'll actually use them.

**JORDAN:** Pipe build errors and command output into `gh copilot explain` for in-terminal debugging. It beats copy-pasting to a browser.

**MAYA:** No codebase access — context comes from what you pipe in. Never pipe real credentials. Always read the suggested command before running it.

**JORDAN:** For developers who live in the terminal, this is the workflow upgrade you've been waiting for. I'm Jordan.

**MAYA:** I'm Maya. Next video: MCP and Tools — the extensions that make Copilot aware of your cloud, your APIs, and your organisation's systems. See you in Video Six.

*[OUTRO: course hub URL on screen]*

---

## PRODUCTION NOTES

- **Runtime:** ~12 minutes
- **Chapter markers:** 0:00 Cold Open · 0:50 Installation · 2:00 gh copilot suggest · 4:00 gh copilot explain · 6:00 Aliases · 7:45 Real Workflow (git rebase) · 9:30 Limitations & Security · 10:45 Recap
- **Terminal preference:** Record on the shell your audience uses. Separate recording for PowerShell and bash if the course serves both Windows and Mac users.
- **Key demo setup:** The git rebase conflict state needs to be pre-staged — don't do this live. Use a prepared test repo.
- **Security demo:** Show the placeholder approach with `<CONNECTION_STRING>` as a clearly visible on-screen graphic

---
*Spoken word count: ~2,000 · Estimated runtime: ~12 minutes*
