# Episode 05 — AI-Assisted Engineering vs Spec-Driven: The Decision Framework
## AI-Assisted Engineering & Spec-Driven Development Podcast Series · GitHub Copilot Mastery

**Format:** 2 hosts · conversational · ~4.5 minutes
**Voices:** Jordan (male, US English) · Maya (female, US English)
**Audience:** Developers wanting a clear, practical framework for choosing the right mode

---

**[INTRO MUSIC FADE IN, THEN UNDER]**

**JORDAN:** Hey, welcome back. I'm Jordan.

**MAYA:** And I'm Maya. This is the episode the series has been building toward. We've covered AI-assisted development, spec-driven development, plans, and quality gates. Now — how do you *choose*? How do you stand in front of a new task and confidently decide which mode is right?

**JORDAN:** And I want to be upfront: there's no rule that's correct 100% of the time. But there's a really solid decision framework that gets it right the vast majority of the time, and that's what we're sharing today.

**MAYA:** Let's start with the three questions. Because I think these are the cleanest version of the framework.

**JORDAN:** Three questions. Ask them in order. Question one: will this code go to production? If yes — lean toward spec-first. If no — vibe is probably fine.

**MAYA:** Question two?

**JORDAN:** Will someone other than me need to understand or maintain this code? If yes — spec-first. If no — vibe may be fine.

**MAYA:** Question three?

**JORDAN:** Does this feature touch security, compliance, data privacy, or audit requirements? If yes — spec-first, full stop. No exceptions.

**MAYA:** So if any of those three answers is yes — spec-first. If all three answers are no — vibe away.

**JORDAN:** That's the framework in its simplest form. And it maps really cleanly to the kinds of work we see at MetLife. Scripts for personal productivity — all three are no. Vibe it. A new API endpoint that processes policyholder data — all three are yes. Spec-first.

**MAYA:** Let me add the time dimension, because I think it's useful. How long will this code need to exist?

**JORDAN:** Great addition. Throwaway code — scripts, demos, spikes — lives for hours or days. Vibe. Feature code lives for months or years. Spec-first. The longer the lifespan, the more the upfront investment in clarity pays off.

**MAYA:** Okay — let's talk about mixed scenarios. Because not everything is cleanly on one end or the other.

**JORDAN:** Right, and this is where judgment comes in. Say you're building a new reporting dashboard. It's going to production, it'll be maintained, but it doesn't handle sensitive data and it's relatively low risk. Where does that land?

**MAYA:** I'd say — lightweight spec. Not a full formal spec-kit workflow, but at least a spec.md with the core requirements and non-goals. Enough structure to keep the implementation on track, but without the full quality gate ceremony for a lower-risk feature.

**JORDAN:** Exactly. The spectrum has a middle — and that middle is a mini-spec. Five to ten requirements. A rough plan. No formal gate tracking but a quick human review before coding starts. You get most of the benefit with a fraction of the overhead.

**MAYA:** The mini-spec is the underrated option. People sometimes feel like they have to choose between total structure and total freedom.

**JORDAN:** The gradient is the whole point of thinking of it as a spectrum. Most of your work lands somewhere in the middle and benefits from some deliberate structure — not maximum structure.

**MAYA:** Let's do some rapid-fire scenarios. I'll name a task, you call it.

**JORDAN:** Let's go.

**MAYA:** Writing a one-time script to migrate data between two database tables.

**JORDAN:** Depends. If it's migrating production data — spec-first, because data integrity is a compliance concern. If it's migrating test data in a dev environment — vibe it.

**MAYA:** Good call on the nuance. Okay — building a new REST endpoint for a public-facing API that will be documented and used by partners.

**JORDAN:** Spec-first. External partners means a contract. If you change behavior later, you're breaking someone else's integration. Requirements need to be locked before code is written.

**MAYA:** Learning a new testing framework.

**JORDAN:** Vibe. Completely. Build things, break things, understand the framework. That's the whole point.

**MAYA:** Adding a new compliance-required audit log to an existing service.

**JORDAN:** Full spec-first. Compliance is the third question — automatic yes. You need to define *exactly* what gets logged, in what format, with what retention policy, and verify against each requirement.

**MAYA:** Building a quick prototype to demo an idea to a product manager.

**JORDAN:** Vibe it. The demo will either be discarded or redesigned. Speed is the only metric. Just be honest with the product manager that it's a prototype, not production code.

**MAYA:** And finally — adding a feature to an existing microservice that two other teams depend on.

**JORDAN:** Spec-first. Other teams depending on your service means your changes have blast radius. The spec and the non-goals section specifically help you define what you're not breaking.

**MAYA:** Those scenarios cover probably 80% of what developers face day-to-day.

**JORDAN:** And the underlying logic is consistent: risk, lifespan, audience, and compliance requirements. Those four factors, weighed together, tell you where on the spectrum to land.

**MAYA:** Let me address one more thing — the cost misconception. A lot of developers resist spec-first because they think it's slower.

**JORDAN:** And it is slower to get to the *first line of code*. But that's the wrong metric. The right metric is time from idea to *correct, working, maintainable code in production*. And on that metric, spec-first is almost always faster for production features. You spend 45 minutes on a spec and save two days of rework and confusion.

**MAYA:** The spec is an investment with a measurable return.

**JORDAN:** And the smaller the feature, the smaller the spec. A five-requirement feature needs maybe 20 minutes of spec time. That's not overhead — that's professional practice.

**MAYA:** The habit builds quickly too. After a few specs, the structure becomes second nature. The questions you ask in a spec are the questions you should have been asking anyway.

**JORDAN:** "What are we actually building? What does success look like? What are we explicitly *not* doing?" Those are the questions that any engineer should be asking before writing code. The spec just makes the answers written and shared.

**MAYA:** Alright — Episode Five done. The three-question decision framework: production code, team maintenance, security or compliance. Any yes — lean spec-first. All no — vibe is fine. Add the time dimension: long-lived code needs more structure. Use mini-specs for the middle ground. And reframe the cost: the right metric is time to correct, working, maintainable production code — and spec-first wins that race for production features.

**JORDAN:** One episode left — the GitHub Spec Kit. The tooling that automates everything we've described in the last four episodes.

**MAYA:** I'm Maya.

**JORDAN:** I'm Jordan. Don't miss the finale.

**[OUTRO MUSIC]**

---
*Runtime estimate: ~5 minutes · Word count: ~990*
