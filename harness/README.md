# Harness

Two thin wrappers that drive the two engines against this repo's brand source. Both write to
`../out/<engine>-<name>/` (gitignored). Output is **untrusted** — eyeball + brand-review before ship.

## run-glm.sh — GLM-5.2 code builds (works today)

```bash
harness/run-glm.sh <name> <absolute-prompt-file>
```
Wraps Builder's `tools/glm-delegate.sh` (Claude Code routed to Z.ai/GLM-5.2, Z.ai-billed). Runs in an
isolated `out/glm-<name>/` with bypassPermissions (safe because isolated). The prompt tells GLM to read
the brand source by absolute path and produce `index.html` + `BUILD-NOTES.md`. Review by opening the
HTML (or screenshot) against `../design.md`.

## run-imagegen.sh — GPT-Image-2 raster via Codex `$imagegen`

```bash
harness/run-imagegen.sh <name> <prompt.txt> [ref1 ref2 ...]
```
Drives Codex's `$imagegen` system skill headless via `codex exec`, attaching reference images with `-i`
(reference priming is the #1 brand-locking lever). Saves a PNG to `out/imagegen-<name>/`.

**Status / prereqs:**
- Needs Codex authenticated (`codex login` — ChatGPT plan, or an `OPENAI_API_KEY`). There is **no
  `OPENAI_API_KEY` in `~/.hermes/.env`** as of 2026-06-21, so this path leans on Codex's own login.
- The `$imagegen`-via-`codex exec` round-trip is **not yet smoke-confirmed headless** on this host
  (it's a real Codex system skill, but typically driven from the interactive TUI). If `codex exec`
  stalls on an approval or won't generate non-interactively, run the 1-image smoke test interactively
  first, or add `--full-auto` / `--dangerously-bypass-approvals-and-sandbox`.
- Raster output still needs brand-locking (silver-gray grade + code-overlay logo/text) per
  `../brand-locking.md` before it's on-brand.

## After generating

GLM → open/screenshot the HTML. Image-gen → view the PNG, then apply the brand-locking post-steps.
Score against `../test-prompts/README.md`. Full automated fidelity scoring is the deferred verification workflow.
