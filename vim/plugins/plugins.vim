

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
    packadd! vim-polyglot
    " Auto pairs for '(' '[' '{'
    packadd! auto-pairs
    " Themes
    packadd! theme-onedark
    packadd! theme-iceberg
    " Intellisense
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " FZF
    packadd! fzf
    packadd! fzf-vim
    packadd! fzf-preview

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
    " LSP
    packadd! nvim-lsp
    packadd! nvim-completion
    packadd! diagnostic-nvim
    packadd! lsp-status
    "packadd! nvim-completion-treesitter
    " Whitespace
    packadd! vim-better-whitespace
    "show when there is gross trailing whitespace

    packadd! vim-illuminate
    " highlight current word

    " Test
    packadd! vim-test

    " Bean Copy Txn
    packadd! bean-copy-txn

    " Games/ Utils
    packadd! vim-hardtime
    packadd! vim-be-good
endif

