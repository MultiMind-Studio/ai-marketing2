# Runbook — structured JSON to keep GPT-Image-2 on Balluff brand

The honest premise first: **structured JSON does NOT, by itself, keep a diffusion model on brand.**
JSON makes a brief *reproducible, reviewable, and machinable* — but a model still can't be *told* an
exact hex or a logo and obey it. On-brand output comes from **three things working together**:

1. a **structured brief** (the JSON) that encodes intent + constraints + the avoid-list,
2. **reference-image priming** (attach the real Balluff Room render — the single biggest lever),
3. **deterministic post-work** (silver-gray grade + code-overlay the real logo/text).

JSON is layer 1. `brand-locking.md` is layers 2-3. This runbook stitches them into one pipeline.

## The pipeline

```
brand.spec.json   (the durable brand truth — palettes, type, imagery, hard-never rules)
        +
asset-brief.json  (THIS asset — validates against asset-brief.schema.json)
        ↓  compile
structured prompt (.prompt.txt: intended use / brand context / scene / constraints / output)
        +  -i reference images (balluff-rooms/ + examples/)   ← the real brand lock
        ↓  generate
built-in image_gen (GPT-Image-2, ChatGPT-plan-backed; raster source only)
        ↓  brand-lock  (brand-locking.md)
silver-gray grade + palette-snap  →  code-overlay real wordmark + headline (Roboto Flex)
        ↓  review
fidelity checklist (now)  →  automated rubric (deferred verification workflow)
        ↓
committed artifact + provenance manifest
```

## Step 1 — Author the brief (the structured JSON)

Copy an existing brief in `test-prompts/chatgpt/*.json` and edit. It validates against
`asset-brief.schema.json`. The fields that actually do brand work:

| Field | What it does for on-brand-ness |
|-------|--------------------------------|
| `reference_images[]` | **The #1 lever.** Point at `balluff-rooms/balluff-room-studio-01.jpg` (+ `examples/00-primary-optical-sensors.jpeg`). The model matches register from the image, not prose. |
| `constraints.must_avoid[]` | Schema default already bans the off-brand tells: human/robot faces, neon, saturated color, fake UI text, **any logo/wordmark** (overlaid in code), centered composition, emoji, Balluff Red as area fill. |
| `brand.palette` | "achromatic + Balluff Red as condiment only" — steers generation toward the register so the post-grade has less to fix. |
| `copy.in_image_text=false` | **Keep text out of the raster.** GPT-Image-2 text drifts; headlines are overlaid in code. |
| `brand_locking.*` | Flags the deterministic post-steps (palette_snap, silver_gray_grade, code_overlay_logo, code_overlay_text). |
| `format.safe_area` | Leaves space for the code-overlaid headline + top-left wordmark. |

What JSON **cannot** do (don't expect it to): exact `#e73446`, the real wordmark letterforms, exact
copy, regulatory text, precise data. Those are **always** code/post — see the routing table in
`brand.spec.json → generation.routing`.

## Step 2 — Compile to the prompt

The `.prompt.txt` beside each brief is the compiled, model-facing prompt in the report's structure:
INTENDED USE / BRAND CONTEXT / SCENE / VISUAL DIRECTION / CONSTRAINTS / OUTPUT / REFERENCE IMAGES / POST.
(A future `build-prompt.mjs` can generate this from the JSON; for now the pair is authored together.)

## Step 3 — Generate (built-in image_gen, no API key)

Codex must be logged in via ChatGPT (`codex login status` → "Logged in using ChatGPT"). Then:

```bash
harness/run-imagegen.sh rfid-hero \
  test-prompts/chatgpt/01-rfid-hero-background.prompt.txt \
  balluff-rooms/balluff-room-studio-01.jpg \
  examples/00-primary-optical-sensors.jpeg
```

This drives Codex's **built-in `image_gen` tool** (GPT-Image-2) via `codex exec`, attaching the
references with `-i`, and copies the result into `out/imagegen-rfid-hero/`. (The CLI fallback
`scripts/image_gen.py` needs `OPENAI_API_KEY` — not used here; we lack one. Built-in mode does not.)

## Step 4 — Brand-lock (deterministic post)

Per `brand-locking.md`: silver-gray grade + palette-snap toward the achromatic ramp; then composite
the **real** wordmark SVG (`logos/`) and render the headline in Roboto Flex over the image in code.
Never ship the raw generation — the logo and text it draws are not the real ones.

## Step 5 — Review

Eyeball against `design.md` using the `brand-locking.md` fidelity checklist (palette / logo / text /
composition / tells). The automated scored gate (deltaE, red-pixel ratio, OCR, logo-presence + a brand
judge) is the **deferred full-verification workflow** — out of scope until the eyeball rounds settle.

## Step 6 — Provenance

Record a sidecar manifest beside the asset (model, prompt hash, source/reference images, brief path,
created_at) per the `provenance` block in `asset-brief.schema.json`. Keeps generation auditable +
reproducible.

---

### TL;DR
JSON = reproducible brief + the avoid-list. **Reference images = the real brand lock.** Logo + text +
exact color = code/post, never the model. On-brand Balluff raster is **80% compositing, 20% generation.**
