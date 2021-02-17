local lspconfig = require('lspconfig')
local custom_attach = require("polarmutex.lsp.attach")

lspconfig.vimls.setup({
    on_attach=custom_attach,
})
