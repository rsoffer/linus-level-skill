# Standards Ladder

Use this reference to decide which engineering standards are advisory, expected, or non-negotiable at the active Linus Level. Repository instructions can make any item stricter.

## Always

- Follow repo instructions, README files, docs, and local conventions.
- Ask before bypassing repo standards.
- Never edit vendored dependency code without explicit approval.
- Never run authoritative actions such as commit, push, deploy, publish, release, production/staging changes, schema-changing migrations, or external persistent-state changes unless the user explicitly asks in the current turn.
- Never imply full completion when work is partial.
- Do not knowingly introduce malicious, deceptive, or exfiltrating behavior.

## Linus 1.0-1.9

Non-negotiable:

- Follow higher-priority instructions and safety constraints.
- Do not break repo rules unless the user explicitly approves a scoped exception.
- Keep the work understandable enough that a human can continue from it.

Expected:

- Lead creatively and make strong taste calls.
- Optimize for exploration, speed, and a vivid first result.
- Prefer direct implementation over architecture.
- Accept duplication and rough edges when clearly prototype-local.
- Keep final notes short: what exists, how to try it, and the biggest known caveat.

## Linus 2.0-2.9

Non-negotiable:

- Avoid choices that create irreversible state, security risk, or repo-rule violations.
- Label intentional shortcuts if they could matter later.

Expected:

- Build a working sketch or proof of concept.
- Make reasonable assumptions without stopping for minor ambiguity.
- Use lightweight structure only where it keeps momentum.
- Do not over-test; use a quick smoke check or manual verification when appropriate.

## Linus 3.0-3.9

Non-negotiable:

- Preserve the core concept and obvious user flow.
- Avoid hard-to-undo choices in data shape, contracts, or security-sensitive areas.

Expected:

- Make the prototype coherent and modifiable.
- Add basic edge handling for likely demo-breaking cases.
- Follow local patterns when cheap, but do not let pattern archaeology stall the concept.

## Linus 4.0-4.9

Non-negotiable:

- Preserve the main product invariant.
- Do not duplicate business rules or state authority if that duplication is likely to survive into production.

Expected:

- Move fast while keeping the code easy to evolve.
- Start preferring shared helpers/constants when the same rule appears more than once.
- Note debt that should be cleaned up before production use.

## Linus 5.0+

Non-negotiable:

- Keep changes scoped to the request.
- Match existing style and naming before inventing patterns.
- Do not hide failures with silent catches or "best effort" behavior.
- Avoid new dependencies unless they clearly reduce risk or complexity.
- Prefer readable code over clever patches.

Expected:

- Read enough surrounding code to follow local patterns.
- Use clear names that communicate purpose without becoming noisy.
- Comments should explain why, tradeoffs, or non-obvious algorithms; avoid comments that merely narrate code.

## Linus 6.0+

Non-negotiable:

- Preserve public API/UI contracts unless an explicit migration is in scope.
- Treat client-visible fields, event names, route names, config names, and persisted data shapes as contracts.

Expected:

- Add or update tests for behavior changes.
- Prefer behavior-focused tests over implementation-mirroring tests.
- Keep UI expectations stable unless the user requested a product change.

## Linus 7.0+

Non-negotiable:

- Fix root causes rather than symptoms.
- No unrelated refactors in targeted fixes.
- DRY for business rules, authority decisions, API contracts, validation, scoring/ranking rules, permissions, cache keys, and UI state authority.
- Use named constants for thresholds, scoring weights, timeouts, limits, and domain magic numbers.
- Keep work small and reviewable.

Expected:

- Ask when ambiguity affects product behavior or long-term structure.
- Prefer existing helpers, services, constants, and source-of-truth modules.
- Avoid speculative future-proofing. Solve the current known problem.
- If refactoring is needed, keep it behavior-preserving and small.

## Linus 8.5+

Non-negotiable:

- Ask before product, business-rule, contract, architecture, persistence, auth, payments, analytics, privacy, security, deployment, or data-model decisions.
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

## Decimal Interpolation

Thresholds are anchors, not cliffs. For decimals:

- `.0-.2`: mostly follow the current anchor.
- `.3-.6`: blend current and next anchor based on task risk.
- `.7-.9`: pre-adopt the next anchor's non-negotiables when they are relevant and cheap, and pre-adopt them when risk is high.

When a standard is marked non-negotiable at an anchor, treat it as increasingly expected in the final 0.3 before that anchor. Example: at Linus 6.8, tests for behavior changes are not merely optional because Linus 7.0 is close and the work is already production-shaped.

## Sources To Internalize

- Google Engineering Practices: code health, small CLs, design/functionality/complexity/tests/names/comments/docs review.
- Google Testing guidance: test behavior, not implementation details.
- Azure API design and Semantic Versioning: APIs are contracts; avoid breaking clients without explicit versioning/migration.
- Twelve-Factor App: deploy-varying config belongs outside code.
- Martin Fowler/refactoring.com: refactoring is behavior-preserving restructuring in small steps.
- WaveWise AGENTS.md: fail-fast, contract stability, docs-in-PR, deterministic behavior, no hidden partial completion, no unrequested shims, no multi-path behavior without approval.
