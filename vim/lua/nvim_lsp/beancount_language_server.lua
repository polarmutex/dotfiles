local configs = require 'nvim_lsp/configs'
local util = require 'nvim_lsp/util'

configs.beancount_language_server = {
  default_config = {
    cmd = {"beancount-language-server",};
    filetypes = {"beancount"};
    root_dir = function(fname)
      return util.path.dirname(fname)
    end;
    init_options = {
      journal = "~/Documents/beancount/journal.beancount";
      use_tree_sitter = true;
    };
  };
  docs = {
    description = [[
https://github.com/bryall/beancount-language-server
`beancount-language-server`, a language server for Beancount.
    ]];
  };
};
-- vim:et ts=2 sw=2
