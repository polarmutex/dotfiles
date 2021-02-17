local lspconfig = require('lspconfig')
local custom_attach = require("polarmutex.lsp.attach")

lspconfig.clangd.setup({
    cmd={
        'clangd-10',
        '--background-index',
        '--clang-tidy',
        '--completion-style=bundled',
        '--header-insertion=iwyu',
        '--suggest-missing-includes'
    },
    on_attach=custom_attach
})
