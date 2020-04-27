" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

"some of these require the neovim pip package
call plug#begin('~/.config/nvim/plugged')
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter' " The git gutter being the extra column tracking git changes by numbering
Plug 'jreybert/vimagit'

" Theme
Plug 'joshdick/onedark.vim' "main color theme
Plug 'cocopon/iceberg.vim'

" Language
Plug 'sheerun/vim-polyglot' "a super language pack for a ton of stuff

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neovim/nvim-lsp'
"Plug 'haorenW1025/completion-nvim'
"Plug 'vigoux/completion-treesitter'

" Other
Plug 'jiangmiao/auto-pairs' " Auto pairs for '(' '[' '{' 
Plug 'luochen1990/rainbow' "rainbow highlight brackets
Plug 'ntpeters/vim-better-whitespace' "show when there is gross trailing whitespace
Plug 'tpope/vim-surround' "change things surounding like ()->[]
Plug 'RRethy/vim-illuminate' " highlight current word
Plug 'tpope/vim-speeddating'
Plug 'janko-m/vim-test'
Plug 'fabi1cazenave/termopen.vim'
Plug 'junegunn/vim-easy-align' "allow mappings for lots of aligning
Plug 'junegunn/vim-peekaboo' "allows registers and macros to be viewed as used

"putting this farther down so the nested call happens more smoothly on loading
Plug 'isaacmorneau/vim-simple-sessions' "easily manage sessions

"this should always be the last plugin
Plug 'ryanoasis/vim-devicons'

call plug#end()
