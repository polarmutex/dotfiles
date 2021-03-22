--    ____      _ __        _
--   /  _/___  (_) /__   __(_)___ ___
--   / // __ \/ / __/ | / / / __ `__ \
-- _/ // / / / / /__| |/ / / / / / / /
--/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

package.loaded['polarmutex.globals'] = nil
require('polarmutex.globals')

-- load plugins
if require('polarmutex.first_load')() then
    return
end
require("polarmutex.plugins")
require('polarmutex.settings')

require("polarmutex.lsp")

-- configure plugins
require("polarmutex.configure_plugins")
require('polarmutex.mappings')

vim.api.nvim_command('augroup start_screen')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command("autocmd VimEnter * ++once lua require('start-screen').start()")
vim.api.nvim_command('augroup END')


