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

INSTRUCT="Use your BUILT-IN image_gen tool (NOT the CLI/API path, NOT scripts/image_gen.py) to generate exactly ONE image from the SPEC below.
Treat the attached image(s) as REFERENCE images: match their silver-gray Balluff Room register, lighting, perspective, and material treatment; compose the subject within that register.
After generating, COPY the final selected image into THIS working directory as: $OUT/$NAME.png — then report the absolute saved path.
Do NOT write a script, do NOT ask clarifying questions — produce the image directly with the built-in image_gen tool.
Attached references:$REFNOTE

SPEC:
$PROMPT"

echo "run-imagegen: '$NAME' via codex built-in image_gen → $OUT/$NAME.png  (ref imgs: $(( ${#IMG_ARGS[@]} / 2 )))"
# Built-in image_gen needs network; isolated authorized smoke test in out/ → bypass sandbox/approvals.
# NOTE: --image is variadic, so it would swallow a trailing positional prompt; pass the prompt via STDIN.
printf '%s' "$INSTRUCT" | codex exec --dangerously-bypass-approvals-and-sandbox --skip-git-repo-check \
  -C "$OUT" "${IMG_ARGS[@]}" 2>&1 | tee "$OUT/run.log"
