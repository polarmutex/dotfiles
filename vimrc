
"===========================================================
" PLUGINS
"===========================================================

" Automatically install vim-plug and run PlugInstall if vim-plug is not found.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initialize vim-plug.
call plug#begin('~/.vim/plugged')

"-----------------------------
" Styling related plugings
"-----------------------------
Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-moonfly-statusline'

"-----------------------------
" File management plugins
"-----------------------------
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

"-----------------------------
" Completion plugins
"-----------------------------

"-----------------------------
" Git plugins
"-----------------------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"-----------------------------
" Development plugins
"-----------------------------
Plug 'dense-analysis/ale'
"Plug 'sheerun/vim-polyglot'
Plug 'janko/vim-test'
"-----------------------------
" tmux support
"-----------------------------
Plug 'christoomey/vim-tmux-navigator'

" Finalize vim-plug.
call plug#end()
"===========================================================
" SETTINGS
"===========================================================

" Colors {{{
syntax on " enable syntax highlighting
colorscheme moonfly
set termguicolors
" }}}
" Spaces and tabs {{{
set tabstop=4 " number of visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
set shiftwidth=4
set modelines=1
set smartindent
set autoindent
" }}}
" UI config {{{
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " hightlight current line
filetype indent on " load filetype-specifc indent files
filetype plugin on
set wildmenu " visual autocomplete for command line
set lazyredraw " redraw only when we need to
set showmatch " hightlight matching [{()}]
" }}}
" Searching {{{
set incsearch " search as characters are enetred
set hlsearch " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}
" Folding {{{
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default 0-99
set foldnestmax=10 " 10 nested fold max
nnoremap <space> za " change fold to space
set foldmethod=indent " fold based on indent-level
" }}}
" Leader shortcuts {{{
let mapleader=","

" save session
nnoremap <leader>s :mksession<CR>
"}}}
" Backups {{{
" move backups to tmp dir
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" vim:foldmethod=marker:foldlevel=0
