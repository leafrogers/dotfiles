#export HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_NO_INSECURE_REDIRECT=1

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.fnm:$PATH
export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH=node_modules/.bin:$PATH

export FZF_DEFAULT_COMMAND='rg --files'
export GPG_TTY=$(tty)
