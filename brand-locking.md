# Brand-locking — how to actually hold Balluff CI in a raster model

> The hard truth the research is missing: a diffusion model (GPT-Image-2) **cannot be told
> "use `#e73446`"** and obey it — it regresses to training priors, drifts colors, mangles logos,
> and hallucinates text. So faithful Balluff output is mostly **compositing**, not generation.
> This file is the deterministic recipe. Read it before any image-gen run; the GLM (code) path
> doesn't need most of this because code sets exact values directly.

## The five levers (in order of leverage)

### 1. Reference-image priming (the biggest lever)
A good reference image beats any amount of prose. For anything needing the Balluff backdrop,
**attach** `balluff-rooms/balluff-room-studio-01.jpg` (or `-02.jpg`) and instruct the model to
**compose the subject inside the supplied render**, preserving its lighting, perspective, and
material treatment. Never ask it to invent a Balluff Room from description — `design.md` is explicit
that the Room is bespoke and not prose-reproducible. For style/register consistency across an asset
family, also attach `examples/00-primary-optical-sensors.jpeg` as a "what good looks like" anchor.

### 2. Achromatic constraint in the prompt
Constrain the generation toward the brand register so the post-grade has less to fix:
- "monochrome / silver-gray engineered scene, desaturated, near-achromatic"
- "no saturated colors; a single small red accent at most, or none"
- negative: "no neon, no cyberpunk, no rainbow UI, no colorful product packaging"
Generate at low/medium quality for exploration; reserve high for the final candidate.

### 3. Silver-gray post-grade (deterministic, numeric)
After generation, grade toward the Balluff silver-gray register so output harmonizes with the
brand. Target characteristics (apply as a LUT or per-channel op):
- **Desaturate** to ~15–30% of original saturation (HSL S ×0.15–0.30). Balluff imagery is near-achromatic.
- **Neutralize tint**: pull the midtone toward the brand gray ramp — gray-600 `#6b6b6a` as the
  midpoint neutral, gray-200 `#e6e6e6` as the highlight floor, gray-900 `#1d1d1b` as the shadow point.
- **Silver highlights**: lift specular/material highlights toward `#bcbcbc` (data-viz silver) for the
  "engineered material surface" read; keep them cool-neutral, not warm.
- **Contrast**: gentle S-curve; Balluff surfaces are clean and even, not crushed/dramatic — except
  the dramatic dark promo card, which goes near-black `#1d1d1b`→black with a single red light accent.
- **Red dot accent** (optional, layer 3): if used, composite a sparse field of small `#e73446` dots
  in code — do not let the model paint them.
A reference ImageMagick starting point (tune per asset):
`magick in.png -modulate 100,22,100 -fill '#6b6b6a' -tint 12 -sigmoidal-contrast 3x50% out.png`

### 4. Code-overlay the logo (never let the model draw it)
GPT-Image-2 cannot reproduce the Balluff wordmark's custom letterforms. Generate with **safe area
left open** (brief `format.safe_area`), then composite the real vector:
`logos/balluff-wordmark-white.svg` (dark bg) / `-black.svg` (light bg). Respect clear space (width of
the "B") and the per-medium position (web top-left, print/deck top-right). The B-signet only appears
paired with the "innovating automation" claim — use `logos/balluff-claim-white.png`.

### 5. Code-overlay text (keep copy out of the raster)
Set the brief `copy.in_image_text=false`, `overlay_text_handled_by_code=true`. Generate the image as a
background/source, then render headlines/labels in **Roboto Flex** over it in HTML/SVG/CSS. This is the
hybrid route and it is the default for anything with words. Generated in-image text is for exploration
or non-critical posters only — never regulatory labels, specs, or exact numbers.

## What stays in code, always (don't generate these)
Icons (use the 178 SVGs in `icons/`), diagrams, charts, exact data viz, OG cards, UI mockups,
responsive layout, and all final typography. See `brand.spec.json.generation.routing`.

## Fidelity checks (the eval the reports lacked — lightweight now, full rubric later)
When you eyeball a generated asset, check against `design.md`:
- **Color**: dominant colors near the achromatic ramp? Red only as a small accent, not an area fill?
  (machinable later: dominant-color deltaE vs locked hexes; red-pixel ratio < a few %.)
- **Logo**: is the wordmark the real composited SVG, not a model-drawn approximation?
- **Text**: any in-image text correct + Roboto Flex, or is copy code-overlaid? (machinable later: OCR.)
- **Composition**: left-aligned, asymmetric, generous whitespace, square feel? Subject 45deg, not centered?
- **Tells**: no uncanny faces, no fake UI glyphs, no stock cliches, no emoji, no neon.

> Full automated verification (deltaE / red-ratio / OCR / logo-presence as a scored gate, plus a
> brand-judge) is the deferred "full verification workflow." This file is the manual recipe so Rob
> can eyeball first.
