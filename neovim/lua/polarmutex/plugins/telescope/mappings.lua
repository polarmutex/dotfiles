local map_tele = function(key, f, options, buffer)
  local mode = "n"
  local rhs = string.format(
    "<cmd>lua require('polarmutex.plugins.telescope')['%s'](%s)<CR>",
    f,
    options and vim.inspect(options, { newline = '' }) or ''
  )
  local options = {
    noremap = true,
    silent = true,
  }

  if not buffer then
    vim.api.nvim_set_keymap(mode, key, rhs, options)
  else
    vim.api.nvim_buf_set_keymap(0, mode, key, rhs, options)
  end
end

--vim.api.nvim_set_keymap('c', '<c-r><c-r>', '<Plug>(TelescopeFuzzyCommandSearch)', { noremap = false, nowait = true })

-- Files
map_tele('<leader>sg', 'git_files')

-- Nvim

-- Git / Github
map_tele('<leader>gi','gh_issues')
map_tele('<leader>gr','gh_pull_request')

-- Telescope Meta
map_tele('<leader>sB', 'builtin')

-- Testing
map_tele('<leader>sc', 'chtsh_root_list')

return map_tele
