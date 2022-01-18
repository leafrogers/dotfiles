# Prequisites:
# - Homebrew installed
# - Oh My Zsh installed
# - No ~/.* files that you want to keep

brew bundle
cargo install trash-it

for file in .{config,editorconfig,gitconfig,gitignore,hushlogin,p10k.zsh,prettier,vim,vimrc,zshrc}; do
	ln -sf ~/Repos/dotfiles/$file ~/$file
done;
unset file;

vim -c 'PlugInstall|q|q'
vim -c 'CocInstall -sync coc-html coc-css coc-tsserver coc-eslint coc-prettier coc-json coc-yaml coc-highlight coc-emmet coc-markdownlint coc-snippets coc-cfn-lint|q|q'
