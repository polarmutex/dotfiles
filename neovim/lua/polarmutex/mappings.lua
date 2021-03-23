local mapper = function(mode, key, result, options)
    vim.api.nvim_set_keymap(mode, key, result, options)
end

--
--LEADER
--

--C

mapper('n','<leader>ce',':lua require("harpoon.term").sendCommand(1, 2)<CR>',{})
mapper('n','<leader>cp',":lua require('plenary.reload').reload_module('contextprint'); require('contextprint').add_statement()<CR>",{})
mapper('n','<leader>cu',':lua require("harpoon.term").sendCommand(1, 1)<CR>',{})

--G

mapper('n','<leader>gb',':lua require("polarmutex.plugins.telescope").git_branches()<CR>',{})
mapper('n','<leader>gc',':lua require("polarmutex.plugins.telescope").git_commits()<CR>',{})
mapper('n','<leader>gd',':lua require("polarmutex.plugins.telescope").git_bcommits()<CR>',{})
mapper('n','<leader>gi',':lua require("polarmutex.plugins.telescope").gh_issues()<CR>',{})
mapper('n','<leader>gr',':lua require("polarmutex.plugins.telescope").gh_pull_request()<CR>',{})

--M

mapper('n','<leader>mc',":%s/txn/*/gc<CR>",{}) -- change uncleared transactions to cleared in beancount
mapper('n','<leader>mt',":lua require('plenary.reload').reload_module('beancount'); require('beancount').CopyTransaction()<CR>",{}) --find transactions to copy

--S

mapper('n','<leader>sB',':lua require("polarmutex.plugins.telescope").builtin()<CR>',{})
mapper('n','<leader>sc',':lua require("telescope.builtin").commands()<CR>',{})
mapper('n','<leader>sch',':lua require("telescope.builtin").command_history()<CR>',{})
mapper('n','<leader>sC',':lua require("telescope.builtin").git_string()<CR>',{})
mapper('n','<leader>sd',':lua require("polarmutex.plugins.telescope").nvim_dotfiles()<CR>',{})
mapper('n','<leader>sf',':lua require("polarmutex.plugins.telescope").fd()<CR>',{})
mapper('n','<leader>sh',':lua require("polarmutex.plugins.telescope").help_tags()<CR>',{})
mapper('n','<leader>sH',':lua require("telescope.builtin").highlights()<CR>',{})
mapper('n','<leader>sk',':lua require("polarmutex.plugins.telescope").keymaps()<CR>',{})
mapper('n','<leader>sl',':lua require("polarmutex.plugins.telescope").live_grep()<CR>',{})
mapper('n','<leader>sg',':lua require("polarmutex.plugins.telescope").git_files()<CR>',{})
mapper('n','<leader>sp',':lua require("telescope.builtin").spell_suggest()<CR>',{})
mapper('n','<leader>sq',':lua require("telescope.builtin").quickfix()<CR>',{})

--T

mapper('n','<leader>te',':lua require("harpoon.term").gotoTerminal(2)<CR>',{})
mapper('n','<leader>tu',':lua require("harpoon.term").gotoTerminal(1)<CR>',{})

--U

mapper('n','<leader>u',':UndotreeShow<CR>',{})

--mapper('n','<leader><C-r>',':lua require("harpoon.mark").shorten_list()<CR>',{})
--mapper('n','<leader>r',':lua require("harpoon.mark").promote()<CR>',{})

--
-- CTRL
--

mapper('n','<C-j>','<C-W><C-J>',{noremap=true})
mapper('n','<C-k>','<C-W><C-K>',{noremap=true})
mapper('n','<C-l>','<C-W><C-L>',{noremap=true})
mapper('n','<C-h>','<C-W><C-H>',{noremap=true})
--mapper('n','<C-m>',':lua require("harpoon.mark").add_file()<CR>',{})
--mapper('n','<C-e>',':lua require("harpoon.ui").toggle_quick_menu()<CR>',{})
--mapper('n','<C-h>',':lua require("harpoon.ui").nav_file(2)<CR>',{})
--mapper('n','<C-t>',':lua require("harpoon.ui").nav_file(2)<CR>',{})
--mapper('n','<C-n>',':lua require("harpoon.ui").nav_file(3)<CR>',{})
--mapper('n','<C-s>',':lua require("harpoon.ui").nav_file(4)<CR>',{})
--mapper('n','<C-g>',':lua require("harpoon.mark").rm_file()<CR>',{})

--
--ALT
--

--" Use alt + hjkl to resize windows
mapper('n','<M-j>',':resize -3<CR>',{noremap=true})
mapper('n','<M-k>',':resize +3<CR>',{noremap=true})
mapper('n','<M-h>',':vertical resize -3<CR>',{noremap=true})
mapper('n','<M-l>',':vertical resize +3<CR>',{noremap=true})

--
-- OTHER
--

-- Allow ESC to leave terminal
mapper('t','<Esc>','<C-\\><C-n>',{noremap=true});
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
