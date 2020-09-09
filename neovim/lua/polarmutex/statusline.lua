local generator = function()
    local builtin = require('el.builtin')
    local extensions = require('el.extensions')
    local sections = require('el.sections')
    local subscribe = require('el.subscribe')

    local el_segments = {}

    -- Left Section
    table.insert(el_segments, extensions.mode)

    table.insert(el_segments, sections.split)

    -- Center Section
    table.insert(el_segments, builtin.file)
    table.insert(el_segments,
        sections.collapse_builtin {
            ' ',
            builtin.modified_flag
        }
    )

    table.insert(el_segments, sections.split)

    -- Right Section
    -- LSP Status
    local lsp_statusline = require('el.plugins.lsp_status')
    table.insert(el_segments, lsp_statusline.segment)
    table.insert(el_segments, lsp_statusline.current_function)
    table.insert(el_segments,
        subscribe.buf_autocmd(
            "el_git_status",
            "BufWritePost",
            function(window, buffer)
                return extensions.git_changes(window, buffer)
            end
        )
    )
    -- helper.async_buf_setter(
    --   win_id,
    --   'el_git_stat',
    --   extensions.git_changes,
    --   5000
    -- ),
    -- Line, Coll % Section
    table.insert(el_segments, '[')
    table.insert(el_segments, builtin.line)
    table.insert(el_segments, ':')
    table.insert(el_segments, builtin.column)
    table.insert(el_segments, ' - ')
    table.insert(el_segments, builtin.percentage_through_file)
    table.insert(el_segments, '] ')
    table.insert(el_segments,
        sections.collapse_builtin{
            '[',
            builtin.help_list,
            builtin.readonly_list,
            ']'
        }
    )
    table.insert(el_segments, builtin.filetype)

    return el_segments
end

-- Mode Colors
-- TODO Change to more Gruvbox Colors
vim.cmd [[hi ElNormal                 guibg=#3c3836 gui=bold guifg=#b8bb26]]
vim.cmd [[hi ElInsert                 guibg=#3c3836 gui=bold guifg=#83a598]]
vim.cmd [[hi ElReplace                guibg=#3c3836 gui=bold guifg=#fb4934]]
vim.cmd [[hi ElCommand                guibg=#3c3836 gui=bold guifg=#b8bb26]]
vim.cmd [[hi ElTerm                   guibg=#3c3836 gui=bold guifg=#83a598]]
vim.cmd [[hi ElNormalOperatingRending guibg=#3c3836 gui=bold guifg=#b8bb26]]
vim.cmd [[hi ElVisual                 guibg=#3c3836 gui=bold guifg=#d3869b]]
vim.cmd [[hi ElVisualLine             guibg=#3c3836 gui=bold guifg=#d3869b]]
vim.cmd [[hi ElVisualBlock            guibg=#3c3836 gui=bold guifg=#d3869b]]
vim.cmd [[hi ElSelect                 guibg=#3c3836 gui=bold guifg=#b8bb26]]
vim.cmd [[hi ElSLine                  guibg=#3c3836 gui=bold guifg=#b8bb26]]
vim.cmd [[hi ElSBlock                 guibg=#3c3836 gui=bold guifg=#b8bb26]]
vim.cmd [[hi ElInsertCompletion       guibg=#3c3836 gui=bold guifg=#b8bb26]]
vim.cmd [[hi ElVirtualReplace         guibg=#3c3836 gui=bold guifg=#b8bb26]]
vim.cmd [[hi ElCommandCV              guibg=#3c3836 gui=bold guifg=#b8bb26]]
vim.cmd [[hi ElCommandEx              guibg=#3c3836 gui=bold guifg=#b8bb26]]
vim.cmd [[hi ElPrompt                 guibg=#3c3836 gui=bold guifg=#b8bb26]]
vim.cmd [[hi ElMore                   guibg=#3c3836 gui=bold guifg=#b8bb26]]
vim.cmd [[hi ElConfirm                guibg=#3c3836 gui=bold guifg=#b8bb26]]
vim.cmd [[hi ElShell                  guibg=#3c3836 gui=bold guifg=#b8bb26]]

require('el').setup{ generator = generator }

