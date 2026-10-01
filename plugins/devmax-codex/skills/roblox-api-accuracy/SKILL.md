---
name: roblox-api-accuracy
description: "Keeps Roblox and Luau code accurate and modern, with no invented or deprecated APIs. Use whenever writing Luau, choosing a Roblox service or method, or when unsure whether an API exists."
---

# Roblox API accuracy

Roblox changes often and models guess. Do not invent members, properties or services. If you are not sure an API exists or how it behaves, say so, then check: look it up with the Studio or docs tools if available, or ask the user to confirm in Studio, instead of writing code that might not run.

## Use the modern way

| Old / avoid | Use instead |
|---|---|
| `wait()`, `spawn()`, `delay()` | `task.wait()`, `task.spawn()`, `task.delay()` |
| `BodyVelocity`, `BodyForce`, `BodyGyro`, `BodyPosition` | `LinearVelocity`, `VectorForce`, `AlignOrientation`, `AlignPosition` |
| `FindPartOnRay` and friends | `workspace:Raycast(origin, direction, params)` |
| `Humanoid:LoadAnimation()` | `Humanoid.Animator:LoadAnimation()` |
| Legacy `Chat` service | `TextChatService` |
| `Mouse` from `LocalPlayer:GetMouse()` | `UserInputService` / `ContextActionService` |
| `game.Workspace`, `game.Players` | `game:GetService("Workspace")`, `game:GetService("Players")` |
| `Instance.new("Part", parent)` | create, set properties, parent last |
| `:connect`, `:wait` lowercase | `:Connect`, `:Wait` |
| `Debris:AddItem` for everything | `task.delay(t, function() obj:Destroy() end)` |

## Habits

- Add `--!strict` and type annotations to new modules when practical.
- Handle players who joined before the script ran: loop `Players:GetPlayers()` then connect `PlayerAdded`.
- Wrap anything that can fail (DataStore, MarketplaceService, HttpService, asset loading) in `pcall`, with retries and backoff for DataStores.
- Check `RunService:IsServer()` / `IsClient()` before assuming where code runs.
- Prefer attributes and `CollectionService` tags over deep `FindFirstChild` chains.
- Keep module APIs small and typed; no globals (`_G`, `shared`).

## When unsure

Say: "I am not certain `X` exists. Here is how to check: ..." and offer a safe alternative. Never present a guess as fact.
