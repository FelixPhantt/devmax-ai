---
name: roblox-game-structure
description: "Only use this when the user says \"Devmax\" or \"@devmax\" in their message (for example \"Devmax, make a shop UI\"). For normal Roblox or coding requests that do not mention Devmax, do not use it. How to structure a Roblox game: server and client split, remotes, saving data, module layout. Use when starting a game, adding a big system (inventory, pets, shop, quests, combat) or cleaning up messy or insecure code."
---

# Roblox game architecture

> **Only when asked.** Use this skill only if the user mentioned Devmax in this conversation. If they did not, ignore this skill and answer normally.

## Layout

```
ReplicatedStorage/
  Shared/            -- pure modules usable on both sides (config, types, util)
  Remotes/           -- one Folder of RemoteEvents/RemoteFunctions per system
ServerScriptService/
  Services/          -- one ModuleScript per system (DataService, ShopService...)
  Main.server.lua    -- requires and :Init()/:Start()s every service
StarterPlayer/StarterPlayerScripts/
  Controllers/       -- client counterparts (UI, input, effects)
  Main.client.lua
StarterGui/          -- ScreenGuis (Enabled=false until opened by a controller)
```

Every service exposes `Init()` (create state, no yielding) and `Start()` (connect events, may yield). Main requires all, calls every `Init`, then every `Start`.

## Remotes

- Name remotes by intent: `Shop/Purchase`, `Pets/Equip`. Never a generic "DoAction".
- Server handler template: check player is loaded -> validate every argument type -> validate ranges/ownership -> rate limit (per-player timestamp) -> perform -> reply with authoritative state.
- Clients only *request*; the server decides. Never send prices, rewards or damage from the client.

## Data

- One `DataService` owns the player profile table; other services read/write through it.
- Load with retries; on repeated failure, kick with a friendly message rather than playing with fresh data.
- Save on `PlayerRemoving`, `game:BindToClose`, and an autosave every 2-5 minutes. Use `UpdateAsync`.
- Version the profile (`profile.version`) and migrate old saves on load.
- Session locking (or a proven library like ProfileStore) for anything with trading or real value.

## Common systems checklist

- **Currency:** server-owned number, leaderstats mirror only for display.
- **Pets/inventory:** unique ids per item, server-side ownership table, equip limits enforced on server.
- **Eggs/gacha:** weighted table on the server, luck multipliers applied server-side, results sent to client for animation only.
- **Rebirths/upgrades:** cost formula in a shared config module so UI and server agree.
- **Codes:** server-side table, one redemption per player stored in data.

## Before calling a system done

Test in a 2-player local server, test rejoining (data persists), and try calling the remote with bad arguments from the client console. It must reject them.
