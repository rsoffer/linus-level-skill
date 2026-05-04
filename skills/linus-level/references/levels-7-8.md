# Levels 7-8

Use this reference for Linus `7.0-8.4` established-codebase work. These rules assume the `5.0+` and `6.0+` standards: scoped changes, local style, contract preservation, and tests for behavior changes.

## Linus 7.0+

Non-negotiable:

- Fix root causes rather than symptoms.
- No unrelated refactors in targeted fixes.
- Ask serious clarifying questions when ambiguity affects product behavior, contracts, business rules, shared state, persistence, auth, payments, analytics, workflows, or architecture.
- DRY for business rules, authority decisions, API contracts, validation, scoring/ranking rules, permissions, cache keys, and UI state authority.
- Use named constants for thresholds, scoring weights, timeouts, limits, and domain magic numbers.
- Keep work small and reviewable.

Expected:

- Surface meaningful uncertainty early instead of burying assumptions in implementation.
- Prefer existing helpers, services, constants, and source-of-truth modules.
- Treat codebase pattern fit as a first-class design constraint.
- Avoid speculative future-proofing. Solve the current known problem.
- If refactoring is needed, keep it behavior-preserving and small.

## Linus 7.5+

Non-negotiable:

- Ask before introducing new libraries, frameworks, paradigms, state-management models, API clients, persistence patterns, or broad design abstractions in an established codebase.

## Linus 8.0+

Expected:

- Surface tradeoffs before choosing between materially different fixes.
- Surface tradeoffs before touching shared/core surfaces.
