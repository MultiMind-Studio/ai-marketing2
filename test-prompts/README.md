# Test prompts — GLM-5.2 vs GPT-Image-2 head-to-head

Prompts chosen on the **engine-divergence line**: each one is picked to be where one engine should
clearly win, so the comparison is informative rather than a tie. Brand fidelity is judged against
`../design.md` + `../brand.spec.json`; brand-locking per `../brand-locking.md`.

## The matrix

| # | Asset | Engine under test | Why this engine | Prompt |
|---|-------|-------------------|-----------------|--------|
| GLM-1 | RFID category landing page | **GLM (code)** | Exact tokens, real Roboto Flex, real Balluff SVG icons, left-aligned, square corners, precise layout + text — pure code strength. | `glm/01-rfid-category-landing.md` |
| GLM-2 | IO-Link focus section + dark promo card | **GLM (code)** | Real icons, exact CTA hierarchy, the dramatic dark-card surface as CSS — code strength. | `glm/02-iolink-focus-section.md` |
| IMG-1 | RFID hero **background** | **GPT-Image-2 (raster)** | Atmospheric silver-gray Balluff Room stage with product glow — can't be coded; headline/logo overlaid in code (hybrid). | `chatgpt/01-rfid-hero-background.{json,prompt.txt}` |
| IMG-2 | Condition-monitoring editorial scene | **GPT-Image-2 (raster)** | Application atmosphere / depth — image strength, not a diagram. | `chatgpt/02-condition-monitoring-editorial.{json,prompt.txt}` |

## What we're actually testing

1. **Can GLM hit Balluff CI** (not just Dracula)? The GLM prompts force exact achromatic + red-as-condiment,
   Roboto Flex, square corners, real icons/logo — the brand's hard rules. (Open question Rob flagged.)
2. **Can GPT-Image-2 produce a usable Balluff-register source image** given reference priming
   (`balluff-rooms/` + `examples/`), and how much brand-locking post-work it needs.
3. **The routing thesis**: code wins where text/layout/exactness matter; image-gen wins for atmosphere.
   The four prompts are deliberately split across that line.

## Scoring (eyeball now; rubric is the deferred full-verification layer)

Per asset, against `design.md`: brand fidelity (palette / type / logo / square-flat), composition
(left-aligned / asymmetric / whitespace), text accuracy, usability/edit-ability, and the
brand-locking checklist in `../brand-locking.md`. The future automated rubric scores deltaE / red-ratio
/ OCR / logo-presence + a brand judge — out of scope until Rob has eyeballed a few rounds.

## Run

```bash
../harness/run-glm.sh rfid-landing  $PWD/glm/01-rfid-category-landing.md
../harness/run-glm.sh iolink-section $PWD/glm/02-iolink-focus-section.md
../harness/run-imagegen.sh rfid-hero $PWD/chatgpt/01-rfid-hero-background.prompt.txt \
  ../balluff-rooms/balluff-room-studio-01.jpg ../examples/00-primary-optical-sensors.jpeg
```
