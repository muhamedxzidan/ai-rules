#!/usr/bin/env bash
# Usage: ./sync-rules.sh <preset> <target-project-dir> [--with-agents]
set -euo pipefail
PRESET="${1:?preset name, e.g. flutter-mobile}"; TARGET="${2:?target project dir}"
HERE="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$TARGET/.rules"
cp "$HERE/AGENTS.md" "$TARGET/AGENTS.md"
files=$(tail -n +2 "$HERE/presets/$PRESET.txt")
[ "${3:-}" = "--with-agents" ] && files="$files"$'\n'"$(cat "$HERE/presets/agents-extra.txt")"
while read -r f; do
  [ -z "$f" ] && continue
  mkdir -p "$TARGET/.rules/$(dirname "$f")"; cp "$HERE/$f" "$TARGET/.rules/$f"
done <<< "$files"
echo "Synced preset '$PRESET' -> $TARGET (AGENTS.md + .rules/)"
