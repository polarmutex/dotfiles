
" LSP Mappings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implemenation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gd   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>

nnoremap <leader>, :let @/=''<CR>:noh<CR>|       " clear search
nnoremap <leader>d :w !diff % -<CR>|             " show diff
nnoremap <leader>n :set invnumber number?<CR>|   " toggle line numbers
nnoremap <leader>r :source $MYVIMRC<CR>|         " reload .vimrc
nnoremap <silent> <leader>t :call StripTrailingWhitespace()<CR>|    " trim whitespace
nnoremap <leader>w :set wrap! wrap?<CR>|         " toggle wrapping

" Map save to Ctrl + S
map <c-s> :w<CR>
imap <c-s> <C-o>:w<CR>
nnoremap <Leader>s :w<CR>

" Open vertical split
nnoremap <Leader>v <C-w>v
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap [l :lprevious<CR>
nnoremap ]l :lnext<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>
nnoremap [t :tprevious
nnoremap ]t :tnext
nnoremap [T :tfirst
nnoremap ]T :tlast
nnoremap [b :bprevious
nnoremap ]b :bnext
nnoremap [B :bfirst
nnoremap ]B :blast

" Vim Tmux Runner
nnoremap <leader>v- :VtrOpenRunner {"orientation": "v", "percentage": 30}<cr>
nnoremap <leader>v\ :VtrOpenRunner {"orientation": "h", "percentage": 30}<cr>
nnoremap <leader>vk :VtrKillRunner<cr>
nnoremap <leader>va :VtrAttachToPane<cr>
nnoremap <leader>vf :VtrFocusRunner<cr>
nnoremap <leader>vs :VtrSendCommandToRunner<space>
