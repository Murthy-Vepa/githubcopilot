# Session 1 — Video Scripts
## Five Micro-Videos · 3–5 min each · Screen Record with Captions

---

## VIDEO 1: "What is GitHub Copilot in 3 Minutes"
**Duration:** 3 min · **Format:** Talking head + VS Code demo

### Script

**[0:00 – 0:30] HOOK**  
*[Screen: blank VS Code with cursor blinking]*  
"What if your IDE could finish your sentences? Not just boilerplate — but actually understand what you're trying to build, read your codebase, and write production-quality code? That's GitHub Copilot. Let me show you what it actually does."

**[0:30 – 1:30] DEMO: Inline completions**  
*[Screen: TodoService.cs open]*  
"I'm going to write a comment describing a method I need."  
*[Type: `// Returns all overdue todo items, ordered by due date`]*  
"Watch the ghost text appear."  
*[Pause for ghost text]*  
"That's Copilot predicting what I want. Tab to accept."  
*[Tab]*  
"Done. That's it. No googling, no typing boilerplate."

**[1:30 – 2:30] THREE MODES**  
*[Screencast showing each mode briefly]*  
"Three ways to interact. One — ghost text as you type. Two — inline chat: select code, Ctrl+I, ask a question, it edits in place. Three — the chat panel: Ctrl+Shift+I. Think of it as a conversation with someone who knows your whole codebase."

**[2:30 – 3:00] WRAP**  
"Copilot isn't autocomplete on steroids. It's a pair programmer who never gets tired. Session 1 of this course covers everything — check the one-pager and lab in the course hub."

---

## VIDEO 2: "Chat Participants & Slash Commands"
**Duration:** 4 min · **Format:** VS Code demo with callouts

### Script

**[0:00 – 0:20] HOOK**  
"Most people use Copilot Chat like it's a search box. Once you know about participants and slash commands, you'll use it completely differently."

**[0:20 – 1:20] @workspace**  
*[Open chat panel, type:]*  
"`@workspace explain how authentication works in this app`"  
"The @workspace participant has indexed your entire codebase. It's not just reading the current file — it understands every file, every import, every dependency."  
*[Show response pointing to specific files]*  
"Look — it's referencing the actual middleware class in our repo."

**[1:20 – 2:20] @terminal**  
*[Run a failing test, then open chat]*  
"`@terminal why did my last test run fail?`"  
"@terminal reads the output of your last terminal command. No copy-pasting error messages."

**[2:20 – 3:20] Slash Commands**  
*[Select a function, open inline chat]*  
"`/tests`"  
"Slash commands are shortcuts for common tasks. /tests generates unit tests for the selected code. /explain walks you through it. /fix repairs it. /doc writes documentation."

**[3:20 – 4:00] COMBINATION**  
"`@workspace /tests for the TodoService class including edge cases`"  
"Combine a participant with a slash command for laser-focused results. This is one command I run every single day."

---

## VIDEO 3: "The GitHub Copilot CLI"
**Duration:** 3.5 min · **Format:** Terminal demo

### Script

**[0:00 – 0:30] HOOK**  
*[Terminal visible]*  
"How many times today have you Googled a shell command? What if you could just describe what you want in plain English?"

**[0:30 – 1:00] SETUP**  
*[Run:]*  
```
gh extension install github/gh-copilot
```
"One command. Done. Now you have `gh copilot suggest` and `gh copilot explain`."

**[1:00 – 2:00] SUGGEST DEMO**  
*[Run:]*  
```
gh copilot suggest "show git log with author, date, one line per commit"
```
*[Show output, run the command]*  
"It suggests the command. You press Y to run it, N to explain it, or E to edit it."

**[2:00 – 2:45] EXPLAIN DEMO**  
*[Run:]*  
```
gh copilot explain "awk '{sum += $2} END {print sum}' data.txt"
```
"Someone handed you a script. You don't know what it does. Explain it."  
*[Show explanation]*

**[2:45 – 3:30] ALIASES**  
"Set up aliases in your shell profile:  
`alias ghcs='gh copilot suggest'`  
`alias ghce='gh copilot explain'`  
Now it's just `ghcs 'undo last commit'`. Three keystrokes."

---

## VIDEO 4: "Understanding MCP in 4 Minutes"
**Duration:** 4 min · **Format:** Diagram animation + VS Code demo

### Script

**[0:00 – 0:40] WHAT IS MCP?**  
*[Simple diagram: AI Model ↔ JSON-RPC ↔ Tools]*  
"MCP stands for Model Context Protocol. It's a standard that lets AI models call external tools using a common interface. Think USB-C for AI integrations — one standard, works with everything."

**[0:40 – 1:30] HOW IT WORKS**  
"Copilot is the MCP *client*. An MCP *server* exposes tools — like 'list Azure resources' or 'create a GitHub issue'. Copilot can call any registered server's tools when answering your questions."

**[1:30 – 2:30] CONFIG DEMO**  
*[Open/create `.github/mcp.json`]*  
"Configure servers in a JSON file. Here I'm adding the Azure MCP server."  
*[Type the JSON config]*  
"Reload VS Code. That's the entire setup."

**[2:30 – 3:30] IN ACTION**  
*[Open Chat panel]*  
"Now I ask: 'List my Azure resource groups.' Copilot calls the Azure MCP server, gets the data, and responds in natural language."  
*[Show the response]*  
"No SDK code. No API calls. Just a question."

**[3:30 – 4:00] ECOSYSTEM**  
"77,000 MCP servers at mcp.run. Azure, GitHub, databases, Jira, Slack — if a service has an API, there's probably an MCP server for it."

---

## VIDEO 5: "Security Hygiene with Copilot"
**Duration:** 3 min · **Format:** Talking head with screen examples

### Script

**[0:00 – 0:30] HOOK**  
"Before you go all-in on Copilot, there are three things you need to know about security. Miss these and you could create real problems."

**[0:30 – 1:00] WHAT COPILOT SEES**  
"Copilot sees: your open files, the code you've selected, your chat messages. It sends these to GitHub's API for inference. On MetLife's Copilot Business plan — your code is NOT used to train the model. But it does leave your machine."

**[1:00 – 1:45] WHAT NEVER TO SHARE**  
*[Show example — blur any real secrets]*  
"Never paste: API keys, passwords, connection strings, PII — customer names, emails, account numbers. Even in a chat message. Even to debug a problem. Redact first, then ask."

**[1:45 – 2:30] THE PUBLIC CODE FILTER**  
"Copilot has a public code filter that blocks suggestions that closely match public licensed code. This is on by default on our account. It protects you from accidentally shipping GPL-licensed code."

**[2:30 – 3:00] YOUR RESPONSIBILITY**  
"Copilot is a tool. You're the engineer. Review every suggestion. Run your tests. Treat AI-generated code exactly like you'd treat code from a contractor — read it, understand it, own it. Then ship it."

---

## PRODUCTION NOTES

**Recording:**
- Screen: 1920×1080, VS Code dark theme (default)
- Font: Fira Code, size 16 for demos
- Terminal: PowerShell with Oh My Posh or similar
- Audio: Lapel mic or headset — no background noise
- Captions: Auto-generate via Descript or CapCut, then manually correct

**Upload:**
- SharePoint > GitHub Copilot Training > Session 1 > Videos
- Pin in Teams channel: #copilot-training
- Add to course hub one-pager as iframe or link

**Length guidance:**
- Videos 1, 3, 5: Keep under 3.5 min — strong hook required
- Videos 2, 4: Can go to 4 min — demo-heavy content
- Never exceed 5 min — split into two videos if needed
