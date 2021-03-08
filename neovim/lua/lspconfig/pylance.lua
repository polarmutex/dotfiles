local configs = require("lspconfig/configs")
local util = require 'lspconfig/util'


vim.cmd [[ let $ELECTRON_RUN_AS_NODE = 1 ]]
vim.cmd [[ let $VSCODE_NLS_CONFIG = '{"locale": "en"}' ]]

local plug_path = "/home/brian/.vscode/extensions/ms-python.vscode-pylance-2021.3.0/"

configs.pylance = {
    default_config = {
        cmd = {
            --"ELECTRON_RUN_AS_NODE=1",
            --"VSCODE_NLS_CONFIG='{\"locale\": \"en\"}'",
            "node",
            plug_path .. "dist/server.bundle.js",
            "--stdio"
        },
        filetypes = {"python"},
        root_dir = util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt");
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true;
              useLibraryCodeForTypes = true;
            };
          };
        };
    }
}
