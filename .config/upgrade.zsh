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
fnm uninstall 16
fnm install 16
fnm uninstall 18
fnm install 18
fnm default 18

if [[ -f ".nvmrc" ]]; then
	n use
fi

echo "##"
echo "## NodeJS upgrades done"
echo ""
echo ""
echo "## Homebrew upgrades starting"
echo "##"
brew update
brew upgrade
brew upgrade --cask --greedy
echo "##"
echo "## Homebrew upgrades done"
echo ""
echo ""
echo "## vim upgrades starting"
echo "##"
vim -c 'PlugUpgrade|q|q'
vim -c 'PlugUpdate|q|q'
vim -c 'CocUpdateSync|q|q'
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
