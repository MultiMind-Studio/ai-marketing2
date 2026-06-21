# Balluff Design System

Source of truth for Balluff brand assets and rules consumed by Claude Design, Stitch, v0, Lovable, and adjacent design-doc tools.

**This directory is canonical.** A sibling [`../design-handoff/`](../design-handoff/) holds a derivative bundle (Claude-Design output: preview cards, drop-in `colors_and_type.css`, working component HTML, agent-skill manifest) — useful for design handoff, but if its rules diverge from `design.md` here, this directory wins.

## Layout

```
design.md      Canonical brand + design doc. Three palettes (brand / data-viz / UI-state), derived gray scale,
               typography, logo placement, imagery rules, composition principles. This is what Claude Design reads.
icons.md       Use-case index for the icon library. Read this before picking icons by filename.
tokens.css     Tailwind v4 @theme block — colors, type scale, spacing, breakpoints, radius, elevation.
               Generated from design.md. AI tools that ingest CSS tokens read this directly.
prompts.md     Canonical agent prompts for product hero, category landing page, sales one-pager,
               marketing section, and case-study card. Copy-paste templates with brand rules baked in.
examples/      Reference captures of Balluff brand work in the wild — public balluff.com pages
               (Playwright). See examples/MANIFEST.md.
logos/         Logo assets — kebab-case, see logos § below.
icons/         178 Balluff-supplied UI icons, SVG, kebab-case. Sourced from brandportal.balluff.com 2026-04-27.
favicon/       B-signet favicon set: .ico (legacy), 32, 128, 180 (Apple touch), 192, 512 (PWA install).
fonts/         Roboto Flex variable TTF + OFL license. Self-contained for offline generators.
balluff-rooms/ Studio-backdrop reference renders. Attach as image input to image-generation prompts.
```

## logos/

Naming: `balluff-{type}-{color}.{ext}`. All PNGs are transparent at 2000×473 (claim) or 2224×482 (wordmark).

```
balluff-wordmark-{black,white}.svg    vector wordmark — preferred for web.
balluff-wordmark-{black,white}.png    raster fallback when SVG isn't supported.
balluff-claim-black.png               B-signet + "innovating automation" for light bg.
balluff-claim-white.png               B-signet + claim for dark bg. PRODUCTION-CANONICAL — shipped on balluff-tools.com.
balluff-claim-{black,white}.ai        Illustrator sources for the claim.
balluff-claim-cmyk-neg.ai             CMYK negative source for print.
```

The americas-landing project still references `balluff_claim_white_transparent.png` from its own [public/logos/](../../americas-landing/public/logos/) under the old name — that's intentional, do not rename there without also updating [src/app/page.tsx:231](../../americas-landing/src/app/page.tsx#L231).

## icons/

178 SVGs sourced from brandportal.balluff.com on 2026-04-27. Flat structure (Lucide-style) for easy globbing by AI design tools. Lowercase kebab-case throughout.

**[icons.md](icons.md) is the entry point — read it before picking icons.** It covers technical constraints (viewBox is 70×50 not square; fills are hard-coded across 4 dark-gray hex values, not `currentColor` — see icons.md for the breakdown), groups all 178 by use case, lists synonyms, and flags niche / seasonal / domain-specific icons that shouldn't be used in generic contexts.

## Notes for AI design tools

- **Read `design.md` first.** Everything else here is asset-level; the doc is rule-level.
- **`examples/` is feel reference, not pixel target.** Captures show the brand's vocabulary — colors, type rhythm, component anatomy, section spacing — and should inform improvements, not be duplicated. Read `examples/MANIFEST.md` for the full guidance and per-capture caveats. Specific photography in any capture is illustrative; the imagery rules in `design.md` are authoritative.
- **Fonts.** Roboto Flex (variable TTF, OFL-licensed) ships under `fonts/Roboto_Flex/`. Web flows can still load it from the Google Fonts CDN; local generators (PDF, DOCX, image pipelines) load from this directory.
- **`tokens.css` is the canonical token file.** Tailwind v4 `@theme` block, generated from `design.md`. Tools that ingest CSS tokens (Claude Design, v0, Lovable) read this directly. If you need a project-specific tweak (e.g., a wider container max-width), override locally; don't edit this file.
