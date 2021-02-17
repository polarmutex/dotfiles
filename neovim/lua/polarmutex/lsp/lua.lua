local lspconfig = require('lspconfig')
local custom_attach = require("polarmutex.lsp.attach")

require('nlua.lsp.nvim').setup(lspconfig, {
    on_attach = custom_attach,

    globals = {
      -- Colorbuddy
      "Color", "c", "Group", "g", "s",

      -- Custom
      "RELOAD",
    }
})
