local configs = require 'nvim_lsp/configs'
local util = require 'nvim_lsp/util'

local server_name = "pyright"
local bin_name = "pyright-langserver"

local installer = util.npm_installer {
  server_name = server_name;
  packages = {server_name};
  binaries = {bin_name};
}

configs[server_name] = {
  default_config = {
    cmd = {"pyright-langserver", "--stdio"};
    filetypes = {"python"};
    root_dir = util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt");
    settings = {
      analysis = { autoSearchPaths= true; };
      pyright = { useLibraryCodeForTypes = true; };
    };
   };
   on_new_config = function(new_config)
      local install_info = installer.info()
      if install_info.is_installed then
        if type(new_config.cmd) == "table" then
          -- Try to preserve any additional args from upstream changes.
          new_config.cmd[1] = install_info.binaries[bin_name]
        else
          new_config.cmd = {install_info.binaries[bin_name]}
        end
      end
    end,
  docs = {
    description = [[
https://github.com/microsoft/pyright
`pyright`, a static type checker and language server for python
]];
  };
}

configs[server_name].install = installer.install
configs[server_name].install_info = installer.info
-- vim:et ts=2 sw=2
