vim := nvim
#vim := ~/Downloads/nvim.appimage
pwd := $(shell pwd -LP)


link: link-vim link-neovim

link-vim:
	@echo "==> ~/.vim"
	@if [ ! . -ef ~/.vim ]; then ln -nfs "${pwd}/vim" ~/.vim; fi
	@echo "==> ~/.vimrc"
	@ln -nfs "${pwd}/vim/init.vim" ~/.vimrc

link-neovim:
	@mkdir -p ~/.config
	@echo "==> ~/.config/nvim"
	@if [ ! . -ef ~/.config/nvim ]; then ln -nfs "${pwd}/vim" ~/.config/nvim; fi

install:
	$(vim) +PlugInstall +PlugClean

upgrade:
	$(vim) +PlugUpdate +PlugUpgrade +PlugClean +PlugDiff


.PHONY: install link upgrade restore default link-vim link-neovim doc/vimfiles_keys.txt
