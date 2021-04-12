local lsp_configs = require("lspconfig/configs")
local lsp_util = require("lspconfig/util")
local custom_attach = require("polarmutex.lsp.attach")
local path = lsp_util.path

local M = {}

M.setup = function()
	lsp_configs.prosemd = {
		default_config = {
			-- Update the path to prosemd-lsp
			--cmd = { "/usr/local/bin/prosemd-lsp", "--stdio" },
			cmd = { path.join({ vim.loop.os_homedir(), ".cargo/bin/prosemd-lsp" }), "--stdio" },
			filetypes = { "markdown", "svx" },
			root_dir = function(fname)
				return lsp_util.find_git_ancestor(fname) or vim.fn.getcwd()
			end,
			settings = {},
		},
	}
end

M.config = function()
	return {}
end

return M
