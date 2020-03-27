" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
"   " - Avoid using standard Vim directory names like 'plugin'
call plug#begin(vim . '/plugins')

" colorschemes
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" fzf
Plug 'kien/ctrlp.vim'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

" Language
Plug 'sheerun/vim-polyglot'
Plug 'janko-m/vim-test'

" Completion
Plug 'neovim/nvim-lsp'
Plug 'lifepillar/vim-mucomplete'

" Linter
Plug 'w0rp/ale'

" File Browser
Plug 'Shougo/defx.nvim'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'

" Initialize plugin system
call plug#end()
