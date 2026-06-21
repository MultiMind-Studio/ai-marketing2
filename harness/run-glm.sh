#!/usr/bin/env bash
# run-glm.sh — drive a GLM-5.2 Balluff BUILD via Builder's glm-delegate, pointed at
# the ai-marketing2 brand source. GLM is the cheap leaf executor; brand source is read
# by absolute path from this repo; artifacts land in out/glm-<name>/.
#
# Usage:
#   harness/run-glm.sh <task-name> <absolute-prompt-file>
#   harness/run-glm.sh rfid-landing ~/Workspaces/ai-marketing2/test-prompts/glm/01-rfid-category-landing.md
#
# Notes:
#   - GLM output is UNTRUSTED + may drift off-brand; eyeball + brand-review before any ship.
#   - Z.ai-billed (cheap). Runs in an isolated out/ dir with bypassPermissions (safe: isolated).
set -euo pipefail

REPO="$HOME/Workspaces/ai-marketing2"
DELEGATE="$HOME/Workspaces/Builder/tools/glm-delegate.sh"

NAME="${1:?usage: run-glm.sh <task-name> <absolute-prompt-file>}"
PROMPT="${2:?usage: run-glm.sh <task-name> <absolute-prompt-file>}"

[[ -f "$PROMPT" ]] || { echo "run-glm: prompt file not found: $PROMPT" >&2; exit 1; }
[[ -x "$DELEGATE" ]] || { echo "run-glm: glm-delegate not found/executable: $DELEGATE" >&2; exit 1; }

OUT="$REPO/out/glm-$NAME"
mkdir -p "$OUT"
echo "run-glm: building '$NAME' → $OUT (GLM-5.2 via glm-delegate, Z.ai-billed)"
exec "$DELEGATE" --dir "$OUT" --task "@$PROMPT" 2>&1 | tee "$OUT/run.log"
