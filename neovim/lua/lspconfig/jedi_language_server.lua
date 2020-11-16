local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

configs.jedi_language_server = {
  default_config = {
    cmd = {"jedi-language-server"};
    filetypes = {"python"};
    root_dir = function(fname)
      return util.path.dirname(fname)
    end;
    init_options = {
    };
  };
  docs = {
    description = [[
    ]];
  };
};
-- vim:et ts=2 sw=2
