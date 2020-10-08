" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" Not a fan of floating windows for this
"let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['/'] = [ ':Commentary'                , 'comment' ]
let g:which_key_map['.'] = [ ':e $MYVIMRC'                , 'open init' ]
let g:which_key_map[';'] = [ ':Commands'                  , 'commands' ]
let g:which_key_map['='] = [ '<C-W>='                     , 'balance windows' ]
let g:which_key_map[','] = [ 'Startify'                   , 'start screen' ]
let g:which_key_map['d'] = [ ':bd'                        , 'delete buffer']
let g:which_key_map['f'] = [ ':Files'                     , 'search files' ]
let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below']
let g:which_key_map['q'] = [ 'q'                          , 'quit' ]
let g:which_key_map['S'] = [ ':SSave'                     , 'save session' ]
let g:which_key_map['T'] = [ ':Rg'                        , 'search text' ]
let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right']
let g:which_key_map['W'] = [ 'w'                          , 'write' ]

" Group mappings

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'c' : [':ColorizerToggle'        , 'colorizer'],
      \ 'n' : [':set nonumber!'          , 'line-numbers'],
      \ 'r' : [':set norelativenumber!'  , 'relative line nums'],
      \ 's' : [':let @/ = ""'            , 'remove search highlight'],
      \ 'v' : [':Vista!!'                , 'tag viewer'],
      \ }

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }

" s is for search
command! TelescopeGitFiles       lua require('polarmutex.telescope')["git_files"]()
command! TelescopeLiveGrep       lua require('polarmutex.telescope')["live_grep"]()
command! TelescopeLspReferences  lua require('polarmutex.telescope')["lsp_references"]()
command! TelescopeLspCodeActions lua require('polarmutex.telescope')["lsp_code_actions"]()
command! TelescopeLspDocSymbols  lua require('polarmutex.telescope')["lsp_document_symbols"]()
command! TelescopeLspWSSymbols   lua require('polarmutex.telescope')["lsp_workspace_symbols"]()
command! TelescopeOldFiles       lua require('polarmutex.telescope')["old_files"]()
command! TelescopeFindFiles      lua require('polarmutex.telescope')["fd"]()
command! TelescopeBuffers        lua require('polarmutex.telescope')["buffers"]()
command! TelescopeCurrentBuffer  lua require('polarmutex.telescope')["current_buffer"]()
command! TelescopeHelpTags       lua require('polarmutex.telescope')["help_tags"]()
command! TelescopeBuiltin        lua require('polarmutex.telescope')["builtin"]()
command! TelescopeReloader       lua require('polarmutex.telescope')["reloader"]()
command! TelescopeQuickfix       lua require('polarmutex.telescope')["quickfix"]()
command! TelescopeLocList        lua require('polarmutex.telescope')["loclist"]()
command! TelescopeCommands       lua require('polarmutex.telescope')["commands"]()
command! TelescopeCommandHistory lua require('polarmutex.telescope')["command_history"]()
command! TelescopeTreesitter     lua require('polarmutex.telescope')["treesitter"]()
command! TelescopeGrepString     lua require('polarmutex.telescope')["grep_string"]()
command! TelescopePlanets        lua require('polarmutex.telescope')["planets"]()
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ 'g' : [":TelescopeGitFiles"      , 'git files'],
      \ 't' : [':TelescopeLiveGrep'      , 'live grep'],
      \ 'r' : [':TelescopeLspReferences' , 'lsp references'],
      \ 'a' : [':TelescopeLspCodeActions', 'lsp code actions'],
      \ 'd' : [':TelescopeLspDocSymbols' , 'lsp document symbols'],
      \ 'w' : [':TelescopeLspWSSymbols'  , 'lsp workspace symbols'],
      \ 'q' : [':TelescopeQuickfix'      , 'quickfix'],
      \ 'l' : [':TelescopeLoclist'       , 'location list'],
      \ 'o' : [':TelescopeOldFiles'      , 'old files'],
      \ 'c' : [':TelescopeCommands'      , 'command history'],
      \ 'x' : [':TelescopeBuiltin'       , 'builtin'],
      \ 'n' : [':TelescopeTreesitter'    , 'treesitter'],
      \ 's' : [':TelescopeGrepString'    , 'grep string'],
      \ 'z' : [':TelescopePlanets'       , 'planets'],
      \ 'h' : [':TelescopeHelpTags'      , 'help tags'],
      \ 'f' : [':TelescopeFindFiles'     , 'find files'],
      \ 'p' : [':TelescopeReloader'      , 'lua reloader'],
      \ 'b' : [':TelescopeCurrentBuffer' , 'current buffer'],
      \ 'j' : [':TelescopeBuffers'       , 'buffers'],
      \ 'm' : [':TelescopeCommandHistory', 'command history'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':Git add %'                        , 'add current'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ }

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
      \ 'O' : [':CocList outline'                    , 'outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 'R' : ['<Plug>(coc-references)'              , 'references'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'v' : [':Vista!!'                            , 'tag viewer'],
      \ }

" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ }

" f is for finances
function BeancountCopyTransaction()
    lua require('plenary.reload').reload_module('beancount'); require('beancount').CopyTransaction({})
endfunction
let g:which_key_map.f = {
            \ 'name' : '+finances' ,
      \ 't' : [':call BeancountCopyTransaction()'        , 'copy txn'],
      \ 'c' : [':%s/txn/*/gc'        , 'confirm txns'],
      \ }
" Register which key map
call which_key#register('<Space>', "g:which_key_map")
