local generator = function()
    local builtin = require('el.builtin')
    local extensions = require('el.extensions')
    local sections = require('el.sections')
    local subscribe = require('el.subscribe')

    local el_segments = {}

    -- Left Section
    table.insert(el_segments, extensions.mode)
    table.insert(el_segments,
        subscribe.buf_autocmd(
            "el_git_branch",
            "BufEnter",
            function(window, buffer)
            local branch = extensions.git_branch(window, buffer)
            if branch then
                return ' ' .. extensions.git_icon() .. ' ' .. branch
            end
            end
        )
    )

    table.insert(el_segments, sections.split)

    -- Center Section
    table.insert(el_segments,
        subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, bufnr)
            local icon = extensions.file_icon(_, bufnr)
            if icon then
                return icon .. ' '
            end

            return ''
        end)
    )
    table.insert(el_segments, builtin.responsive_file(140,90))
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
    table.insert(el_segments, lsp_statusline.server_progress)
    --table.insert(el_segments,
    --    subscribe.buf_autocmd(
    --        "el_git_status",
    --        "BufWritePost",
    --        function(window, buffer)
    --            return extensions.git_changes(window, buffer)
    --        end
    --    )
    --)

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

