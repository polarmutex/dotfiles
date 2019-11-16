
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" sensible defaults
    if !has('nvim') && !exists('g:gui_oni') | Plug 'tpope/vim-sensible' | endif
    Plug 'rstacruz/vim-opinion'

" Look
    Plug 'bluz71/vim-moonfly-colors'
    Plug 'itchyny/lightline.vim'
    Plug 'mgee/lightline-bufferline' " For tabs on top

" File Management
    Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
    Plug 'Xuyuanp/nerdtree-git-plugin', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
    Plug 'ryanoasis/vim-devicons'

" Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

" Tools
    Plug 'w0rp/ale'
    Plug 'sheerun/vim-polyglot'
    Plug 'janko/vim-test'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
    Plug 'junegunn/fzf.vim'
    Plug 'mhinz/vim-grepper'
    Plug 'tmsvg/pear-tree'
    Plug '907th/vim-auto-save'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-commentary'

" Tmux
    Plug 'christoomey/vim-tmux-navigator'

" Syntax Highlighting
	Plug 'bfrg/vim-cpp-modern'

" Auto completion
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-jedi'
    Plug 'ncm2/ncm2-pyclang'

" linting
    Plug 'neomake/neomake'

call plug#end()

