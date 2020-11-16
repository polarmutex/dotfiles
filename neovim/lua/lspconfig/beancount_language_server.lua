local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

configs.beancount_language_server = {
  default_config = {
    cmd = {"beancount-language-server"};
    --cmd = {"beancount-language-server", "--debug",  "--log-file",  "bls.log"};
    filetypes = {"beancount"};
    root_dir = function(fname)
      return util.path.dirname(fname)
    end;
    init_options = {
      journal = "~/repos/beancount/journal.beancount";
      use_tree_sitter = false;
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
