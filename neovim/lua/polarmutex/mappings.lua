local mapper = function(mode, key, result, options)
    vim.api.nvim_set_keymap(mode, key, result, options)
end

--"to avoid the mistake of uppercasing these
--cnoreabbrev W! w!
--cnoreabbrev Q! q!
--cnoreabbrev Qa! qa!
--cnoreabbrev Wq wq
--cnoreabbrev Wa wa
--cnoreabbrev wQ wq
--cnoreabbrev WQ wq
--cnoreabbrev W w
--cnoreabbrev Q q
--cnoreabbrev Qa qa

--"split nav with control dir
mapper('n','<C-j>','<C-W><C-J>',{noremap=true})
mapper('n','<C-k>','<C-W><C-K>',{noremap=true})
mapper('n','<C-l>','<C-W><C-L>',{noremap=true})
mapper('n','<C-h>','<C-W><C-H>',{noremap=true})

--" Use alt + hjkl to resize windows
mapper('n','<M-j>',':resize -3<CR>',{noremap=true})
mapper('n','<M-k>',':resize +3<CR>',{noremap=true})
mapper('n','<M-h>',':vertical resize -3<CR>',{noremap=true})
mapper('n','<M-l>',':vertical resize +3<CR>',{noremap=true})

--"tab management with t leader
mapper('n','tn',':tabnew<CR>',{noremap=true})
mapper('n','tq',':tabclose<CR>',{noremap=true})

--" Map save to Ctrl + S
--map <c-s> :w<CR>
--imap <c-s> <C-o>:w<CR>
--nnoremap <Leader>s :w<CR>

--" visual move and highligh
--" from the Primeagen
--vnoremap J :m '>+1<CR>gv=gv'
--vnoremap K :m '<-2<CR>gv=gv'

-- git
--'a' : [':Git add .'                        , 'add all'],
--'A' : [':Git add %'                        , 'add current'],
--'b' : [':Git blame'                        , 'blame'],
--'B' : [':GBrowse'                          , 'browse'],
--'c' : [':Git commit'                       , 'commit'],
--'d' : [':Git diff'                         , 'diff'],
--'D' : [':Gdiffsplit'                       , 'diff split'],
--'g' : [':GGrep'                            , 'git grep'],
--'G' : [':Gstatus'                          , 'status'],
--'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
--'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
--'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
--'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
--'l' : [':Git log'                          , 'log'],
--'p' : [':Git push'                         , 'push'],
--'P' : [':Git pull'                         , 'pull'],
--'r' : [':GRemove'                          , 'remove'],
--'s' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
--'t' : [':GitGutterSignsToggle'             , 'toggle signs'],
--'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],

-- terminal / harpoon
mapper('n','<leader>tt',':call GotoBuffer(0)<CR> | :startinsert<CR>',{})
mapper('n','<leader>ts',':call GotoBuffer(1)<CR> | :startinsert<CR>',{})
mapper('n','<leader>tr',':call GotoBuffer(2)<CR> | :startinsert<CR>',{})
mapper('n','<leader>ta',':call GotoBuffer(3)<CR> | :startinsert<CR>',{})
-- turn terminal to normal mode with escape
mapper('t','<Esc>','<C-\\><C-n>',{noremap=true});

-- contextprint
mapper('n','<leader>cp',":lua require('plenary.reload').reload_module('contextprint'); require('contextprint').add_statement()<CR>",{})


-- finances
mapper('n','<leader>ft',":lua require('plenary.reload').reload_module('beancount'); require('beancount').CopyTransaction()<CR>",{})
mapper('n','<leader>fc',":%s/txn/*/gc<CR>",{})
