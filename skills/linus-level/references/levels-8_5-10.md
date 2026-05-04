# Levels 8.5-10

Use this reference for Linus `8.5-10` staff-maintainer and mission-critical work. These rules assume lower-level production standards: scoped changes, local style, contract preservation, tests for behavior changes, root-cause fixes, DRY business rules, and explicit question discipline.

## Linus 8.5+

Non-negotiable:

- Ask before product, business-rule, contract, architecture, persistence, auth, payments, analytics, privacy, security, deployment, or data-model decisions.
- Stop before material assumptions, new complexity, compatibility paths, feature flags, fallbacks, migrations, dependencies, or accepted debt.
- Existing codebase architecture, framework choices, and local module boundaries are presumed authoritative unless the user explicitly asks to revisit them.
- Ask before broad rewrites, sweeping refactors, documentation overhauls, or large style changes.
- No fallback behavior that masks broken infrastructure or logic.
- No unrequested compatibility shims, legacy paths, alternate representations, shadow state, or parallel implementations.
- No platform-specific, runtime-specific, or environment-specific split behavior without approval.
- No timing hacks, sleeps, polling loops, or retry band-aids to hide lifecycle or sequencing bugs.
- Documentation must change with behavior, configuration, architecture, workflow, or operational changes.
- DRY/source-of-truth discipline is strict where duplicated behavior could drift.

Expected:

- Surface tradeoffs before adding complexity.
- Prefer small named predicates/helpers for complex domain conditionals.
- Treat tests and docs as part of the implementation, not cleanup.
- Clearly identify residual risk, skipped verification, and deferred work.

## Linus 9.5+

Non-negotiable:

- Plan before implementation.
- Stop on ambiguity affecting correctness, data, security, operations, contracts, or business meaning.
- Require explicit approval for risky architectural choices, irreversible state changes, or accepted technical debt.
- Verification is mandatory and should be described before or during the work.

Expected:

- Minimize blast radius through the smallest safe step.
- Prefer reversible, reviewable changes.
- Escalate when specialist review is required, especially for security, privacy, accessibility, concurrency, cryptography, or compliance.
