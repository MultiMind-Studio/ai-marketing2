# Composable visual-generation skills — the Lego blocks

> **Captured 2026-06-21 so we don't lose them (Rob).** These are the Tier-2 composable SKILLS emerging
> from the GLM / GPT-Image-2 work — concrete instances of the single-agent composability north star
> (see Atlas memory `project-single-agent-composability-direction` + `project-visual-asset-pipeline-imagegen`).
> Each block = **one engine + a defined harness**, consuming the **shared `ai-marketing2` brand substrate**,
> driven by an **orchestrator** (Atlas/Opus, GLM, or ChatGPT). Files-as-contract between blocks (`out/` + manifests).

## The shared substrate (what every block consumes)

- `ai-marketing2/` — brand source (`design.md`, `tokens.css`, `icons/`, `logos/`, `fonts/`, `balluff-rooms/`, `examples/`)
  + the machine layer (`brand.spec.json`, `asset-brief.schema.json`, `brand-locking.md`, `imagegen-runbook.md`).
- `gopher-data/snapshots/presentation-assets/.../cutouts/` — **real** transparent Balluff product cutouts.
- Output → `out/`. Brand-lock + review per `brand-locking.md` before any ship.

## The blocks

### 1. `balluff-build` (GLM) — on-brand Balluff slides / web / sections  **[PROVEN]**
- **Engine:** GLM-5.2 (code) via `harness/run-glm.sh` (wraps Builder's glm-delegate, Z.ai-billed).
- **Consumes:** `design.md`, `tokens.css`, `icons/`, `logos/`, `fonts/`.
- **Produces:** self-contained on-brand HTML (decks, landing pages, marketing sections).
- **Proof:** `out/glm-iolink-section/` (IO-Link section — achromatic + red-condiment held, real icons, square corners).
- **Invoke:** `run-glm.sh <name> <abs-prompt-file>`

### 2. `glm-explainer` (GLM) — interactive data explainers  **[PATTERN PROVEN]**
- **Engine:** GLM-5.2 (code) via `run-glm.sh`.
- **Consumes:** the brand register (achromatic, restrained palette, Roboto/Inter) + the data + the narrative spine.
- **Produces:** scrollytelling / d3 interactive explainers (data-journalism style; sticky chart + advancing narrative).
- **Note:** distinct from #1 — narrative + interaction + motion, not a static layout. (GLM is strong at this class.)

### 3. `balluff-scene` (GPT-Image-2) — on-brand atmosphere / hero imagery  **[PROVEN]**
- **Engine:** GPT-Image-2 (raster) via `harness/run-imagegen.sh` (Codex built-in `image_gen`, ChatGPT login, **no API key**).
- **Consumes:** a brief (`asset-brief.schema.json`) + **reference images** (`balluff-rooms/`, `examples/`) — reference priming is the brand lock.
- **Produces:** raster source image (hero background, atmospheric/editorial scene).
- **Proof:** `out/imagegen-rfid-hero/` (silver-gray Balluff Room register, sensor at 45° + product glow).
- **Brand-lock:** silver-gray grade + code-overlay real logo/text. Raster is the SOURCE, final = composite.

### 4. `balluff-product-shot` (GPT-Image-2) — a REAL product composited into an on-brand scene  **[PROTOTYPE — iterate: EDGES]**
- **Engine:** GPT-Image-2 (edit/composite) via `run-imagegen.sh` with a real product cutout attached (`-i`).
- **Consumes:** a **real** Balluff product cutout (gopher `presentation-assets/.../cutouts/`) + the brand register.
- **Produces:** product hero on a clean on-brand background — **studio OR room** (the register, not a mandatory room).
- **First attempt:** `out/imagegen-product-studio/` (BNI IO-Link master, clean silver-gray studio, NO Balluff Room) — Codex
  generated a clean plate then composited the original product so its markings weren't redrawn. **The right approach.**
- **Rob verdict 2026-06-21: a fail — EDGES.** The composite seam between the cutout and the generated plate is rough
  (matte fringe / mismatched edge light). **Tomorrow's fix levers:** (a) clean the cutout matte first — defringe/despill
  (the imagegen skill ships `scripts/remove_chroma_key.py`); (b) deterministic composite in code for edge control —
  feather + light-wrap + a grounded contact shadow + match the plate's light direction, rather than letting image_gen
  blend; (c) higher input-fidelity edit if available. Concept is right (real product + register, no room); execution
  needs the edge pass. **This is the one block to iterate — balluff-scene + balluff-build stay as-is (the composability payoff).**
- **Key principle (Rob 2026-06-21):** preserve the **real** product (don't hallucinate it); on-brand = the
  **register** (achromatic / silver-gray / product-glow / 45° / red-condiment), NOT slavish room-replication.
  The guidelines are overly prescriptive in mandating the room — it's one expression of the register, not the register.

## Orchestration

An orchestrator picks the block, writes the brief, and reviews the output. Options: **Atlas/Opus** (longest
context, the CoS), **GLM**, or **ChatGPT**. The blocks **compose + chain** via files — e.g.
`balluff-product-shot` (GPT) generates the asset → `balluff-build` (GLM) embeds it in a deck → Atlas/Opus
brand-reviews. That chain IS the composability thesis, working.

## Graduation path (don't lose these)

Today these are **harness + prompts** in this repo. To become first-class composable skills: promote each to a
`SKILL.md` (description-gated, lazy-loaded) in the central skills substrate (`~/.claude/skills/` or a skills repo),
carrying its harness contract (engine, inputs, outputs, brand-lock, review). Tracked under the composability
direction; the **empirical skill-loading test** (how many description-gated skills load cleanly at once) gates how
aggressively we consolidate them under one orchestrator.
