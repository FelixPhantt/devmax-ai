---
name: plan-roblox-game
description: "Turns a game idea into a complete, buildable plan and then starts building it. Use when the user says \"make me a ___ type of game\", pitches a game idea, or asks what to build, how an economy should work, or how to monetize a new game."
---

# Plan a Roblox game

Do not interrogate the user. Make decisions, state them in one line each, and move on. Ask at most one question, at the end.

## The blueprint (keep it tight, bullet points only)

1. **Pitch**: one sentence, plus what the player is doing every 30 seconds.
2. **Core loop**: action -> reward -> upgrade -> repeat, with real timings (first reward within 10 seconds, first upgrade within 30-45 seconds).
3. **Systems in build order**: the smallest playable version first (MVP), then retention, then monetization, then polish. Number them.
4. **Data model**: exactly what is saved per player (currency, upgrades, inventory ids, rebirths, timestamps).
5. **Economy**: starting income, upgrade cost curve (usually 1.15x to 1.6x per level), time to first rebirth (about 20-30 minutes), and the one number that must never be exploitable.
6. **Monetization**: gamepasses (2x currency, auto-collect, VIP, extra slots), developer products (currency packs, skips, spins), and a Robux price ladder (49 / 99 / 199 / 399 / 799 / 1499). Fair for free players.
7. **Retention**: daily rewards, index or collection, rebirth, limited-time events, a reason to come back tomorrow.
8. **UI screens**: list them (HUD, shop, inventory, settings, rewards...). Offer to generate them with `devmax_ui`.
9. **Store page**: a thumbnail and icon idea, generated with the Devmax tools when the user agrees.

## Genre notes (use what fits, never copy a game exactly)

- **Steal / base games**: each player owns a base that earns passively; items can be taken by others; locking, alarms and a cooldown make stealing tense, not unfair. Rarity tiers drive the hype.
- **Tycoon**: droppers -> conveyor -> collector -> buy the next stage; show the next purchase as the goal at all times.
- **Simulator**: collect -> sell -> upgrade -> unlock a new zone -> rebirth; pets multiply everything.
- **Obby / tower**: checkpoints, fair difficulty ramp, skip-stage product.
- **Tower defense**: waves, placement, upgrades, a clear difficulty curve and a strong late game.
- **Gacha / anime**: hatch with transparent odds, duplicates feed upgrades, a visible collection index.

## After the plan

Start building system 1 immediately: use the Roblox Studio tools if connected to create the real scripts and instances, follow `build-roblox-game`, and tell the user exactly how to test it. Ask one question only: which system or screen to do next.
