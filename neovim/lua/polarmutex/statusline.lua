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
vim.cmd [[hi ElNormal                 guibg=#d75f5f gui=bold guifg=#e9e9e9]]
vim.cmd [[hi ElInsert                 guibg=#e9e9e9 gui=bold guifg=#dab997]]
vim.cmd [[hi ElReplace                guibg=#e9e9e9 gui=bold guifg=#afaf00]]
vim.cmd [[hi ElCommand                guibg=#e9e9e9 gui=bold guifg=#83adad]]
vim.cmd [[hi ElTerm                   guibg=#e9e9e9 gui=bold guifg=#6f6f6f]]
vim.cmd [[hi ElNormalOperatingRending guibg=#e9e9e9 gui=bold guifg=#f485dd]]
vim.cmd [[hi ElVisual                 guibg=#e9e9e9 gui=bold guifg=#f485dd]]
vim.cmd [[hi ElVisualLine             guibg=#e9e9e9 gui=bold guifg=#f485dd]]
vim.cmd [[hi ElVisualBlock            guibg=#e9e9e9 gui=bold guifg=#f485dd]]
vim.cmd [[hi ElSelect                 guibg=#e9e9e9 gui=bold guifg=#f485dd]]
vim.cmd [[hi ElSLine                  guibg=#e9e9e9 gui=bold guifg=#f485dd]]
vim.cmd [[hi ElSBlock                 guibg=#e9e9e9 gui=bold guifg=#f485dd]]
vim.cmd [[hi ElInsertCompletion       guibg=#e9e9e9 gui=bold guifg=#f485dd]]
vim.cmd [[hi ElVirtualReplace         guibg=#e9e9e9 gui=bold guifg=#f485dd]]
vim.cmd [[hi ElCommandCV              guibg=#e9e9e9 gui=bold guifg=#f485dd]]
vim.cmd [[hi ElCommandEx              guibg=#e9e9e9 gui=bold guifg=#f485dd]]
vim.cmd [[hi ElPrompt                 guibg=#e9e9e9 gui=bold guifg=#f485dd]]
vim.cmd [[hi ElMore                   guibg=#e9e9e9 gui=bold guifg=#f485dd]]
vim.cmd [[hi ElConfirm                guibg=#e9e9e9 gui=bold guifg=#f485dd]]
vim.cmd [[hi ElShell                  guibg=#e9e9e9 gui=bold guifg=#f485dd]]

require('el').setup{ generator = generator }

