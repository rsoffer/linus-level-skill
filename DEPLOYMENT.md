# Deployment

This repository supports three distribution shapes:

- Hosted skill upload for OpenAI and Claude
- Filesystem installs for Codex, Claude Code, and other `SKILL.md`-aware agent workflows
- GitHub release distribution

## Hosted OpenAI Skill Upload

OpenAI's Skills API uploads the skill bundle itself, not the whole Codex compatibility wrapper. For this repo, the upload target is:

```text
skills/linus-level/
```

That folder contains the required `SKILL.md` frontmatter plus the reference files. The `.codex-plugin/` wrapper is only for Codex plugin distribution and local marketplace presentation.

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

Set that version as the default:

```bash
curl -X POST 'https://api.openai.com/v1/skills/<skill_id>' \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{ "default_version": <version_number> }'
```

See OpenAI's Skills guide for the latest API details:

```text
https://developers.openai.com/api/docs/guides/tools-skills
```

## Claude Skill Distribution

Claude Skills use the same core shape: a directory containing `SKILL.md`, with optional `references/`, `scripts/`, and `assets/`.

For Claude Code user install:

```bash
mkdir -p ~/.claude/skills
ln -s "$(pwd)/skills/linus-level" ~/.claude/skills/linus-level
```

For Claude Code project install:

```text
<project>/.claude/skills/linus-level/
  SKILL.md
  references/
```

For Claude.ai upload, package the canonical skill directory:

```bash
bash scripts/package-skill.sh
```

Upload `dist/linus-level.zip` through the current Claude skill upload flow. Claude's docs require the zip to contain one top-level directory whose name matches the `name` field in `SKILL.md`.

For Claude API upload, Anthropic's Skills API uses multipart `files[]` entries rather than the OpenAI-style zip upload. Each uploaded file must be named under the same top-level directory, with `SKILL.md` at that directory root. Example pattern:

```bash
curl -X POST "https://api.anthropic.com/v1/skills" \
  -H "x-api-key: $ANTHROPIC_API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -H "anthropic-beta: skills-2025-10-02" \
  -F "display_title=Linus Level" \
  -F "files[]=@skills/linus-level/SKILL.md;filename=linus-level/SKILL.md" \
  -F "files[]=@skills/linus-level/references/standards-core.md;filename=linus-level/references/standards-core.md"
```

Include the remaining `references/` files the same way. Keep all `filename=` paths inside the `linus-level/` top-level directory.

Claude Code reads `CLAUDE.md`, not `AGENTS.md`. For repos that already use `AGENTS.md`, create a `CLAUDE.md` that imports it:

```md
@AGENTS.md
```

Docs:

```text
https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview
https://claude.com/docs/skills/how-to
https://code.claude.com/docs/en/agent-sdk/skills
https://code.claude.com/docs/en/memory
```

Claude's official docs describe custom skill upload and filesystem discovery, not a public marketplace submission flow. For marketplace-style distribution today, publish the GitHub repo and release artifact so users can install the skill into Claude Code, upload the zip to Claude.ai, or submit the same `SKILL.md` package wherever third-party skill directories accept GitHub/zip submissions.

## GitHub Publishing

Recommended repository name: `linus-level-skill`.

This repository is primarily a skill repo. It also includes `.codex-plugin/plugin.json` as a Codex compatibility wrapper. To publish a GitHub release:

1. Commit the skill files.
2. Push to `git@github.com:rsoffer/linus-level-skill.git`.
3. Tag a semantic version, starting from `v0.1.0`.
4. Attach `dist/linus-level.zip` as the hosted-skill upload artifact.
5. Share the repository as the source for Codex, Claude Code, and other `SKILL.md`-aware agent workflows.
