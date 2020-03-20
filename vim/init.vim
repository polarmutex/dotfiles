
let g:mapleader=","
let g:maplocalleader="<Space>"

if has('nvim')
    let vim = stdpath('config')
else
    let vim = $HOME . '/.vim'
end

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
"   " - Avoid using standard Vim directory names like 'plugin'
call plug#begin(vim . '/plugins')

" colorschemes
Plug 'cocopon/iceberg.vim'

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
"Plug 'ntpeters/vim-better-whitespace'

" Initialize plugin system
call plug#end()

" Basic Settings

filetype plugin indent on
syntax enable
set encoding=utf-8
scriptencoding utf-8

" set t_Co=256
" set background=dark
set termguicolors
colorscheme iceberg

set timeoutlen=300                      " mapping timeout
set ttimeoutlen=50                      " keycode timeout
set mousehide                           " hide when characters are typed
set history=1000                        " number of command lines to remember
set ttyfast                             " assume fast terminal connection
set viewoptions=folds,options,cursor,unix,slash " unix/windows compatibility
" sync with OS clipboard
if has('linux')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif
set hidden                              " allow buffer switching without saving
set autoread                            " reload on external file changes
set fileformats+=mac                    " add mac to auto detect of file format
set nrformats-=octal                    " always assume decimal numbers
set showcmd
set tags=tags;/
set showfulltag
set modeline
set modelines=5
set exrc

" Whitespace
set backspace=indent,eol,start          " Allow backspacing everything in insert mode
set nowrap                              " disable wrapping
set autoindent                          " automatically indent to match adjacent lines
set expandtab                           " spaces besides tab
set smarttab                            " use shiftwidth to enter tabs
set tabstop=4                           " number of spaces per tab for display
set softtabstop=4                       " number of spaces per tab in insert mode
set shiftwidth=4                        " number of spaces when indenting
set list                                " highlight whitespace
set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮
set fillchars=vert:│,fold:\
set shiftround
set linebreak

set scrolloff=1
set scrolljump=5
set display+=lastline
set wildmenu                            " show list for autocomplete
set wildmode=list:longest,full

set splitbelow
set splitright

set showmatch                           " Automatically highlight matching braces/brackets/etc
set number                              " Show line numbers
set lazyredraw
set laststatus=2
set noshowmode
set nofoldenable                        " disable folds by default

" disable sounds
set noerrorbells
set novisualbell
set t_vb=

"Searching
set hlsearch                            " highlight searches
set incsearch                           " incremental searching
set ignorecase                          " ignore case for searching
set smartcase                           " do case-sensitive if there's a capital letter
set infercase                           " smarter completions that will be case aware when ignore case is on

set colorcolumn=80
set signcolumn=yes

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif


" Undo and Backup
set nobackup noswapfile nowritebackup               " disable backup/swap files
set undofile undodir=~/.vim/undo undolevels=9999    " undo options

" utils
func! Preserve(command)
    " preperation: save last search, and cursor position
    let _s=@/
    let l = line('.')
    let c = col('.')
    " do the command
    execute a:command
    "clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l,c)
endfunc

func! StripTrailingWhitespace()
    call Preserve("%s/\\s\\+$//e")
endfunc

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
nnoremap <silent> <leader>t :call StripTrailingWhitespace()<CR>|    " trim whitespace
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

source ~/.config/nvim/statusbar.vim
