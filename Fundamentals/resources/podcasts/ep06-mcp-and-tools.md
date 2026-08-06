# Episode 06 — MCP & Tools: Connecting Copilot to the World
## Copilot Fundamentals Podcast Series · GitHub Copilot Mastery · MetLife 2026

**Format:** 2 hosts · conversational · ~4.5 minutes
**Voices:** Jordan (male, US English) · Maya (female, US English)
**Audience:** Developers ready to extend Copilot beyond the workspace

---

**[INTRO MUSIC FADE IN, THEN UNDER]**

**MAYA:** Welcome back to Copilot Fundamentals. I'm Maya.

**JORDAN:** And I'm Jordan. Episode Six — MCP and tools. This one is about extending what Copilot can *see* and *do* beyond your local workspace. And for a lot of people, this is where Copilot goes from "really useful coding assistant" to "genuinely changing how I work."

**MAYA:** So let's start with the built-in tools, because even without any configuration, Copilot has tools available in agent mode.

**JORDAN:** Right. When you run Copilot in agent mode, it has access to file system tools — read files, write files, search files, list directories. It has terminal access — it can run shell commands. And it has browser tools, which let it open web pages and read their content.

**MAYA:** That last one is underrated. Because one of the known limitations of AI is the training cutoff — the model's knowledge only goes up to a certain date. But if the agent can *browse* to the official documentation —

**JORDAN:** It gets current information. No hallucinating outdated APIs. No confidently wrong answers about library versions. It checks the actual docs.

**MAYA:** Okay, now — MCP. The Model Context Protocol. What is it and why does it matter at the Fundamentals level?

**JORDAN:** So MCP is an open standard for connecting AI models to external systems. Think of it as a plugin protocol. Any external service that implements MCP — GitHub, Azure, a database, an internal API — becomes a tool that Copilot can call directly, in real time, during a conversation or an agent task.

**MAYA:** And "in real time" is important there. This isn't cached data or pre-indexed knowledge. It's a live API call.

**JORDAN:** Exactly. Ask Copilot "what are my open PRs right now?" With GitHub MCP connected, it *actually looks*. The answer reflects the current state of your repository.

**MAYA:** How do you set it up?

**JORDAN:** It's a JSON config file in your project: `.vscode/mcp.json`. You define which MCP servers you want, the command to start each one, and any environment variables they need — like auth tokens. And importantly — auth tokens always go in environment variables, never directly in the file. The file is safe to commit because it contains no secrets.

**MAYA:** Let's talk about the most useful MCP servers for developers at MetLife.

**JORDAN:** First — GitHub MCP. This is the one almost everyone should have. You connect it with a GitHub personal access token, and suddenly Copilot can read and search your issues, your pull requests, your repository contents, and your code. Workflows like "summarize all open bugs labeled 'high priority'" or "find any PRs that touch the authentication service" — those become one-line chat messages.

**MAYA:** I've started using it to write PR descriptions. I ask Copilot to "look at the diff since main and write a PR description with context and a testing checklist." It reads the actual changes and writes something meaningful.

**JORDAN:** That alone saves five to ten minutes on every PR.

**MAYA:** What about Azure MCP?

**JORDAN:** Azure MCP connects Copilot to your Azure subscription. You can ask it to list your resource groups, check App Service health, summarize error logs from the last hour, see what secrets are expiring in Key Vault. All from the chat panel. No portal context-switching required.

**MAYA:** For anyone doing cloud work, that's a massive quality-of-life improvement.

**JORDAN:** And there are others worth knowing: a filesystem MCP server for enhanced file operations across paths outside your workspace, a PostgreSQL MCP server if you want to query a database directly in conversation, Brave Search MCP for live web searches during a task.

**MAYA:** And the ecosystem is growing fast — there are tens of thousands of community-built MCP servers at this point.

**JORDAN:** Let me cover the security side because it's important. A few non-negotiable rules. One — secrets always in environment variables, never in the JSON file. Two — apply least privilege. If the agent only needs to *read* GitHub issues, give it a read-only token. Don't hand it a token that can delete repositories. Three — review the tool call log. Every MCP call the agent makes is visible in the execution log. You can see exactly what it queried or changed.

**MAYA:** And just like terminal commands — you can configure Copilot to ask before taking action through MCP tools.

**JORDAN:** The approval model applies everywhere. You're always in control of what gets executed.

**MAYA:** Let me give a real end-to-end workflow so people can see how this comes together. Picture this. Monday morning, you want to plan your week. You ask Copilot: "Look at the open issues assigned to me in our repo, check if any of the services they touch have had recent Azure App Service errors, and summarize what needs attention first."

**JORDAN:** Without MCP — impossible. Copilot has no idea what your issues look like or what your Azure logs say. With GitHub MCP and Azure MCP connected — it reads your issues, it checks the service health, it synthesizes a priority view. In thirty seconds.

**MAYA:** That workflow used to take me twenty minutes of context-gathering across three different tools. Now it's one question.

**JORDAN:** And the output gets better over time as you tune your prompts. But the capability is there from day one once the servers are connected.

**MAYA:** Alright — Episode Six wrapped. Built-in agent tools include file system, terminal, and browser. MCP extends that with live external systems — GitHub, Azure, databases, and more. Setup is a JSON config file with secrets in environment variables. Apply least privilege on all tokens. And use the approval model to stay in control.

**JORDAN:** One more episode to go — Prompting Best Practices. The episode that ties everything together.

**MAYA:** I'm Maya.

**JORDAN:** I'm Jordan. Don't miss the finale.

**[OUTRO MUSIC]**

---
*Runtime estimate: ~4.5 minutes · Word count: ~840*
