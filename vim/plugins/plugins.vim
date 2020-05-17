

" Change dates fast
packadd! vim-speeddating
" Convert binary, hex, etc..
packadd! vim-radical
" Files
packadd! vim-eunuch
" Repeat stuff
packadd! vim-repeat
" Surround
packadd! vim-surround
" Better Comments
packadd! vim-commentary
" Have the file system follow you aroun
packadd! vim-rooter

if exists('g:vscode')
    " Easy motion for VSCode
    "packadd! vim-easymotion
else
    " Text Navigation
    packadd! vim-sneak
    packadd! quick-scope
    " Add some color
    packadd! nvim-colorizer
    packadd! rainbow-parentheses
    " Better Syntax Support
    "Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    "Plug 'jiangmiao/auto-pairs'
    " Themes
    packadd! theme-onedark
    packadd! theme-iceberg
    " Intellisense
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Status Line
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'
    " Ranger
    "Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    " FZF
    "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    "Plug 'junegunn/fzf.vim'
    packadd! vim-clap
    " Git
    packadd! vim-signify
    packadd! vim-fugitive
    packadd! vim-rhubarb
    " Terminal
    packadd! vim-floaterm
    " Start Screen
    packadd! vim-startify
    " Vista
    packadd! vista
    " Help
    packadd! which-key
    " Making stuff
    "Plug 'neomake/neomake'
     " Better Comments
    "Plug 'jbgutierrez/vim-better-comments'
    " LSP
    packadd! nvim-lsp
    packadd! nvim-completion
    packadd! nvim-completion-treesitter
    " Whitespace
    packadd! vim-better-whitespace
    "show when there is gross trailing whitespace

    packadd! vim-illuminate
    " highlight current word

    " Test
    packadd! vim-test
endif

