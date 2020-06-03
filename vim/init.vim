"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

source $HOME/.config/nvim/plugins/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/which-key.vim
source $HOME/.config/nvim/general/paths.vim

if exists('g:vscode')
    source $HOME/.config/nvim/plugins/easymotion.vim
else
    source $HOME/.config/nvim/general/statusline.vim
    source $HOME/.config/nvim/general/terminal.vim
    source $HOME/.config/nvim/themes/gruvbox.vim
    source $HOME/.config/nvim/plugins/nvim-lsp.vim
    source $HOME/.config/nvim/plugins/fzf.vim
    source $HOME/.config/nvim/plugins/commentary.vim
    source $HOME/.config/nvim/plugins/rainbow.vim
    source $HOME/.config/nvim/plugins/quickscope.vim
    source $HOME/.config/nvim/plugins/sneak.vim
    source $HOME/.config/nvim/plugins/start-screen.vim
    source $HOME/.config/nvim/plugins/signify.vim
    source $HOME/.config/nvim/plugins/better-whitespace.vim
    source $HOME/.config/nvim/plugins/polyglot.vim
    source $HOME/.config/nvim/plugins/hardtime.vim
endif
