require('telescope').setup {
    defaults = {
        winblend = 0,
        layout_strategy = "vertical",
        preview_cutoff = 120,

        sorting_strategy = "ascending",
        prompt_position = "top",

        borderchars = {
            { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},

            preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        },
    }
}

local themes = require('telescope.themes')

local M = {}

function M.fd()
    local opts = themes.get_dropdown {
        winblend = 10,
        previewer = false,
        shorten_path = false,
    }
    require('telescope.builtin').fd(opts)
end

function M.git_files()
    local opts = themes.get_dropdown {
        winblend = 10,
        previewer = false,
        shorten_path = false,
    }
    require('telescope.builtin').git_files(opts)
end

function M.live_grep()
    local opts = {
        shorten_path = true,
    }
    require('telescope.builtin').live_grep(opts)
end

function M.old_files()
    local opts = {
    }
    require('telescope.builtin').old_files(opts)
end

function M.installed_plugins()
    local opts = {
        cwd = vim.fn.stdpath('data') .. '/site/pack/packer/start/'
    }
    require('telescope.builtin').fd(opts)
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
