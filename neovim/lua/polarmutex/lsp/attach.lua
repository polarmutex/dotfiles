
local custom_attach = function(client)
        require('completion').on_attach(client)
        status.on_attach(client)

        --if client.resolved_capabilities.document_formatting then
        --    attach_formatting(client)
        --end

        -- can we inject code into this function?
        if vim.api.nvim_buf_get_option(0,'filetype') == 'beancount' then
            -- populate quickfix list with diagnostics
            -- TODO can we limit this easily to beancount?
            local method = "textDocument/publishDiagnostics"
            local default_callback = vim.lsp.handlers[method]
            vim.lsp.handlers[method] = function(err, method, result, client_id)
                default_callback(err, method, result, client_id)
                if result and result.diagnostics then
                    local item_list = {}

                    for _, v in ipairs(result.diagnostics) do
                        local fname = result.uri
                        table.insert(item_list, {
                            filename = fname,
                            lnum = v.range.start.line + 1,
                            col = v.range.start.character + 1;
                            text = v.message;
                        })
                    end

                    local old_items = vim.fn.getqflist()
                    for _, old_item in ipairs(old_items) do
                        local bufnr = vim.uri_to_bufnr(result.uri)
                        if vim.uri_from_bufnr(old_item.bufnr) ~= result.uri then
                            table.insert(item_list, old_item)
                        end
                    end

                    vim.fn.setqflist({}, ' ', {
                        title = 'LSP';
                        items = item_list;
                    })
                end
            end
        end

    end

return custom_attach
