let g:languagetool_server_jar='$HOME/repos/github/LanguageTool-5.2-SNAPSHOT/languagetool-server.jar'

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
