# Examples manifest

Reference captures of Balluff brand work in the wild. All files live alongside this manifest — captured from public balluff.com pages with headless Playwright, no auth required.

A capture pass against the authenticated brandportal.balluff.com was considered and **intentionally skipped**. Brandportal's most distinctive content (Balluff Room renders, bespoke art-directed promo compositions) is flagged in `../design.md` as "not reproducible from prose" — capturing them as references invites imitation, which is the wrong outcome. Brandportal's other role as the raw-asset library is already fulfilled: `../icons/`, `../logos/`, and `../fonts/` were sourced from brandportal directly. Re-open this if a future need (e.g., print/deck templates) makes a brandportal pass valuable.

## How to read these examples — important

**These are feel references, not design targets.** The job is to keep the Balluff feel and improve the design, not duplicate balluff.com pixel-for-pixel. The site has uneven quality; some captures are better evidence than others.

**Primary reference: `00-primary-optical-sensors.jpeg`.** Among these captures it best represents what good Balluff web design looks like — restrained, hierarchical, confident use of white space, dramatic dark promo cards as accent. Anchor design decisions to this page first; treat the other captures as supporting evidence for specific patterns (filter tables, hero compositions, support hubs) rather than as quality benchmarks.

**Use these examples for:**

- **Color application** — where Balluff Red appears (CTAs, filter-active state, accents only), where it does not, and how the dark gray + white + Balluff Red system holds across surfaces.
- **Typography rhythm** — heading weight relative to body, eyebrow-tag treatment, how H1/H2/H3 cascade within a section.
- **Spacing and section rhythm** — how much vertical breathing room between sections, how dense vs. airy each surface tends to be.
- **Component anatomy** — hero card-on-image overlay, eyebrow + H1 + lede + red link with arrow, 4-up advantages row, filter chip + range slider + radio refinement, SKU table layout, tile grid proportions, footer column structure.
- **Borders, radii, elevation** — corner story (mostly square, occasional small radius), shadow vocabulary (subtle, on white), divider rules.

**Do NOT take these as canonical for:**

- **Specific photography or imagery** — the photos in these captures are illustrative, not authoritative. Apply the imagery rules in `../design.md` (the 5-layer composition stack, Balluff Room renders, application photography conventions). Do not try to recreate or imitate any specific photo here.
- **Copy / messaging** — campaign copy, event names, product launch language, dates, and pricing are all ephemeral. Ignore the words; honor the structure.
- **Pixel-exact layout** — column counts, gutter widths, exact font sizes are reference points, not hard targets. If a better layout serves the same hierarchy, prefer it.
- **Quality floor** — some captured pages show legacy patterns or weak visual design. Claude Design should match or **exceed** what's shown, never settle for the median page on balluff.com.

**One-line summary for AI tools:** treat these examples as the brand's **vocabulary** (colors, weights, components, rhythm) — not its **sentences**.

## Per-entry fields

Every entry below records:

- **source-url** — exact URL captured.
- **capture-date** — ISO date of capture.
- **artifact-type** — what kind of brand surface (web/print/render/component).
- **why-this-matters** — what design decision this example informs.
- **usage-notes** — gotchas for AI tools consuming this example (date sensitivity, regional variant, marketing campaign vs. evergreen, etc.).

## File naming

`{nn}-{section}-{descriptor}.{png|jpeg}` where `nn` orders captures roughly by surface (homepage → product → support). Lowercase kebab-case.

## Capture conventions

- Headless Playwright at viewport **1440 × 900** (typical desktop).
- Default to **full-page JPEG quality 90**, since the goal is design reference, not pixel-perfect inspection. Viewport-only PNG is reserved for hero shots where viewport-fold framing is itself the example.
- Cookie/consent banners that appear may obscure footer captures. Re-capture if a banner is in frame.
- Pages contain campaign/event content (e.g. "Automate 2026") that ages out — see `usage-notes` per entry.

---

## Captures

### 00-primary-optical-sensors.jpeg — **PRIMARY REFERENCE**

Also available as viewport-only PNG: `00-primary-optical-sensors-viewport.png`.

- **source-url:** https://www.balluff.com/en-us/products/areas/A0001/groups/G0103
- **capture-date:** 2026-04-27
- **artifact-type:** web — product group / category landing page
- **why-this-matters:** This is the cleanest, most disciplined page on balluff.com — the canonical "what good looks like" for a category landing surface. Anchor design decisions to this first.
  - **Restrained hero.** H1 ("Optical sensors") + single-line lede on pure white. No hero image, no card overlay, no carousel — confidence through whitespace. Breadcrumb above (Homepage › Products › Sensors › Photoelectric sensors). This is the hero treatment to prefer when the page has substantive content below.
  - **Section nav as a soft horizontal rule.** Five inline links with red arrow icons (Product portfolio | Product guide | Application examples | Product innovations | Contact Us) — replaces in-page anchors with a visible "table of contents" without using a heavy nav bar. Reusable pattern.
  - **2-column subcategory grid with hairline dividers.** 12 tiles (Diffuse / Retroreflective / Through-beam / etc.), each tile = product image left + title + 2-line descriptor right, square corners, **only hairline rules separating rows** — no shadows, no borders, no backgrounds. Lightest possible card treatment. This is the canonical Balluff "list of things" surface.
  - **CTA band on muted blue-gray.** Single-line label + right-aligned arrow link, low-contrast surface — used as a quiet handoff to a deeper resource ("Product guide for object detection").
  - **Two side-by-side dark dramatic promo cards.** "A NEW SPECIES OF FORK SENSORS" (dark with red laser accents) and "PRECISE — object detection" (near-black with subtle illumination). These are the most visually striking blocks on balluff.com and represent the brand at its most confident — monochrome industrial photography, dramatic lighting, restrained typography. **Use this as the model when the spec asks for visual emphasis.**
  - **Application examples as a clean accordion.** Plain expand/collapse rows, no card chrome, no icons. Maximum content-density, minimum visual weight.
  - **"New products in focus" 4-up card grid + dark CTA band + "you may also be interested" related grid.** Standard supporting blocks; consistent with the rest of the site.
- **usage-notes:** This is a **category landing page**, not a SKU listing. For the canonical SKU table pattern (filters + paginated table + price/spec columns), use `04-product-family-cables.jpeg`. For long-form editorial / pillar pages, use `05-focus-topic-iolink.jpeg`. The two dark promo cards on this page contain bespoke art direction — do not try to reproduce; reference the composition and lighting concept only.

### 01-homepage-fullpage.jpeg

- **source-url:** https://www.balluff.com/en-us
- **capture-date:** 2026-04-27
- **artifact-type:** web — homepage, full scroll
- **why-this-matters:** Top-down view of the homepage information architecture: hero rotator → product-guide CTA band → 3-up product recommendation cards → "In focus" tabbed grid → highlights carousel → "My Balluff" service hero → discover grid → benefits row → footer with newsletter CTA. Single best reference for the overall page rhythm and section spacing.
- **usage-notes:** Hero panel 3 / 6 ("Automation made easy – Our Entry Line") was active at capture; rotator content rotates per visit and over time. Treat hero copy as ephemeral, hero composition as canonical.

### 02-homepage-hero-viewport.png

- **source-url:** https://www.balluff.com/en-us
- **capture-date:** 2026-04-27
- **artifact-type:** web — hero composition (above the fold)
- **why-this-matters:** Canonical hero treatment: dark monochrome product photo bleeds full-bleed left, dark gray translucent eyebrow card sits right of center with eyebrow ("Entry Line"), H1, single-paragraph subhead, red-accent "Learn more" link with arrow. Logo is **top-left** here (overrides brand-portal top-right preference, per `../design.md` Logo §). Floating red support bubble, bottom-right.
- **usage-notes:** Captures pagination dots and floating support widget — both are real homepage furniture, not artifacts of the screenshot.

### 03-product-overview-grid.jpeg

- **source-url:** https://www.balluff.com/en-us/products
- **capture-date:** 2026-04-27
- **artifact-type:** web — product taxonomy index
- **why-this-matters:** Despite the name "Products," this is a **list of 10 product categories**, not a card grid of SKUs. Each row pairs a small product image with the category name and a chevron — minimal, single-column, generous whitespace. Good reference for low-density navigational pages where aesthetic restraint is more important than density.
- **usage-notes:** If you need an example of a real product card grid (multi-column, image + spec), use `04-product-family-cables.jpeg` instead.

### 04-product-family-cables.jpeg

- **source-url:** https://www.balluff.com/en-us/products/dynamic/Z01A01
- **capture-date:** 2026-04-27
- **artifact-type:** web — product family / filterable catalog
- **why-this-matters:** This is the **canonical SKU table pattern**: hero image + value-prop on the right, then a quick-filter row (chips with x-close), then a four-column refinement panel (range slider + radio groups), then a paginated SKU table with order-code thumbnails, price (USD), and spec columns. Red is reserved for filter-active state and the primary "Add to shopping cart" CTA. This is the working reference for any data-table / e-commerce-grid component work.
- **usage-notes:** Filter state (length 5m, M12x1, PUR) was pre-applied by the URL — this is the filtered view, not the empty state.

### 05-focus-topic-iolink.jpeg

- **source-url:** https://www.balluff.com/en-us/focus-topics/io-link-the-ideal-solution
- **capture-date:** 2026-04-27
- **artifact-type:** web — long-form focus topic / pillar page
- **why-this-matters:** Long-form editorial pattern: bold H1 + lede over a "Balluff Room" hero render (silver-gray architectural composition, abstract red wave overlay — see `../design.md` Imagery §), then alternating 2-up image-rich sections with red-accent CTAs, embedded application photography, a CTA band on a Balluff-Room background, and a "you may also be interested in" related-topics block. Best reference for any pillar-page / focus-topic build.
- **usage-notes:** Render in the hero is a bespoke Balluff Room — not reproducible by image generators (see `../design.md` Imagery §). For prompts, describe the surface but reference an existing render.

### 06-product-detail-smartlight.jpeg

- **source-url:** https://www.balluff.com/en-us/news/smartlight-rigid-compact-bright-versatile
- **capture-date:** 2026-04-27
- **artifact-type:** web — product / news detail
- **why-this-matters:** Product detail layout: H1 + subhead, full-width product hero photo on dark background, **"Your advantages at a glance" 4-up icon-card row** (the canonical Balluff feature-row pattern), descriptive prose, application photo + bullet pairs, **product variant chip selector** (BNI00LU / BNI00LP / BNI00LR / BNI00LT), then a spec table with vertical labels and a red "Add to shopping cart" CTA. Strong reference for tech-feature presentation.
- **usage-notes:** Lives under `/news/`, not `/products/` — Balluff treats product launches as news posts. Date-stamp at top is real; older news posts may have stale layouts.

### 07-service-support.jpeg

- **source-url:** https://www.balluff.com/en-us/service-support
- **capture-date:** 2026-04-27
- **artifact-type:** web — service & support hub
- **why-this-matters:** Service-page conventions: bilingual toggle, search-box prominent at top, **3-up support persona cards** (Direct chat / Send query / Complete an inquiry — each with a real photographed staff portrait), then horizontal section nav, then two side-by-side info blocks (multi-download + YouTube tutorial), product-guide 4-up grid, services 5-up grid, event-calendar CTA band, related-topics, FAQ accordion, route-to-us mini-map, and newsletter CTA band. Single best reference for how Balluff blends self-service info with human-photographed reassurance.
- **usage-notes:** Newsletter CTA appears twice (mid-page band and footer) — that's intentional, not an artifact.

### 08-industries-overview.jpeg

- **source-url:** https://www.balluff.com/en-us/industries
- **capture-date:** 2026-04-27
- **artifact-type:** web — segment / industry overview
- **why-this-matters:** **17-tile industry grid** in a 4-column responsive layout, each tile = photo + title + one-line descriptor. Demonstrates Balluff's industry photography style (real factories, real people, occasional red wave overlay) and tile aspect ratio. Hero above the grid uses the same eyebrow / H2 / lede / red CTA + carousel-thumbnail pattern as the homepage.
- **usage-notes:** Captures imagery diversity — Life Science (lab coats), Steel & Metallurgical (foundry glow), Mobile Equipment (woman engineer in workshop), Energy Production (silhouettes against turbines). Good when reviewing **what counts as on-brand application photography** for a given segment.

