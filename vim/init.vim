
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
"   " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugins')

" colorschemes
Plug 'bluz71/vim-moonfly-colors'
Plug 'joshdick/onedark.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" fzf
Plug 'kien/ctrlp.vim'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" Language
Plug 'sheerun/vim-polyglot'
Plug 'janko-m/vim-test'

" WHitespace
Plug 'ntpeters/vim-better-whitespace'

" Initialize plugin system
call plug#end()

" Basic Settings
set autoread                            " reload on external file changes
set backspace=indent,eol,start          " backspace behavior
set clipboard=unnamed,unnamedplus       " enable clipboard
set encoding=utf8                       " enable utf8 support
set hidden                              " nide buffers, don't close
set mouse=a                             " enable mouse support
set nowrap                              " disable wrapping
set number                              " show line numbers
set term=xterm-256color                 " terminal type
set wildmenu wildmode=longest:full,full " wildmode settings

" UI Settings
filetype plugin indent on           " enable filetype detection
set listchars=eol:¶,trail:•,tab:▸\  " whitespaxce characters
set scrolloff=999                   " center cursor position vertically
set showbreak=¬\                    " wrapping character
set showmatch                       " show matching brackets
syntax on                           " enable suntax highlighting

" Colors
colorscheme moonfly
"colorscheme onedark
"let g:onedark_termcolors=256

" Status line
set laststatus=0
set ruler rulerformat=%40(%=%<%F%m\ \
            \›\ %{getfsize(@%)}B\ \
            \›\ %l/%L:%v%)
" Tabs/Indentations
set autoindent expandtab                    " autoindentation and tabbing
set shiftwidth=4 softtabstop=4 tabstop=4    " 1 tab = 4 spaces

" Search Settings
set hlsearch ignorecase incsearch smartcase

" Undo and Backup
set nobackup noswapfile nowritebackup               " disable backup/swap files
set undofile undodir=~/.vim/undo undolevels=9999    " undo options

" Performance Tuning
set lazyredraw      " enable lazyredraw
set nocursorline    " disable cursorline
set ttyfast         " enable fast terminal connection

" Key Mappings
let mapleader=','                                " leader key
nnoremap <leader>, :let @/=''<CR>:noh<CR>|       " clear search
nnoremap <leader># :g/\v^(#\|$)/d_<CR>|          " delete commented/blank lines
nnoremap <leader>b :ls<CR>:buffer<space>|        " show/select buffer
nnoremap <leader>d :w !diff % -<CR>|             " show diff
nnoremap <silent> <leader>i gg=G``<CR>|          " fix indentation
nnoremap <leader>l :set list! list?<CR>|         " toggle list (special chars)
nnoremap <leader>n :set invnumber number?<CR>|   " toggle line numbers
nnoremap <leader>p :set invpaste paste?<CR>|     " toggle paste mode
nnoremap <leader>r :retab<CR>|                   " convert tabs to spaces
nnoremap <leader>s :source $MYVIMRC<CR>|         " reload .vimrc
nnoremap <silent> <leader>t :%s/\s\+$//e<CR>|    " trim whitespace
nnoremap <leader>w :set wrap! wrap?<CR>|         " toggle wrapping

" Autocommands
" Auto source .vimrc on save
augroup Vimrc
    autocmd! bufwritepost .vimrc source %
augroup END

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Whitespace Settings
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_on_save = 1
