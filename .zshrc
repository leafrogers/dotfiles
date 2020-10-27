export ZSH=~/.oh-my-zsh

ZSH_CUSTOM=~/.config/oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

eval "$(fnm env --use-on-cd)"
