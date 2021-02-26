vim.opt.completeopt = { "menuone" , "noinsert", "noselect" }

-- Don't show the dumb matching stuff.
-- TODO look into this
vim.cmd [[set shortmess+=c]]

-- completion.nvim
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
--vim.g.completion_enable_snippet = 'snippets.nvim'
-- Decide on length
vim.g.completion_trigger_keyword_length = 2

local has_compe, compe = pcall(require, 'compe')
if has_compe then
    print('setting up compe')
    compe.setup {
        enabled = true;
        autocomplete = true;
        debug = false;
        min_length = 1;
        preselect = 'disable';
        throttle_time = 80;
        source_timeout = 200;
        incomplete_delay = 400;
        allow_prefix_unmatch = false;
        max_abbr_width = 100;
        max_kind_width = 100;
        max_menu_width = 100;
        documentation = true;

        source = {
            path = true;
            buffer = true;
            calc = true;
            vsnip = true;
            nvim_lsp = true;
            nvim_lua = true;
            spell = true;
            tags = true;
            snippets_nvim = true;
        };
    }
end
