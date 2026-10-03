---
name: roblox-debug-and-playtest
description: "For Roblox work. The first time in a conversation, ask the user once: \"Want me to use Devmax for this?\" Use it only if they say yes or already asked for Devmax. If they say no, do not use it again in this conversation. Finds the real cause of bugs in a Roblox game and proves the fix by playtesting. Use when something is broken, an error shows in Output, a script does nothing, the UI does not appear, data does not save, or \"it works in Studio but not in game\"."
---

# Debug and playtest Roblox games

> **Ask first.** The first time in a conversation, ask the user once: "Want me to use Devmax for this?" Use it only if they say yes or already asked for Devmax. If they say no, do not use it again in this conversation. Never change the user's project unless they asked for a change. Do not announce a mode or change how you talk: just do better Roblox work.

Fix the cause, not the symptom. Never hide an error with `pcall` or an `if x then` just to make the red text go away.

## Workflow

1. **Reproduce**: with Studio tools, run a playtest and read the Output. Note the exact error, script and line. If you cannot run it, ask the user for the Output text and which side (server or client) printed it.
2. **Locate**: read the script and the scripts that call it. Find the first thing that is wrong, not the last thing that failed.
3. **Explain** the cause in one or two plain sentences.
4. **Fix** with the smallest correct change. Add a temporary `print` or `assert` only if the cause is unclear, and remove it after.
5. **Verify**: playtest again, confirm the Output is clean and the behaviour is right. Say what you tested.

## Common causes

- `attempt to index nil`: an instance is not loaded yet (use `WaitForChild` with a timeout) or a name is misspelled.
- `Infinite yield possible`: something never gets created, often because it was made on the client (the server never sees it) or is under the wrong parent.
- Remote does nothing: wrong side, wrong path, name mismatch, or the server handler errors before replying.
- UI missing: `ResetOnSpawn` wiping it, `Enabled` false, parented to the wrong ScreenGui, zero size from scale math, or `ZIndex` / `ClipsDescendants` hiding it.
- Data does not save in Studio: enable "Allow API Services" in Game Settings, Security.
- Works in Studio, not live: `StreamingEnabled`, script runs before the character exists, `LocalScript` placed somewhere it cannot run, or different `PlaceId` / test mode checks.
- A loop that suddenly stops: an unhandled error inside it ends the thread; wrap the body in `pcall` and log, or restructure.

## Rules

- State what you actually saw and ran. If you could not test something, say so.
- After a fix, check that you did not break the neighbouring feature.
