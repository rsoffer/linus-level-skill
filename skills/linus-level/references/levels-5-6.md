# Levels 5-6

Use this reference for Linus `5.0-6.9` product-development work.

## Linus 5.0+

Non-negotiable:

- Keep changes scoped to the request.
- Match existing style and naming before inventing patterns.
- Do not hide failures with silent catches or "best effort" behavior.
- Avoid new dependencies unless they clearly reduce risk or complexity.
- Prefer existing libraries, frameworks, state models, and design patterns before adding new ones.
- Prefer readable code over clever patches.
- Prefer cohesive, reviewable modules over large catch-all files.

Expected:

- Read enough surrounding code to follow local patterns.
- Use clear names that communicate purpose without becoming noisy.
- Split files when responsibilities diverge, ownership or tests become clearer, or a focused helper/module reduces cognitive load. Do not split purely for line count.
- Comments should explain why, tradeoffs, or non-obvious algorithms; avoid comments that merely narrate code.

## Linus 6.0+

Non-negotiable:

- Preserve public API/UI contracts unless an explicit migration is in scope.
- Treat client-visible fields, event names, route names, config names, and persisted data shapes as contracts.

Expected:

- Add or update tests for behavior changes.
- Prefer behavior-focused tests over implementation-mirroring tests.
- Keep UI expectations stable unless the user requested a product change.
