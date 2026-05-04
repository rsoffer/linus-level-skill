# Standards Core

Use this reference for universal Linus Level rules, decimal behavior, and context discipline. Repository instructions can make any item stricter.

## Always

- Follow repo instructions, including `AGENTS.md`, `CLAUDE.md`, `.claude/rules/`, README files, docs, and local conventions.
- Ask before bypassing repo standards.
- Never edit vendored dependency code without explicit approval.
- Never run authoritative actions such as commit, push, deploy, publish, release, production/staging changes, schema-changing migrations, or external persistent-state changes unless the user explicitly asks in the current turn.
- Never imply full completion when work is partial.
- Do not knowingly introduce malicious, deceptive, or exfiltrating behavior.
- Scale edit scope with Linus Level: lower levels permit broader exploration; higher levels increasingly favor surgical, reviewable changes.

## Context Discipline

- Load only references that change the work.
- Prefer the active level band over cumulative reading.
- Summarize long references mentally; do not paste them back to the user.
- If the needed rule is in `SKILL.md`, do not load a reference for confirmation.
- If unsure which level band applies, use `standards-ladder.md` as the index.

## Decimal Interpolation

Thresholds are anchors, not cliffs.

- `.0-.2`: mostly follow the current anchor.
- `.3-.6`: blend current and next anchor based on task risk.
- `.7-.9`: pre-adopt the next anchor's most important requirements when they materially affect the task.

When a standard becomes non-negotiable at an anchor, treat it as increasingly expected in the final `0.3` before that anchor. Example: at Linus `6.8`, tests for behavior changes are not merely optional because Linus `7.0` is close and the work is already production-shaped.

## Half-Step Deltas

Apply every half-step at or below the active level. Between half-steps, use the lower half-step as the floor and lean toward the next one when task risk is high.

| Level | Additional behavior |
|---:|---|
| `1.0` | Max creative autonomy; take the lead and optimize for momentum. |
| `1.5` | Keep the result coherent enough for a human to continue from. |
| `2.0` | Build the working sketch before polishing. |
| `2.5` | Avoid shortcuts that will be painful tomorrow. |
| `3.0` | Make the core interaction coherent and demoable. |
| `3.5` | Use lightweight structure so the prototype can evolve. |
| `4.0` | Preserve the main product invariant. |
| `4.5` | Start honoring standards that would block safe continuation: contracts, obvious state authority, and repo conventions. |
| `5.0` | Keep changes scoped, match local style, and avoid silent failure hiding. |
| `5.5` | Prefer existing helpers/components before adding new patterns. |
| `6.0` | Preserve public API/UI contracts unless explicitly migrating. |
| `6.5` | Treat tests for behavior changes as expected. |
| `7.0` | Ask serious questions before changing product behavior, contracts, shared state, persistence, auth, payments, analytics, workflows, or architecture. |
| `7.5` | Ask before introducing new libraries, frameworks, paradigms, or cross-cutting abstractions in an existing codebase. |
| `8.0` | Surface tradeoffs before choosing between materially different fixes or touching shared/core surfaces. |
| `8.5` | Stop before material assumptions, compatibility paths, feature flags, fallbacks, migrations, dependencies, or accepted debt; ask before broad rewrites, sweeping refactors, documentation overhauls, or large style changes. |
| `9.0` | Produce an explicit verification plan for risky behavior, data, security, or operational changes. |
| `9.5` | Plan first; hard stop on unresolved ambiguity affecting correctness, security, data, operations, contracts, or business meaning. |
| `10.0` | Require the smallest safe, reviewable step; escalate for specialist review when needed. |
