local lspconfig = require('lspconfig')
local lspinstall = require('lspinstall')

--require('vim.lsp.log').set_level("trace")
--require('vim.lsp.log').set_level("debug")

require('polarmutex.lsp.handlers')

require("polarmutex.lsp.servers.prosemd").setup()

local custom_on_attach = function(client, bufnr)

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_formatting then

	    if client.name ~= "tsserver" then
		    vim.cmd([[ autocmd BufWritePre * :lua vim.lsp.buf.formatting_sync(nil, 250) ]])
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

local function make_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    return {
        on_attach = custom_on_attach
    }
end

local function setup_servers()
    lspinstall.setup()

    -- get all installed servers
    local servers = lspinstall.installed_servers()
    -- ... and add manually installed servers
    table.insert(servers, "beancount")
    table.insert(servers, "clangd")
    table.insert(servers, "prosemd")

    for _, server in pairs(servers) do
        local config = make_config()

        if server == "sumneko" then
            config = vim.tbl_extend("force", config, require'polarmutex.lsp.servers.sumneko')
        elseif server == "pyright" then
            config = vim.tbl_extend("force", config, require'polarmutex.lsp.servers.pyright')
        elseif server == "clangd" then
            config = vim.tbl_extend("force", config, require'polarmutex.lsp.servers.clangd')
        elseif server == "efm" then
            config = vim.tbl_extend("force", config, require'polarmutex.lsp.servers.efm')
        elseif server == "beancount" then
            config = vim.tbl_extend("force", config, require'polarmutex.lsp.servers.beancount')
        elseif server == "prosemd" then
            config = vim.tbl_extend("force", config, require'polarmutex.lsp.servers.prosemd').config()
        elseif server == "tsserver" then
            config = vim.tbl_extend("force", config, require'polarmutex.lsp.servers.typescript')
        elseif server == "svelte" then
            config = vim.tbl_extend("force", config, require'polarmutex.lsp.servers.svelte')
        end

        lspconfig[server].setup(config)
    end
end

setup_servers()

-- Automatically reload after LspInstall <server>` so we don't have to restart neovim
lspinstall.post_install_hook = function ()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
