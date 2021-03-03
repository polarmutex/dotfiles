local lspconfig = require('lspconfig')
local custom_attach = require("polarmutex.lsp.attach")

lspconfig.tsserver.setup({
    cmd = {"typescript-language-server", "--stdio"},
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    on_attach=custom_attach
})
