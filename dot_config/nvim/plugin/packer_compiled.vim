" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/brian/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/brian/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/brian/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/brian/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/brian/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["beancount.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/beancount.nvim"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
  ["contextprint.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/contextprint.nvim"
  },
  ["dial.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/dial.nvim"
  },
  firenvim = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/firenvim"
  },
  ["git-worktree.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/git-worktree.nvim"
  },
  ["gitlinker.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/harpoon"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  neogit = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-dap-python"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lua-debugger"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-lua-debugger"
  },
  ["nvim-terminal.lua"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-terminal.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["tasks.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/tasks.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope-fzf-writer.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-fzf-writer.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-be-good"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-be-good"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-hardtime"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-hardtime"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-radical"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-radical"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-scriptease"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-scriptease"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-test"
  }
}

time("Defining packer_plugins", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
