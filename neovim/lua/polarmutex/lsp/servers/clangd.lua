local lspstatus = require('lsp-status')

return {
    cmd = {
        "clangd",
        "--background-index",
        "--suggest-missing-includes",
        "--clang-tidy",
        "--header-insertion=iwyu",
    },
    -- Required for lsp-status
    init_options = {
        clangdFileStatus = true
    },
    handlers = lspstatus.extensions.clangd.setup(),
    capabilities = lspstatus.capabilities,
}

