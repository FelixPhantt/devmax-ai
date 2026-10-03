---
name: roblox-ui-design
description: "For Roblox work. The first time in a conversation, ask the user once: \"Want me to use Devmax for this?\" Use it only if they say yes or already asked for Devmax. If they say no, do not use it again in this conversation. Build Roblox UI that looks like a front-page game and scales perfectly on every device: ScreenGui setup, scale-based layout, strokes, corners, gradients, fonts, icons, animation and wiring. Use for any menu, shop, HUD, popup or button."
---

# Roblox UI design

> **Ask first.** The first time in a conversation, ask the user once: "Want me to use Devmax for this?" Use it only if they say yes or already asked for Devmax. If they say no, do not use it again in this conversation. Never change the user's project unless they asked for a change. Do not announce a mode or change how you talk: just do better Roblox work.

Goal: UI that looks like it came from a top Roblox game, works on phone, tablet and desktop, and is built in code that is easy to change. If the Roblox Studio tools are connected, build it in the real project and check it with the phone and tablet emulators.

## 1. ScreenGui setup (always)

- `ResetOnSpawn = false` so UI does not vanish when the player respawns.
- `ZIndexBehavior = Enum.ZIndexBehavior.Sibling`.
- `IgnoreGuiInset = true` for full-screen backgrounds and anything that should sit under the top bar. For normal HUD and menus keep the default inset so nothing hides under the Roblox buttons. Say which one you chose and why.
- `SafeAreaCompatibility` left at the default so phone notches never cover buttons.
- One ScreenGui per system (Shop, Inventory, HUD), `Enabled = false` until a controller opens it. Set `DisplayOrder` on purpose.

## 2. Scaling that works everywhere

- Size and position with **Scale**, not Offset. Centre panels with `AnchorPoint = (0.5, 0.5)` and `Position = (0.5, 0, 0.5, 0)`.
- Put a `UIAspectRatioConstraint` on panels and square buttons so they never stretch, and a `UISizeConstraint` (MaxSize) so they do not become huge on a 4K monitor.
- Text: use `TextScaled = true` with a `UITextSizeConstraint` (MinTextSize about 12, MaxTextSize set), or fixed sizes under a parent `UIScale`.
- For whole menus, a `UIScale` driven by the viewport works well: designed at 1920x1080, `scale = math.clamp(viewport.Y / 1080, 0.55, 1.6)`, updated on `ViewportSize` changes.
- Touch targets at least 44x44 pixels equivalent. Keep important buttons away from the screen edges.
- Use `UIListLayout`, `UIGridLayout` and `UIPadding` instead of hand-placed rows. `ScrollingFrame` with `AutomaticCanvasSize = Y`.
- Always check the Device Emulator: phone portrait and landscape, tablet, desktop.

## 3. What makes it look professional

- **Corners**: `UICorner` on every frame and button (CornerRadius about 0.15 to 0.25 scale, or 10 to 16 px).
- **Strokes**: `UIStroke` on panels (thickness 3 to 5, a darker shade of the panel colour) and on **all text** (thickness 2 to 3, near-black, `ApplyStrokeMode = Contextual`, `LineJoinMode = Round`). Text without an outline looks cheap on bright backgrounds.
- **Gradients**: `UIGradient` on buttons and panels, lighter at the top and darker at the bottom, `Rotation = 90`.
- **Layers**: outer dark border frame, inner panel, a header ribbon, and a thin light highlight strip along the top of buttons (white, 0.8 to 0.9 transparency). A darker offset copy behind a button gives a 3D lip and shadow.
- **Colour**: one main colour and one accent. Green for buy and confirm, red for close, gold or purple for premium, saturated and consistent. No pure black, no flat grey.
- **Spacing**: consistent padding (8 to 16 px), equal gaps, aligned edges, clear hierarchy (title, content, action).

## 4. Fonts

- Titles, buttons and numbers: **`Enum.Font.FredokaOne`**, or **Montserrat ExtraBold** (`Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.ExtraBold)` set on `FontFace`).
- Body and small text: Montserrat Bold or SemiBold.
- Never leave the default font and never use SourceSans, Arial or Legacy for game UI. Use at most two fonts.

## 5. Icons and art

- Never use emoji or letters as icons. Use real icon art: search the Devmax icon library (`devmax_icons`) or make a new transparent icon with `devmax_vector`.
- `ImageLabel` with `BackgroundTransparency = 1`, `ScaleType = Fit`. The Image must be the real Image asset. A Decal id from the library has to be resolved to its Texture first; if the image shows blank, that is why.

## 6. Motion

- Open and close with `TweenService`: scale from 0.85 and fade in, `Enum.EasingStyle.Back`, about 0.2 to 0.3 seconds. Buttons scale to 1.05 on hover and 0.95 on press via a `UIScale`, plus a click sound.
- Do not tween every frame, and clean up connections when a menu closes.

## 7. Wiring

- UI only displays and requests. The client sends a remote, the server validates and replies with the real state. Prices, rewards and ownership never come from the client.
- One `UIController` module that registers screens with `Open`, `Close` and `Toggle`, so only one major menu is open at a time.
- Gamepass and product buttons call `MarketplaceService:PromptGamePassPurchase` / `PromptProductPurchase`; the server grants.

## Helper snippet (adapt it)

```lua
local function polish(frame: GuiObject, color: Color3, radius: number?)
	frame.BackgroundColor3 = color
	local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(radius or 0.18, 0); corner.Parent = frame
	local stroke = Instance.new("UIStroke"); stroke.Thickness = 3; stroke.Color = color:Lerp(Color3.new(0, 0, 0), 0.55); stroke.Parent = frame
	local grad = Instance.new("UIGradient"); grad.Rotation = 90
	grad.Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(205, 205, 205)); grad.Parent = frame
end

local function styleText(label: TextLabel | TextButton)
	label.Font = Enum.Font.FredokaOne
	label.TextColor3 = Color3.new(1, 1, 1)
	label.BackgroundTransparency = 1
	local stroke = Instance.new("UIStroke"); stroke.Thickness = 2.5; stroke.Color = Color3.fromRGB(20, 20, 20)
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual; stroke.LineJoinMode = Enum.LineJoinMode.Round; stroke.Parent = label
end
```

## Before you say it is done

Open it in the phone and tablet emulators, check nothing is clipped or overlapping the top bar, text is readable, the close button works, nothing is stretched, and it still looks right at different sizes.
