local theme = require("polarmutex.colorschemes.gruvbox")

require("bufferline").setup({
    options = {
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 18,
        enforce_regular_tabs = true,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin",
        always_show_bufferline = false,
    },
    highlights = {
        background = {guifg = theme.GruvboxFg0.fg, guibg = theme.GruvboxBg0.fg},
        fill = {guifg = theme.GruvboxFg0.fg, guibg = theme.GruvboxBg0.fg},
        buffer_selected = {
            guifg = theme.GruvboxFg0.fg,
            guibg = theme.GruvboxBg0.fg,
            gui = "bold",
        },
        separator_visible = {guifg = theme.GruvboxFg0.fg, guibg = theme.GruvboxBg0.fg},
        separator_selected = {guifg = theme.GruvboxFg0.fg, guibg = theme.GruvboxBg0.fg},
        separator = {guifg = theme.GruvboxFg0.fg, guibg = theme.GruvboxBg0.fg},
        indicator_selected = {guifg = theme.GruvboxFg0.fg, guibg = theme.GruvboxBg0.fg},
        modified_selected = {guifg = theme.GruvboxFg0.fg, guibg = theme.GruvboxBg0.fg},
    },
})
