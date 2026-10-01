---
name: roblox-monetization
description: Gamepasses, developer products, premium payouts and fair monetization for Roblox games, implemented safely. Use when adding a shop, Robux purchases, VIP, boosts or starter packs.
---

# Roblox monetization

## Implementation

- **Developer products** (repeatable: currency, boosts, spins): handle in one `MarketplaceService.ProcessReceipt` on the server. Look up the product id in a table of handlers, grant, save, and only then return `PurchaseGranted`. Record `receiptInfo.PurchaseId` in the player's data so a retried receipt never grants twice. If the player left or saving failed, return `NotProcessedYet`.
- **Gamepasses** (permanent perks): check `UserOwnsGamePassAsync` on join (pcall, cache the result), and listen to `PromptGamePassPurchaseFinished` to grant immediately.
- Prompt purchases from the client, but every grant happens on the server.

## What sells (without making the game worse)

- A starter pack shown once after the first few minutes of real play.
- Time savers and convenience (2x speed, auto-collect, extra storage) over pay-to-win power.
- Cosmetic flair: trails, auras, pet skins, name tags.
- Limited-time offers with a real timer and a clear value comparison.
- VIP gamepass with several small perks and a visible badge/chat tag.
- Group rewards ("join the group, like the game") for free players.

## Checklist

- Every product id lives in one config module.
- Test purchases in Studio (they are free there) including leaving mid-purchase and rejoining.
- Never sell something that breaks the game for free players.
