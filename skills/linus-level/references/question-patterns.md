# Question Patterns

Use these patterns to ask fewer, better questions as Linus Level rises.

## Principles

- Ask only when the answer changes the work.
- Prefer one or two precise questions over a broad questionnaire.
- State why the question matters.
- If local context answers it, use local context.
- Offer a default only when it is safe and reversible.
- At high Linus Levels, do not bury a material assumption in the final response after already acting.

## Good Questions

Business rule:

```text
Before I change this: should this ranking rule apply only to Session Finder, or is it a shared forecast-quality rule used elsewhere? That determines whether I update a local filter or the shared scoring source of truth.
```

Contract change:

```text
This would remove a response field the UI may depend on. Do you want an explicit contract migration, or should I preserve the key and change only the internal derivation?
```

Security:

```text
This endpoint can be called by admins today. Should the new action require the same admin role, or a narrower permission? I do not want to guess on authorization semantics.
```

Architecture:

```text
There are two viable fixes: centralize the rule in the shared service, or keep this screen-specific. Centralizing is safer for drift but touches more callers. Which direction do you want?
```

Repo-rule conflict:

```text
You asked for Linus 2, but this repo requires docs with workflow/config changes. Should I keep that repo standard while moving quickly, or are you explicitly approving a temporary exception?
```

## Weak Questions To Avoid

- "What framework is this?" when the repo already shows it.
- "Should I add tests?" at Linus 7+ when behavior changed and repo rules expect tests.
- "Do you want clean code?" because the answer is not actionable.
- Long intake forms before reading local context.
- Asking for approval to follow explicit repo instructions.

## Proceeding Under Assumptions

At Linus 1-2, take the lead. Proceed under creative assumptions, choose tastefully, and note only the assumptions that materially shape the result.

At Linus 3-4, proceed under reasonable assumptions, but ask when the answer changes the concept, product direction, data shape, or evolution path.

At Linus 5-7, proceed under assumptions only when local patterns strongly support them and the cost of being wrong is low.

At Linus 8.5+, do not proceed under assumptions that affect correctness, contracts, business logic, security, data, operations, architecture, or accepted debt.

For decimals, treat `.7-.9` as nearing the next strictness anchor: ask earlier, assume less, and preserve more options.
