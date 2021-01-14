local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

local lsp_src_folder = '~/repos/beancount-language-server/'

local server_name = 'beancount'
local exe_name = 'beancount-langserver'
local install_loc = '~/.cache/nvim/' .. server_name
local bin_loc = install_loc .. '/node_modules/.bin/' .. exe_name

--local installer = util.npm_installer {
--  server_name = server_name;
--  packages = { lsp_src_folder };
--  binaries = { exe_name };
--}

-- set the path to the previously installed via the now deprecated :LspInstall, use
local beancount_root_path = vim.fn.stdpath('cache')..'/lspconfig/beancount'
local beancount_binary = beancount_root_path.."/node_modules/.bin/".."beancount-langserver"


configs.beancount = {
  default_config = {
    cmd = {
      'beancount-langserver',
      '--stdio'
    };
    log_level = vim.lsp.protocol.MessageType.Warning;
    filetypes = {"beancount"};
    root_dir = function(fname)
      return util.find_git_ancestor(fname) or util.path.dirname(fname)
    end;
    init_options = {
      journalFile = "~/repos/beancount/journal.beancount",
      pythonPath = "~/.cache/pypoetry/virtualenvs/beancount-repo-iwRmyqK8-py3.9/bin/python3";
    };
  };
  docs = {
    description = [[
https://github.com/bryall/beancount-language-server
`beancount-language-server`, a language server for Beancount.
    ]];
  };
};
--configs.beancount.install = installer.install
--configs.beancount.install_info = installer.info
