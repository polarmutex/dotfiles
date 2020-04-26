
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
"runtime! completion.vim
runtime! completion_coc.vim
runtime! hardmode.vim

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

let g:python3_host_prog = '/home/blueguardian/.cache/pypoetry/virtualenvs/nvim-py-venv-Pvle36et-py3.7/bin/python'

" Neoterm
" Sets default location that neoterm opens
let g:neoterm_size = 5
let g:neoterm_default_mod = 'botright'
"let g:neoterm_autojump = 1

" Lens
let g:lens#disabled_filetypes = ['defx', 'fzf']
let g:lens#height_resize_max = 20
let g:lens#height_resize_min = 5
let g:lens#width_resize_max = 80
let g:lens#width_resize_min = 20

nnoremap <silent> <C-z> :call nvim_toggle_terminal#ToggleTerminal()<Enter>
tnoremap <silent> <C-z> <C-\><C-n>:call nvim_toggle_terminal#ToggleTerminal()<Enter>
