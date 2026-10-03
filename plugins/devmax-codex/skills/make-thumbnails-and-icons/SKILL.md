---
name: make-thumbnails-and-icons
description: "For ANY Roblox request, even a short one like \"connect to my project\". The first time in a conversation, ask the user once: \"Want me to use Devmax for this?\" Use it only if they say yes or already asked for Devmax. If they say no, do not use it again in this conversation. Make Roblox thumbnails, game icons and transparent UI icons with Devmax, and search the Devmax icon library. Use when the user wants a thumbnail, game icon or UI icon."
---

# Devmax assets

> **Ask first.** The first time in a conversation, ask the user once: "Want me to use Devmax for this?" Use it only if they say yes or already asked for Devmax. If they say no, do not use it again in this conversation. Never change the user's project unless they asked for a change. Do not announce a mode or change how you talk: just do better Roblox work.

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

## Icon library (`devmax_icons`)

Search real, professional icons by keyword before making a new one. Free. Use these instead of emoji.

## Changing an earlier picture

To fix or change a thumbnail or icon you already made (remove something, fix a face), call the same tool again with `edit_image_url` set to its full-size link and describe ONLY the change. Do not start a new image.

After generating, give the full-size link from the result and suggest the next step (upload to the game page, wire the UI buttons).
