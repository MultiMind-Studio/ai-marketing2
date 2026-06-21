# Agent prompts

Canonical, copy-paste prompts that bake in Balluff's brand rules for AI
design tools (Claude Design, Claude Code, v0, Lovable, Stitch). Each prompt
references `design.md`, `tokens.css`, and the captures in `examples/` —
attach those when invoking. Placeholders are in `{braces}`.

These prompts encode the non-negotiables — left-aligned headings,
achromatic surface with Balluff Red as condiment, square corners, generous
whitespace, the 5-layer imagery stack, and the primary capture
(`examples/00-primary-optical-sensors.jpeg`) as the canonical "what good
looks like" reference.

---

## 1. Product hero

For a single product family or SKU, generate the above-the-fold hero.

```
Generate a Balluff web hero section for {product family}, for example:
"{e.g., BES inductive sensors — Entry Line}".

Rules to follow:
- Read design-system/design.md (especially Color, Typography, Composition,
  Components → Hero/promo card) and tokens.css for tokens.
- Reference examples/00-primary-optical-sensors.jpeg for the restrained
  hero pattern (no card overlay, just H1 + lede on white). For dramatic
  product photography heroes, reference the dark promo cards in that same
  capture or examples/02-homepage-hero-viewport.png.
- Achromatic surface; Balluff Red only on the CTA arrow link.
- Left-aligned heading. H1 in --text-5xl bold; subhead in --text-2xl
  regular, --color-gray-800.
- Logo top-left.
- Whitespace is generous; don't fill empty regions.
- Roboto Flex throughout.

Output: a single HTML file that uses tokens.css. Render at 1440px width.
Include {brand-relevant photo description} as the product image, or use a
neutral placeholder labeled "Balluff Room render — to be replaced."
```

---

## 2. Category landing page

For a product category or topic group, generate a full landing page in the
restrained-and-confident style of the primary capture.

```
Generate a Balluff category landing page for {category}, for example:
"{e.g., Industrial RFID systems}".

Anchor the design tightly to examples/00-primary-optical-sensors.jpeg.
This is the canonical "what good looks like" for this surface.

Required sections, in order:
1. Breadcrumb (gray-600, --text-sm).
2. Restrained hero — H1 + one-line lede on pure white. No image.
3. Section nav as a soft horizontal rule — 4–6 inline links with red
   right-arrow icons, no chips, no cards. Section gaps via --spacing-12.
4. Lead paragraph (H2 + body text) introducing the category.
5. 2-column subcategory grid — each tile = product image left + title +
   2-line descriptor right. Hairline rules between rows; no shadows; no
   borders; --radius-none. Generate {number} tiles.
6. Optional CTA band on --color-gray-50 background, single-line label +
   right-aligned arrow link.
7. Optional 2-up dramatic dark promo cards for visual emphasis (see
   examples/00-primary for the pattern).
8. Application examples as a clean accordion — no card chrome.
9. "New products in focus" 4-up card grid.
10. Footer with newsletter CTA (red primary button).

Use design-system/tokens.css. Use Roboto Flex. Logo top-left. Achromatic
surface; red only on CTAs and active states.
```

---

## 3. Sales one-pager (PDF)

For a vertical or application-specific sales artifact.

```
Generate a Balluff sales one-pager for {audience} on {topic}, for example:
"{e.g., automotive plant managers, on condition monitoring with
IO-Link}".

Rules to follow:
- Read design-system/design.md (especially Color, Audience-specific notes
  for sales enablement, Composition, Imagery) and tokens.css.
- Format: A4 portrait, 2 columns or 1+2 asymmetric split.
- Logo top-right (print/deck convention; design.md Logo §).
- Brand palette dominant; data-viz palette only inside any chart.
- Voice: precise and number-led. Lead with the customer outcome, support
  with 2–3 capability bullets, close with a clear next step.
- Imagery: pair one product photo with one application photo from
  Balluff's brand library. Use a render from `balluff-rooms/` as the
  hero background where applicable.
- Footers are quiet — author/date/page in low-contrast type.

Output: a single-page PDF (or HTML+print CSS). Headings left-aligned.
```

---

## 4. Marketing page section

For dropping a section into an existing page or larger flow — useful when
the team wants a focus-topic block, an application showcase, or a
product-comparison band.

```
Generate a Balluff marketing page section for {topic}, for example:
"{e.g., predictive maintenance with vibration sensors}".

Rules to follow:
- Read design-system/design.md and tokens.css.
- Reference examples/05-focus-topic-iolink.jpeg for the alternating
  2-column editorial pattern when content is long-form, or
  examples/00-primary-optical-sensors.jpeg for shorter, more restrained
  treatments.
- One section, not a full page. ~600–900 px tall at desktop width.
- Left-aligned H2 + lede, then either a 2-up content block, a 3-up icon
  feature row ("Your advantages at a glance" pattern from
  examples/06-product-detail-smartlight.jpeg), or a single 1+1 image-text
  asymmetric split.
- One primary CTA (red tertiary text+arrow); no second CTA in this
  section.
- Imagery: respect the 5-layer composition stack; reference Balluff Room
  + application photo where applicable.

Output: HTML fragment that drops cleanly into a page using tokens.css.
```

---

## 5. Application example / case study card

For a single dramatic-promo card in the dark-photo style of the primary
capture.

```
Generate a Balluff application-example promo card for {application}, for
example: "{e.g., precise object detection in automotive body shops}".

Rules to follow:
- Card is full-bleed dark photographic background (near-black industrial
  scene with monochrome metallic surfaces and subtle red light accents),
  white text overlay, --radius-md corner.
- All-caps eyebrow tag in --text-xs, --color-balluff-red.
- H3 in --text-2xl bold white.
- One-line descriptor in --text-base, --color-gray-50 (near-white) for
  legibility on the dark background.
- Right-arrow CTA in white at the bottom-left, label like "Learn more"
  or "Read the case".
- Card aspect ratio ~16:9 desktop; ~1:1 mobile.
- This is the dramatic-treatment surface — use it for content that
  genuinely deserves visual weight, not as a generic card variant.

Output: a single HTML+CSS component using tokens.css. Include the image
description as a placeholder comment so the customer can swap in the
real photograph.
```

---

## Notes for prompt authors

- **Always attach the captures.** Even the strongest prompt is weaker than
  a prompt + one good reference image. The primary capture
  (`00-primary-optical-sensors.jpeg`) does an enormous amount of work that
  prose cannot.
- **Resist over-specifying.** These prompts deliberately leave room for
  Claude Design to make local decisions on type sizing, exact spacing
  values, and image cropping. The brand vocabulary (colors, fonts,
  components, rhythm) is encoded in `design.md` + `tokens.css`; the prompt
  just sets the surface and the constraints.
- **Don't bake project-specific details in here.** If a project needs a
  different container width or a different CTA label convention, override
  it in the project's own prompt — keep this file canonical.
