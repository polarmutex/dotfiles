" Colors {{{
	syntax on
	colorscheme moonfly
	set termguicolors
" }}}
"
" Common Settings
    let mapleader=","
	filetype plugin indent on
	set encoding=utf-8
	set mouse=a " enable mouse movement
	set number " show line numbers
	set relativenumber "show relative numbers
	set cursorline " hightlight cursor line
	"set path+=**
	set wildmenu " visual autocomplete line
	set updatetime=350
	"set signcolumn=yes
	"set wrap
	"set linebreak
	"set scrolloff=5
	"set shortmess+=c
	set lazyredraw " redraw only when we need to
	"set hidden
	"set inccommand=nosplit
	set incsearch " search as characters are entered
	set hlsearch " highlight matches
	nnoremap <leader><space> :nohlsearch<CR> " command to toggle of hightlights
	" setting to ignore case on serach

" Folds {{{
 	set foldenable " enable folding
	set foldmethod=indent
	set foldlevelstart=20 " Disables automatic closing of all folds on fileopen
	hi Folded ctermfg=black
	hi Folded ctermbg=white
" }}}

" Tabs, trailing spaces {{{
	set listchars=tab:▏\ ,eol:\ ,extends:,precedes:,space:\ ,trail:⋅
	set list
" }}}

" Splits {{{
	set noequalalways
	set splitright
	set splitbelow
" }}}

" Tabs {{{
	set expandtab " tabs are spoaces
	set tabstop=4
	set shiftwidth=4
	set smartindent
	set autoindent
" }}}

" Spell
	set spelllang=en_us

" Autocmds
	augroup Trailing
		autocmd!
		autocmd BufWritePre *.* :call RemoveTrailingSpaces()
	augroup end
