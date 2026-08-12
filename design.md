# Balluff Brand Guidelines (v2 — prose-form, LLM-context-ready)

> Distilled from brandportal.balluff.com for use as standing context in Claude
> Design, GPT-Image-2, Codex, and any other reasoning-model brief. The brand
> portal remains the source of truth; this document expresses what's there in
> the form a reasoning model consumes best.

---

## Who Balluff is

Balluff is a German industrial automation manufacturer, family-owned and
headquartered in Neuhausen since 1921, with global manufacturing and sales
operations. The audience for every Balluff communication is technically
literate: automation engineers, plant managers, OEM design teams, and
procurement specialists who make capital-equipment decisions on the basis of
reliability, technical specification, and long-term support — not on the
basis of feature checklists or marketing trend.

The brand voice is fresh, technological, and high-quality — never cold, never
breathless. Sentences are clear and declarative. Numbers carry claims;
rhetoric does not. A sensor that detects to 0.01 mm is described as detecting
to 0.01 mm — not as offering "industry-leading precision." Where a
specification matters it is named precisely; where it does not it is omitted.
Confidence without bombast. Technical depth made accessible. Respect for the
reader's time and expertise.

## A note on median output

Default AI output trends toward median — generic conventions, common
phrasings, default visual choices that the model has seen most often. This
document is most useful where Balluff explicitly differs from those defaults.
Where a *Never* rule below is followed by a **Median override** note, treat
it as a deliberate correction of what the model would otherwise produce.

## Things we never do

- **Logo.** Never modified, never red, never rotated, never used without its
  prescribed clear space (width of the "B" on every side). Never substituted
  with a generic typeface — the wordmark uses custom letterforms.
- **Color.** Never use Balluff Red as a dominant area color. Never introduce
  accent colors outside the three documented palettes below. Never apply the
  data-visualization palette to brand surfaces or UI buttons. **Median
  override:** the default brand system uses color liberally for hierarchy
  and brand expression. Balluff's achromatic-plus-red is the deliberate
  inverse — color is rationed.
- **Typography.** Never use a typeface other than Roboto Flex on web, app,
  raster, or print surfaces. (Editable `.pptx` decks are the one documented
  exception: Arial / Arial Black, never embedded — see Typography.) Never rely
  on color alone to convey hierarchy — weight and size do that work.
- **Composition.** Never center title or body content. Never use complicated
  perspectives or busy backgrounds. Never crowd the layout — white space is
  part of the design, not a leftover.
- **Imagery.** Never use stock photography that contradicts the silver-gray
  Balluff Room register described in the Imagery section below. Never crop
  the wordmark. Never separate the B-signet from the "innovating automation"
  claim once the two have been paired. Never attempt to generate a Balluff
  Room from prose — always supply the render as a reference image. Never
  attempt to generate human figures — source people imagery from Balluff's
  brand library and composite. **Median override:** the default
  product hero is a centered shot on white seamless. Balluff is dynamic
  45° inside a silver-gray Balluff Room render.
- **Voice.** Never inflate. Never deploy adjectives that the underlying
  specification does not support. Never use marketing language where
  technical language is more honest. **Median override:** the default
  industrial-marketing voice deploys superlatives — *leading*,
  *industry-leading*, *innovative solutions*, *world-class*,
  *cutting-edge*, *next-generation*. Balluff rejects all of these in
  favor of specifications. If the spec doesn't support the claim, the
  claim is dropped.

## Color — three palettes, each with a defined scope

### 1. Brand palette (primary)

This palette defines every brand surface — title slides, hero sections,
document headers, navigation, layout backgrounds, primary buttons.
Achromatic-plus-red is the differentiator that sets Balluff apart from the
colorful field of automation competitors. Red is condiment, not paint: if a
layout looks balanced without red, leave the red out.

| Color        | HEX     | Use                                                        |
|--------------|---------|------------------------------------------------------------|
| Black        | #1d1d1b | Primary text; logo on light backgrounds                    |
| White        | #ffffff | Primary backgrounds; logo on dark backgrounds              |
| Balluff Red  | #e73446 | Accent only — emphasis, links, key terms, small callouts   |

**Surface grays.** Intermediate grays (cards, borders, dividers, hover
states, secondary text) are derived as tints of `#1d1d1b`. Use this
deterministic scale unless brand-source documentation overrides:

| Role                          | Tint of #1d1d1b | Approximate HEX |
|-------------------------------|-----------------|-----------------|
| Subtle background / card fill | 5%              | `#f5f5f5`       |
| Border / divider              | 10%             | `#e6e6e6`       |
| Disabled text / inactive UI   | 40%             | `#9e9e9e`       |
| Secondary text                | 60%             | `#6b6b6a`       |
| Heading-secondary / dark UI   | 80%             | `#414140`       |

### 2. Data visualization palette

For multi-series charts, diagrams, dashboards, KPI tiles, heat maps, pie
segments, and any artifact where data must be distinguished by hue. Applies
equally to web, app, print, and slides. *Do not* use these as brand-surface
colors, button colors, or decorative backgrounds — they are reserved for
information design.

| Color           | HEX     | Use                                  |
|-----------------|---------|--------------------------------------|
| Steel blue      | #6A9DC6 | Primary data accent                  |
| Cyan            | #70BFD7 | Secondary data accent                |
| Cool gray       | #94A7B4 | Neutral data series                  |
| Silver          | #BCBCBC | Supporting neutral; disabled state   |
| Teal / sage     | #A3C7C7 | Additional accent                    |
| Muted green     | #779389 | Additional accent                    |

These are intentionally desaturated to maintain visual harmony with the
achromatic brand surface around them.

### 3. Functional UI state palette (web and app only)

For interactive products, semantic UI states are non-decorative — colors
signal meaning, not style. Use conventional state palettes; do not invent
custom hues.

| State                | HEX                       | Use                              |
|----------------------|---------------------------|----------------------------------|
| Error / destructive  | #d32f2f                   | Error messages, destructive ops  |
| Success              | #2e7d32                   | Confirmations, success states    |
| Warning              | #f9a825                   | Caution, soft warnings           |
| Info                 | #6A9DC6 (data-viz blue)   | Informational alerts, hints      |
| Disabled / inactive  | #BCBCBC (data-viz silver) | Inactive controls                |

UI state colors are reserved for what they signify. Do not introduce
success-green into a marketing surface or warning-amber into a non-warning
icon. Balluff Red and the destructive-error red are *not* interchangeable
— Balluff Red is a brand accent, the error red is a UX signal. If a future
brand-source revision documents official UI state colors, those override
this table.

## Typography

Roboto Flex is the Balluff typeface. Use it on every surface that can load or
bake it in — web, app, HTML/SVG builds, generated raster, print. Embed or load
the typeface in those artifacts; do not substitute a system font, and **do not
pair a second face** — the
single family is intentional (single-family brand systems are current, not
dated; cf. IBM Plex, SAP). Hierarchy is expressed through **typeface variety
within Roboto Flex**, not by adding a font. Roboto Flex is a *variable* font,
and Balluff deliberately picked the variable cut: carry hierarchy and
display-vs-body character on its axes — **weight (`wght`) + optical size
(`opsz`) + width (`wdth`) + size** — not weight alone. Concretely:

- Set **`font-optical-sizing: auto`** globally so `opsz` tracks font-size for
  free (tighter, higher-contrast display text; more open, legible body).
- On large display headings, tighten **`wdth`** (a slightly condensed heading
  against normal-width body is the in-family "display face" — the character
  contrast a display+body pairing would give, without leaving CI).
- Use the full `wght` range, not just 400/700 — custom weights (e.g. 780, 840)
  are on the table.

Using Roboto Flex at flat weights (only regular/bold, no `opsz`/`wdth`) reads
as under-using the variable font — that's the one real "single-font" tell to
avoid. Color is supportive of hierarchy, never load-bearing — a heading should
still read as a heading in monochrome. Vertical rhythm matters: paragraphs
separated by clear line spacing, headings with consistent space-above and
space-below.

**Slide decks are the documented exception (Rob rulings, 2026-08-04 and
2026-08-06).** Decks built as editable `.pptx` use **Arial** for body and
**Arial Black** for display, **never embedded**. Two reasons: coworkers who
open a shared deck do not have Roboto Flex installed, and the current Balluff
PowerPoint cannot save a deck that embeds Roboto Flex — so generator
`embedFonts()` steps stay off. Do not "restore" Roboto Flex to a from-scratch
deck without Rob save-testing the result first. Adapting an *existing* .pptx by
direct XML edit preserves that deck's real Roboto Flex font runs, which is fine.
The canonical source for deck generation, including this ruling, is
`~/Workspaces/runbooks/build-a-balluff-deck.md`. Roboto Flex still applies to
customer-facing raster surfaces, where the pixels bake it in.

**Type scale.** Not documented in Balluff brand sources; the scale below is
PMM-derived, calibrated against public balluff.com (see
`examples/MANIFEST.md` — `00-primary-optical-sensors` is the primary
reference). It is pinned here so AI-generated artifacts in this repo stay
consistent. If a future brand-source revision documents an official scale,
that overrides this table.

| Token | Size  | Line height | Use                                                    |
|-------|-------|-------------|--------------------------------------------------------|
| xs    | 12 px | 1.4         | Eyebrow tags, helper text, footnotes, payment-icon row |
| sm    | 14 px | 1.5         | Small UI labels, table cells, secondary descriptors    |
| base  | 16 px | 1.6         | Body copy — default                                    |
| lg    | 18 px | 1.5         | Lead paragraph, hero subhead small                     |
| xl    | 20 px | 1.4         | H4 / card heading                                      |
| 2xl   | 24 px | 1.3         | H3 / hero subhead, "Wide range of optoelectronic..."   |
| 3xl   | 30 px | 1.25        | H2 small                                               |
| 4xl   | 36 px | 1.15        | H2 standard, section opener                            |
| 5xl   | 48 px | 1.1         | H1, page title                                         |
| 6xl   | 60 px | 1.05        | Oversized hero H1 (sparingly)                          |

Headings use heavier `wght` + display `opsz` (and optionally condensed
`wdth`); body uses regular weight + text `opsz`. Italic is reserved for
proper-noun emphasis only — Balluff hierarchy rides Roboto Flex's variable
axes (weight + optical-size + width + size), never a second typeface.

## Layout scales (PMM-derived)

Spacing, breakpoints, radius, and elevation are not documented in Balluff
brand sources. The values below are PMM-derived, calibrated against public
balluff.com (see `examples/MANIFEST.md`). They are pinned for consistency
across AI-generated artifacts and align with Tailwind v4 defaults so
generators (Claude Design, v0, Lovable, americas-landing) interop cleanly.
If a future brand-source revision documents official scales, those override.

### Spacing

4 px base unit. Token = unit count. Pixel values shown for clarity.

| Token | px    | Use                                                         |
|-------|-------|-------------------------------------------------------------|
| 1     | 4 px  | Hairline gap, icon-text gap                                 |
| 2     | 8 px  | Tight inline groups, chip internal padding                  |
| 3     | 12 px | Form-field row gap                                          |
| 4     | 16 px | Default text/element gap                                    |
| 5     | 20 px | Card internal heading-to-body                               |
| 6     | 24 px | Card padding, tile gutter                                   |
| 8     | 32 px | Component-to-component within a section                     |
| 10    | 40 px | Container side padding (mobile)                             |
| 12    | 48 px | Section-internal block separation                           |
| 16    | 64 px | Section-to-section (default)                                |
| 20    | 80 px | Section-to-section (generous, used on landing pages)        |
| 24    | 96 px | Hero-to-content, footer separator                           |

Balluff favors generous whitespace — when in doubt, prefer a larger value.

### Breakpoints

Mobile-first, Tailwind-aligned. Use `min-width` queries.

| Token | Width    | Surface                              |
|-------|----------|--------------------------------------|
| (default) | < 640 px  | Mobile portrait                  |
| sm    | ≥ 640 px  | Mobile landscape, small tablet       |
| md    | ≥ 768 px  | Tablet portrait                      |
| lg    | ≥ 1024 px | Tablet landscape, small desktop      |
| xl    | ≥ 1280 px | Desktop (target)                     |
| 2xl   | ≥ 1536 px | Wide desktop                         |

Container max-width: **1280 px** with horizontal padding via spacing tokens
(20 px mobile, 32 px tablet, 64 px desktop). Captures were taken at 1440 ×
900 — the `xl` breakpoint is the design target.

### Radius

Balluff leans square-cornered. Heavy rounding reads as consumer-app, not
industrial-automation — keep that tendency in mind, but use the full token
set when softening genuinely helps.

| Token | px       | Use                                                       |
|-------|----------|-----------------------------------------------------------|
| none  | 0        | Default — cards, tiles, dividers, hero panels             |
| sm    | 2 px     | Inputs, buttons (subtle softening over square)            |
| md    | 4 px     | Prominent CTAs, small modals                              |
| lg    | 8 px     | Larger modals, drawers, image-cards where soft reads well |
| xl    | 12 px    | Big visual blocks where corner softening adds polish      |
| full  | 9999 px  | Chips, filter tags, badges, count indicators ("0")        |

### Elevation

Balluff leans flat — hairline borders and surface tint do most of the
elevation work, and shadows stay subtle even at the top of the scale. The
full ramp is here so Claude Design can reach for `md` / `lg` when an
overlay genuinely needs to float, but `00-primary-optical-sensors`'s
shadow-free 12-tile grid is the canonical surface treatment.

| Token | Shadow                                | Use                                          |
|-------|---------------------------------------|----------------------------------------------|
| none  | (no shadow)                           | Default — every static surface               |
| xs    | `0 1px 2px rgba(0,0,0,0.04)`          | Hover hint on otherwise-flat tiles           |
| sm    | `0 2px 8px rgba(0,0,0,0.06)`          | Low-elevation cards, floating chat widget    |
| md    | `0 4px 16px rgba(0,0,0,0.08)`         | Dropdowns, popovers, raised cards            |
| lg    | `0 8px 24px rgba(0,0,0,0.10)`         | Modals, drawers, full-screen overlays        |

## Logo

The wordmark "BALLUFF" — all caps, custom letterforms — is the primary brand
mark. Black on light backgrounds; white on dark.

**Logo position by medium:**

- **Web and app:** top-left corner. This overrides the brand-portal
  preference for top-right because top-left is the universal web/app
  convention — users expect a top-left logo to function as the home link,
  and a top-right logo creates UX friction.
- **Print, PDF, decks, one-pagers:** top-right corner (brand-portal
  preference).

Pick one position per project per medium and stay consistent.

Sizing: 55 mm width on A4/Letter; minimum 15 mm physical or 43 px digital.
For non-standard formats, scale proportionally while respecting the 15 mm /
43 px minimum and the clear-space rule. Clear space: width of the "B" on
every side, no exceptions.

The B-signet (red "B" icon) appears only when paired with the "innovating
automation" claim, level-aligned at the same width as the wordmark, with the
two elements never repositioned independently.

## Imagery — the 5-layer composition stack

Every Balluff visual composition layers in this order, from background
forward:

1. **Background environment — the "Balluff Room."** The standing background
   environment for product and application photography is a pre-rendered 3D
   scene Balluff calls a "Balluff Room": abstract architectural compositions
   in silver-gray with soft directional lighting and engineered material
   surfaces, reading as engineered, clean, and technical — a conceptual
   product stage rather than a literal location. **These are bespoke renders,
   not reproducible from prose.** For any image-generation prompt that
   requires the Balluff Room as background, source the chosen render from
   `balluff-rooms/`, attach it as a reference image alongside the
   prompt, and instruct the model to compose the foreground subject inside
   the supplied render while preserving its lighting, perspective, and
   material treatment. Do not ask the model to invent a Balluff Room from
   description alone — it cannot.

2. **Application or industry context.** Equipment, machinery, factory floor
   — color-graded toward silver-gray to harmonize with the Balluff Room
   render. Real industrial photography is acceptable when the silver-gray
   treatment is applied as a color grade; raw factory photography without
   grading reads off-brand.

3. **Digital element.** A sparse field of small red dots, applied as an
   overlay accent, signaling the digital and connected nature of Balluff
   sensors. Used once per surface, not as a repeating motif. Not every
   composition needs it.

4. **People.** **Do not generate human figures from prose.** Image
   generators reliably produce uncanny faces, generic stock-photo
   composites, or anatomical errors. For any artifact that requires people,
   source imagery from Balluff's brand library and composite the foreground
   subject(s) into the rendered scene separately. The brand intent for
   people imagery: successful, determined, curious — depicted in action, in
   conversation, at work, never posed or centered or frontal — but that
   intent is realized through library photography, not generation.

5. **UI graphics.** Software interfaces, dashboards, sensor data overlays —
   included when relevant to the application, rendered cleanly without
   dramatization.

### Photography conventions

Products are photographed at a 45° angle inside the silver-gray Balluff Room
render described above. Lighting includes a soft halo or rim-light around the
product silhouette — Balluff calls this the "product glow," a subtle
backlight that separates the product from the background — and a clean drop
shadow on the floor surface. Position is dynamic, never centered. People
photography depicts work in progress, not posed portraits. Industrial
photography uses real working environments where Balluff products are
visible in context. Avoid centered compositions, complicated perspectives,
and stock-photography clichés (handshake-over-globe, generic conference
rooms, cliff-edge silhouettes).

## Composition principles for layouts

These principles apply across web pages, app screens, print one-pagers, and
slides — they are the layout DNA, not specific to any one medium.

- **Logo placement is consistent within a project and follows the medium**
  (see Logo section): top-left for web/app, top-right for print/decks/PDF.
- **Titles are left-aligned, never centered.** Centered titles read as
  decorative; left-aligned titles read as informational.
- **White space is generous and intentional.** If a layout feels
  under-filled, it is probably correct. The empty space is part of the
  composition.
- **Asymmetric splits express hierarchy.** Use proportional splits like
  1/3 + 2/3 or 1/4 + 3/4 to show relative weight — proportion does the work
  that color and font weight do not. Equal 1/2 + 1/2 splits are reserved
  for genuinely peer content (side-by-side comparison, before/after).
- **Decorative elements are sparing.** The red-dot pattern is an accent —
  used once or twice per surface, never as wallpaper or repeating motifs.
- **Footers are quiet.** Author/presenter, date, page or slide number,
  rendered in low-contrast type. Footers are not a branded zone.

## Components (web / app)

Concrete defaults for the recurring UI primitives across Balluff web and
app surfaces. Values reference the tokens in `tokens.css`. Anchor reference
is `examples/00-primary-optical-sensors.jpeg` — when in doubt, look there.
This section is web/app only; print/deck collateral conventions are not
documented here.

### Buttons

Primary, secondary, and tertiary in that order of visual weight. Most
surfaces should have **at most one primary button per viewport** — the rest
should de-escalate to secondary or tertiary so the call to action is
unambiguous.

- **Primary** — solid `--color-balluff-red` background, white text, weight
  bold, `--radius-sm` (2 px) corners, `text-base` size. Pad 12 px vertical,
  24 px horizontal (md size). Right-arrow icon optional and common
  ("Subscribe to the newsletter now! →"). On hover, darken background ~8 %.
- **Secondary** — transparent background, 1 px `--color-gray-800` border,
  `--color-gray-900` text. Same padding as primary. Hover: tint background
  to `--color-gray-50`.
- **Tertiary / text + arrow** — no background, no border. Red text in
  `--color-balluff-red`, right-arrow icon `--color-balluff-red`. Used
  inline at the end of a card or section for "Learn more" handoffs. This is
  the most common CTA in the captures — prefer it over a heavy button when
  the surrounding context already implies the action.

Sizes: sm (32 px height), md (40 px, default), lg (48 px). Buttons are
always single-line; never wrap.

### Links

- **Inline body links** — `--color-balluff-red`, no underline by default,
  underline on hover. Bold weight only when the link sits inside a heading.
- **Standalone link with arrow** — same as the tertiary button pattern
  above. The arrow is a non-decorative right-arrow icon, set in red.
- **Quiet links** (footer, breadcrumb, secondary nav) — `--color-gray-600`,
  no underline by default, underline on hover, not red. Red is reserved for
  primary affordances.

### Cards

- **Default card** — white background, no shadow, square corners
  (`--radius-none`), 1 px `--color-gray-200` border or no border with a
  hairline divider between siblings. Padding 24 px (`--spacing-6`). This
  is the canonical "list of things" card per `00-primary-optical-sensors`.
- **Subtle card** — `--color-gray-50` background, no border. Use when a
  group of cards needs to read as a single block against a white page.
- **Elevated card** — white background, `--shadow-xs` or `--shadow-sm`,
  square corners. Reserve for content that genuinely floats (sidebar
  helper, sticky CTA). Default to flat.
- **Hero / promo card** (the dramatic dark blocks on the primary capture)
  — full-bleed dark photographic background with restrained typography
  in white. Corner radius optional (`--radius-md` reads well at this
  scale). Treat as a content-art surface, not a generic card variant.

### Forms

- **Inputs** — 1 px `--color-gray-200` border, `--radius-sm` corners, 12 px
  vertical / 16 px horizontal padding, `text-base` size, white background.
  Min height 40 px (md button parity).
- **Focus state** — border replaces with 2 px `--color-balluff-red`. Do not
  add a separate outline ring; the border already does the work.
- **Error state** — border becomes 2 px `--color-error` (note: error red,
  not Balluff Red — see Color § 3). Helper text below in `--color-error`,
  `text-sm`.
- **Labels** — above the input, `text-sm`, weight medium,
  `--color-gray-800`. Required-field marker in `--color-balluff-red`.
- **Disabled** — background `--color-gray-50`, text `--color-gray-400`,
  border `--color-gray-200`, cursor `not-allowed`.

### Navigation

- **Top nav** — white background, 1 px `--color-gray-200` bottom border,
  height 64 px desktop / 56 px mobile. No shadow. Logo top-left
  (web/app convention; see Logo §). Primary nav items use `text-base`,
  weight medium, `--color-gray-900`, with a hover treatment of
  `--color-balluff-red` text. Section gaps `--spacing-8` (32 px).
- **Mobile** — hamburger menu, full-screen drawer on open. The drawer is a
  card-tier surface (white, no shadow); the top bar gets `--shadow-sm`
  *only* once the drawer is open, to separate from drawer content.
- **Breadcrumbs** — `text-sm`, `--color-gray-600`, with a chevron
  separator. Current page in `--color-gray-900`, not red.
- **In-page section nav** — borrow the primary capture's pattern: a row of
  text + red arrow, separated by generous whitespace, sitting below the
  hero. No card chrome, no underline, no chips. This is the preferred
  in-page-anchor pattern for category/landing pages.

### Alerts

Use the UI state palette (Color § 3). Never use Balluff Red for alerts —
that's a brand accent, not a UX signal.

- **Container** — 1 px left border (4 px wide) in the state color, with a
  subtle background tint of the same color (~8 % opacity). Square corners,
  16 px padding, `text-sm` body.
- **Icon** — leftmost, 20 px, in the state color.
- **Title (optional)** — `text-base`, weight bold, in the state color.
- **Description** — `text-sm`, `--color-gray-900`.

States: error (`#d32f2f`), success (`#2e7d32`), warning (`#f9a825`), info
(`#6A9DC6`). The disabled-state color (`#BCBCBC`) is for inactive controls,
not alerts.

### Tables and KPI tiles

The product-family page (`examples/04-product-family-cables.jpeg`) is the
canonical table reference.

- **Tables** — white background, 1 px `--color-gray-200` row dividers
  (hairline), no vertical column dividers. `text-sm` for body cells,
  `text-sm` weight bold for header cells. Header background
  `--color-gray-50`. Row hover: `--color-gray-50`. Column padding 12 px
  vertical / 16 px horizontal.
- **Filter chips** above tables — `--radius-full`, `--color-gray-50`
  background, `--color-gray-900` text, with an "x" close in
  `--color-gray-600`. Active filter swaps to `--color-balluff-red` with
  white text.
- **KPI tile** (dashboards) — white card, 24 px padding,
  `--color-gray-600` label in `text-sm`, value in `text-3xl` or `text-4xl`
  weight bold `--color-gray-900`, optional delta in `--color-success` or
  `--color-error`. No shadow; rely on the surrounding grid gaps for
  separation.

### Hover, focus, disabled — cross-cutting guidance

- **Hover** is always subtle. Background tint shift, color darken, or icon
  arrow translate (4 px right) are appropriate; dramatic transforms or
  large shadow lifts are not.
- **Focus** uses `--color-balluff-red` consistently. For elements with a
  border (inputs, secondary buttons), the border itself becomes red and
  thickens to 2 px. For elements without a border (links, primary
  buttons), use a 2 px red outline at 2 px offset. Always wire this through
  `:focus-visible` so mouse focus doesn't display the ring.
- **Disabled** is gray-on-gray, never red. Background `--color-gray-50` or
  `--color-gray-200`, text `--color-gray-400`, no hover, cursor
  `not-allowed`. Never use Balluff Red for disabled states — red is an
  affordance signal.

## Where to find what

- **True source of truth:** brandportal.balluff.com (this document is a
  distillation, not a replacement).
- **Logos and claim variants:** `logos/`
- **Icon library** (178 Balluff-supplied web/app UI icons — directly usable
  for app and web mockups): `icons/`. Use cases indexed by `icons.md` —
  read it before picking icons.
- **Studio-backdrop reference images** (attach for image-generation prompts
  where the backdrop matters): `balluff-rooms/`
- **Fonts:** `fonts/Roboto_Flex/` — embed or load this typeface in every
  generated web/raster/print artifact; do not substitute a system font there.
  Editable `.pptx` decks are the exception: Arial / Arial Black, never
  embedded (see Typography, and
  `~/Workspaces/runbooks/build-a-balluff-deck.md`).
- **Favicons:** `favicon/` (32 / 128 / 180 / 192 / 512 px + `.ico`).
- **CSS tokens** (Tailwind v4 `@theme`, ingestable by Claude Design, v0,
  Lovable): `tokens.css`
- **Reference captures** of Balluff in production: `examples/` — start with
  `examples/MANIFEST.md`; the primary anchor is
  `examples/00-primary-optical-sensors.jpeg`.
- **Agent-prompt templates** (product hero, category landing, sales
  one-pager, marketing section, case-study card): `prompts.md`

## Audience-specific notes

- **Sales enablement** (one-pagers, decks, briefs, PDF reports): Brand
  palette dominant. Data-viz palette only inside charts. Photography from
  Balluff's brand library, with the silver-gray Balluff Room render
  attached as reference whenever a hero image is generated. Voice precise
  and number-led.
- **Web** (marketing pages, product pages, microsites): Brand palette
  dominant for content surfaces. UI state palette for forms, alerts, and
  navigation states. Data-viz palette for any embedded charts. Composition
  principles apply directly.
- **App** (interactive products, customer-facing dashboards, internal
  tools): UI state palette is load-bearing. Brand palette for chrome
  (header, navigation, branding). Data-viz palette for charts and KPIs. The
  icon library is the most directly transferable Balluff-branded UI asset
  and should be your default before you commission new icons.
