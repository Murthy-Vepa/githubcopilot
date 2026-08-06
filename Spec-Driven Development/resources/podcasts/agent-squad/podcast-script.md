# Session 4 — Podcast Script
## "The Day We Let the Agents Ship It"
**Format:** Two hosts, conversational · Duration: ~22 minutes

---

### PRE-SHOW NOTES
- **Host A:** Principal engineer who ran the first full agent squad pipeline in production
- **Host B:** The skeptic who's now running weekly squad pipelines
- This is the "payoff" episode — be concrete about what the pipeline actually feels like
- OK to be honest about what was rough / where it surprised them

---

### [00:00 – 01:30] COLD OPEN

**Host A:**  
"Let me tell you about the first time I fully handed off a feature to the agent squad. I mean fully. No code written by me. Just a description of what I wanted, a review of the spec, a PR approval, and a merge."

**Host B:**  
"When was this?"

**Host A:**  
"About three months ago. CSV export feature for the TodoApp. Took me 40 minutes. The pipeline took another 25 minutes. I was in a meeting. I got a Slack from GitHub: 'PR opened.' I reviewed it, merged it."

**Host B:**  
"How long would that have taken you manually?"

**Host A:**  
"Half a day. Easy. Maybe a full day if I'd had to set up tests and documentation too."

**Host B:**  
"I was jealous. So I tried it on the next ticket. It went sideways."

**Host A:**  
[laugh] "Tell them."

**Host B:**  
"I gave the orchestrator a two-line description with no acceptance criteria. The coder implemented something completely reasonable — just not what I meant. So I learned what you'd already learned. The planner isn't optional."

**Host A:**  
"Welcome to the final session. I'm [Name], this is [Name]. Session 4 of the Copilot Mastery series. Today we go fully live on the agent squad. What it does, how to run it, what breaks, and the 90-minute capstone where you ship your own feature."

---

### [01:30 – 06:00] THE TEN AGENTS

**Host B:**  
"Ten agents. Let's go through them."

**Host A:**  
"Orchestrator. This is the conductor. It reads tasks.json, figures out the dependency graph, and dispatches the right agent at the right time. It never writes code. It's traffic control."

**Host B:**  
"Model?"

**Host A:**  
"Claude Sonnet 4.6. It's the control plane — complex sequencing and gate management needs a capable model."

**Host B:**  
"Planner — we covered in episode 3. Turns ambiguous requirements into spec.md, plan.md, tasks.json. GPT-5.4 and Claude Sonnet 4.6 because it needs to reason about requirements."

**Host A:**  
"Designer. Invoked by the orchestrator only when the spec has UI-related requirements. Produces wireframe guidance, component recommendations, accessibility notes. Doesn't write final code — it briefs the coder."

**Host B:**  
"Then the pipeline splits and runs in sequence: Coder → Tester → Reviewer → Security → SRE → Document Writer."

**Host A:**  
"Coder is GPT-5.4. Reads constitution.md before touching anything. Implements exactly what the task says — no more, no less. Confirms the build passes. Reports what files changed."

**Host B:**  
"Tester generates the tests. Every test is tagged with the REQ-XXX it validates. Coverage threshold is 85% on changed files. If it falls short, the orchestrator routes back to the tester."

**Host A:**  
"Then Reviewer. This is Claude Sonnet 4.6. Full code review against the constitution and the spec. Produces PASS or FAIL with line-level findings."

**Host B:**  
"Security Review is the one that catches things humans miss. Last week it flagged a potential SQL injection in code that had been in our repo for a year. Not in the new code — in an old method the coder had called. Worth its weight in gold."

**Host A:**  
"SRE and Observability checks logging, health checks, error handling. It generates a runbook snippet that gets attached to the PR. Brilliant for on-call engineers."

**Host B:**  
"And Document Writer updates the API reference, user guide, and CHANGELOG. That one alone saves me 20 minutes per PR."

---

### [06:00 – 10:30] REWORK LOOPS

**Host B:**  
"The rework loops are what make the pipeline feel like it has intelligence."

**Host A:**  
"Walk me through what happens when security fails."

**Host B:**  
"Security Review flags an issue — let's say a HIGH severity injection risk. It writes a structured finding: severity, location down to the file and line, description of the risk, suggested remediation. Passes this back to the Orchestrator."

**Host A:**  
"Orchestrator routes it back to Coder with that finding as context. Coder fixes it. Doesn't re-run the whole pipeline — goes straight back to Security Review with just the changed file."

**Host B:**  
"And if the coder fixes it wrong?"

**Host A:**  
"Security flags it again. Orchestrator routes back again. If it fails a third time, the orchestrator escalates to the human — you. With a summary of what was tried and why it didn't work."

**Host B:**  
"In practice, does it ever take more than one rework loop?"

**Host A:**  
"Rarely. The findings are specific enough that the first fix usually resolves them. The worst case I've seen was a complex CSRF issue that took two iterations. But we're talking 10 minutes, not two days."

**Host B:**  
"The thing that surprised me most about the rework loops is that they're silent. You don't see them. The orchestrator handles it. You see the final PR, which has a section in the description: 'Agent rework loops: 1 — security finding resolved.' You know it happened, but you didn't have to manage it."

---

### [10:30 – 15:00] THE HUMAN GATES

**Host A:**  
"Two human gates. That's it."

**Host B:**  
"Gate 1 is after the spec. Before a single line of code is written, you read the spec.md and say yes or no. Does this capture what I want? Is anything missing? Are the acceptance criteria testable?"

**Host A:**  
"This is where most of the value is. A two-minute spec review saves hours of rework. And the spec is written by the planner, which has asked you clarifying questions. So by the time you're reviewing spec.md, you've already thought about the edge cases."

**Host B:**  
"Gate 2 is the PR review. By this point the code has been reviewed by the Reviewer agent, security-checked, SRE-checked, and documented. Your job as the human is business logic review. Does it do what the spec says? Does it feel right?"

**Host A:**  
"The PR description has all the agent reports attached. You're not hunting for context — it's all right there. Reviewer: PASS. Security: PASS, 1 medium advisory. SRE: PASS, runbook attached. Docs: updated."

**Host B:**  
"What do you do when the PR looks wrong at Gate 2?"

**Host A:**  
"You request changes like any normal PR. The orchestrator sees your review comments, routes the relevant items back to the appropriate agents, and re-opens the PR when they're resolved."

---

### [15:00 – 19:00] WHAT STILL REQUIRES HUMANS

**Host B:**  
"Let's be honest about the limitations. What does the agent squad do badly?"

**Host A:**  
"Architecture decisions. If you ask the squad to 'add caching', it'll implement Redis the way it's seen Redis implemented before. But choosing Redis versus in-memory cache versus a CDN — that's a human decision that needs to be in the spec before the agents touch it."

**Host B:**  
"Performance optimisation. The tester checks correctness and coverage. It doesn't load test. It doesn't profile. If you care about P99 latency, that's a separate concern."

**Host A:**  
"Novel problem domains. If you're implementing something the training data doesn't cover well — a proprietary financial algorithm, a very specific regulatory compliance requirement — the planner may produce a spec that sounds plausible but misses domain-specific nuances. You need a human SME reviewing that spec."

**Host B:**  
"The constitution helps here. The more you put into constitution.md, the better the agents stay in their lane. But the constitution can't capture everything."

**Host A:**  
"The summary: the agent squad is excellent at building well-defined features in established codebases with clear conventions. It's not a replacement for architectural thinking or domain expertise."

---

### [19:00 – 21:00] THE CAPSTONE

**Host B:**  
"Today's lab is the capstone. 90 minutes. You add a Priority field to the TodoApp — Low, Medium, High — with a visual badge and a filter. Full pipeline. No manual coding."

**Host A:**  
"The instructions are in `GitHub Copilot/Agent Squad/lab-capstone.md`. It walks you through every phase: constitution check, planner invocation, spec review, plan review, pipeline execution, PR review, merge."

**Host B:**  
"And if you ship it — if you merge a PR that was produced entirely by the agent squad — you get the badge."

**Host A:**  
"Post your merged PR in `#copilot-training`. Screenshot of the PR, screenshot of the Priority badge on the Index page. The team will badge you within 24 hours."

**Host B:**  
"And the reflection questions in the capstone doc — please answer those. The answers are feeding into how we evolve this training programme. What surprised you? Where did the pipeline save you time? Where did it feel like overhead? That feedback matters."

---

### [21:00 – 22:00] CLOSE

**Host A:**  
"That's the four-session Copilot Mastery programme. From ghost text completions to autonomous agent squads in four weeks. I hope it's changed how you think about what AI-assisted development actually means."

**Host B:**  
"The through-line across all four sessions: the quality of what you get out is proportional to the quality of the context you put in. Good instructions files. Good prompt templates. Precise specs. Clear constitution. Invest in those, and the tools reward you exponentially."

**Host A:**  
"Links to everything — all four one-pagers, the cheat sheet, prompt library, SpecKit guide, agent roles guide, all four labs — are in the course hub. Thank you for taking this seriously. See you in the channels."

---

### SHOW NOTES TEMPLATE
```
Episode 4: The Day We Let the Agents Ship It
Hosts: [Name A], [Name B]
Duration: ~22 min

Topics:
- All 10 agents: role, model, ownership
- Rework loops: automatic routing on failures
- Two human gates: spec approval, PR approval
- Limitations: what agents do badly
- The 90-minute capstone challenge

Resources:
- One-Pager: GitHub Copilot/Agent Squad/one-pager.html
- Agent Roles Guide: GitHub Copilot/Agent Squad/agent-roles-guide.md
- Capstone Lab: GitHub Copilot/Agent Squad/lab-capstone.md
- Course Hub: GitHub Copilot/index.html

Badge: Merge the capstone PR to earn Agent Squad Certified
```
