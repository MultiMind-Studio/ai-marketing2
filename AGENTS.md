# Working in ai-marketing2

This repo is the Balluff brand source that decks, sites and generated imagery build from. A wrong colour or logo here spreads to everything downstream, so changes land through review.

## How changes land

1. **Work on a branch in your own fork.** Contributors have read access to this repo, so pushing to it directly will fail. Fork it, branch from the latest `main`, and push the branch to your fork.
2. **Open a pull request against `main`.** Say what changed and why in a few lines. For a visual change (palette, logo, icon, layout rule), attach a before and after image.
3. **Rob reviews and merges.** Nobody else merges into `main`, agents included. If Rob asks for changes, push them to the same branch.

Keep each PR to one change. Fold small fixes you spot into a follow-up PR or an issue rather than this one.

## What not to commit

- Internal or customer data, pricing, or anything from Balluff systems that isn't already public brand material.
- Credentials, tokens or `.env` files.
- Generated output (`out/` is ignored for this reason).

## Sources of truth

`design.md` is the human brand doc and `brand.spec.json` the machine-readable one. When a rule changes, update `design.md`, `brand.spec.json` and `tokens.css` together in the same PR.
