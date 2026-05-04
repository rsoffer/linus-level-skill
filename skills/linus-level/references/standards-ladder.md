# Standards Ladder Index

Use this file only as a routing index. Do not load every standards reference by default.

## Loading Rules

- Always apply `standards-core.md` for repository code changes, reviews, refactors, tests, architecture, docs, release, or workflow work.
- Load exactly one active level band unless the task explicitly spans multiple modes:
  - `1.0-4.9`: `levels-1-4.md`
  - `5.0-6.9`: `levels-5-6.md`
  - `7.0-8.4`: `levels-7-8.md`
  - `8.5-10`: `levels-8_5-10.md`
- Load `security-ladder.md` only for security-sensitive work or plausible material security risk.
- Load `question-patterns.md` when ambiguity matters at Linus `7+`, ambiguity is blocking at any level, or a precise clarifying question is needed.
- Load `low-level-playbook.md` only for Linus `1.0-4.9` creative/prototype work.

## Context Rule

Prefer the smallest reference set that covers the active level and risk surface. If one file answers the question, stop there.
