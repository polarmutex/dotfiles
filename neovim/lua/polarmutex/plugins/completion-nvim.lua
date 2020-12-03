local opt = vim.opt

opt.completeopt = { "menuone" , "noinsert", "noselect" }


-- Don't show the dumb matching stuff.
vim.cmd [[set shortmess+=c]]

-- completion.nvim
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
--vim.g.completion_enable_snippet = 'snippets.nvim'

-- Decide on length
vim.g.completion_trigger_keyword_length = 2

