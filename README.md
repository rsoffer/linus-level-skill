# Linus Level Codex Plugin

Linus Level is a Codex skill that gives AI coding agents a `1.0-10.0` strictness dial, from creative vibe-mode prototyping to careful maintainer-grade engineering.

The name is a software-culture wink to Linus Torvalds' reputation for exacting technical standards and maintainer seriousness. It is not about harsh communication. It is about giving agents a memorable control for how much freedom, skepticism, verification, security discipline, and code-review strictness a task deserves.

## What It Tunes

- autonomy and assumption budget
- clarifying-question behavior
- DRY/source-of-truth discipline
- testing and documentation expectations
- security posture and trust-boundary caution
- tolerance for shortcuts, shims, fallbacks, and technical debt

## Example Usage

```text
Use $linus-level at Linus Level 8.5 for this production codebase task.
```

```text
Use Linus Level 2 for fast creative prototyping.
```

```text
Calibrate this task with Linus Level before coding.
```

## Plugin Structure

```text
.codex-plugin/plugin.json
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

## Publishing

This repository is shaped as a Codex plugin: `.codex-plugin/plugin.json` plus a `skills/` directory. To publish a release:

1. Commit the plugin files.
2. Push to `git@github.com:rsoffer/linus-level-codex-plugin.git`.
3. Tag a semantic version, starting with `v0.1.0`.
4. Attach or share the repository/archive as the install source.

There is not currently a self-serve public Codex skill marketplace submission flow represented in the local plugin tooling. If OpenAI later provides one, this repo should already have the expected plugin shape.

## License

MIT
