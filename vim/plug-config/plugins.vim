" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


"some of these require the neovim pip package
call plug#begin('~/.config/nvim/plugged')
" Change dates fast
Plug 'tpope/vim-speeddating'
" Convert binary, hex, etc..
Plug 'glts/vim-radical'
" Files
Plug 'tpope/vim-eunuch'
" Repeat stuff
Plug 'tpope/vim-repeat'
" Surround
Plug 'tpope/vim-surround'
" Better Comments
Plug 'tpope/vim-commentary'
" Have the file system follow you aroun
Plug 'airblade/vim-rooter'

if exists('g:vscode')
    Easy motion for VSCode
    Plug 'asvetliakov/vim-easymotion'
else
    " Text Navigation
    Plug 'justinmk/vim-sneak'
    Plug 'unblevable/quick-scope'
    " Add some color
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'junegunn/rainbow_parentheses.vim'
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Themes
    Plug 'christianchiarulli/onedark.vim'
    Plug 'cocopon/iceberg.vim'
    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Status Line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Ranger
    "Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
    " Git
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    " Terminal
    Plug 'voldikss/vim-floaterm'
    " Start Screen
    Plug 'mhinz/vim-startify'"
    " Vista
    Plug 'liuchengxu/vista.vim'
    " Help
    Plug 'liuchengxu/vim-which-key'"
    " Making stuff
    Plug 'neomake/neomake'
     " Better Comments
    Plug 'jbgutierrez/vim-better-comments'
    " LSP
    "Plug 'neovim/nvim-lsp'
    "Plug 'haorenW1025/completion-nvim'
    "Plug 'vigoux/completion-treesitter'
    " Whitespace
    Plug 'ntpeters/vim-better-whitespace' "show when there is gross trailing whitespace

    Plug 'RRethy/vim-illuminate' " highlight current word
    Plug 'janko-m/vim-test'
endif

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
