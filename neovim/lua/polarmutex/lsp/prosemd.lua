local lsp_configs = require('lspconfig/configs')
local lsp_util = require('lspconfig/util')
local custom_attach = require('polarmutex.lsp.attach')

local M = {}

M.setup = function()
    lsp_configs.prosemd = {
        default_config = {
            -- Update the path to prosemd-lsp
            --cmd = { "/usr/local/bin/prosemd-lsp", "--stdio" },
            cmd = { "/home/brian/.cargo/bin/prosemd-lsp", "--stdio" },
            filetypes = { "markdown" },
            root_dir = function(fname)
                return lsp_util.find_git_ancestor(fname) or vim.fn.getcwd()
            end,
            settings = {},
        }
    }
end

M.config = function()
    return {}
end

return M
