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
-- Undo
mapper('n','<leader>u',':UndotreeShow<CR>',{})

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

-- harpoon
-- Terminal commands
-- ueoa is first through fourth finger left hand home row.
-- This just means I can crush, with opposite hand, the 4 terminal positions
--
-- These functions are stored in harpoon.  A plugn that I am developing
mapper('n','<C-m>',':lua require("harpoon.mark").add_file()<CR>',{})
mapper('n','<C-e>',':lua require("harpoon.ui").toggle_quick_menu()<CR>',{})
mapper('n','<C-h>',':lua require("harpoon.ui").nav_file(2)<CR>',{})
mapper('n','<C-t>',':lua require("harpoon.ui").nav_file(2)<CR>',{})
mapper('n','<C-n>',':lua require("harpoon.ui").nav_file(3)<CR>',{})
mapper('n','<C-s>',':lua require("harpoon.ui").nav_file(4)<CR>',{})
mapper('n','<C-g>',':lua require("harpoon.mark").rm_file()<CR>',{})
mapper('n','<leader><C-r>',':lua require("harpoon.mark").shorten_list()<CR>',{})
mapper('n','<leader>r',':lua require("harpoon.mark").promote()<CR>',{})
mapper('n','<leader>tu',':lua require("harpoon.term").gotoTerminal(1)<CR>',{})
mapper('n','<leader>te',':lua require("harpoon.term").gotoTerminal(2)<CR>',{})
mapper('n','<leader>cu',':lua require("harpoon.term").sendCommand(1, 1)<CR>',{})
mapper('n','<leader>ce',':lua require("harpoon.term").sendCommand(1, 2)<CR>',{})
