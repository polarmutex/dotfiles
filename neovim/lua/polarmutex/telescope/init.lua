local actions = require('telescope.actions')
local sorters = require('telescope.sorters')
local themes = require('telescope.themes')

require('telescope').setup {
  defaults = {
    prompt_prefix = ' >',

    winblend = 0,
    preview_cutoff = 120,

    scroll_strategy = 'cycle',
    layout_strategy = 'vertical',
    layout_defaults = {
      horizontal = {
        width_padding = 0.1,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      }
    },

    sorting_strategy = "descending",
    prompt_position = "bottom",
    color_devicons = true,

    mappings = {
      i = {
        ["<c-x>"] = false,
        ["<c-s>"] = actions.goto_file_selection_split,
      },
    },

    borderchars = {
      { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
      preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    },

    file_sorter = sorters.get_fzy_sorter,
  }
}

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
