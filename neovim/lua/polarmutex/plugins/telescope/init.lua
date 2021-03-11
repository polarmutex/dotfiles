local themes = require('telescope.themes')
local actions = require('telescope.actions')

local M = {}

-- GIT
M.git_files = function()
    local opts = themes.get_dropdown {
        winblend = 10,
        border = true,
        previewer = false,
        shorten_path = false,
    }

    require('telescope.builtin').git_files(opts)
end
M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            actions.select_default:replace(actions.git_track_branch)
            return true
        end
    })
end
--TODO
--octo commits, files, gists, issues, prs, live_issues, live_prs

-- Files / Meta
M.builtin = function()
    require('telescope.builtin').builtin()
end
M.fd = function()
    require('telescope.builtin').fd()
end
M.buffers = function()
    local opts = {
    }
    require('telescope.builtin').buff(opts)
end
M.current_buffers = function()
    local opts = {
        winblend = 10,
        previewer = false,
        shorten_path = false,
    }
    require('telescope.builtin').current_buffer_fuzzy_find(opts)
end
M.live_grep = function()
    require('telescope').extensions.fzf_writer.staged_grep {
        shorten_path = true,
        previewer = false,
        fzf_separator = "|>",
    }
end
M.grep_last_search = function(opts)
    opts = opts or {}

    -- \<getreg\>\C
    -- -> Subs out the search things
    local register = vim.fn.getreg('/'):gsub('\\<', ''):gsub('\\>', ''):gsub("\\C", "")

    opts.shorten_path = true
    opts.word_match = '-w'
    opts.search = register

    require('telescope.builtin').grep_string(opts)
end

-- LSP
M.lsp_code_actions = function()
    local opts = themes.get_dropdown {
        winblend = 10,
        border = true,
        previewer = false,
        shorten_path = false,
    }

    require('telescope.builtin').lsp_code_actions(opts)
end

-- Plugins
function M.installed_plugins()
    require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath('data') .. '/site/pack/packer/start/'
    }
end

-- Neovim
M.help_tags = function()
    local opts = {
        show_version = true
    }
    require('telescope.builtin').help_tags(opts)
end

return setmetatable({}, {
    __index = function(_, k)
        if M[k] then
            return M[k]
        else
            return require('telescope.builtin')[k]
        end
    end
})
