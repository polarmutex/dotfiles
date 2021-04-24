--    ____      _ __        _
--   /  _/___  (_) /__   __(_)___ ___
--   / // __ \/ / __/ | / / / __ `__ \
-- _/ // / / / / /__| |/ / / / / / / /
-- /___/_/ /_/_/\__(_)___/_/_/ /_/ /_/
package.loaded["polarmutex.globals"] = nil
require("polarmutex.globals")

-- load plugins
if require("polarmutex.first_load")() then return end
require("polarmutex.plugins")
require("polarmutex.settings")

require("polarmutex.lsp")

-- configure plugins
require("polarmutex.configure_plugins")
require("polarmutex.mappings")

--Modules
require("polarmutex.modules.whitespace").setup()

vim.api.nvim_command("augroup start_screen")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command("autocmd VimEnter * ++once lua require('start-screen').start()")
vim.api.nvim_command("augroup END")

-- Put these in an autocmd group, so that you can revert them with:
-- :augroup vimStartup | au! | augroup END
vim.api.nvim_command("augroup vimStartup")
vim.api.nvim_command("autocmd!")
-- When editing a file, always jump to the last known cursor position.
-- Don't do it when the position is invalid, when inside an event handler
-- (happens when dropping a file on gvim) and for a commit message (it's
-- likely a different one than last time).
vim.api.nvim_command([[
autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif
]])
vim.api.nvim_command("augroup END")

-- automatically run packer compile on plugin change
vim.api.nvim_command("autocmd BufWritePost plugins.lua PackerCompile")

-- highlight yank
vim.api.nvim_command("augroup LuaHighlight")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command([[
autocmd TextYankPost * lua vim.highlight.on_yank { hlgroup = "Substitute", timeout = 150, on_macro = true }
]])
vim.api.nvim_command("augroup END")
