" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
"   " - Avoid using standard Vim directory names like 'plugin'
call plug#begin(vim . '/plugins')

" Hard mode
Plug 'takac/vim-hardtime'

" Grammat
Plug 'rhysd/vim-grammarous'

Plug 'tpope/vim-repeat'
" colorschemes
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

" fzf
Plug 'kien/ctrlp.vim'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

" Language
Plug 'sheerun/vim-polyglot'
Plug 'janko-m/vim-test'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neovim/nvim-lsp'
"Plug 'haorenW1025/completion-nvim'
"Plug 'vigoux/completion-treesitter'

" Linter
Plug 'w0rp/ale'

" File Browser
Plug 'Shougo/defx.nvim'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'

" Tools
Plug 'kassio/neoterm'

" Visualization
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

Plug 'caenrique/nvim-toggle-terminal'
" The bang version will try to download the prebuilt binary if cargo does not
" exist.
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" Initialize plugin system
call plug#end()
