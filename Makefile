pwd := $(shell pwd -LP)
.PHONY: link-vim link-tmux neovim

link-vim:
	@echo "linking vim"
	@mkdir -p ~/.config
	@ln -nfs "${pwd}/vim" ~/.config/nvim

link-tmux:
	@echp "linking tmux"
	@echo "==> ~/.tmux.conf"
	@ln -nfs "${pwd}/tmux/tmux.conf" ~/.tmux.conf

neovim_target = $(pwd)/../neovim
neovim: | $(neovim_target)
	cd $(neovim_target);\
	git pull;\
	make CMAKE_BUILD_TYPE=RelWithDebInfo;\
	sudo make install;\

$(neovim_target):
	mkdir $(neovim_target);
	git clone https://github.com/neovim/neovim.git $(neovim_target);

CMAKE = /opt/cmake
cmake: | $(CMAKE)
$(CMAKE):
	wget https://cmake.org/files/v3.17/cmake-3.17.3-Linux-x86_64.sh;\
	sudo mkdir /opt/cmake;\
	sudo sh cmake-3.17.3-Linux-x86_64.sh --prefix=/opt/cmake;\
