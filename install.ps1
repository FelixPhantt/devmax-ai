# Devmax installer for Windows. Adds the Devmax plugin to Claude Code and Codex.
# Run:  irm https://raw.githubusercontent.com/FelixPhantt/devmax-ai/main/install.ps1 | iex
# It only runs the apps' own "plugin" commands. Nothing else is installed.

$repo = 'FelixPhantt/devmax-ai'
$installed = @()

function Find-Codex {
  $cmd = Get-Command codex -ErrorAction SilentlyContinue
  if ($cmd) { return $cmd.Source }
  $bin = Join-Path $env:LOCALAPPDATA 'OpenAI\Codex\bin'
  if (Test-Path $bin) {
    $exe = Get-ChildItem $bin -Recurse -Filter codex.exe -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 1
    if ($exe) { return $exe.FullName }
  }
  return $null
}

function Find-Claude {
  $cmd = Get-Command claude -ErrorAction SilentlyContinue
  if ($cmd) { return $cmd.Source }
  foreach ($path in @((Join-Path $env:USERPROFILE '.local\bin\claude.exe'), (Join-Path $env:APPDATA 'npm\claude.cmd'))) {
    if (Test-Path $path) { return $path }
  }
  return $null
}

Write-Host ''
Write-Host 'Installing Devmax...' -ForegroundColor Cyan

$claude = Find-Claude
if ($claude) {
  Write-Host '  Claude found, adding the plugin...'
  $null = & $claude plugin marketplace add $repo 2>&1
  $null = & $claude plugin marketplace update devmax-roblox 2>&1
  $null = & $claude plugin install devmax@devmax-roblox 2>&1
  $list = (& $claude plugin list 2>&1 | Out-String)
  if ($list -match 'devmax@devmax-roblox') { $installed += 'Claude' } else { Write-Host '  Claude: the plugin could not be added.' -ForegroundColor Yellow }
}

$codex = Find-Codex
if ($codex) {
  Write-Host '  Codex found, adding the plugin...'
  $null = & $codex plugin marketplace add $repo 2>&1
  $null = & $codex plugin marketplace upgrade 2>&1
  $null = & $codex plugin add devmax@devmax 2>&1
  $list = (& $codex plugin list 2>&1 | Out-String)
  if ($list -match 'devmax@devmax\s+installed') { $installed += 'Codex' } else { Write-Host '  Codex: the plugin could not be added.' -ForegroundColor Yellow }
}

Write-Host ''
if ($installed.Count -gt 0) {
  Write-Host ("DONE. Devmax is installed in: " + ($installed -join ' and ')) -ForegroundColor Green
  Write-Host ''
  Write-Host 'Where to see it:'
  if ($installed -contains 'Codex') { Write-Host '  Codex: close and reopen Codex, then open Plugins. Devmax is in the list.' }
  if ($installed -contains 'Claude') { Write-Host '  Claude Code: start it and type /plugin. Devmax is in the list.' }
  Write-Host ''
  Write-Host 'Then start a new chat and ask for something Roblox.'
  Write-Host 'The first time, press Connect and then Allow on the Devmax page.'
  if ($installed -contains 'Claude') {
    Write-Host ''
    Write-Host 'Note: the Claude chat app keeps its own plugin list. To add Devmax there, open' -ForegroundColor Yellow
    Write-Host 'https://claude.ai/customize/plugins and add the marketplace FelixPhantt/devmax-ai' -ForegroundColor Yellow
  }
} else {
  Write-Host 'Could not find Claude Code or Codex on this PC.' -ForegroundColor Yellow
  Write-Host 'Use the "Add Devmax to Claude" button on https://www.devmax.dev/plugin instead.'
}
Write-Host ''
