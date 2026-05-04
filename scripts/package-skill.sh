#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
skill_src="$repo_root/skills/linus-level"
dist_dir="$repo_root/dist"
tmp_dir="$(mktemp -d)"

cleanup() {
  rm -rf "$tmp_dir"
}
trap cleanup EXIT

mkdir -p "$dist_dir"
cp -R "$skill_src" "$tmp_dir/linus-level"

(
  cd "$tmp_dir"
  zip -qr "$dist_dir/linus-level.zip" linus-level
)

echo "Created $dist_dir/linus-level.zip"
