local lspconfig = require('lspconfig')
local status = require('polarmutex.lsp.status')

--require('vim.lsp.log').set_level("trace")
--require('vim.lsp.log').set_level("debug")

--setup mappings
require("polarmutex.lsp.mappings")

-- from rockerboo
function DoFormat()
    vim.lsp.buf.formatting_sync(nil, 1000)
end
local attach_formatting = function(client)
  -- Skip tsserver for now so we dont format things twice
  if client.name == "tsserver" then return end

  --print(string.format('attaching format to %s', client.name))

  vim.api.nvim_command [[augroup Format]]
  vim.api.nvim_command [[autocmd! * <buffer>]]
  vim.api.nvim_command [[autocmd BufWritePre <buffer> lua DoFormat()]]
  vim.api.nvim_command [[augroup END]]
end

require("polarmutex.lsp.prosemd").setup()

local custom_on_attach = function(client, bufnr)

    -- Set autocommands conditional on server_capabilities
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
    require'lspinstall'.setup()

    -- get all installed servers
    local servers = require'lspinstall'.installed_servers()
    -- ... and add manually installed servers
    table.insert(servers, "beancount")
    table.insert(servers, "clangd")
    table.insert(servers, "prosemd")

    for _, server in pairs(servers) do
        local config = make_config()

        if server == "sumneko" then
            config = vim.tbl_extend("force", config, require'polarmutex.lsp.sumneko')
        elseif server == "pyright" then
            config = vim.tbl_extend("force", config, require'polarmutex.lsp.pyright')
        elseif server == "clangd" then
            config = vim.tbl_extend("force", config, require'polarmutex.lsp.clangd')
        elseif server == "efm" then
            config = vim.tbl_extend("force", config, require'polarmutex.lsp.efm')
        elseif server == "beancount" then
            config = vim.tbl_extend("force", config, require'polarmutex.lsp.beancount')
        elseif server == "prosemd" then
            config = vim.tbl_extend("force", config, require'polarmutex.lsp.prosemd').config()
        elseif server == "tsserver" then
            config = vim.tbl_extend("force", config, require'polarmutex.lsp.typescript')
        elseif server == "svelte" then
            config = vim.tbl_extend("force", config, require'polarmutex.lsp.svelte')
        end

        require'lspconfig'[server].setup(config)
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end



-- setup diagnostice
--[[
0. nil -> do default (could be enabled or disabled)
1. false -> disable it
2. true -> enable, use defaults
3. table -> enable, with (some) overrides
4. function -> can return any of above
--]]

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = true,
    signs = {
      priority = 20
    },
    update_in_insert = true,
  }
)

--from tj
function MyLspRename()
    local current_word = vim.fn.expand("<cword>")
    local plenary_window = require('plenary.window.float').percentage_range_window(0.5, 0.2)
    vim.api.nvim_buf_set_option(plenary_window.bufnr, 'buftype', 'prompt')
    vim.fn.prompt_setprompt(plenary_window.bufnr, string.format('Rename "%s" to > ', current_word))
    vim.fn.prompt_setcallback(plenary_window.bufnr, function(text)
        vim.api.nvim_win_close(plenary_window.win_id, true)

        if text ~= '' then
            vim.schedule(function()
                vim.api.nvim_buf_delete(plenary_window.bufnr, { force = true })
                vim.lsp.buf.rename(text)
            end)
        else
            print("Nothing to rename!")
        end
    end)
    vim.cmd [[startinsert]]
end
