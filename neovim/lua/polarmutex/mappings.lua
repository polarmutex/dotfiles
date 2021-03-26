local utils = require('polarmutex.utils')

local n, i, t, esc = "n", "i", "t", "<esc>"
local silent = { silent = true }

local maps = {

    -- LSP
    { n, "gd",          "<cmd>lua vim.lsp.buf.definition()<cr>", silent },
	{ n, "K",           "<cmd>lua vim.lsp.buf.hover()<cr>", silent },
	{ n, "gD",          "<cmd>lua vim.lsp.buf.implementation()<CR>", silent },
    { n, '<C-k>',       '<cmd>lua vim.lsp.buf.signature_help()<CR>', silent},
	{ n, "1gD",         "<cmd>lua vim.lsp.buf.type_definition()<CR>", silent },
	{ n, "gr",          "<cmd>lua require'telescope.builtin'.lsp_references{}<CR>", silent },
	{ n, "g0",          "<cmd>lua vim.lsp.buf.document_symbol()<CR>", silent },
	{ n, "gW",          "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", silent },
	{ n, "<c-]>",       "<cmd>lua vim.lsp.buf.declaration()<CR>", silent },
    { n, '<space>wa',   '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', silent},
    { n, '<space>wr',   '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', silent},
    { n, '<space>wl',   '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', silent},
	{ n, "<Leader>re",  "<cmd>lua vim.lsp.buf.rename()<CR>", silent },
	{ n, "<Leader>ca",  "<cmd>lua vim.lsp.buf.code_action()<CR>", silent },
	{ n, "<Leader>di",  "<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>", silent },
    { n, '[d',          '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', silent},
    { n, ']d',          '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', silent},
    { n, '<space>q',    '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', silent},
    { n, "<space>f",    "<cmd>lua vim.lsp.buf.formatting()<CR>", silent},
    { n, "<space>f",    "<cmd>lua vim.lsp.buf.range_formatting()<CR>", silent},

    -- Testing
	{ n, "<leader>T", "<cmd>Ultest<cr>" },
	{ n, "]t", "<plug>(ultest-next-fail)" },
	{ n, "[t", "<plug>(ultest-prev-fail)" },


    -- Harpoon
    { n, '<leader>te',':lua require("harpoon.term").gotoTerminal(2)<CR>'},
    { n, '<leader>ce',':lua require("harpoon.term").sendCommand(1, 2)<CR>'},
    { n, '<leader>tu',':lua require("harpoon.term").gotoTerminal(1)<CR>'},
    { n, '<leader>cu',':lua require("harpoon.term").sendCommand(1, 1)<CR>'},

    { n, '<leader>cp',":lua require('plenary.reload').reload_module('contextprint'); require('contextprint').add_statement()<CR>"},

    -- Git
    { n, '<leader>gb',':lua require("polarmutex.plugins.telescope").git_branches()<CR>'},
    { n, '<leader>gc',':lua require("polarmutex.plugins.telescope").git_commits()<CR>'},
    { n, '<leader>gd',':lua require("polarmutex.plugins.telescope").git_bcommits()<CR>',},
    { n, '<leader>gi',':lua require("polarmutex.plugins.telescope").gh_issues()<CR>'},
    { n, '<leader>gr',':lua require("polarmutex.plugins.telescope").gh_pull_request()<CR>'},
    { n, '<leader>hb','<cmd>lua require("gitsigns").blame_line()<CR>'},
    { n, '<leader>hp','<cmd>lua require("gitsigns").preview_hunk()<CR>'},
    { n, '<leader>hr','<cmd>lua require("gitsigns").reset_hunk()<CR>'},
    { n, '<leader>hR','<cmd>lua require("gitsigns").reset_buffer()<CR>'},
    { n, '<leader>hs','<cmd>lua require("gitsigns").stage_hunk()<CR>'},
    { n, '<leader>hu','<cmd>lua require("gitsigns").undo_stage_hunk()<CR>'},

    -- Beancount
    { n, '<leader>mc',":%s/txn/*/gc<CR>"}, -- change uncleared transactions to cleared in beancount
    { n,'<leader>mt',":lua require('plenary.reload').reload_module('beancount'); require('beancount').CopyTransaction()<CR>"}, --find transactions to copy

    -- Find/Search Files
    { n, '<leader>sB',':lua require("polarmutex.plugins.telescope").builtin()<CR>'},
    { n, '<leader>sc',':lua require("telescope.builtin").commands()<CR>'},
    { n, '<leader>sch',':lua require("telescope.builtin").command_history()<CR>'},
    { n, '<leader>sC',':lua require("telescope.builtin").git_string()<CR>'},
    { n, '<leader>sd',':lua require("polarmutex.plugins.telescope").nvim_dotfiles()<CR>'},
    { n, '<leader>sf',':lua require("polarmutex.plugins.telescope").fd()<CR>'},
    { n, '<leader>sh',':lua require("polarmutex.plugins.telescope").help_tags()<CR>'},
    { n, '<leader>sH',':lua require("telescope.builtin").highlights()<CR>'},
    { n,'<leader>sk',':lua require("polarmutex.plugins.telescope").keymaps()<CR>'},
    { n, '<leader>sl',':lua require("polarmutex.plugins.telescope").live_grep()<CR>'},
    { n, '<leader>sg',':lua require("polarmutex.plugins.telescope").git_files()<CR>'},
    { n, '<leader>sp',':lua require("telescope.builtin").spell_suggest()<CR>'},
    { n, '<leader>sq',':lua require("telescope.builtin").quickfix()<CR>'},


    -- Undo
    { n, '<leader>u',':UndotreeShow<CR>'},


    -- Move windows
    { n, '<C-j>','<C-W><C-J>'},
    { n, '<C-k>','<C-W><C-K>'},
    { n, '<C-l>','<C-W><C-L>'},
    { n, '<C-h>','<C-W><C-H>'},

    --" Use alt + hjkl to resize windows
    { n, '<M-j>',':resize -3<CR>'},
    { n, '<M-k>',':resize +3<CR>'},
    { n, '<M-h>',':vertical resize -3<CR>'},
    { n, '<M-l>',':vertical resize +3<CR>'},

    -- Allow ESC to leave terminal
    { t, '<Esc>','<C-\\><C-n>'},

    --"tab management with t leader
    { n, 'tn',':tabnew<CR>'},
    { n, 'tq',':tabclose<CR>'},

    -- Save and Quit
    { n, "<Leader>w", ":w<cr>" },
	{ n, "<Leader>q", ":q<cr>" },

    --" visual move and highligh
    --" from the Primeagen
    --vnoremap J :m '>+1<CR>gv=gv'
    --vnoremap K :m '<-2<CR>gv=gv'

    -- Disable up/down in insert mode
	--{ i, "<Up>", "<nop>" },
	--{ i, "<Down>", "<nop>" },
}

utils.keymaps(maps)
