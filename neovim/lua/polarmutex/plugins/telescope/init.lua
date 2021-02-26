local themes = require('telescope.themes')

local M = {}

function M.fd()
    require('telescope.builtin').fd()
end

function M.builtin()
    require('telescope.builtin').builtin()
end

function M.git_files()
    local opts = themes.get_dropdown {
        winblend = 10,
        border = true,
        previewer = false,
        shorten_path = false,
    }

    require('telescope.builtin').git_files(opts)
end

function M.lsp_code_actions()
    local opts = themes.get_dropdown {
        winblend = 10,
        border = true,
        previewer = false,
        shorten_path = false,
    }

    require('telescope.builtin').lsp_code_actions(opts)
end

function M.live_grep()
    require('telescope').extensions.fzf_writer.staged_grep {
        shorten_path = true,
        previewer = false,
        fzf_separator = "|>",
    }
end

function M.grep_last_search(opts)
    opts = opts or {}

    -- \<getreg\>\C
    -- -> Subs out the search things
    local register = vim.fn.getreg('/'):gsub('\\<', ''):gsub('\\>', ''):gsub("\\C", "")

    opts.shorten_path = true
    opts.word_match = '-w'
    opts.search = register

    require('telescope.builtin').grep_string(opts)
end

function M.installed_plugins()
    require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath('data') .. '/site/pack/packer/start/'
    }
end

function M.buffers()
    local opts = {
    }
    require('telescope.builtin').buff(opts)
end

function M.current_buffers()
    local opts = {
        winblend = 10,
        previewer = false,
        shorten_path = false,
    }
    require('telescope.builtin').current_buffer_fuzzy_find(opts)
end

function M.help_tags()
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
