# Deployment

This repository supports two distribution shapes:

- Hosted OpenAI Skill API upload
- GitHub/Codex plugin distribution

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

Set that version as the default:

```bash
curl -X POST 'https://api.openai.com/v1/skills/<skill_id>' \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{ "default_version": "2" }'
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
