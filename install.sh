#!/bin/sh
# Devmax installer for Mac and Linux. Adds the Devmax plugin to Claude Code and Codex.
# Run:  curl -fsSL https://raw.githubusercontent.com/FelixPhantt/devmax-ai/main/install.sh | sh
# It only runs the apps' own "plugin" commands. Nothing else is installed.

repo="FelixPhantt/devmax-ai"
installed=""

echo ""
echo "Installing Devmax..."

if command -v claude >/dev/null 2>&1; then
  echo "  Claude found, adding the plugin..."
  claude plugin marketplace add "$repo" >/dev/null 2>&1
  claude plugin marketplace update devmax-roblox >/dev/null 2>&1
  claude plugin install devmax@devmax-roblox >/dev/null 2>&1
  if claude plugin list 2>/dev/null | grep -q "devmax@devmax-roblox"; then installed="Claude"; else echo "  Claude: the plugin could not be added."; fi
fi

if command -v codex >/dev/null 2>&1; then
  echo "  Codex found, adding the plugin..."
  codex plugin marketplace add "$repo" >/dev/null 2>&1
  codex plugin marketplace upgrade >/dev/null 2>&1
  codex plugin add devmax@devmax >/dev/null 2>&1
  if codex plugin list 2>/dev/null | grep -q "devmax@devmax  *installed"; then installed="${installed:+$installed and }Codex"; else echo "  Codex: the plugin could not be added."; fi
fi

echo ""
if [ -n "$installed" ]; then
  echo "DONE. Devmax is installed in: $installed"
  echo "Codex: reopen it and open Plugins. Claude Code: type /plugin."
  echo "Open it, start a new chat and ask for something Roblox."
  echo "The first time, press Connect and then Allow on the Devmax page."
else
  echo "Could not find Claude Code or Codex on this computer."
  echo "Use the \"Add Devmax to Claude\" button on https://www.devmax.dev/plugin instead."
fi
echo ""
