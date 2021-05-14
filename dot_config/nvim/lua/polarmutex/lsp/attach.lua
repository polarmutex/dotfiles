local M = {}

M.default_custom_on_attach = function(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_formatting then
        if client.name ~= "tsserver" then
            vim.cmd(
                [[ autocmd BufWritePre * :lua vim.lsp.buf.formatting_sync(nil, 250) ]])
        end
    end

    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]], false)
    end
end

return M
