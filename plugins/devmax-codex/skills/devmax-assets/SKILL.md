---
name: devmax-assets
description: How to get great results from the Devmax tools (devmax_thumbnail, devmax_icon, devmax_vector, devmax_ui) and how they are billed. Use whenever the user wants a thumbnail, icon, UI icon or UI screen.
---

# Devmax assets

All Devmax tools spend the user's Devmax credits. Confirm the idea in one line before generating, generate one at a time, and show the result. If a tool says Devmax is not connected, tell the user to press Connect for Devmax in their app, then Allow on the Devmax page.

## Thumbnails (`devmax_thumbnail`)

Give the game's hook, not a scene list. Devmax plans the shot like a GFX artist.
- Good: "Grow a giant strawberry elephant pet by feeding it" / "Day 1 vs Day 100 of a mining simulator" (+ `split: true`).
- Use `title_text` only for a short number/price hook ("$999M+", "1/9.2B"). Never the game name.
- `first_person: true` when the hands/interaction are the hook.

## Icons (`devmax_icon`)

One hero subject, readable at tiny size. Describe the game's main creature/item/character.

## UI icons (`devmax_vector`)

Transparent PNG stickers for ImageLabels: coins, gems, potions, eggs, pets. One object per call.

## UI screens (`devmax_ui`)

Short prompts work: "daily rewards 7 days", "anime units inventory with filters", "studded pet index". Styles: `studded` (simulator), `anime` (ribbon banner, rarity cards), `clean`. Needs Devmax+ (10 credits). The result has every word as a live TextLabel; import it with the Devmax Studio importer.

After generating, give the full-size link from the result and suggest the next step (upload to the game page, wire the UI buttons).
