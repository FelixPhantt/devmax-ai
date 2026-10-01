---
name: roblox-ui-design
description: "Build Roblox UI that looks like a front-page game and scales on every device: layout, fonts, strokes, animation and wiring. Use for any menu, shop, HUD or popup."
---

# Roblox UI

## Look (what top games do)

- Chunky rounded display font (`Enum.Font.FredokaOne` or `GothamBlack`), white text with a dark `UIStroke` (thickness 2-3, `ApplyStrokeMode.Contextual`).
- Strong colour meaning: green = claim/buy, gold = premium, purple/pink = Robux, red = close, blue = info.
- Panels with a dark outline (`UIStroke` on the frame, `ApplyStrokeMode.Border`), `UICorner` 8-16px, subtle `UIGradient` top-light to bottom-dark.
- Big bright header banner with an icon breaking out of its corner.
- For art-heavy panels, generate them with `devmax_ui` instead of hand-building: every word comes back as a live TextLabel.

## Scaling rules

- Size and position with **Scale**, not Offset, for anything that should grow with the screen.
- Put a `UIAspectRatioConstraint` on every window so it keeps its shape on phones and monitors.
- Use `UIListLayout`/`UIGridLayout` + `UIPadding` for repeated items; never hand-place grid cells.
- `TextScaled = true` with a `UITextSizeConstraint` (MaxTextSize) so text never becomes huge.
- `ScreenGui.IgnoreGuiInset` deliberately; keep important buttons out of the top bar and the mobile jump/thumbstick zones.
- Test with Studio's Device emulator: a phone, a tablet and 1080p.

## Behaviour

- Windows start `Visible = false`; one client controller opens/closes them and closes others.
- Open/close with a short `TweenService` scale pop (0.15-0.2s, `Back` easing) and a click sound.
- Buttons get hover/press feedback (slight scale or colour change).
- Purchases go through a RemoteEvent to the server; the UI only updates after the server confirms.
