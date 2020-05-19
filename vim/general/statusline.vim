scriptencoding utf-8
if exists('g:loaded_statusline')
    finish
endif

if exists('g:vscode')
    set statusline=
    let g:loaded_statusline = v:true
    finish
endif

set noshowmode
set laststatus=2

function! UpdateColors(mode) abort
    " Normal mode
    if a:mode ==# 'n'
        " Insert mode
        hi StatuslineAccent guibg=#d75f5f gui=bold guifg=#e9e9e9
    elseif a:mode ==# 'i'
        " Replace mode
        hi StatuslineAccent guifg=#e9e9e9 gui=bold guibg=#dab997
    elseif a:mode ==# 'R'
        " Command mode
        hi StatuslineAccent guifg=#e9e9e9 gui=bold guibg=#afaf00
    elseif a:mode ==# 'c'
        " Terminal mode
        hi StatuslineAccent guifg=#e9e9e9 gui=bold guibg=#83adad
    elseif a:mode ==# 't'
        hi StatuslineAccent guifg=#e9e9e9 gui=bold guibg=#6f6f6f
        " Visual mode
    else
        hi StatuslineAccent guifg=#e9e9e9 gui=bold guibg=#f485dd
    endif

    if &modified
        hi StatuslineFilename guifg=#d75f5f gui=bold guibg=#3a3a3a
    else
        hi StatuslineFilename guifg=#e9e9e9 gui=bold guibg=#3a3a3a
    endif
    " Return empty string so as not to display anything in the statusline
    return ''"
endfunction

function! SetModifiedSymbol(modified) abort
    if a:modified == 1
        hi StatuslineModified guibg=#3a3a3a gui=bold guifg=#d75f5f
        " TODO make a dot
        return ' M'
    else
        hi StatuslineModified guibg=#3a3a3a gui=bold guifg=#afaf00
        return ''
    endif
endfunction

function! statusline#get_mode(mode) abort
    let l:currentmode={
        \'n' : 'Normal',
        \'no' : 'N·Operator Pending',
        \'v' : 'Visual',
        \'V' : 'V·Line',
        \'^V' : 'V·Block',
        \'s' : 'Select',
        \'S': 'S·Line',
        \'^S' : 'S·Block',
        \'i' : 'Insert',
        \'R' : 'Replace',
        \'Rv' : 'V·Replace',
        \'c' : 'Command',
        \'cv' : 'Vim Ex',
        \'ce' : 'Ex',
        \'r' : 'Prompt',
        \'rm' : 'More',
        \'r?' : 'Confirm',
        \'!' : 'Shell',
        \'t' : 'Terminal'
        \}
    return toupper(get(l:currentmode, a:mode, 'V-Block'))
endfunction

function! statusline#filename() abort
    let base_name = fnamemodify(bufname('%'), ':~:.')
    let space = min([60, float2nr(floor(0.6 * winwidth(0)))])
    if len(base_name) <= space
        return base_name
    endif
    return pathshorten(base_name)
endfunction

function! statusline#filetype() abort
      return &filetype !=# '' ? &filetype : 'no filetype'
endfunctio

function! statusline#vc_status() abort
    let l:mark = ''
    let l:branch = gitbranch#name()
    let l:changes = sy#repo#get_stats()
    let l:status = l:changes[0] > 0 ? '+' . l:changes[0] : ''
    let l:prefix = l:changes[0] > 0 ? ' ' : ''
    let l:status = l:changes[1] > 0 ? l:status . l:prefix . '~' . l:changes[1] : l:status
    let l:prefix = l:changes[1] > 0 ? ' ' : ''
    let l:status = l:changes[2] > 0 ? l:status . l:prefix . '-' . l:changes[2] : l:status
    let l:status = l:status ==# '' ? '' : l:status . ' '
    return l:branch !=# '' ? l:status . l:mark . ' ' . l:branch . ' ' : ''
endfunction

function! statusline#have_lsp() abort
    return luaeval("#vim.lsp.buf_get_clients() > 0")
endfunction
function! statusline#lsp() abort
    return luaeval("require('lsp-statusline').lsp()")
endfunction

" Setup the statusline
set statusline=%{UpdateColors(mode())}

" Left side items
set statusline+=%#StatuslineAccent#\ %{statusline#get_mode(mode())}\ 

" Filetype icon
"set statusline+=%#StatuslineFiletype#\ %{statusline#icon()}

" Modified status
set statusline+=%#StatuslineModified#%{SetModifiedSymbol(&modified)}

" Filename
set statusline+=%#StatuslineFilename#\ %{statusline#filename()}\ %<

" Paste and RO
"set statusline+=%#StatuslineFilename#%{&paste?'PASTE\ ':''}
"set statusline+=%{&paste&&&readonly?'\ ':''}%r%{&readonly?'\ ':''}

" Line and Column
set statusline+=%#StatuslineLineCol#(Ln\ %l/%L,\ %#StatuslineLineCol#Col\ %c)\ %<

" Right side items
set statusline+=%=

" Filetype
set statusline+=%#StatuslineFiletype#%{statusline#filetype()}\ \ 

" Current scroll percentage and total lines of the file
set statusline+=%#StatuslinePercentage#%p%%\ (%L)\ \ 

" VC
"set statusline+=%#StatuslineVC#%{statusline#vc_status()}\ 

" LSP
set statusline+=%{statusline#have_lsp()?'':'\ '}%(%#StatuslineLint#%{statusline#lsp()}%)

" Setup the colors
function! s:setup_colors() abort
    hi StatusLine          guifg=#d485ad     guibg=NONE     gui=NONE
    hi StatusLineNC        guifg=#d75f5f     guibg=NONE     gui=bold

    hi StatuslineSeparator guifg=#3a3a3a gui=none guibg=none

    hi StatuslineFiletype guifg=#d9d9d9 gui=none guibg=#3a3a3a

    hi StatuslinePercentage guibg=#3a3a3a gui=none guifg=#dab997

    hi StatuslineNormal guibg=#3a3a3a gui=none guifg=#e9e9e9
    hi StatuslineVC guibg=#3a3a3a gui=none guifg=#a9a9a9

    hi StatuslineLintWarn guibg=#3a3a3a gui=none guifg=#ffcf00
    hi StatuslineLintChecking guibg=#3a3a3a gui=none guifg=#458588
    hi StatuslineLintError guibg=#3a3a3a gui=none guifg=#d75f5f
    hi StatuslineLintOk guibg=#3a3a3a gui=none guifg=#b8bb26
    hi StatuslineLint guibg=#e9e9e9 guifg=#3a3a3a

    hi StatuslineLineCol guibg=#3a3a3a gui=none guifg=#878787

    hi StatuslineFiletype guibg=#3a3a3a gui=none guifg=#e9e9e9
 endfunction

augroup statusline_colors
    au!
    au ColorScheme * call s:setup_colors()
augroup END

call s:setup_colors()
