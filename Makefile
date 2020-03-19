vim := vim
pwd := $(shell pwd -LP)


link: link-vim link-tmux

link-vim:
	@echo "==> ~/.vim"
	@if [ ! . -ef ~/.vim ]; then ln -nfs "${pwd}/vim" ~/.vim; fi
	@echo "==> ~/.vimrc"
	@ln -nfs "${pwd}/vim/vimrc" ~/.vimrc

link-tmux:
	@echo "==> ~/.tmux.conf"
	@ln -nfs "${pwd}/tmux/tmux.conf" ~/.tmux.conf

install:
	$(vim) +PlugInstall +PlugClean

upgrade:
	$(vim) +PlugUpdate +PlugUpgrade +PlugClean +PlugDiff


.PHONY: install link upgrade restore default link-vim link-neovim doc/vimfiles_keys.txt
