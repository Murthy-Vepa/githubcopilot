# Session 3 — Podcast Script
## "The Art of Specifying Before You Code"
**Format:** Two hosts, conversational · Duration: ~18 minutes

---

### PRE-SHOW NOTES
- **Host A:** Engineering manager who introduced SpecKit to reduce rework
- **Host B:** Staff engineer who was the skeptic but is now the team's biggest advocate
- Key tension to maintain: "this feels like overhead" vs "this saves 3x more time than it costs"

---

### [00:00 – 01:00] COLD OPEN

**Host A:**  
"Tell me the last time a PR review ended with 'this doesn't match the requirements.'"

**Host B:**  
[laugh] "Last week."

**Host A:**  
"What happened?"

**Host B:**  
"I'd built what I *thought* we wanted. But the ticket said something slightly different. And in the conversation thread there were three different versions of what the acceptance criteria were. So I'd built the third version when the PM wanted the first version."

**Host A:**  
"How long had you spent on it?"

**Host B:**  
"Two days. Plus a half-day of rework. That was before we started using SpecKit."

**Host A:**  
"This is the problem SpecKit solves. I'm [Name], this is [Name]. Session 3 of the Copilot Mastery series — today we're talking about spec-driven development and why specifying *before* you code is the most important AI productivity unlock that nobody talks about."

---

### [01:00 – 04:30] THE COST OF VAGUE REQUIREMENTS

**Host B:**  
"I'll be honest — when you first showed me SpecKit I thought it was overkill. Another process layer. Another set of files to maintain. I was resistant."

**Host A:**  
"What changed your mind?"

**Host B:**  
"I watched an agent write the wrong feature. Perfectly. Beautiful code, great tests, exactly wrong. Because the prompt was ambiguous. 'Add a priority field to todos.' Does that mean a database column? A UI indicator? Filtering? Sorting? The agent picked one interpretation and ran with it."

**Host A:**  
"And that's the fundamental problem. LLMs are very good at filling in ambiguity with plausible-sounding answers. When a human reads a vague requirement, they ask questions. When an agent reads a vague requirement, it makes assumptions. Silently."

**Host B:**  
"SpecKit forces those questions to the surface before code is written."

**Host A:**  
"Exactly. The Planner agent's job is to interview you. It asks clarifying questions, documents the answers as requirements, and only hands off to the coder once every requirement has a concrete acceptance criterion."

---

### [04:30 – 09:00] THE THREE FILES

**Host B:**  
"Walk me through the file structure."

**Host A:**  
"Three files. `spec.md` — the what. `plan.md` — the how. `tasks.json` — the executable work list."

**Host B:**  
"spec.md first."

**Host A:**  
"Requirements numbered REQ-001, REQ-002. Each requirement has one or more acceptance criteria. Concrete ones. Not 'it works' — 'the response includes a Content-Disposition header with attachment; filename=todos-2025-07-08.csv'. Something you can test."

**Host B:**  
"The acceptance criterion is the test before the test."

**Host A:**  
"Right. If you can't write a test for it, it's not specific enough. There's also an out-of-scope section. This one is underrated. Explicitly saying 'we are NOT doing Excel format, we are NOT doing filtering' prevents scope creep mid-sprint."

**Host B:**  
"And then plan.md?"

**Host A:**  
"The implementation plan. Written by the Planner agent after you approve the spec. Every step is linked to one or more REQ-XXX IDs. If you run the Gate 2 quality check and any requirement isn't in the plan, you get a red flag before a single line of code is written."

**Host B:**  
"tasks.json is the most interesting one to me. Because this is what the Orchestrator actually reads."

**Host A:**  
"It's the machine-readable version of the plan. Each task has an ID, a title, which agent executes it, which requirements it satisfies, and what other tasks it depends on. The Orchestrator reads this file and dispatches agents in topological order — it figures out the dependency graph and parallelises where possible."

**Host B:**  
"So T-003 that depends on T-001 and T-002 won't start until both of those are done."

**Host A:**  
"Exactly. And if T-002 fails, the Orchestrator doesn't run T-003. It routes back to @coder with the failure context."

---

### [09:00 – 13:30] THE QUALITY GATES

**Host B:**  
"Four quality gates. Explain them."

**Host A:**  
"Gate 1 is the spec review. You — the human — read spec.md and decide if it's specific enough to implement. Are the acceptance criteria testable? Is the out-of-scope section honest? Are there open questions left unresolved?"

**Host B:**  
"This is where you catch scope problems."

**Host A:**  
"This is where a two-minute review saves you two days of rework. Gate 2 is automated — the Planner agent checks that every REQ-XXX in spec.md appears in at least one step in plan.md. If anything's missing, it flags it before you proceed."

**Host B:**  
"So requirements can't fall through the cracks."

**Host A:**  
"Gate 3 is tasks.json validation. The Orchestrator checks the dependency graph is valid — no circular dependencies, all referenced task IDs exist, all requirements have tasks. Gate 4 is the PR review. This is the final human gate. By the time a PR opens, code has been reviewed, security-checked, SRE-reviewed. Your job is business logic review, not bug hunting."

**Host B:**  
"That's the shift that I didn't appreciate until we ran the first full pipeline. The PR review became a 20-minute sign-off instead of a 2-hour deep dive. Because all the grunt work had already been done by agents."

---

### [13:30 – 17:00] CONSTITUTION.MD AND FEATURE INVENTORY

**Host A:**  
"Two more things. The constitution and feature inventory."

**Host B:**  
"constitution.md is interesting. It's not SpecKit per se, but it's what makes agents reliable across a whole project."

**Host A:**  
"It's the architectural foundation. One file that captures everything agents need to know: tech stack, folder conventions, naming rules, security requirements, forbidden patterns. Every agent reads it before acting. It's what prevents the coder from implementing something in a way that conflicts with what the reviewer expects."

**Host B:**  
"And once you ratify it — everyone on the team signs off — it becomes the source of truth. 'This is how we build software here.' No debates in PR review about style when it's already in the constitution."

**Host A:**  
"Feature inventory is the tool for understanding what you already have before you spec something new. Especially valuable for migrations and modernisation work. You ask Copilot to inventory all user-facing features as REQ-XXX requirements, and suddenly you have a structured spec of your existing system. Which you probably never had before."

**Host B:**  
"That's one of those things that sounds small but is huge in practice. We used feature inventory before our classic ASP migration project. In 30 minutes we had a complete requirements document for an application that had been running for 8 years with no documentation."

---

### [17:00 – 18:30] CLOSE & PREVIEW

**Host B:**  
"Homework this week: take a Jira ticket you're currently working on and run it through SpecKit. Just spec.md and plan.md — you don't have to execute it. See how many things you discover in the spec review that you would have had to figure out mid-implementation."

**Host A:**  
"Next week is the capstone. We're going full agent squad — orchestrator, planner, designer, coder, tester, reviewer, security, SRE, document writer. All of them, on a real feature, live. You'll see the rework loops, the human gates, the PR with all the agent reports attached."

**Host B:**  
"And you'll run your own capstone. The instructions are in the lab for session 4. If you ship it in the lab, you get the badge."

**Host A:**  
"See you at the finish line."

---

### SHOW NOTES TEMPLATE
```
Episode 3: The Art of Specifying Before You Code
Hosts: [Name A], [Name B]
Duration: ~18 min

Topics:
- Why vague requirements break AI-assisted development
- spec.md: REQ-XXX requirements with acceptance criteria
- plan.md: implementation steps linked to requirements
- tasks.json: executable agent work list with dependencies
- Four quality gates: spec, coverage, decomposition, completeness
- constitution.md: architectural foundation
- Feature inventory: cataloguing existing functionality

Resources:
- One-Pager: GitHub Copilot/Spec-First/one-pager.html
- SpecKit Guide: GitHub Copilot/Spec-First/speckit-guide.md
- Lab: GitHub Copilot/Spec-First/lab-exercises.md

Next episode: Agent Squad in Action (capstone)
```
