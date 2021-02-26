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
                ["<c-s>"] = actions.select_vertical,
            },
        },

        borderchars = {
            { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
            preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        },

        file_sorter = sorters.get_fzy_sorter,
    },

    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },

        fzf_writer = {
            use_highlighter = false,
            minimum_grep_characters = 4,
        }
    },
}

-- Load the fzy native extension at the start.
require('telescope').load_extension('fzy_native')
--require('telescope').load_extension('ghcli')
--require('telescope').load_extension('cht-sh')

require('polarmutex.plugins.telescope.mappings')

