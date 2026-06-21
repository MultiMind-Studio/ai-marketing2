#!/usr/bin/env bash
# run-imagegen.sh — generate a Balluff raster asset via Codex's $imagegen system skill (GPT-Image-2).
#
# $imagegen is a real Codex system skill (composed by curated skills like hatch-pet). This drives it
# headless via `codex exec`. Codex must be authenticated (`codex login` / ChatGPT plan or OPENAI_API_KEY).
# Reference images are attached with `-i` (the #1 brand-locking lever — see ../brand-locking.md).
#
# Usage:
#   harness/run-imagegen.sh <name> <prompt.txt> [ref1.jpg ref2.jpg ...]
#   harness/run-imagegen.sh rfid-hero \
#     ~/Workspaces/ai-marketing2/test-prompts/chatgpt/01-rfid-hero-background.prompt.txt \
#     ~/Workspaces/ai-marketing2/balluff-rooms/balluff-room-studio-01.jpg \
#     ~/Workspaces/ai-marketing2/examples/00-primary-optical-sensors.jpeg
#
# STATUS: the $imagegen-via-codex-exec round-trip is not yet smoke-confirmed on this host (no
# OPENAI_API_KEY in ~/.hermes/.env; Codex uses its own login). If it stalls on approvals, add
# --full-auto or --dangerously-bypass-approvals-and-sandbox. Output is raster only — brand-lock
# (silver-gray grade + code-overlay logo/text) per ../brand-locking.md before any ship.
set -euo pipefail
export PATH="$HOME/.local/bin:$PATH"

REPO="$HOME/Workspaces/ai-marketing2"
NAME="${1:?usage: run-imagegen.sh <name> <prompt.txt> [refs...]}"
PROMPT_FILE="${2:?usage: run-imagegen.sh <name> <prompt.txt> [refs...]}"
shift 2 || true

[[ -f "$PROMPT_FILE" ]] || { echo "run-imagegen: prompt file not found: $PROMPT_FILE" >&2; exit 1; }
command -v codex >/dev/null || { echo "run-imagegen: codex CLI not found" >&2; exit 1; }

OUT="$REPO/out/imagegen-$NAME"; mkdir -p "$OUT"
PROMPT="$(cat "$PROMPT_FILE")"

IMG_ARGS=(); REFNOTE=""
for ref in "$@"; do
  if [[ -f "$ref" ]]; then IMG_ARGS+=( -i "$ref" ); REFNOTE+=$'\n- '"$ref"; fi
done

INSTRUCT="Use the \$imagegen skill to generate exactly ONE image from the SPEC below.
Use the attached reference image(s) to match the silver-gray Balluff Room register, lighting, and material treatment. Compose the subject within that register.
Save the final PNG to: $OUT/$NAME.png
Do NOT write a script, do NOT ask clarifying questions — produce the image directly with \$imagegen.
Attached references:$REFNOTE

SPEC:
$PROMPT"

echo "run-imagegen: '$NAME' via codex \$imagegen → $OUT/$NAME.png  (refs: ${#IMG_ARGS[@]})"
cd "$OUT"
exec codex exec --sandbox workspace-write "${IMG_ARGS[@]}" "$INSTRUCT" 2>&1 | tee "$OUT/run.log"
