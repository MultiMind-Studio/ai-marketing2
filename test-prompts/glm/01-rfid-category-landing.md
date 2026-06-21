# GLM build test — Balluff RFID category landing page

You are building a **Balluff-brand** category landing page as a SINGLE self-contained `index.html`
(opens offline by double-click; Roboto Flex via Google Fonts `<link>` is fine). This is a
code-strength test: exact CI fidelity, real tokens, real assets.

## Read the brand source first (absolute paths — read them, don't guess)
- `/Users/jimmykline/Workspaces/ai-marketing2/design.md` — the brand rules (Color, Typography, Composition, Components). READ IT.
- `/Users/jimmykline/Workspaces/ai-marketing2/tokens.css` — the canonical tokens. Inline the values you need.
- `/Users/jimmykline/Workspaces/ai-marketing2/logos/balluff-wordmark-black.svg` — the real wordmark. Inline it (top-left).
- `/Users/jimmykline/Workspaces/ai-marketing2/icons/` — real Balluff SVG icons (viewBox 0 0 70 50; fills are dark-gray hex, not currentColor). Use 3-4 relevant ones (e.g. `recognition-of-devices.svg`, `network.svg`, `mobile-data-transmission.svg`, `factory.svg`) by inlining their SVG.

## The page: "Industrial RFID systems"
Anchor to the restrained, confident Balluff register. Required sections, in order:
1. Top nav — white, 1px gray-200 bottom border, 64px tall, wordmark top-left, 4 nav items (`text-base`, gray-900, hover red), no shadow.
2. Breadcrumb — gray-600, `text-sm` ("Home / Industrial RFID systems").
3. Restrained hero — left-aligned H1 (`text-5xl` bold, gray-900) "Industrial RFID systems" + one-line lede (`text-2xl` regular, gray-800) on pure white. NO hero image. Generous whitespace.
4. Section nav — a row of 4-6 inline links each with a red right-arrow, separated by generous whitespace. No chips, no cards.
5. Lead paragraph — H2 + body introducing RFID for industrial traceability (number-led, no superlatives).
6. 3-up "Your advantages at a glance" feature row — each = an inlined Balluff icon + short bold title + 2-line descriptor. Recolor icon fills to gray-900.
7. 2-column subcategory grid — 4 tiles (HF read/write heads, UHF systems, processors, data carriers), each = title + 2-line descriptor, hairline rules between rows, no shadows, square corners.
8. CTA band on gray-50 — single-line label + red tertiary arrow link.
9. Footer — quiet, low-contrast (author/date/page), wordmark.

## Hard brand rules (from design.md — do NOT violate)
- Roboto Flex everywhere. Achromatic surface; **Balluff Red `#e73446` only on CTAs / active states / the arrow icons** — never an area fill.
- Headings LEFT-aligned, never centered. Square corners (`--radius-none` cards, `2px` buttons). Flat — hairline borders + tint, no heavy shadows.
- Sentence case. NO emoji (use the SVG icons). No invented superlatives — numbers carry claims.
- One primary CTA per viewport; default CTA is the red text + red arrow ("Learn more →").
- Generous whitespace; asymmetric splits for hierarchy.

## Output
- Single `index.html` in the current directory. Render target 1440px desktop width; also reflow cleanly to mobile.
- After writing, do a quick structure sanity check (no unclosed tags; required sections present).
- Write a 6-line `BUILD-NOTES.md`: what you built, how to open, which icons/logo you used, any brand-rule you were unsure about.
- Do not invent product specs you don't know — keep descriptors generic-but-plausible and number-led where safe.
