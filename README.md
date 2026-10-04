# Devmax for Claude and Codex

Make Claude and Codex better at Roblox.

Devmax adds Roblox know-how and a few extra abilities to the AI you already use. It asks once before it helps, so it never gets in the way of normal coding.

## What it does

- **Roblox rules and checks.** Secure remotes, safe DataStores, clean game structure, modern Luau, exploit and lag reviews, debugging.
- **Thumbnails and icons.** Professional Roblox thumbnails, game icons and transparent UI icons, shown in your chat. You can change an earlier one with a short message. Uses your Devmax credits.
- **Icon library.** Search real, professional game icons.
- **Game passes and developer products.** Devmax creates them in your game after you allow it and confirm, and gives you the ids for your scripts.

Roblox Studio itself is handled by Roblox's own Studio connector.

## Install

One command adds Devmax to Claude Code and Codex.

**Windows** (open PowerShell and paste):

```
irm https://raw.githubusercontent.com/FelixPhantt/devmax-ai/main/install.ps1 | iex
```

**Mac or Linux** (open Terminal and paste):

```
curl -fsSL https://raw.githubusercontent.com/FelixPhantt/devmax-ai/main/install.sh | sh
```

Then open Claude or Codex, start a new chat, and the first time press **Connect** and **Allow**.

The script only runs the apps own plugin commands:

```
claude plugin marketplace add FelixPhantt/devmax-ai
claude plugin install devmax@devmax-roblox
codex plugin marketplace add FelixPhantt/devmax-ai
codex plugin add devmax@devmax
```

In the Claude app without a terminal: **Settings → Plugins → Add marketplace**, paste `FelixPhantt/devmax-ai`, press **Sync**, then install **Devmax**.

## Try it

- "Add a shop with gamepasses to my Roblox game"
- "Make me a thumbnail for my game Steal an Egg"
- "Check my game for exploits"

## Privacy

Devmax only receives what you ask it to make (your prompt) and your Devmax account. Game pass access is optional and can be removed at any time. Privacy policy: https://www.devmax.dev/privacy

## License

MIT
