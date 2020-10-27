#!/bin/zsh
source ~/.zshrc

echo "# Starting upgrades…"
echo ""
echo "## OhMyZsh upgrade starting"
echo "##"
omz update
echo "##"
echo "## OhMyZsh upgrade done"
echo ""
echo ""
echo "## NodeJS upgrades starting"
echo "##"
n install latest-v12.x
n install latest-v14.x
echo "##"
echo "## NodeJS upgrades done"
echo ""
echo ""
echo "## Homebrew upgrades starting"
echo "##"
brew update
brew upgrade
brew upgrade --cask
echo "##"
echo "## Homebrew upgrades done"
echo ""
echo ""
echo "## vim upgrades starting"
echo "##"
vim -c 'PlugUpgrade|q|q'
vim -c 'PlugUpdate|q|q'
echo "##"
echo "## vim upgrades done"
echo ""
echo ""
echo "## macOS upgrades starting"
echo "##"
mas upgrade
echo "##"
echo "## macOS upgrades done"
echo ""
echo "# Upgrades done"
