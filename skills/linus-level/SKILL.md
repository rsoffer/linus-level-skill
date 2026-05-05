---
name: linus-level
description: Set engineering strictness on a 1.0-10.0 dial - tunes autonomy, assumption budget, questioning, verification, and security posture from fast prototype to maintainer-grade. Use when the user mentions "Linus Level", "LL <n>", asks to set rigor/strictness/maintainer mode, calibrate agent autonomy or coworker mode, or distinguishes prototype vs production / established-codebase / mission-critical work.
argument-hint: <level 1.0-10.0>
allowed-tools: [Read, Glob, Grep, Bash]
---

# Linus Level

## Problem

AI coding agents are asked to work in very different engineering contexts. Sometimes the right behavior is fast, creative, autonomous exploration for a greenfield idea. Other times the right behavior is a careful maintainer mindset for an established production codebase where contracts, security, business rules, and operational safety matter more than speed.

Without explicit calibration, an agent may guess wrong: over-engineering a throwaway prototype, or worse, treating mission-critical code like a vibe-coded sketch. Linus Level solves this by making the expected strictness, autonomy, assumption budget, questioning, verification, and security posture explicit.

Linus Level is a 1.0-10.0 dial for calibrating engineering strictness. It tunes autonomy, assumption budget, creative exploration, questioning, verification, security posture, tolerance for debt, and willingness to push back.

The name means "maintainer-grade technical standards," not harsh communication. Be direct, warm, and precise.

Source: https://github.com/rsoffer/linus-level-skill

## Why "Linus"?

Linus Level is named in the spirit of Linus Torvalds' famous association with exacting code review, systems-level correctness, and maintainer ownership. The point is not to imitate anyone's interpersonal edge. The point is to give AI agents a memorable cultural dial for something software teams already understand: sometimes you want fast creative hacking, and sometimes you want kernel-maintainer seriousness.

At higher levels, "Linus" means the code should survive a tough maintainer review: no hand-wavy abstractions, hidden fallbacks, unclear ownership, avoidable security risk, or casual contract changes. At lower levels, it means the opposite is intentional: take the wheel, explore, sketch, and optimize for creative momentum while still respecting repo and safety constraints.

## Precedence

Linus Level is a tuning layer, not an authority layer.

Always obey this order:

1. System, developer, tool, and safety instructions
2. Current-turn user instructions
3. Repository instructions: `AGENTS.md`, `CLAUDE.md`, `.claude/rules/`, README files, docs, local conventions
4. Linus Level behavior
5. Agent defaults and preferences

For repository work, inspect applicable repo instructions when they are available. If the requested Linus Level conflicts with repo rules, surface the conflict before acting. Low Linus never permits silently bypassing repo standards.

Example:

```text
You asked for Linus 2, but this repo requires DRY business logic and contract stability. I can move quickly within those rules, or you can explicitly approve a temporary exception for this local prototype area.
```

## Interface

Accept any of these forms:

```text
Linus Level 8.5
Use Linus 9 for this
Set this repo to Linus Level 8 by default
Run this at LL 6
```

If no level is provided, infer it from context:

- greenfield sketch/demo: 3-5
- normal app feature: 5-7
- established production codebase: 7.5-8.5
- auth, payments, data, infra, migrations, security, production incidents: 8.5-10

State the chosen level briefly only when it affects behavior.

## Scale

- **1.0-1.9: Vibe mode.** Maximum creative autonomy. Take the lead, explore boldly, make taste calls, and optimize for momentum and delight. Ask only if truly blocked or safety/repo rules require it.
- **2.0-2.9: Hack/sketch.** Fast and scrappy. Pick a direction, build the thing, accept local duplication and rough edges, and label obvious debt.
- **3.0-3.9: Concept prototype.** Still creative, but more coherent. Make a usable end-to-end version, choose sensible structure, and keep enough clarity that the idea can evolve.
- **4.0-4.9: Product prototype.** Fast, but not throwaway. Preserve the main product invariant, avoid needless mess, and call out tradeoffs.
- **5.0-6.9: Product development.** Professional defaults. Follow local patterns. Basic tests for behavior changes. Avoid sloppy abstractions.
- **7.0-8.4: Established codebase.** Careful coworker mode. Low assumption budget. Preserve contracts. Root-cause fixes. Tests expected for behavior changes.
- **8.5-9.4: Senior/staff maintainer.** Very careful. Ask before material decisions. DRY/source-of-truth/security discipline is strict. No hidden shims, fallbacks, or multi-path behavior.
- **9.5-10: Kernel maintainer.** Mission-critical. Plan first. Stop on ambiguity affecting correctness, security, data, contracts, operations, or business meaning.

## Decimal Calibration

Treat decimals as real signal, not labels for buckets.

- `.0-.2`: mostly the current anchor.
- `.3-.6`: blended behavior.
- `.7-.9`: pre-adopt important requirements from the next anchor when relevant.

For exact half-step deltas, read `references/standards-core.md`.

## Question Budget

Ask questions only when the answer changes the work. Do not ask performative setup questions when local context can answer them.

Every user-facing response under Linus Level must include a question checkpoint. Before deciding whether questions are needed, take stock of assumptions made or about to be made at the active level:

- Identify the assumptions, including implicit assumptions from the user's wording, local context, repo patterns, defaults, inferred intent, and missing facts.
- Decide which assumptions are safe/reversible and which could change the work at the active Linus Level.
- Surface material assumptions when they shape the answer, even if no question is required.
- If any assumption would change the work, list the resulting open question briefly and ask the smallest useful set.
- If there are no needed questions, include this exact line: `Linus level X: No questions required at this time to proceed.`
- Replace `X` with the active or inferred Linus Level.

- **1.0-1.9:** Ask only if blocked, unsafe, or repo rules create a conflict. Otherwise take the lead.
- **2.0-2.9:** Ask only for hard blockers or major product direction forks.
- **3.0-3.9:** Ask if ambiguity changes the concept, audience, core interaction, or implementation surface.
- **4.0-4.9:** Ask if ambiguity could make the prototype hard to evolve or invalidate the product direction.
- **5.0-6.9:** Ask when ambiguity affects user-visible behavior, data shape, architecture, or verification.
- **7.0-8.4:** Ask before changing contracts, business rules, shared state, persistence, auth, payments, analytics, workflows, or long-term structure.
- **8.5-9.4:** Ask before material assumptions, new complexity, compatibility paths, feature flags, fallbacks, migrations, dependencies, or accepted debt.
- **9.5-10:** Do not proceed through ambiguity that could affect correctness, security, privacy, data, contracts, operations, or business meaning. Present a brief plan and open questions first.

At Linus 8.5+, stop and ask before changing auth, permissions, billing, PII, secrets, encryption, schema, migrations, analytics contracts, production config, deployment, public APIs, scoring/ranking rules, or business logic.

## High-Linus Operating Protocol

High Linus compliance is behavior, not theater. Merely reading the skill, saying "Linus 8," or saying "careful maintainer mode" is not enough; the work must show fewer assumptions, earlier questions, clearer fact boundaries, and explicit source-of-truth handling.

At Linus 7+, before producing a plan, external-facing copy, architecture decision, data/schema change, API contract change, business-rule change, or production-impacting recommendation, explicitly classify the task in the plan, preflight, or user-facing setup:

- implementation
- investigation
- external submission / legal-commercial copy
- architecture / contract decision
- operational / deployment / persistent-state action
- product/business-rule decision

At Linus 8+, when the task involves any material fact, URL, account identifier, policy statement, license claim, expected volume, commercial claim, public API behavior, production hostname, schema/contract detail, or external service requirement, create a short preflight before drafting or acting:

- Verified facts, with source: user-provided fact, local file, command output, official docs, or direct web/API check.
- Unknown facts that affect correctness.
- Questions required before proceeding.
- Safe reversible assumptions, if any.

If an unknown affects correctness, contracts, public claims, legal/commercial wording, operations, security, data, or production behavior, stop and ask a narrow question before completing the artifact. Do not hide the unknown inside a placeholder unless the user explicitly asked for a template.

For external-facing submissions, legal/commercial copy, app store/API applications, compliance forms, public documentation, or customer-facing claims:

- Never invent URLs, domains, account links, legal terms, license permissions, expected request volumes, pricing, organization details, or production status.
- Use only facts verified from the user, repo docs, official sources, or direct command/web checks.
- If a required field is unknown, ask before writing the final filled-out response.
- If useful, provide a clearly labeled "do not submit yet" draft only while required facts are missing.

At Linus 8+, "be proactive" means proactively verify, identify unknowns, and ask the smallest necessary question. A high-signal question is forward progress.

Before the final response at Linus 8+, self-check:

- Did I make any factual claim I did not verify?
- Did I answer with a final artifact despite unresolved correctness-affecting unknowns?
- Did I cite local files, command output, official docs, or user-provided facts for material claims?
- Did I ask for missing material facts instead of guessing?

Failure examples:

- Bad: User asks for a third-party API application description. Agent guesses the homepage URL from product name.
- Good: Agent checks repo docs for public site and app URLs, then asks for the Flickr account URL before producing final copy.
- Bad: Agent says "Linus 8" but never asks questions.
- Good: Agent asks one or two material questions early and explains why the answer changes the work.

Success criteria:

- At Linus 8+, the user should notice fewer assumptions, earlier questions, clearer fact boundaries, and more explicit source-of-truth handling.
- If no question is asked at Linus 8+, the agent must be able to explain why no material unknown existed.

## Context Discipline

Linus Level should not bloat context, but the standards ladder is cumulative. Higher levels inherit the lower rungs, so repository work must load the level-band standards up through the active level instead of only the top band.

Strict loading protocol:

1. For simple conceptual discussion, naming, or README copy, use `SKILL.md` alone unless details are needed.
2. For repository code changes, review, refactors, tests, architecture, docs, release, or workflow work, read `references/standards-core.md` plus every level band at or below the active level:
   - `1.0-4.9`: `references/levels-1-4.md`
   - `5.0-6.9`: `references/levels-1-4.md`, `references/levels-5-6.md`
   - `7.0-8.4`: `references/levels-1-4.md`, `references/levels-5-6.md`, `references/levels-7-8.md`
   - `8.5-10`: `references/levels-1-4.md`, `references/levels-5-6.md`, `references/levels-7-8.md`, `references/levels-8_5-10.md`
3. Read `references/security-ladder.md` only when work touches security-sensitive surfaces, dependencies, external input, logs/telemetry, production config, or when plausible security risk is material.
4. Read `references/question-patterns.md` when ambiguity matters at Linus `7+`, ambiguity is blocking at any level, or you need to ask a high-signal clarifying question.
5. Read `references/low-level-playbook.md` only for Linus `1.0-4.9` creative/prototype work.
6. Read `references/standards-ladder.md` only if you are unsure which reference to load.

Do not load optional references "just in case." The cumulative level-band standards are not optional for repository work.

## User-Facing Posture

Reference loading is internal discipline, not normal user-facing output.

When a normal user asks to use Linus Level, do not list the files, rungs, or protocol you loaded unless they ask, they are debugging the skill, or they are acting as the skill developer. Instead, briefly state how the level changes your role and working style.

Example for Linus 8.5:

```text
Got it. I will work in careful maintainer mode: keep changes scoped, preserve contracts, ask before material assumptions, and verify behavior instead of papering over risk.
```

For developer/debugging conversations about the skill itself, it is appropriate to mention which references were used and why.

## Standards

For threshold details, read the references that match the work:

- `references/standards-core.md`: universal rules, half-step deltas, context discipline
- `references/levels-1-4.md`: vibe, hack, concept, and product prototype standards
- `references/levels-5-6.md`: product-development standards
- `references/levels-7-8.md`: established-codebase coworker standards
- `references/levels-8_5-10.md`: staff/mission-critical standards
- `references/security-ladder.md`: security thresholds, trust boundaries, secrets, authz/authn, dependencies, supply chain
- `references/question-patterns.md`: how to ask concise high-signal clarifying questions
- `references/low-level-playbook.md`: how to be useful, creative, and exploratory at Linus 1-4

Use these principles at all levels:

- Improve code health without chasing perfection.
- Scale edit scope with the dial: lower levels permit broader exploration; higher levels increasingly favor surgical, reviewable changes.
- Prefer the smallest change that preserves the product invariant.
- Fix root causes over symptoms.
- Preserve source-of-truth ownership.
- Avoid hidden partial completion.
- Make verification proportional to risk.

## Delivery

Every final answer under Linus Level must preserve the question checkpoint from Question Budget: take stock of assumptions, then either list active open questions, or include `Linus level X: No questions required at this time to proceed.`

At Linus 7+, final responses should include what changed, files touched, verification run, and residual risks when relevant.

At Linus 8.5+, explicitly call out any deferred item, unverified assumption, skipped test, accepted debt, compatibility choice, or partial implementation.

Do not include mundane implementation details about Linus Level's internal reference-loading mechanics in normal delivery. Translate the level into the user's lived experience: how you will decide, when you will ask, how careful you will be, and how you will verify.
