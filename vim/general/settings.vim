" Set leader key
map <Space> <Leader>

if !exists('g:vscode')
    syntax enable                           " Enables syntax highlighing
    filetype indent plugin on               "
    set hidden                              " Required to keep multiple buffers open multiple buffers
    set nowrap                              " Display long lines as just one line
    set encoding=utf-8                      " The encoding displayed
    set pumheight=10                        " Makes popup menu smaller
    set fileencoding=utf-8                  " The encoding written to file
    set ruler                               " Show the cursor position all the time
    set cmdheight=2                         " More space for displaying messages
    set iskeyword+=-                        " treat dash separated words as a word text object"
    set mouse=a                             " Enable your mouse
    set splitbelow                          " Horizontal splits will automatically be below
    set splitright                          " Vertical splits will automatically be to the right
    set t_Co=256                            " Support 256 colors
    set colorcolumn=80                      " color 80th column
    set conceallevel=0                      " So that I can see `` in markdown files
    set tabstop=4                           " Insert 4 spaces for a tab
    set shiftwidth=4                        " Change the number of space characters inserted for indentation
    set softtabstop=4                       " Change the number of space characters inserted for indentation
    set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
    set expandtab                           " Converts tabs to spaces
    set smartindent                         " Makes indenting smart
    set autoindent                          " Good auto indent
    set relativenumber                      " Relative Line numbers
    set number                              " set current line to the actual line number
    set cursorline                          " Enable highlighting of the current line
    set background=dark                     " tell vim what the background color looks like
    set showtabline=2                       " Always show tabs
    set noshowmode                          " We don't need to see things like -- INSERT -- anymore
    set nobackup                            " This is recommended by coc
    set nowritebackup                       " This is recommended by coc
    set undofile
    set undolevels=1000
    set undoreload=1000
    set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
    set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
    set updatetime=300                      " Faster completion
    set timeoutlen=100                      " By default timeoutlen is 1000 ms
    set clipboard=unnamedplus               " Copy paste between vim and everything else
    set showmatch                           " show matches
    set ignorecase                          " ignore case on matches
    set smartcase
    set incsearch
    set backspace=indent,eol,start          " backspace like normal people
    set listchars=tab:→→,trail:●,nbsp:○     " visualize whitespace
    set list
    set mmp=5000                            " for floatingterm

    " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
    au! BufWritePost $MYVIMRC source %
    " Jump to last open
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    " Store temporarily files globally instead of in working directory
    set backupdir=~/.config/nvim/backup
    if !isdirectory(expand(&backupdir))
        call mkdir(expand(&backupdir), "p")
    endif

    set directory=~/.vim/tmp/swap
    if !isdirectory(expand(&directory))
        call mkdir(expand(&directory), "p")
    endif

    if has('persistent_undo')
        set undodir=~/.config/nvim/undodir
        if !isdirectory(expand(&undodir))
            call mkdir(expand(&undodir), "p")
        endif
    endif

    " show search count
    set shortmess -=S
endif

