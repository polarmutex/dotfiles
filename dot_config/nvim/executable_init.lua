--    ____      _ __        _
--   /  _/___  (_) /__   __(_)___ ___
--   / // __ \/ / __/ | / / / __ `__ \
-- _/ // / / / / /__| |/ / / / / / / /
-- /___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

package.loaded["polarmutex.globals"] = nil

local modules = {
    -- cool opt tricks
    "polarmutex.globals",

    -- load plugins
    "polarmutex.plugins.packer",

    "polarmutex.lsp",
    "polarmutex.settings",
    "polarmutex.mappings",

    "polarmutex.modules.whitespace",
    "polarmutex.modules.spell",
    "polarmutex.modules.terminal",
    "polarmutex.modules.statusline",
}

local errors = {}
for _, v in pairs(modules) do
    local ok, err = pcall(require, v)
    if not ok then
	table.insert(errors, err)
    end
end

if not vim.tbl_isempty(errors) then
    for _, v in pairs(errors) do
        print(v)
    end
end

vim.api.nvim_command("augroup start_screen")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command("autocmd VimEnter * ++once lua require('polarmutex.modules.start-screen').start()")
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
