# Balluff icon library — usage index

178 SVGs in [icons/](icons/). Sourced from brandportal.balluff.com 2026-04-27. Filenames in this doc are without the `.svg` extension.

## Confidence disclaimer — read first

This doc was assembled by an LLM working from filenames + the SVG XML source + a low-resolution contact sheet rendering. **The categorizations and synonym mappings are filename-pattern-matched, not visually verified per icon.** Treat them as a starting taxonomy, not a verified one. A consuming tool with image-rendering and visual-grounding capability (Claude Design, Stitch, etc.) should do its own pass before relying on any specific assignment in the lower half of this doc.

What IS verified from source:
- Style consistency across the set (line art, single dark fill, ~1.5px stroke)
- Technical constraints below
- File inventory

What is NOT verified per icon:
- That `circles-alter-attention` is the right "warning" pick over its sibling `circles-alter-attention-1`
- That `circles-deactivate` reads as "destructive" vs. "power off"
- The use-case category each icon is filed under
- The synonym mappings

## Technical constraints (verified)

- **viewBox is `0 0 70 50` — landscape 7:5, not square.** Most icon libraries are square (24×24, 16×16). Plan layout accordingly. If a square slot is required, render with `preserveAspectRatio="xMidYMid meet"` and accept letterboxing, or pre-process SVGs to crop the empty space and rewrite the viewBox.
- **Default fill is dark warm gray — not Balluff black `#1d1d1b`.** Four near-identical hex values appear across the set (likely brand-portal export inconsistency, not deliberate variation):

  | Color      | Files | Form                                          |
  |------------|------:|-----------------------------------------------|
  | `#333`     | 87    | `<style>` block (`.cls-1{fill:#333}`)         |
  | `#333233`  | 53    | inline `style="fill:#333233"` on paths        |
  | `#323232`  | 36    | inline `style="fill:#323232"` on paths        |
  | `#343434`  | 6     | both forms — calendar-plus, calendar-real-time, entry-line, software, users, voucher-apply |

  File counts overlap because some icons mix forms; 279 fill rules total across 178 files.

- **Recoloring strategy.** When inlined into HTML, the `<style>`-block fills recolor via outer CSS through normal selector specificity; inline-styled fills need `!important` or attribute-targeted overrides. For Claude Design and other Opus-class consumers this is fine — they handle inline styles intelligently. For tools that need the whole set to behave like Lucide/Heroicons (parent's `color` propagates to fill), the opt-in preprocess below works on a copy. **Don't run this against the source** — keep `icons/` faithful to the brand-portal export so future re-imports diff cleanly.

  ```bash
  # Run on a COPY of icons/, not the source.
  sed -i '' \
    -e 's/#333233/currentColor/g' \
    -e 's/#323232/currentColor/g' \
    -e 's/#343434/currentColor/g' \
    -e 's/#333/currentColor/g' \
    icons-copy/*.svg
  ```

  Order matters: `#333` is a prefix of `#333233`, so the longer match has to run first.
- **Style is uniformly line-art / single-stroke**, similar in feel to Lucide or Phosphor. Mixing in icons from another library will read as off-brand.

## File inventory (factual)

All 178 filenames, alphabetical:

```
acting-together, airplane, all-in-one-package, angle-down, angle-left, angle-right,
angle-up, apple, arrow-accordion-closed, arrow-accordion-open, arrow-back, arrow-down,
arrow-forward, arrow-link-list, arrow-up, basic-statistics, battery-driven, book,
bottle, calendar-plus, calendar-real-time, car, chip, christmas-candy-cane,
christmas-hat, christmas-present, christmas-sock, circles-alter-attention,
circles-alter-attention-1, circles-bullet-point-check, circles-clear-input,
circles-clock, circles-deactivate, circles-discount, circles-info-details,
circles-input-info, circles-play-home, circles-star-bestseller, clean,
cloud-independent, cloud, collect-data, communication-chat, communication-contact,
communication-language, communication-mail, communication-phone, communication-print,
communication-social-media, conference, cup-of-coffee, current-voltage-monitoring,
customizing, cycle, desk, dishes, dishwashing-machine, displacement-and-distance,
drinking-bottle, easy-to-get-started, easy-to-use, electrician, entry-line, explain,
factory, files-software-data-sheet, files-software-documents, files-software-jpg,
files-software-mp4, files-software-pdf, files-software-png, files-software-ppt,
files-software-request-offer, files-software-unknown, files-software-xls,
files-software-zip, film-flap, flexible, flow-rate, fridge, group, growth, handshake,
high-voltage, humidity, led-diagnosis, logic-blocks, meeting, microwave,
miniaturization, mobile-data-transmission, nature, network, oil-quality,
operating-hours-counter, operating-start-counter, paragraph,
peak-energy-of-high-frequency-signal-components, people-retention, people-speak,
people-speaker, people-user-management, people-user, pin-setting, plug-and-play,
power-switch, preconfigured, pressure, product-consideration, recognition-of-devices,
recycling, robot, room, screen, shower, signal-delay, signal-quality, simple-add,
simple-close, simple-copy, simple-download, simple-folder-download,
simple-save-changes, simple-select, simple-share, simple-switch, simple-upload,
software, speed, status-of-extreme-environmental-conditions, suitcase, sustainability,
switch-counter, target, temperature, tilt-angle, timer, train, tree-2, tree, users,
vacuum-suitability, various-admin, various-awareness, various-calendar-date,
various-calendar, various-camera, various-cart, various-change-configuration,
various-coming-soon, various-composition-check, various-composition-text-people,
various-composition-text, various-composition, various-create-added-value,
various-dark-light-mode, various-delivery, various-edit, various-food-steps,
various-forward-looking, various-heart, various-hide, various-lock, various-main,
various-maintenance, various-micro, various-performance, various-product-finder,
various-search, various-several-gear-wheels, various-show, various-wallet, vibration,
voucher-apply, washing-machine, waste-garbage-can, waste-sorting, wet-floor
```

## Filename-derived groupings (unverified — starting taxonomy only)

The groupings below are inferred from filenames, not from visual inspection. Use them as a first-pass narrowing of the search space; verify the actual glyph before relying on it.

### Likely navigation (chevrons, arrows)
`angle-{down,up,left,right}` · `arrow-{down,up,back,forward}` · `arrow-accordion-{open,closed}` · `arrow-link-list`

### Likely status / feedback (circle-bounded)
`circles-info-details`, `circles-input-info`, `circles-alter-attention`, `circles-alter-attention-1`, `circles-bullet-point-check`, `circles-deactivate`, `circles-clear-input`, `circles-clock`, `circles-discount`, `circles-star-bestseller`, `circles-play-home`

### Likely UI actions (`simple-*` family)
`simple-{add,close,copy,download,folder-download,save-changes,select,share,switch,upload}`

### File types
`files-software-{pdf,png,jpg,mp4,ppt,xls,zip,data-sheet,documents,unknown,request-offer}`

### Communication
`communication-{chat,mail,phone,print,contact,language,social-media}` · `people-speak` · `people-speaker` · `people-retention`

### People
`people-user`, `people-user-management`, `users`, `group`, `handshake`, `conference`, `meeting`

### Time / scheduling
`various-calendar`, `various-calendar-date`, `calendar-plus`, `calendar-real-time`, `timer`, `circles-clock`

### Commerce
`various-cart`, `various-wallet`, `various-delivery`, `voucher-apply`, `circles-discount`, `various-product-finder`

### Settings / tools / admin
`various-admin`, `various-edit`, `various-search`, `various-several-gear-wheels`, `various-change-configuration`, `target`, `various-maintenance`, `customizing`

### View / show / hide / lock
`various-show`, `various-hide`, `various-lock`, `various-dark-light-mode`

### Sentiment / engagement / brand-feel
`various-heart`, `various-awareness`, `various-forward-looking`, `various-create-added-value`, `various-performance`, `various-main`, `various-camera`, `various-micro` (likely microphone), `various-coming-soon`

### Sustainability / environment
`nature`, `tree`, `tree-2`, `sustainability`, `growth`, `recycling`, `waste-garbage-can`, `waste-sorting`, `clean`

### Transport
`airplane`, `car`, `train`

### Likely Balluff sensor / industrial domain
`temperature`, `humidity`, `pressure`, `vibration`, `flow-rate`, `tilt-angle`, `displacement-and-distance`, `signal-quality`, `signal-delay`, `current-voltage-monitoring`, `oil-quality`, `peak-energy-of-high-frequency-signal-components`, `status-of-extreme-environmental-conditions`, `vacuum-suitability`, `operating-hours-counter`, `operating-start-counter`, `switch-counter`, `led-diagnosis`, `recognition-of-devices`, `factory`, `robot`, `chip`, `network`, `software`, `logic-blocks`, `screen`, `pin-setting`, `collect-data`, `cloud`, `cloud-independent`, `mobile-data-transmission`, `power-switch`, `high-voltage`

### Likely brand-attribute icons (paired with feature claims)
`acting-together`, `customizing`, `flexible`, `easy-to-use`, `easy-to-get-started`, `all-in-one-package`, `plug-and-play`, `preconfigured`, `miniaturization`, `battery-driven`

### Domestic / lifestyle (filename-inferred — context unclear)
`apple`, `bottle`, `drinking-bottle`, `cup-of-coffee`, `dishes`, `dishwashing-machine`, `fridge`, `microwave`, `shower`, `washing-machine`, `cycle`, `desk`, `room`, `suitcase`, `book`, `film-flap`, `paragraph`

## Flags (filename-derived)

- **`christmas-{candy-cane,hat,present,sock}`** — seasonal. Filename is unambiguous; don't pull these into year-round work.
- **`entry-line`** — likely the Balluff Entry Line product family, not a generic icon. Verify before using in non-Balluff-product contexts.
- **`wet-floor`** — likely a safety / facility-warning icon. Niche outside those contexts.

## Coverage gaps (filename-derived; consuming tool should verify by render)

Common UI icons whose filenames don't appear in this set — you may need to fall back to Lucide or another library:
- Hamburger / menu (three lines)
- Bell / notification
- Bookmark
- Tag / label
- Map pin / location pin
- Filter / funnel
- Sort / reorder
- Credit card
- Trophy / award

## For future LLM sessions — enrich this doc as you discover things

This document is a living scaffold, not a finished reference. If you render an icon and confirm what it depicts, fix any wrong categorization here. If you find that `circles-deactivate` is actually a power-off symbol rather than a destructive-action one, update the entry. If you discover the difference between `circles-alter-attention` and its `-1` sibling, document it. If you commission new icons or replace existing ones, update the inventory and flag the change with a date.

Specific upgrades worth making when capability allows:
- Replace filename-derived groupings with visually-verified ones, and remove the "unverified — starting taxonomy" disclaimer for sections you've validated.
- Add a per-icon one-line description (what it actually depicts) — at least for the ambiguous and domain-specific ones.
- Confirm or refute the coverage-gap list by attempting each pick.
- Note any icons that turn out to be redundant or visually identical despite different filenames.

The goal is that the next session reading this doc trusts it more than the previous session did. Compound the verification work — don't redo it. Date your additions inline so later readers know what's recent.

## Recommended consumption pattern

1. Apply the `currentColor` preprocess (see Technical constraints) so the whole set is CSS-recolorable.
2. When picking an icon for a use case, narrow via the filename groupings above, then **render the candidates and visually verify** before finalizing the choice. Filenames disambiguate the easy cases; they don't disambiguate `circles-alter-attention` vs `circles-alter-attention-1`, or whether `circles-deactivate` reads as "destructive" or "off."
3. For consumer-facing customer artifacts, prefer the `simple-*`, `communication-*`, `circles-*`, and `arrow/angle-*` families — these are unambiguously UI-targeted by their naming. The `various-*` family is broader and less internally consistent.
