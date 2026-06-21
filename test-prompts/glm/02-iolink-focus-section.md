# GLM build test — Balluff focus-topic marketing section (IO-Link condition monitoring)

Build a SINGLE self-contained `index.html` containing ONE marketing page section (~700-900px tall
at desktop), in the Balluff register. Code-strength test: real tokens, real icons, dramatic dark
promo card. Roboto Flex via Google Fonts `<link>` is fine; opens offline by double-click.

## Read the brand source first (absolute paths)
- `/Users/jimmykline/Workspaces/ai-marketing2/design.md` — READ Color, Typography, Components (Hero/promo card), Imagery. Follow it.
- `/Users/jimmykline/Workspaces/ai-marketing2/tokens.css` — tokens.
- `/Users/jimmykline/Workspaces/ai-marketing2/icons/` — use 3 real Balluff icons inlined (e.g. `current-voltage-monitoring.svg`, `vibration.svg`, `operating-hours-counter.svg`, `signal-quality.svg`).
- `/Users/jimmykline/Workspaces/ai-marketing2/logos/balluff-wordmark-black.svg` — only if you add a small mark; otherwise omit (this is a section, not a full page).

## The section: "Condition monitoring with IO-Link"
- Left-aligned H2 (`text-4xl` bold) + one-line lede (`text-lg`, gray-800).
- A 3-up icon feature row ("Your advantages at a glance" pattern): each column = inlined Balluff icon (recolor fill to gray-900) + bold `text-xl` title + 2-line `text-base` descriptor. Topics: continuous vibration sensing, current/voltage monitoring, operating-hours counters.
- One dramatic dark promo card (full-bleed near-black industrial background via CSS gradient/texture — NO real photo needed, suggest it with a dark monochrome metallic CSS treatment + a single subtle red light accent): all-caps red eyebrow (`text-xs`), white H3 (`text-2xl`), one-line near-white descriptor, white "Read the case →" arrow bottom-left, `--radius-md`, ~16:9.
- One primary CTA: red tertiary text + arrow ("Explore IO-Link condition monitoring →").

## Hard brand rules
- Roboto Flex; achromatic + red `#e73446` as condiment ONLY (eyebrow, arrows, the single accent on the dark card). Error red is a different color — don't use it here.
- Left-aligned headings. Square corners except the promo card (`--radius-md` reads well there). Flat elsewhere. Sentence case (except the wordmark + the eyebrow tag). NO emoji. No superlatives.
- Generous whitespace; one primary CTA in the section.

## Output
- Single `index.html` in the current directory; desktop 1440px + mobile reflow.
- Quick structure sanity check, then a 6-line `BUILD-NOTES.md` (what you built, how to open, icons used, anything you were unsure about).
