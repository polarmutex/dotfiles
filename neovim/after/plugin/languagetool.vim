"let g:languagetool_server_jar='$HOME/repos/github/languagetool/dist/LanguageTool-5.2-SNAPSHOT/languagetool-server.jar'
let g:languagetool_server_command='/usr/bin/languagetool --http'

let g:languagetool = {
            \ '.' : {
            \       'disabledRules' : ''
            \ },
            \ 'text' : {
            \   'language' : 'en-US'
            \ },
            \ 'markdown' : { 'language' : 'en-US' },
            \ }

let g:languagetool_preview_flags = 'MC'
let g:languagetool_useFloatting = 1

let g:languagetool_debug = 1

autocmd User LanguageToolCheckDone LanguageToolSummary
" autocmd CursorHold * LanguageToolErrorAtPoint

hi LanguageToolGrammarError  guisp=#8be9fd gui=undercurl guifg=#8be9fd guibg=NONE ctermfg=white ctermbg=blue term=underline cterm=none
hi LanguageToolSpellingError guisp=#ff5555  gui=undercurl guifg=#ff5555 guibg=NONE ctermfg=white ctermbg=red  term=underline cterm=none
