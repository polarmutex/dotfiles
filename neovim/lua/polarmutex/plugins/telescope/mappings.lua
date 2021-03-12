if not pcall(require, 'telescope') then
  return
end

local sorters = require('telescope.sorters')

TelescopeMapArgs = TelescopeMapArgs or {}

local map_tele = function(key, f, options, buffer)
    local map_key = vim.api.nvim_replace_termcodes(key .. f, true, true, true)

    TelescopeMapArgs[map_key] = options or {}

    local mode = "n"
    local rhs = string.format(
        "<cmd>lua R('polarmutex.plugins.telescope')['%s'](TelescopeMapArgs['%s'])<CR>",
        f,
        map_key
    )

    local map_options = {
        noremap = true,
        silent = true,
    }

    if not buffer then
        vim.api.nvim_set_keymap(mode, key, rhs, map_options)
    else
        vim.api.nvim_buf_set_keymap(0, mode, key, rhs, map_options)
    end
end

vim.api.nvim_set_keymap('c', '<c-r><c-r>', '<Plug>(TelescopeFuzzyCommandSearch)', { noremap = false, nowait = true })

-- Search
map_tele('<space>gw', 'grep_string', {
  short_path = true,
  word_match = '-w',
  only_sort_text = true,
  layout_strategy = 'vertical',
  sorter = sorters.get_fzy_sorter(),
})
--map_tele('<space>f/', 'grep_last_search', {
--  layout_strategy = 'vertical',
--})

-- Files
map_tele('<leader>sg', 'git_files')
map_tele('<space>sl', 'live_grep')
map_tele('<space>sd', 'fd')
--map_tele('<space>pp', 'project_search')

-- Nvim
--map_tele('<space>sb', 'buffers')
--map_tele('<space>sa', 'installed_plugins')
--map_tele('<space>si', 'search_all_files')
--map_tele('<space>ff', 'curbuf')
map_tele('<space>sh', 'help_tags')
map_tele('<space>so', 'vim_options')
map_tele('<space>sk', 'keymaps')

-- Git / Github
map_tele('<leader>gb','git_branches')
map_tele('<leader>gc','git_commits')
map_tele('<leader>gd','git_bcommits')
map_tele('<leader>gi','gh_issues')
map_tele('<leader>gr','gh_pull_request')

-- Telescope Meta
map_tele('<leader>sB', 'builtin')

return map_tele
