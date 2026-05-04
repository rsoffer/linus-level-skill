# Linus Level Codex Plugin

![Linus Level logo](assets/linus-level-logo-lockup-transparent.png)

**Linus Level** gives Codex a `1.0-10.0` strictness dial for software work: from creative vibe-mode prototyping to careful maintainer-grade engineering.

The name is a software-culture wink to Linus Torvalds' reputation for exacting technical standards and maintainer seriousness. It is not about harsh communication. It is about giving agents a memorable control for how much freedom, skepticism, verification, security discipline, and code-review strictness a task deserves.

The mascot is an original Linux-inspired penguin with a red visor and a `1-10` strictness gauge, not a likeness of a real person.

## The Problem

AI coding agents are asked to behave in wildly different contexts:

- "Vibe-code this idea into existence."
- "Prototype a weird UI direction quickly."
- "Patch a production codebase without breaking contracts."
- "Touch auth, data, security, infra, or business rules safely."

Without calibration, an agent may guess wrong. It may over-engineer a throwaway sketch, or worse, treat a mission-critical production system like a loose prototype.

Linus Level makes the expected behavior explicit.

## Quick Start

```text
Use $linus-level at Linus Level 8.5 for this production codebase task.
```

```text
Use Linus Level 2 for fast creative prototyping.
```

```text
Calibrate this task with Linus Level before coding.
```

## The Dial

| Linus Level | Mode | Agent Behavior |
|---:|---|---|
| `1.0-1.9` | Vibe mode | Take the lead, make creative calls, ask almost nothing, optimize for momentum and delight. |
| `2.0-2.9` | Hack/sketch | Build the thing fast, accept local rough edges, prove the idea. |
| `3.0-3.9` | Concept prototype | Make the concept coherent enough to evaluate and evolve. |
| `4.0-4.9` | Product prototype | Move quickly, but avoid avoidable near-term mess. |
| `5.0-6.9` | Product development | Use professional defaults, follow local patterns, test behavior changes. |
| `7.0-8.4` | Established codebase | Preserve contracts, fix root causes, keep changes scoped and reviewable. |
| `8.5-9.4` | Staff maintainer | Ask before material decisions; enforce DRY, security, and source-of-truth discipline. |
| `9.5-10` | Kernel maintainer | Plan first, stop on dangerous ambiguity, verify deliberately. |

## Decimal Points Matter

Decimals are not cosmetic. They interpolate between anchors.

| Example | Meaning |
|---:|---|
| `2.2` | Still scrappy. Lead creatively, but keep the concept understandable. |
| `4.8` | Prototype speed, but start behaving like product development for contracts and repo conventions. |
| `7.5` | Established-codebase mode with moderate-low assumptions. |
| `7.8` | Leaning staff-maintainer: stricter DRY/source-of-truth review and more deliberate verification. |
| `8.9` | Staff-maintainer leaning mission-critical: stop on more ambiguity and plan risky work. |

Rule of thumb:

- `.0-.2`: mostly the current anchor
- `.3-.6`: blended behavior
- `.7-.9`: pre-adopt important requirements from the next anchor when relevant

## Question Behavior

Higher Linus Level means fewer hidden assumptions.

| Linus Level | Question Policy |
|---:|---|
| `1.0-1.9` | Ask only if blocked, unsafe, or repo rules conflict. Otherwise take the wheel. |
| `2.0-2.9` | Ask only for hard blockers or major product-direction forks. |
| `3.0-3.9` | Ask if ambiguity changes the concept, audience, or core interaction. |
| `4.0-4.9` | Ask if ambiguity could make the prototype hard to evolve. |
| `5.0-6.9` | Ask when ambiguity affects user-visible behavior, data shape, architecture, or verification. |
| `7.0-8.4` | Ask before contracts, business rules, shared state, persistence, auth, payments, analytics, or workflows. |
| `8.5-9.4` | Ask before material assumptions, migrations, dependencies, fallbacks, feature flags, or accepted debt. |
| `9.5-10` | Do not proceed through ambiguity that affects correctness, security, data, contracts, operations, or business meaning. |

Good high-Linus question:

```text
Before I change this: should this ranking rule apply only to Session Finder, or is it a shared forecast-quality rule used elsewhere? That determines whether this is a local filter change or a shared scoring-rule change.
```

Good low-Linus behavior:

```text
I'll pick a bold direction and build the first usable version. I'll keep the code easy enough to continue from, but I won't stop for minor choices.
```

## Engineering Standards By Level

The plugin teaches Codex which standards become expected or non-negotiable as the dial rises.

| Standard | Becomes Non-Negotiable |
|---|---:|
| Follow system, user, repo, and tool instructions | Always |
| Ask before bypassing repo rules | Always |
| No secrets, malicious behavior, or hidden partial completion | Always |
| Keep changes scoped | `5.0+` |
| Match existing style before inventing patterns | `5.0+` |
| Do not silently hide failures | `5.0+` |
| Preserve public API/UI contracts unless explicitly migrating | `6.0+` |
| Tests for behavior changes | `6.5+` expected, stricter near `7.0+` |
| Root-cause fixes over symptom patches | `7.0+` |
| No unrelated refactors in targeted fixes | `7.0+` |
| DRY for business rules, contracts, validation, scoring, permissions, cache keys, and UI state authority | `7.0+`, strict at `8.5+` |
| Named constants for thresholds, weights, limits, and domain magic numbers | `7.0+` |
| No hidden fallbacks, shims, shadow state, or parallel implementations without approval | `8.5+` |
| No timing hacks to mask lifecycle or sequencing bugs | `8.5+` |
| Docs travel with behavior/config/workflow/architecture changes | `8.5+` |
| Plan before implementation | `9.5+` |
| Stop on ambiguity affecting correctness, security, data, operations, contracts, or business meaning | `9.5+` |

## Security Posture By Level

Security is not bolted on. Linus Level tunes security discipline too.

| Security Standard | Becomes Non-Negotiable |
|---|---:|
| Never commit or expose secrets, tokens, keys, credentials, or `.env` values | Always |
| Never log secrets, passwords, tokens, authorization headers, session ids, or sensitive personal data | Always |
| Treat external input as untrusted | `5.0+` |
| Use parameterized queries or safe query builders | `5.0+` |
| Avoid `eval`, unsafe deserialization, shell interpolation, and raw path/URL construction from user input | `5.0+` |
| Authorization must be explicit and fail closed | `7.0+` |
| Use least privilege for service roles, storage, DB access, CI credentials, and OAuth scopes | `7.0+` |
| Add negative tests for security-sensitive behavior | `7.0+` |
| Ask before touching auth, sessions, secrets, PII, encryption, file upload, webhooks, admin surfaces, production config, or RLS/security policies | `8.5+` |
| No custom crypto unless explicitly approved and justified | `8.5+` |
| No fallback from a secure path to a less secure path | `8.5+` |
| Threat-model note before security-sensitive implementation | `9.5+` |
| Exposed secrets, auth bypass, privilege escalation, data leak, high/critical dependency vulnerability, or production security misconfig are blockers | `9.5+` |

## Repository Rules Still Win

Linus Level is a tuning layer, not an authority layer.

If a repository says "always use DRY" and you ask for `Linus Level 1`, Codex should not silently ignore the repo. It should say:

```text
You asked for Linus 1, but this repo requires DRY business logic and contract stability. I can move quickly within those rules, or you can explicitly approve a temporary exception for this local prototype area.
```

Precedence:

1. system, developer, tool, and safety instructions
2. current-turn user instructions
3. repository instructions such as `AGENTS.md`, README files, docs, and local conventions
4. Linus Level behavior
5. agent defaults

## Example Prompts

```text
Use Linus Level 1.5. Take the lead and explore a fun direction. Keep it local and easy to throw away.
```

```text
Use Linus Level 4.8. Move fast, but keep the prototype close enough to production shape that we can continue from it.
```

```text
Use Linus Level 7.8. Read the surrounding code, preserve contracts, avoid duplicated business logic, and verify behavior changes.
```

```text
Use Linus Level 8.8. Ask before changing architecture, business rules, security posture, or public contracts.
```

```text
Use Linus Level 9.7. Plan first, threat-model any security-sensitive work, and stop on ambiguity.
```

## Plugin Structure

```text
.codex-plugin/plugin.json
assets/
  linus-level-logo-lockup-transparent.png
  linus-level-app-icon.png
skills/linus-level/SKILL.md
skills/linus-level/agents/openai.yaml
skills/linus-level/references/
```

## Local Plugin Install

Clone or copy this repository into a local plugin directory:

```bash
mkdir -p ~/plugins
git clone git@github.com:rsoffer/linus-level-codex-plugin.git ~/plugins/linus-level
```

Then add this entry to `~/.agents/plugins/marketplace.json`:

```json
{
  "name": "linus-level",
  "source": {
    "source": "local",
    "path": "./plugins/linus-level"
  },
  "policy": {
    "installation": "AVAILABLE",
    "authentication": "ON_INSTALL"
  },
  "category": "Productivity"
}
```

For a home-local marketplace, `./plugins/linus-level` resolves to:

```text
~/plugins/linus-level
```

See `marketplace.example.json` for a complete sample marketplace file.

## Skill-Only Install

If you do not need plugin packaging, copy or symlink `skills/linus-level` into:

```text
${CODEX_HOME:-$HOME/.codex}/skills/linus-level
```

## Hosted OpenAI Skill Upload

OpenAI's Skills API uploads the skill bundle itself, not the whole Codex plugin wrapper. For this repo, the upload target is:

```text
skills/linus-level/
```

That folder contains the required `SKILL.md` frontmatter plus the reference files. The plugin wrapper (`.codex-plugin/plugin.json`, `assets/`, and `marketplace.example.json`) is for Codex plugin distribution and local marketplace presentation.

Build a hosted-skill zip:

```bash
bash scripts/package-skill.sh
```

This creates:

```text
dist/linus-level.zip
```

The zip contains one top-level folder:

```text
linus-level/
  SKILL.md
  agents/openai.yaml
  references/
```

Upload the zip with the OpenAI API:

```bash
curl -X POST 'https://api.openai.com/v1/skills' \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -F 'files=@./dist/linus-level.zip;type=application/zip'
```

The response includes the hosted `skill_id`. Use that id from a hosted shell environment:

```json
{
  "type": "skill_reference",
  "skill_id": "<skill_id>"
}
```

To publish a new hosted version later:

```bash
curl -X POST 'https://api.openai.com/v1/skills/<skill_id>/versions' \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -F 'files=@./dist/linus-level.zip;type=application/zip'
```

See OpenAI's Skills guide for the latest API details:

```text
https://developers.openai.com/api/docs/guides/tools-skills
```

## GitHub Publishing

This repository is also shaped as a Codex plugin: `.codex-plugin/plugin.json` plus a `skills/` directory. To publish a GitHub release:

1. Commit the plugin files.
2. Push to `git@github.com:rsoffer/linus-level-codex-plugin.git`.
3. Tag a semantic version, starting from `v0.1.0`.
4. Attach `dist/linus-level.zip` as the hosted-skill upload artifact if desired.
5. Share the repository as the local Codex plugin install source.

## License

MIT
