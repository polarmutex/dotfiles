"to avoid the mistake of uppercasing these
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qa! qa!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa

"split nav with control dir
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -3<CR>
nnoremap <M-k>    :resize +3<CR>
nnoremap <M-h>    :vertical resize -3<CR>
nnoremap <M-l>    :vertical resize +3<CR>

"tab management with t leader
nnoremap tn :tabnew<CR>
nnoremap tq :tabclose<CR>

" Map save to Ctrl + S
map <c-s> :w<CR>
imap <c-s> <C-o>:w<CR>
nnoremap <Leader>s :w<CR>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
:nnoremap <c-u> viwU<Esc>
