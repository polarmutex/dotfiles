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


require('el').setup{ generator = generator }

