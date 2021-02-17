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


-- Turn on status.
status.activate()


require("polarmutex.lsp.python")
require("polarmutex.lsp.beancount")
require("polarmutex.lsp.cpp")
require("polarmutex.lsp.vim")
require("polarmutex.lsp.typescript")
require("polarmutex.lsp.efm")
require("polarmutex.lsp.lua")


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
