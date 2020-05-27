" Turn spellcheck on for markdown files
augroup auto_spellcheck
    autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

if exists('##TextYankPost')
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank('Substitute',200)
endif
