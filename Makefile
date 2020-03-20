pwd := $(shell pwd -LP)


default: vim tmux

vim: link-vim install-vim
tmux: link-tmux

link-vim:
	@ln -nfs "${pwd}/vim/init.vim" ~/.vimrc
	@ln -nfs "${pwd}/vim" ~/.vim
	@mkdir -p ~/.config
	@ln -nfs "${pwd}/vim" ~/.config/nvim

link-tmux:
	@echo "==> ~/.tmux.conf"
	@ln -nfs "${pwd}/tmux/tmux.conf" ~/.tmux.conf

install-vim:
	nvim +PlugInstall +PlugClean

update-vim:
	nvim +PlugUpdate +PlugUpgrade +PlugClean +PlugDiff


.PHONY: install link upgrade 
