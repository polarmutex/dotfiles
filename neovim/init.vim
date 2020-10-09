"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

lua require('plugins')
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim
"source $HOME/.config/nvim/keys/which-key.vim
source $HOME/.config/nvim/general/paths.vim
source $HOME/.config/nvim/general/terminal.vim

augroup start_screen
  au!
  autocmd VimEnter * ++once lua require('start-screen').start()
augroup END
