# ai-marketing2 — Balluff brand source-of-truth for AI visual generation

A clean, self-contained Balluff brand package built to feed **two AI generation engines**:

- **GLM-5.2** (via Builder's `glm-delegate.sh`) — code builds: HTML / CSS / SVG / decks. Exact CI.
- **GPT-Image-2** (via Codex's `$imagegen` system skill) — raster: hero backgrounds, atmospheric/editorial imagery.

> **Lineage (hermit-crab, 2026-06-21).** Seeded from `ai-marketing/design-system/` (the canonical half),
> dropping the cruft (the duplicate `design-handoff/` bundle, the 8.9 M nested copy, the forked tokens,
> dead prototypes). **`ai-marketing/` stays untouched and canonical for its existing consumers**
> (Furnace's internal-BI dashboards + beacon decks consume `design-handoff/`; Kalli, Builder-common,
> GLM-lab reference `design-system/design.md`). This repo is the *generation*-focused successor, not a
> replacement of those feeds.

## What's here

**Brand source (prose + assets — the rule layer):**
- `design.md` — canonical 530-line Balluff brand doc (color, type, logo, imagery, composition, components). **Read this first.**
- `tokens.css` — Tailwind v4 `@theme` tokens (generated from design.md).
- `prompts.md` — canonical HTML-gen prompt templates (hero, landing, one-pager, section, case-study).
- `icons.md` + `icons/` — 178 Balluff SVG icons (use-case indexed).
- `logos/`, `fonts/Roboto_Flex/`, `favicon/`, `examples/`, `balluff-rooms/` — real brand assets + reference renders.
- `ASSETS.md` — the detailed asset-layout guide (logos naming, icon technical constraints).

**Machine layer (NEW — the gap the research flagged):**
- `brand.spec.json` — machine-readable brand (palettes, type scale, layout, logo, imagery, hard-never rules) for prompt builders.
- `asset-brief.schema.json` — JSON Schema for an asset brief (compiles to a GLM build prompt or a GPT-Image-2 prompt).
- `brand-locking.md` — **how to actually hold Balluff CI in a raster model** (reference priming + achromatic constraint + numeric silver-gray grade + code-overlay logo/text). Read before any image-gen run.

**Test harness + prompts:**
- `test-prompts/glm/` — GLM build test prompts (code-strength surfaces).
- `test-prompts/chatgpt/` — GPT-Image-2 briefs (`.json`) + compiled prompts (`.prompt.txt`) for image-strength surfaces.
- `test-prompts/README.md` — the GLM-vs-ChatGPT head-to-head matrix.
- `harness/run-glm.sh` — drive a GLM build → `out/glm-<name>/`.
- `harness/run-imagegen.sh` — drive a GPT-Image-2 generation via Codex `$imagegen` → `out/imagegen-<name>/`.
- `out/` — generated artifacts (gitignored).

## Quick start

```bash
# GLM code build (works today, Z.ai-billed):
harness/run-glm.sh rfid-landing ~/Workspaces/ai-marketing2/test-prompts/glm/01-rfid-category-landing.md

# GPT-Image-2 raster (via Codex $imagegen; needs codex login):
harness/run-imagegen.sh rfid-hero \
  ~/Workspaces/ai-marketing2/test-prompts/chatgpt/01-rfid-hero-background.prompt.txt \
  ~/Workspaces/ai-marketing2/balluff-rooms/balluff-room-studio-01.jpg \
  ~/Workspaces/ai-marketing2/examples/00-primary-optical-sensors.jpeg
```

## Engine routing (the core principle)

Keep **final typography + responsive layout + exact data** in code (GLM/SVG/HTML). Use **image-gen**
for source imagery only — hero backgrounds, atmosphere — then **composite real logos + overlay text
deterministically**. See `brand.spec.json → generation.routing` and `brand-locking.md`.

> GLM and GPT-Image-2 output are **untrusted + may drift off-brand**. Eyeball + brand-review before any
> ship. Full automated fidelity verification (deltaE / red-ratio / OCR / logo-presence + a brand judge)
> is the deferred "full verification workflow."
