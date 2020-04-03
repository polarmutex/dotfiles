
let g:mapleader=","
let g:maplocalleader="<Space>"

if has('nvim')
    let vim = stdpath('config')
else
    let vim = $HOME . '/.vim'
end

runtime! plugins.vim
runtime! settings.vim
runtime! colorscheme.vim
runtime! statusbar.vim
runtime! abbreviations.vim
runtime! mappings.vim
runtime! defx.vim
runtime! completion.vim

set ttyfast                             " assume fast terminal connection

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

let g:magit_default_fold_level = 0

nmap ] <Plug>(GitGutterNextHunk)
nmap [ <Plug>(GitGutterPrevHunk)
