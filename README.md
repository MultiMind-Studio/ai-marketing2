# ai-marketing2: the Balluff Design System, packaged for AI-assisted work

Brand source of truth for building on-brand Balluff material with AI tools: decks, web surfaces, diagrams, and generated imagery. Everything a build needs (rules, tokens, logos, icons, fonts, slide chrome) lives in this one repo.

## If you're a person, start here

- **`design.md`** is the brand doc: the three palettes (brand / data-viz / UI-state), gray scale, typography, logo placement, imagery rules, composition principles. Read this first.
- **`logos/`** wordmark and claim, black/white, SVG/PNG/AI.
- **`icons/`** 178 official Balluff SVG icons (from brandportal.balluff.com), indexed by use case in **`icons.md`**.
- **`chrome/`** slide frame furniture: the grey header triangle and slide header used on every deck slide.
- **`fonts/Roboto_Flex/`** the brand face. Note for decks: share internally in Arial (coworkers don't have Roboto Flex, and PowerPoint can't save it embedded); Roboto Flex is for surfaces where pixels bake it in.
- **`examples/`** reference captures of balluff.com brand work; **`balluff-rooms/`** studio backdrop photography for compositing.
- **`ASSETS.md`** the detailed asset-layout guide (naming, icon technical constraints, what lives where).

## If you're an AI tool or writing prompts for one

- **`brand.spec.json`** machine-readable brand: palettes, type scale, layout, logo rules, imagery rules, hard-never rules, engine routing.
- **`tokens.css`** Tailwind v4 `@theme` tokens generated from design.md.
- **`prompts.md`** prompt templates for common surfaces (hero, landing, one-pager, section, case-study).
- **`asset-brief.schema.json`** JSON Schema for an asset brief that compiles to a build or image-gen prompt.
- **`brand-locking.md`** how to hold Balluff CI in a raster image model: reference priming, achromatic constraint, numeric silver-gray grade, deterministic logo/text overlay. Read before any image-gen run.
- **`COMPOSABLE-SKILLS.md`** the proven building blocks (on-brand code builds, scene imagery, product shots, editable .pptx decks) and how they compose.

## The one principle that governs everything

Keep **final typography, layout, and exact data in code** (HTML/SVG/native PowerPoint shapes). Use **image generation only for source imagery** (backgrounds, atmosphere), then composite real logos and set real text deterministically. Generated output drifts off-brand; eyeball and brand-review before anything ships. See `brand.spec.json` under `generation.routing` and `brand-locking.md`.

## Test harness (historical, June 2026)

`test-prompts/` and `harness/` hold the GLM-vs-image-model head-to-head that validated the routing principle above. Kept for reference; the current deck workflow lives outside this repo and consumes the brand source directly.

## Lineage

Seeded 2026-06-21 from the older `ai-marketing/design-system/`, dropping duplicated bundles and dead prototypes. That older repo remains in place for its existing consumers; this one is the generation-focused successor and the canonical brand source for new work. Slide chrome added from the Balluff asset library 2026-08-19.
