# Security Ladder

Use this reference whenever work touches authentication, authorization, sessions, secrets, PII, payments, admin capabilities, file upload, user-generated content, external fetches, webhooks, dependencies, build/release, logging, telemetry, storage, database access, or production configuration.

## Always

Non-negotiable:

- Never commit or expose secrets, tokens, private keys, credentials, session cookies, or `.env` values.
- Never intentionally weaken auth, authorization, validation, encryption, audit logging, or security headers without explicit user approval.
- Never hide security-impacting failures.
- Never log secrets, passwords, tokens, authorization headers, session ids, or sensitive personal data.
- Never add malicious, deceptive, persistence, credential-harvesting, or exfiltration behavior.
- Repo security rules override Linus Level.

## Linus 5.0+

Non-negotiable:

- Treat external input as untrusted.
- Use parameterized queries or safe query builders; do not concatenate SQL with untrusted data.
- Avoid `eval`, dynamic code execution, unsafe deserialization, and shell interpolation.
- Do not build file paths, URLs, redirects, or shell commands from raw user input.
- Add dependencies only when needed.

Expected:

- Validate and normalize at trust boundaries, not only in the UI.
- Prefer allowlists over blocklists for security-sensitive validation.
- Keep error messages useful without leaking sensitive internals.

## Linus 7.0+

Non-negotiable:

- Authorization checks must be explicit and close to the protected action, or centralized in a clearly authoritative layer.
- Auth/authz uncertainty must fail closed.
- Use least privilege for service roles, API keys, database access, storage buckets, CI credentials, and OAuth scopes.
- Include negative tests for security-sensitive behavior.
- Review dependency additions for maintenance, provenance, install scripts, transitive risk, and known vulnerabilities.

Expected:

- Separate authentication from authorization in reasoning and code.
- Preserve auditability for admin or privileged actions.
- Avoid broad CORS, redirect allowlists, CSP relaxations, long token lifetimes, or service-role expansion.
- Prefer framework-provided security primitives over custom implementations.

## Linus 8.5+

Non-negotiable:

- Ask before touching auth, permissions, sessions, secrets, payments, PII, encryption, file upload, webhooks, SSRF-prone fetches, admin surfaces, production config, RLS/security policies, or service-role behavior.
- No custom cryptography unless explicitly approved and justified.
- No fallback from a secure path to a less secure path.
- No compatibility shim that bypasses validation, authorization, rate limits, or audit logging.
- No broadening of CORS, CSP, redirect rules, token lifetime, cookie scope, service-role authority, or data visibility without approval.
- Security-relevant behavior changes require tests and documentation unless the repo/user explicitly scopes otherwise.

Expected:

- Identify trust boundaries before editing.
- Preserve privacy and data minimization.
- Consider OWASP Top 10 classes: broken access control, crypto failures, injection, insecure design, misconfiguration, vulnerable components, auth failures, integrity failures, logging gaps, SSRF.
- For external calls, consider SSRF, allowlists, timeouts, redirects, metadata endpoints, private IP ranges, and response-size limits.
- For uploads, consider MIME/type validation, size limits, storage location, scanning needs, public access, and filename/path safety.

## Linus 9.5+

Non-negotiable:

- Produce a short threat-model note before security-sensitive implementation.
- Stop on ambiguity around trust boundaries, data exposure, authz semantics, key handling, auditability, or operational blast radius.
- Treat exposed secrets, auth bypass, privilege escalation, data leak, high/critical dependency vulnerabilities, and production security misconfiguration as blockers.
- Ask for specialist/user approval before crypto, identity, production-secret, irreversible security, or compliance-sensitive changes.

Expected:

- Prefer smallest safe change with strong verification.
- Include abuse cases and negative tests.
- Consider supply-chain integrity: reviewed source, pinned/locked dependencies, build provenance, protected CI, release signing where applicable.

## Sources To Internalize

- NIST SSDF: secure development is a risk-based lifecycle spanning preparation, protection, producing secure software, and vulnerability response.
- OWASP ASVS: concrete verification requirements for web app controls.
- OWASP Top 10: common web app risk categories.
- OWASP Cheat Sheets: focused guidance for secrets, authentication, authorization, input validation, SSRF, file upload, and session management.
- OpenSSF: dependency evaluation, automated tests, vulnerability monitoring, no secrets, review before accepting changes, stable APIs, supply-chain hygiene.
- SLSA: supply-chain integrity from source through build and provenance.
- MITRE CWE Top Weaknesses: injection, code execution, unsafe deserialization, path traversal, missing auth, SQL injection, memory safety, and related weakness families.
