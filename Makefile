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

build_reqs:
	sudo apt-get install -y make cmake git xclip
	sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
		libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
		xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
	sudo apt-get install -y gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

neovim_target = $(pwd)/../neovim
neovim: | $(neovim_target)
	cd $(neovim_target);\
	git pull;\
	make distclean;\
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

i3_reload:
	i3-msg reload
	i3-msg restart
