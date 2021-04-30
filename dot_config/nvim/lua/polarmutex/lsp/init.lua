local lspconfig = require("lspconfig")
--local lspinstall = require("polarmutex.lsp.install")

-- require('vim.lsp.log').set_level("trace")
-- require('vim.lsp.log').set_level("debug")

require("polarmutex.lsp.handlers")

--require("polarmutex.lsp.servers.prosemd").setup()

local custom_on_attach = function(client, bufnr)
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

require("polarmutex.lsp.servers.beancount")
require("polarmutex.lsp.servers.clangd")
require("polarmutex.lsp.servers.efm")
require("polarmutex.lsp.servers.prosemd")
require("polarmutex.lsp.servers.pyright")
require("polarmutex.lsp.servers.sumneko")
--require("polarmutex.lsp.servers.nlua")
require("polarmutex.lsp.servers.svelte")
require("polarmutex.lsp.servers.typescript")
require("polarmutex.lsp.servers.vimls")
